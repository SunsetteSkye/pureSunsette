; Sunsette: ADDED: Pokemon "nature" reactions.
; A relevant mon pops on screen (reusing the Route 15 binoculars sprite display,
; DisplayMonFrontSpriteInBox) with its cry and a personality-flavored line at four moments:
;   - using a field move (TryFieldMoveReaction, sprite-pop, 250-step cooldown)
;   - winning a notable fight (TryBattleWinReaction, text only - battle VRAM)
;   - evolving (ShowEvolutionReaction, text only, per species)
; Each mon carries a PRIMARY and a SECONDARY nature (SpeciesNatureData); a reaction pulls the
; primary most often, the secondary less often, and rarely a random other nature (SelectReactionNature).
; See constants/nature_constants.asm. All callers reach these via farcall.

; -------------------------------------------------------------------------------------------
; input:  a = party index (0-5)
; output: b = primary nature, c = secondary nature (NATURE_NONE if the mon has only one)
; clobbers: a, de, hl, wPokedexNum
GetPartyMonNatures::
	; species index -> dex number (the nature table is dex-indexed, like the palette tables)
	ld hl, wPartySpecies
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hl]
	ld [wPokedexNum], a
	call IndexToPokedex          ; wPokedexNum := dex number (1-151)
	ld a, [wPokedexNum]
	ld l, a
	ld h, 0
	add hl, hl                   ; dex * 2 (two bytes per dex slot: primary, secondary)
	ld bc, SpeciesNatureData
	add hl, bc
	ld a, [hli]
	ld b, a                      ; b = primary nature
	ld c, [hl]                   ; c = secondary nature (NATURE_NONE if single)
	ret

; -------------------------------------------------------------------------------------------
; Sunsette: like GetPartyMonNatures, but keyed off the currently LOADED mon (wMonHIndex) so it
; works for box/daycare mons on the status screen too, not just a live party slot.
; output: b = primary nature, c = secondary nature (NATURE_NONE if single)
GetLoadedMonNatures::
	ld a, [wMonHIndex]
	ld [wPokedexNum], a
	call IndexToPokedex
	ld a, [wPokedexNum]
	ld l, a
	ld h, 0
	add hl, hl                   ; dex * 2
	ld bc, SpeciesNatureData
	add hl, bc
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ret

; Convenience: loaded mon -> a single rolled reaction nature (a = nature 0-15). Used by the
; status-screen page-3 personality reactions.
GetLoadedMonReactionNature::
	call GetLoadedMonNatures
	jp SelectReactionNature

; -------------------------------------------------------------------------------------------
; input:  b = primary nature, c = secondary nature (NATURE_NONE if single)
; output: a = chosen nature: ~55% primary / ~30% secondary / ~15% random (single: 75/25).
; clobbers: a, de, hl
SelectReactionNature::
	call Random
	ld e, a                      ; e = roll (out of 256)
	ld a, c
	cp NATURE_NONE
	jr z, .single
	; dual-nature mon
	ld a, e
	cp NATURE_PRIMARY_THRESHOLD
	ld a, b
	ret c                        ; ~55%: primary
	ld a, e
	cp NATURE_SECONDARY_CUTOFF
	ld a, c
	ret c                        ; ~30%: secondary
	jr .random                   ; ~15%: a random other nature
.single
	ld a, e
	cp NATURE_SINGLE_THRESHOLD
	ld a, b
	ret c                        ; ~75%: primary
.random
	; random nature that is neither assigned nature nor the primary's forbidden nature
	ld hl, ForbiddenNature
	ld d, 0
	ld e, b
	add hl, de
	ld d, [hl]                   ; d = forbidden(primary)
.reroll
	call Random
	and %1111                    ; 0-15
	cp b
	jr z, .reroll
	cp c
	jr z, .reroll                ; (c = NATURE_NONE never matches 0-15, harmless)
	cp d
	jr z, .reroll
	ret

; -------------------------------------------------------------------------------------------
; input:  a = nature, hl = per-nature pool pointer table (dw per nature)
; output: hl = the pool for that nature
GetNaturePool::
	add a                        ; nature * 2
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

; -------------------------------------------------------------------------------------------
; input:  hl = a line pool (db count, then count * dw text pointers)
; output: hl = a randomly chosen text pointer
PickRandomLine::
	ld a, [hli]
	ld b, a                      ; b = count
	push hl                      ; ptr to first entry
	call Random
.mod
	cp b
	jr c, .got
	sub b
	jr .mod
.got
	add a                        ; index * 2
	pop hl
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

; -------------------------------------------------------------------------------------------
; Choose the line to show: usually a TYPE-flavored tell (one of the mon's types), otherwise a
; nature line from the trigger's pool. Falls back to nature when the rolled type has no pool.
; input:  a = party index, hl = per-nature pool pointer table
; output: hl = chosen text pointer
; clobbers a, bc, de
GetReactionLine::
	push hl                      ; [naturePool]
	push af                      ; [naturePool][index]
	call Random
	cp NATURE_TYPE_ROLL_THRESHOLD
	jr nc, .nature
	; --- type route ---
	pop bc                       ; b = index
	push bc                      ; [naturePool][index]
	ld a, b
	call GetMonReactionType      ; a = one of the mon's types
	call FindTypePool            ; carry + hl = pool if that type has lines
	jr nc, .nature
	pop bc                       ; drop index
	pop de                       ; drop naturePool
	jp PickRandomLine            ; hl = type pool -> text
.nature
	pop bc                       ; b = index
	pop hl                       ; hl = nature pool table
	ld a, b
	jp PickNatureLine            ; a = index, hl = pool -> chosen text

; input:  a = party index ; output: a = one of the mon's two types (50/50)
GetMonReactionType:
	ld hl, wPartyMon1Type1
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes               ; hl -> this mon's Type1
	push hl
	call Random
	pop hl
	and 1
	jr z, .gotType
	inc hl                       ; -> Type2
.gotType
	ld a, [hl]
	ret

; input:  a = type, hl = type pool table (dbw TYPE,pool; NR_TYPE_WILDCARD matches any; -1 term)
; output: carry set + hl = pool if matched, carry clear otherwise
FindTypePoolInTable::
	ld c, a
.loop
	ld a, [hl]
	cp -1
	jr z, .notFound
	cp NR_TYPE_WILDCARD
	jr z, .found
	cp c
	jr z, .found
	inc hl
	inc hl
	inc hl
	jr .loop
.found
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	scf
	ret
.notFound
	or a
	ret

; input:  a = type ; searches the shared TypeReactionPools (which has no wildcard entry)
FindTypePool:
	ld hl, TypeReactionPools
	jr FindTypePoolInTable

; -------------------------------------------------------------------------------------------
; Sprite-pop + cry + print a SPECIFIC text as the given party mon. Overworld contexts only.
; input: a = party index, hl = text pointer
ShowMonSpriteLine::
	push hl                      ; [text]
	push af                      ; [text][index]
	; sprite species for the pop
	ld hl, wPartySpecies
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hl]
	ld [wCurPartySpecies], a
	; alt-palette flag so the pop shows the mon in its own (possibly alt) colors
	pop af
	push af                      ; [text][index]
	ld hl, wPartyMon1Flags
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	and 1
	ld [wIsAltPalettePkmn], a
	callfar DisplayMonFrontSpriteInBox
	; load the mon's nickname (for text_ram_namebuffer) AFTER the pop, then print the line
	pop af                       ; index
	ld hl, wPartyMonNicks
	call GetPartyMonName
	pop hl                       ; hl = text ptr
	rst _PrintText
	ret

; Full reaction: pick a type/nature line, then sprite-pop + cry + print it.
; input: a = party index, hl = per-nature pool pointer table
ShowMonReaction::
	push af                      ; [index]
	call GetReactionLine         ; hl = chosen text ptr (type or nature)
	pop af                       ; a = index
	jp ShowMonSpriteLine

; -------------------------------------------------------------------------------------------
; Nature-only line (no type roll). input: a = party index, hl = per-nature pool ; out: hl = text
PickNatureLine::
	push hl                      ; [pool table]
	call GetPartyMonNatures      ; b = primary, c = secondary
	call SelectReactionNature    ; a = chosen nature (0-15)
	pop hl                       ; pool table
	call GetNaturePool           ; per-nature pools are 16 wide, indexed 0-15
	jp PickRandomLine

; Text-only print of a SPECIFIC text as the given mon (loads nickname). input: a = index, hl = text
PrintMonLine::
	push hl
	ld hl, wPartyMonNicks
	call GetPartyMonName
	pop hl
	rst _PrintText
	ret

; -------------------------------------------------------------------------------------------
; Text-only reaction (no sprite pop). For contexts where the binoculars routine is unsafe
; (in-battle VRAM/palette state).
; input: a = party index, hl = per-nature pool pointer table
ShowMonReactionTextOnly::
	push af                      ; [index]
	call GetReactionLine         ; hl = chosen text ptr
	pop bc                       ; b = index
	push hl                      ; [text]
	ld a, b
	ld hl, wPartyMonNicks
	call GetPartyMonName
	pop hl                       ; hl = text ptr
	rst _PrintText
	ret

; -------------------------------------------------------------------------------------------
; POKE CENTER HEAL: a random party mon reacts after the nurse heals you. Ignores the cooldown.
ShowHealReaction::
	ld a, [wPartyCount]
	and a
	ret z
	ld b, a
	call Random
.mod
	cp b
	jr c, .got
	sub b
	jr .mod
.got
	ld hl, HealReactionPools
	jp ShowMonReaction

; -------------------------------------------------------------------------------------------
; FIELD MOVE: pop the using mon (wWhichPokemon) with its cry + a nature line, then start the
; step cooldown. Bails while the cooldown is still running. (move id arrives in a; reserved
; for future per-move flavoring, unused for now.)
; input: a = field event id (NREVT_*)
TryFieldMoveReaction::
	ld b, a                          ; b = field event id
	ld a, [wNatureReactionCooldown]
	and a
	ret nz
	ld a, b
	add a                            ; id * 2
	ld e, a
	ld d, 0
	ld hl, FieldEventPools
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a                          ; hl = this event's nature pool table
	ld a, [wWhichPokemon]
	call ShowMonReaction
	ld a, NATURE_REACTION_COOLDOWN
	ld [wNatureReactionCooldown], a
	ret

; -------------------------------------------------------------------------------------------
; FLY / DIG / TELEPORT: these warp away, so the reaction is deferred to the destination. Arm it
; here (records the using mon) if off cooldown; FireDeferredNatureReaction pops it after arrival.
; input: a = deferred event id (NRDEF_*)
ArmDeferredNatureReaction::
	ld b, a                          ; b = deferred event id (0-2)
	ld a, [wNatureReactionCooldown]
	and a
	ret nz
	sla b
	sla b
	sla b                            ; b = eventid << 3
	ld a, [wWhichPokemon]
	inc a                            ; index + 1 (1-6, keeps the byte nonzero = armed)
	or b                             ; pack: (eventid << 3) | (index + 1)
	ld [wNatureReactionPending], a
	ret

; Called from EnterMap once the destination map is loaded and joypad is re-enabled. Pops the
; armed mon (using that warp move's own pool) with its cry + a nature line, then starts cooldown.
FireDeferredNatureReaction::
	ld a, [wNatureReactionPending]
	and a
	ret z
	ld b, a                          ; b = packed value
	xor a
	ld [wNatureReactionPending], a   ; consume the pending flag
	; deferred event id -> pool table
	ld a, b
	srl a
	srl a
	srl a                            ; a = deferred event id
	add a
	ld e, a
	ld d, 0
	ld hl, DeferredEventPools
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a                          ; hl = this warp move's nature pool table
	ld a, b
	and %111
	dec a                            ; a = party index
	call ShowMonReaction
	ld a, NATURE_REACTION_COOLDOWN
	ld [wNatureReactionCooldown], a
	ret
; -------------------------------------------------------------------------------------------
; BATTLE WIN: per-fight themed reaction (text only - battle VRAM). Identifies the specific
; fight by map + class (+ trainerNo), then dispatches by mode. Reacting mon = wPlayerMonNumber.
TryBattleWinReaction::
	CheckEvent EVENT_IN_FITNESS_BATTLE
	ret nz                       ; fitness battles never react
	call IdentifyNotableFight
	ret nc                       ; not a notable fight
	; Rocket sisters (Silph 6F-9F, any order): react only when the LAST of the four is beaten.
	; Like the Fuji grunts, the just-won sister's beaten event isn't set yet, so "final" = the
	; other three are already beaten. The lead mon (slot 1) cries and a fixed caption pops up.
	ld a, h
	cp HIGH(FR_Queen)
	jr nz, .notQueen
	ld a, l
	cp LOW(FR_Queen)
	jr nz, .notQueen
	call RocketQueenIsFinal
	ret nc                       ; not the last sister yet
	call BadgeMonCry             ; lead mon's cry (home bank, register-transparent)
	ld hl, FR_QueenText
	rst _PrintText
	ret
.notQueen
	; Mr. Fuji grunts (Tower 7F): react only on the FINAL grunt. The just-won grunt's beaten
	; event isn't set yet, so "final" = the other two are already beaten.
	ld a, h
	cp HIGH(FR_FujiGrunt)
	jr nz, .show
	ld a, l
	cp LOW(FR_FujiGrunt)
	jr nz, .show
	call FujiGruntIsFinal
	ret nc                       ; not the last grunt yet
	ld hl, FR_FujiGrunt          ; FujiGruntIsFinal clobbered hl; reload the descriptor
.show
	; hl = descriptor; preserve wPokedexNum (GetPartyMonNatures overwrites it)
	ld a, [wPokedexNum]
	push af
	call ShowBattleReaction
	pop af
	ld [wPokedexNum], a
	ret

; carry set if at least two of the three Tower-7F rocket grunts are already beaten (so the one
; just defeated is the third/final). c = count of beaten grunts.
FujiGruntIsFinal:
	ld c, 0
	CheckEvent EVENT_BEAT_POKEMONTOWER_7_TRAINER_0
	jr z, .skip0
	inc c
.skip0
	CheckEvent EVENT_BEAT_POKEMONTOWER_7_TRAINER_1
	jr z, .skip1
	inc c
.skip1
	CheckEvent EVENT_BEAT_POKEMONTOWER_7_TRAINER_2
	jr z, .skip2
	inc c
.skip2
	ld a, c
	cp 2                         ; carry set if c < 2
	ccf                          ; -> carry set if c >= 2 (this is the final grunt)
	ret

; carry set if at least three of the four Rocket-sister flags are already set (so the one just
; defeated is the fourth/final). Sisters: Silph 6F TRAINER_0, 7F/8F/9F TRAINER_2. c = beaten count.
RocketQueenIsFinal:
	ld c, 0
	CheckEvent EVENT_BEAT_SILPH_CO_6F_TRAINER_0
	jr z, .skip0
	inc c
.skip0
	CheckEvent EVENT_BEAT_SILPH_CO_7F_TRAINER_2
	jr z, .skip1
	inc c
.skip1
	CheckEvent EVENT_BEAT_SILPH_CO_8F_TRAINER_2
	jr z, .skip2
	inc c
.skip2
	CheckEvent EVENT_BEAT_SILPH_CO_9F_TRAINER_2
	jr z, .skip3
	inc c
.skip3
	ld a, c
	cp 3                         ; carry set if c < 3
	ccf                          ; -> carry set if c >= 3 (this is the final sister)
	ret

; output: carry set + hl = descriptor (db mode, dw ptrA, dw ptrB) if this is a notable fight.
; Scans NotableFightTable: db map, db class($FF=any), db trainerNo($FF=any), dw descriptor; -1 end.
IdentifyNotableFight:
	ld hl, NotableFightTable
.loop
	ld a, [hl]
	cp -1
	jr z, .none
	ld a, [wCurMap]
	cp [hl]
	jr nz, .advance
	inc hl                       ; -> class
	ld a, [hl]
	cp $ff
	jr z, .classMatch
	ld b, a
	ld a, [wTrainerClass]
	cp b
	jr nz, .advanceFromClass
.classMatch
	inc hl                       ; -> trainerNo
	ld a, [hl]
	cp $ff
	jr z, .tnMatch
	ld b, a
	ld a, [wTrainerNo]
	cp b
	jr nz, .advanceFromTn
.tnMatch
	inc hl                       ; -> descriptor lo
	ld a, [hli]
	ld h, [hl]
	ld l, a
	scf
	ret
.advance                         ; hl at map
	inc hl
.advanceFromClass                ; hl at class
	inc hl
.advanceFromTn                   ; hl at trainerNo
	inc hl
	inc hl
	inc hl                        ; -> next entry
	jr .loop
.none
	or a
	ret

; input: hl = descriptor. Interprets the mode and shows the reaction (text only).
ShowBattleReaction:
	ld a, [hli]                  ; mode
	push af
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl                       ; de = ptrA
	ld c, [hl]
	inc hl
	ld b, [hl]                   ; bc = ptrB
	pop af                       ; a = mode
	cp NRM_STD
	jr z, .std
	cp NRM_NATURE
	jr z, .nature
	cp NRM_NATURE_HEALTH
	jr z, .natureHealth
	cp NRM_TYPE
	jr z, .type
	cp NRM_TYPE_HEALTH
	jr z, .typeHealth
	ret                          ; NRM_NONE / unknown
.std
	push de
	push bc
	ld a, [wPlayerMonNumber]
	ld hl, BattleTellNaturePool
	call GetReactionLine         ; beat 1: shared type/nature tell
	ld a, [wPlayerMonNumber]
	call PrintMonLine
	pop bc
	pop de
	call BR_PickHealthPool       ; beat 2: green vs hurt themed line
	call PickRandomLine
	ld a, [wPlayerMonNumber]
	jp PrintMonLine
.nature
	ld h, d
	ld l, e
	ld a, [wPlayerMonNumber]
	call PickNatureLine
	ld a, [wPlayerMonNumber]
	jp PrintMonLine
.natureHealth
	call BR_PickHealthPool
	ld a, [wPlayerMonNumber]
	call PickNatureLine
	ld a, [wPlayerMonNumber]
	jp PrintMonLine
.type
	ld h, d
	ld l, e
	ld a, [wPlayerMonNumber]
	call BR_TypeLine             ; hl = text, carry set if matched
	ret nc
	ld a, [wPlayerMonNumber]
	jp PrintMonLine
.typeHealth
	call BR_PickHealthPool
	ld a, [wPlayerMonNumber]
	call BR_TypeLine
	ret nc
	ld a, [wPlayerMonNumber]
	jp PrintMonLine

; green (wPlayerHPBarColor==0) -> de, else bc. returns hl = chosen pool. de/bc = ptrA/ptrB.
BR_PickHealthPool:
	ld a, [wPlayerHPBarColor]
	and a
	jr nz, .hurt
	ld h, d
	ld l, e
	ret
.hurt
	ld h, b
	ld l, c
	ret

; input: a = mon index, hl = sparse type pool table. out: hl = text + carry, or carry clear.
BR_TypeLine:
	push hl
	call GetMonReactionType
	pop hl
	call FindTypePoolInTable
	ret nc
	call PickRandomLine
	scf
	ret

; -------------------------------------------------------------------------------------------
; LEGENDARY: after defeating OR capturing a legendary, the mon that fought (wPlayerMonNumber,
; fallback lead) pops up with its cry + a reaction. input: a = legend id (NRLEG_*).
ShowLegendaryReaction::
	ld b, a                      ; b = legend id (preserved through the branches below)
	; validated reacting mon index -> c
	ld a, [wPlayerMonNumber]
	ld hl, wPartyCount
	cp [hl]
	jr c, .idxOk
	xor a                        ; out of range -> fall back to the lead mon
.idxOk
	ld c, a
	; reactor species
	ld hl, wPartySpecies
	ld d, 0
	ld e, c
	add hl, de
	ld a, [hl]
	cp MEWTWO
	jr z, .reactorMewtwo
	cp ARMORED_MEWTWO
	jr z, .reactorMewtwo
	cp MEW
	jr z, .reactorMew
	ld a, b
	cp NRLEG_MEW
	jr z, .legendMew
	; --- type-share vs the legend ---
	ld a, b
	ld l, a
	ld h, 0
	add hl, hl                   ; *2
	ld d, h
	ld e, l
	add hl, hl                   ; *4
	add hl, de                   ; *6
	ld de, LegendData
	add hl, de                   ; hl -> entry {db t1, t2; dw awe; dw exhausted}
	ld a, [hli]
	ld d, a                      ; d = legend type 1
	ld a, [hli]
	ld e, a                      ; e = legend type 2
	push hl                      ; [-> awe ptr]
	ld a, [wPlayerMonNumber]
	ld hl, wPartyMon1Type1
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes               ; hl -> reactor Type1 (AddNTimes preserves de)
	ld a, [hli]                  ; reactor type 1
	cp d
	jr z, .shares
	cp e
	jr z, .shares
	ld a, [hl]                   ; reactor type 2
	cp d
	jr z, .shares
	cp e
	jr z, .shares
	pop hl                       ; -> awe ptr
	inc hl
	inc hl                       ; -> exhausted ptr
	jr .loadPool
.shares
	pop hl                       ; -> awe ptr
.loadPool
	ld a, [hli]
	ld h, [hl]
	ld l, a                      ; hl = pool
	call PickRandomLine
	jp .show
.legendMew
	ld a, [wPlayerMonNumber]
	ld hl, MewWonderNaturePool
	call PickNatureLine
	jr .show
.reactorMewtwo
	ld a, b
	cp NRLEG_MEW
	ld hl, LegMewtwoHatredPool
	jr z, .rmPick
	ld hl, LegMewtwoUnimpressedPool
.rmPick
	call PickRandomLine
	jr .show
.reactorMew
	ld a, b
	cp NRLEG_MEWTWO
	ld hl, LegMewSorrowPool
	jr z, .rwPick
	ld hl, LegMewPlayfulPool
.rwPick
	call PickRandomLine
	; fall through to .show
.show
	; hl = text ptr; recompute validated index, then sprite-pop + cry + print
	push hl
	ld a, [wPlayerMonNumber]
	ld hl, wPartyCount
	cp [hl]
	jr c, .showIdxOk
	xor a
.showIdxOk
	pop hl
	jp ShowMonSpriteLine

; -------------------------------------------------------------------------------------------
; EVOLUTION: per-species line for the freshly evolved form (wEvoNewSpecies). Text only; the
; evolved sprite is already on the evolution screen, and its name is already in wNameBuffer.
ShowEvolutionReaction::
	ld a, [wEvoNewSpecies]
	ld b, a
	ld hl, EvolutionReactionLines
.search
	ld a, [hl]
	cp -1
	jr z, .fallback
	cp b
	jr z, .found
	inc hl
	inc hl
	inc hl
	jr .search
.found
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a                      ; hl = this species' pool (db count, then count * dw)
	call PickRandomLine          ; pick one of its 4 lines at random
	rst _PrintText
	ret
.fallback
	ld hl, EvolutionReactionFallbackText
	rst _PrintText
	ret

; ===========================================================================================
; OVERWORLD PLOT REACTIONS (one-time, slot-1 nature-only sprite pops + a few special variants)
; ===========================================================================================

; nature-only reaction (no type-tell overlay). input: a = party index, hl = 8-nature pool
ShowMonNaturePure::
	push af
	call PickNatureLine          ; hl = chosen nature line
	pop af
	jp ShowMonSpriteLine

; input: a = overworld event id (NROW_*). Lead mon reacts with that event's nature pool.
; Sunsette: guard on an empty party -- with no lead mon (e.g. after DECLINING the starter),
; slot 0 is garbage and popping its sprite/cry hangs the next VBlank (DelayFrame lock).
ShowOverworldNature::
	ld b, a                      ; b = event id (preserved across the party check)
	ld a, [wPartyCount]
	and a
	ret z                        ; no lead mon -> no overworld reaction
	ld a, b
	add a
	ld e, a
	ld d, 0
	ld hl, OverworldEventPools
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a                      ; hl = pool table for this event
	xor a                        ; lead mon (slot 0)
	jp ShowMonNaturePure

; input: a = target type. out: carry set + a = index of first party mon with that type
; (checks both of each mon's types); carry clear if none.
FindPartyTypeIndex::
	ld d, a                      ; d = target type
	ld e, 0                      ; e = index
.loop
	ld a, [wPartyCount]
	cp e
	jr z, .none
	ld a, e
	ld hl, wPartyMon1Type1
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes               ; hl -> this mon's Type1 (preserves de, bc)
	ld a, [hli]
	cp d
	jr z, .found
	ld a, [hl]
	cp d
	jr z, .found
	inc e
	jr .loop
.found
	ld a, e
	scf
	ret
.none
	or a
	ret

; input: a = party index, hl = type table (dbw TYPE,pool; -1 term; NO wildcard).
; out: carry set + hl = matched pool if EITHER of the mon's two types is in the table; else carry clear.
PickSlotTypePool::
	push hl
	ld hl, wPartyMon1Type1
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hli]
	ld d, a                      ; type 1
	ld e, [hl]                   ; type 2
	pop hl                       ; table
	push hl
	ld a, d
	call FindTypePoolInTable
	jr c, .found
	pop hl
	ld a, e
	jp FindTypePoolInTable       ; tail: returns its own carry + hl
.found
	pop bc                       ; discard saved table
	ret

; --- Bill's cottage: the first psychic in the party understands what happened to Bill ---
ShowBillPsychicReaction::
	ld a, PSYCHIC_TYPE
	call FindPartyTypeIndex
	ret nc                       ; no psychic -> nothing (the script consumes the flag anyway)
	ld hl, BillPsychicPool
	jp ShowMonNaturePure

; --- Rock Tunnel dark floor change: poison/bug/ghost/psychic are comfortable, others exasperated ---
ShowDarkTunnelReaction::
	xor a
	ld hl, DarkFriendlyTable
	call PickSlotTypePool
	jr c, .havePool
	ld hl, DarkExasperationPool
.havePool
	xor a
	jp ShowMonNaturePure

; --- Route 19 from Fuchsia: sunny beach, but rock types are uncomfortable ---
ShowRoute19Reaction::
	xor a
	ld hl, Route19RockTable
	call PickSlotTypePool
	jr c, .havePool
	ld hl, Route19BeachPool
.havePool
	xor a
	jp ShowMonNaturePure

; --- Cycling road with a flying type: the flyer enjoys the wind. Carry set if it fired. ---
ShowCyclingFlyReaction::
	ld a, FLYING
	call FindPartyTypeIndex
	ret nc                       ; no flying type -> didn't fire (carry clear)
	ld hl, CyclingFlyPool
	call ShowMonNaturePure
	scf
	ret

; --- single-line "same for every mon" reactions (lead mon's sprite/cry/name, identical text) ---
ShowMansionReaction::
	xor a
	ld hl, MansionReactionText
	jp ShowMonSpriteLine

ShowCeruleanCaveReaction::
	xor a
	ld hl, CeruleanCaveReactionText
	jp ShowMonSpriteLine

; --- map-side wrappers (call these from the map _Script; they self-gate on their one-time flag) ---

; Within 4 tiles of the Celadon Dept Store / Silph Co door (shared flag). Call from those cities.
TryTallBuildingReaction::
	CheckEvent EVENT_REACTED_TALL_BUILDING
	ret nz
	ld a, [wCurMap]
	cp CELADON_CITY
	jr z, .celadon
	cp SAFFRON_CITY
	ret nz
	ld b, 18                     ; Silph Co door x
	ld c, 21                     ; door y
	jr .checkRange
.celadon
	ld b, 9                      ; Celadon Dept Store door x
	ld c, 13                     ; door y
.checkRange
	ld a, [wXCoord]
	sub b
	add 4
	cp 9                         ; |dx| <= 4 ?
	ret nc
	ld a, [wYCoord]
	sub c
	add 4
	cp 9                         ; |dy| <= 4 ?
	ret nc
	SetEvent EVENT_REACTED_TALL_BUILDING
	ld a, NROW_TALL_BUILDING
	jp ShowOverworldNature

; Cycling road forced-bike + a flying type in party (shared flag). Call from Route 16/17/18.
TryCyclingFlyReaction::
	CheckEvent EVENT_REACTED_CYCLING_FLY
	ret nz
	ld a, [wStatusFlags6]
	bit BIT_ALWAYS_ON_BIKE, a
	ret z
	call ShowCyclingFlyReaction
	ret nc                       ; no flying type -> stay eligible
	SetEvent EVENT_REACTED_CYCLING_FLY
	ret

; Rock Tunnel floor change while dark (shared flag). input: a = the OTHER tunnel floor map id.
TryDarkTunnelReaction::
	ld b, a
	CheckEvent EVENT_REACTED_DARK_TUNNEL
	ret nz
	ld a, [wWarpedFromWhichMap]
	cp b
	ret nz                       ; didn't just come from the other floor
	ld a, [wMapPalOffset]
	cp 3
	ret c                        ; cave is lit (FLASH) -> skip
	SetEvent EVENT_REACTED_DARK_TUNNEL
	jp ShowDarkTunnelReaction
