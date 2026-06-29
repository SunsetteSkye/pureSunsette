; try to initiate a wild pokemon encounter
; returns success in Z
TryDoWildEncounter:
	ld a, [wNPCMovementScriptPointerTableNum]
	and a
	ret nz
	ld a, [wMovementFlags]
	and a ; is player exiting a door, jumping over a ledge, or fishing?
	ret nz
	callfar IsPlayerStandingOnDoorTileOrWarpTile
	jr nc, .notStandingOnDoorOrWarpTile
.CantEncounter
	ld a, $1
	and a
	ret
.notStandingOnDoorOrWarpTile
	callfar IsPlayerJustOutsideMap
	jr z, .CantEncounter
	; Sunsette: tick the FLASH-in-cave run-out timer each real step (placed before the repel block so a
	; repel of 0 doesn't skip it). CheckUsedFlash handles the 0 transition (re-darken + "use again?").
	; DE-COLLISION: this timer and the repel/hiding timer (wRepelRemainingSteps) both tick down 1/step, so
	; if they're ever equal they'd hit 0 on the SAME step and stack two "wore off" prompts. The moment they
	; match (both active), nudge FLASH +10 so they diverge for good. Self-clearing (once unequal it won't
	; fire again) and arming-path-agnostic, so no per-set-point checks are needed.
	ld a, [wFlashStepsRemaining]
	and a
	jr z, .flashTimerDone ; FLASH inactive -> no tick, no collision
	ld b, a ; b = current FLASH steps (nonzero)
	ld a, [wRepelRemainingSteps]
	and a
	jr z, .flashTick ; repel/hiding inactive -> no collision
	cp b
	jr nz, .flashTick ; already diverged
	ld a, b
	add 10
	ld b, a ; collide -> FLASH ends 10 steps after repel/hiding
.flashTick
	dec b
	ld a, b
	ld [wFlashStepsRemaining], a
.flashTimerDone
	; Sunsette: tick the field-move nature-reaction cooldown each real step (same code path as the
	; repel/FLASH timers, so it only counts genuine overworld steps).
	ld a, [wNatureReactionCooldown]
	and a
	jr z, .natureReactionTicked
	dec a
	ld [wNatureReactionCooldown], a
.natureReactionTicked
	ld a, [wRepelRemainingSteps]
	and a
	jr z, .next
	dec a
	jp z, .lastRepelStep
	ld [wRepelRemainingSteps], a
.next
; determine if wild pokemon can appear in the half-block we're standing in
; is the bottom right tile (9,9) of the half-block we're standing in a grass/water tile?
	hlcoord 9, 9
	ld c, [hl]
	call TestGrassTile ; PureRGBnote: FIXED: viridian forest and safari zone grass tiles are detected correctly
	ld a, [wGrassRate]
	jr z, .CanEncounter
	call TestWaterTile ; PureRGBnote: FIXED: Route 10 coast tiles will be treated as water encounter tiles instead of loading grass tiles
	ld a, [wWaterRate]
	jr z, .CanEncounter
; even if not in grass/water, standing anywhere we can encounter pokemon
; so long as the map is "indoor" and has wild pokemon defined.
; ...as long as it's not Viridian Forest or Safari Zone or Volcano.
	ld a, [wCurMap]
	cp FIRST_INDOOR_MAP ; is this an indoor map?
	jr nc, .indoorAmbient
; Sunsette: outdoor maps only get off-grass "ambient" encounters if explicitly flagged
; (the city-pest maps). Coast tiles are water-classified, so they never reach here.
	ld hl, AmbientEncounterMaps
	call IsInSingleByteArray ; a = wCurMap; carry set if flagged
	jp nc, .CantEncounter2
	ld a, [wGrassRate]
	srl a ; Sunsette: halve the (already low) ambient city encounter rate
	jr .CanEncounter
.indoorAmbient
	ld a, [wCurMapTileset]
	cp VOLCANO
	jr z, .CantEncounter2
	cp FOREST ; Viridian Forest/Safari Zone
	jr z, .CantEncounter2
	ld a, [wGrassRate]
.CanEncounter
	call ModifyEncounterRateForMovement ; Sunsette: run(B on foot)=x2, bike=half (bike+B=zero), surf=half
; compare encounter chance with a random number to determine if there will be an encounter
	ld b, a
	ldh a, [hRandomAdd]
	cp b
	jr nc, .CantEncounter2
	ldh a, [hRandomSub]
	ld b, a
	ld hl, WildMonEncounterSlotChances
	xor a
	ld c, a
.determineEncounterSlot
	ld a, [hli]
	cp b
	jr nc, .gotEncounterSlot
	inc c ; PureRGBnote: ADDED: c will store the current encounter slot index, used to help decide if that pokemon uses alternate palette
	inc hl
	jr .determineEncounterSlot
.gotEncounterSlot
	ld a, c
	ld [wIsAltPalettePkmn], a ; PureRGBnote: ADDED: store which encounter slot index (0-9) we ended up with into wIsAltPalettePokemon
	                          ;                     we still don't know if the pokemon is alt palette yet, just storing the index.
; determine which wild pokemon (grass or water) can appear in the half-block we're standing in
	ld c, [hl] ; c = slot * 2
	; Sunsette: GROWTH field move inverts encounter rarity - flip the slot (rare<->common) while armed (FLOURISH)
	; (wFieldMoveArmedFlags bit 1; cleared on map change)
	ld a, [wFieldMoveArmedFlags]
	bit 1, a
	jr z, .gotFinalSlot
	ld a, (NUM_WILDMONS - 1) * 2
	sub c
	ld c, a ; inverted slot * 2
.gotFinalSlot
	ld hl, wGrassMons
	lda_coord 8, 9
	call TestWaterTile2 ; is the bottom left tile (8,9) of the half-block we're standing in a water tile?
	                    ; PureRGBnote: FIXED: Route 10 coast tiles will be treated as water encounter tiles instead of loading grass encounters
	jr nz, .gotWildEncounterType ; else, it's treated as a grass tile by default
	ld hl, wWaterMons
;;;;;;;;;; PureRGBnote: ADDED: for water encounters, need to modify the encounter slot index to account for water encounter alt palette flags starting at bit 10.
	ld a, [wIsAltPalettePkmn]
	add 10 ; water encounters start at bit 10
	ld [wIsAltPalettePkmn], a
;;;;;;;;;;
; since the bottom right tile of a "left shore" half-block is $14 but the bottom left tile is not,
; "left shore" half-blocks (such as the one in the east coast of Cinnabar) load grass encounters.
.gotWildEncounterType
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld [wCurEnemyLevel], a
	ld a, [hl]
	ld [wCurPartySpecies], a
	ld [wEnemyMonSpecies2], a
	ld a, [wRepelRemainingSteps]
	and a
	jr z, .willEncounter
	CheckEvent EVENT_USING_MAX_REPEL
	jr nz, .CantEncounter2 ; max repel doesn't care about levels, never will encounter pokemon
	ld a, [wPartyMon1Level]
	ld b, a
	ld a, [wCurEnemyLevel]
	cp b
	jr c, .CantEncounter2 ; repel prevents encounters if the leading party mon's level is higher than the wild mon
	jr .willEncounter
.lastRepelStep
	ld [wRepelRemainingSteps], a
	ResetEvent EVENT_USING_MAX_REPEL
	ld a, TEXT_REPEL_WORE_OFF
	ldh [hTextID], a
	call EnableAutoTextBoxDrawing
	call DisplayTextID
.CantEncounter2
	xor a
	ld [wIsAltPalettePkmn], a ; PureRGBnote: ADDED: if we end up not encountering a pokemon we need to clear this property as it may have been modified.
	ld a, $1
	and a
	ret
.willEncounter
	callfar CheckWildPokemonPalettes ; PureRGBnote: ADDED: checks if the pokemon should use an alt palette and if so stores 1 in wIsAltPalettePkmn
	xor a
	ret

; Sunsette: per-movement-mode wild-encounter rate modifier. in: a = base rate; out: a = adjusted rate.
; foot + B (running) -> double (kick up more wild mons); bike -> half, bike + B -> zero (the bike is
; evasive); surf -> half (calmer with a Pokemon carrying you, and it also costs HP - see the surf HP drain).
; Reads wWalkBikeSurfState (0=foot,1=bike,2=surf) + hJoyHeld B. Preserves bc.
ModifyEncounterRateForMovement:
	push bc
	ld c, a                  ; c = base rate
	ld a, [wWalkBikeSurfState]
	and a
	jr z, .foot
	cp 1
	jr z, .bike
	; surfing -> half
	srl c
	jr .done
.foot
	ldh a, [hJoyHeld]
	and PAD_B
	jr z, .done              ; walking -> unchanged
	; running -> double, clamped at 255
	sla c
	jr nc, .done
	ld c, $FF
	jr .done
.bike
	ldh a, [hJoyHeld]
	and PAD_B
	jr z, .bikeHalf
	ld c, 0                  ; bike + B -> no encounters
	jr .done
.bikeHalf
	srl c                    ; bike (no B) -> half
.done
	ld a, c
	pop bc
	ret

; Sunsette: ADDED: force a wild encounter from the current map's table (used by the FLASH field move
; outside dark caves). Picks the grass or water table by surf state, rolls an encounter slot via the
; normal distribution, and sets wCurOpponent + wCurEnemyLevel. Carry set if an encounter was set up,
; carry clear if this map has no matching wild table (caller falls back). The overworld loop launches
; the battle once it sees wCurOpponent set, and end_of_battle clears wCurOpponent so it won't repeat.
ForceWildEncounter::
	ld a, [wWalkBikeSurfState]
	cp 2 ; surfing?
	jr z, .water
	ld a, [wGrassRate]
	and a
	ret z ; no grass encounters on this map
	ld de, wGrassMons
	jr .roll
.water
	ld a, [wWaterRate]
	and a
	ret z ; no water encounters on this map
	ld de, wWaterMons
.roll
	call Random
	ld b, a
	ld hl, WildMonEncounterSlotChances
.slot
	ld a, [hli] ; cumulative chance for this slot
	cp b
	jr nc, .gotSlot
	inc hl ; skip the slot*2 byte to the next slot's chance
	jr .slot
.gotSlot
	ld c, [hl] ; slot * 2 (each wGrassMons/wWaterMons entry is level,species)
	ld b, 0
	ld h, d
	ld l, e ; hl = table base
	add hl, bc
	ld a, [hli]
	ld [wCurEnemyLevel], a
	ld a, [hl]
	ld [wCurOpponent], a
	scf
	ret

TestGrassTile:
	ld a, [wGrassTile]
	cp c
	ret z
	ld a, [wCurMapTileset]
	cp VOLCANO
	jr z, .volcano
	cp FOREST
	ret nz
	ld a, $34	; check for the extra grass tile in the forest tileset
	cp c
	ret
;;;;; PureRGBnote: ADDED: In the volcano there are multiple encounter tiles and some are conditional.
.volcano
	; no encounters in first room
	ld a, [wXCoord]
	cp 6
	jr nc, .normal
	ld a, [wYCoord]
	cp 8
	ret c
.normal
	; volcano has a couple of encounter tiles
	ld a, $05
	cp c
	ret z
	ld a, $16
	cp c
	ret z
	ld a, $20
	cp c
	ret z
	; don't encounter on this specific tile in the lava flood room, but otherwise do
	CheckEvent EVENT_IN_LAVA_FLOOD_ROOM
	ret nz
	ld a, $27
	cp c
	ret
;;;;;

TestWaterTile:
;;;;;;;;;; PureRGBnote: ADDED: when in bills garden, if alt palettes are not turned on, don't encounter any pokemon at all
	ld a, [wCurMap]
	cp BILLS_GARDEN
	jr nz, .notBillsGarden
	ld a, [wOptions2]
	bit BIT_ALT_PKMN_PALETTES, a
	jr z, .cantEncounter ; skip encounters in bills garden if alt palettes are turned off
.notBillsGarden
;;;;;;;;;;
	ld a, $14 ; in all tilesets with a water tile, this is its id
	cp c
	ret z
	ld a, [wCurMapTileset]
	cp VOLCANO
	jr z, .volcano
	cp FOREST ; every map in FOREST tileset will treat the coast tile as a water encounter tile as well
	jr z, .forestCoastTileCheck 
	cp OVERWORLD
	ret nz ; maps not in FOREST or OVERWORLD tilesets dont have any other water tiles to consider
	ld a, [wCurMap]
	cp ROUTE_20	; every OVERWORLD map except route 20 will treat tile 32 as a water encounter tile as well
	            ; (route 20 is an exception to preserve missingno behaviour)
	jr nz, .overworldCoastTileCheck
.cantEncounter
	ld a, 1
	and a ; clear z flag
	ret
.forestCoastTileCheck
	ld a, $48 ; left coast tile in FOREST tileset
	cp c
	ret
.overworldCoastTileCheck
	ld a, $32 ; left coast tile in OVERWORLD tileset
	cp c
	ret
;;;;; PureRGBnote: ADDED: volcano has two lava bubble tiles that generate encounters too
.volcano
	ld a, $21
	cp c
	ret z
	ld a, $06
	cp c
	ret
;;;;;

TestWaterTile2:
	push bc
	ld c, a
	call TestWaterTile
	pop bc
	ret

; Sunsette: outdoor maps that get low-rate "ambient" off-grass encounters (city pests).
; Their own grass-table rate controls how rare it is; coast tiles route to water instead.
AmbientEncounterMaps:
	db PEWTER_CITY
	db CERULEAN_CITY
	db VERMILION_CITY
	db CELADON_CITY
	db SAFFRON_CITY
	db -1

INCLUDE "data/wild/probabilities.asm"
