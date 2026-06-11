; Sunsette: "morale lockout". Once you're inside a gym, the Rocket Hideout (B1F-B4F), or Silph Co. 2F+,
; trying to LEAVE before you've beaten the boss (the gym leader, or Giovanni for the Hideout/Silph) pops
; a confirmation. Leaving anyway costs every active, unfainted party mon 16 affection. Covers walking out
; (WarpFound2) and every menu escape - Teleport, Dig, Fly, Escape Rope, Pocket Abra - which all funnel
; through HandleFlyWarpOrDungeonWarp. The "lock" is derived on the fly (locked map + boss event unset);
; no entry script or saved flag. Both home-bank choke points callfar in here.

; ---- entry from WarpFound2 (walking out a door / down to 1F / up to the Game Corner / elevator) ----
; reads wCurMap (origin) + hWarpDestinationMap (dest). carry SET = allow the warp; carry CLEAR = the
; player declined - we've already queued a one-tile walk-back, so the home hook just aborts the warp.
CheckLockedWalkExit_::
	call LockedGateActive
	jr nc, .allow
	ldh a, [hWarpDestinationMap]
	call IsMapInLockedSet ; destination still inside the locked area (floor-to-floor) -> not leaving
	jr c, .allow
	call PromptLockedExit
	ret c ; chose to leave (affection already drained)
	call QueueWalkBack
	and a ; clear carry = abort
	ret
.allow
	scf
	ret

; ---- entry from HandleFlyWarpOrDungeonWarp (menu escapes) ----
; carry SET = allow; carry CLEAR = declined (we've cleared the pending fly/escape warp flags).
CheckLockedMenuExit_::
	call LockedGateActive
	jr nc, .allow
	call PromptLockedExit
	ret c
	ld hl, wStatusFlags6
	res BIT_FLY_WARP, [hl]
	res BIT_ESCAPE_WARP, [hl]
	res BIT_DUNGEON_WARP, [hl]
	and a
	ret
.allow
	scf
	ret

; carry SET if wCurMap is a locked area whose boss event is NOT yet set; else carry CLEAR.
LockedGateActive:
	ld a, [wCurMap]
	call IsMapInLockedSet
	ret nc ; not a locked map -> gate inactive
	ld a, [wCurMap]
	cp PEWTER_GYM
	jr nz, .nP
	CheckEvent EVENT_BEAT_BROCK
	jr .activeIfUnset
.nP
	cp CERULEAN_GYM
	jr nz, .nC
	CheckEvent EVENT_BEAT_MISTY
	jr .activeIfUnset
.nC
	cp VERMILION_GYM
	jr nz, .nV
	CheckEvent EVENT_BEAT_LT_SURGE
	jr .activeIfUnset
.nV
	cp CELADON_GYM
	jr nz, .nCe
	CheckEvent EVENT_BEAT_ERIKA
	jr .activeIfUnset
.nCe
	cp FUCHSIA_GYM
	jr nz, .nF
	CheckEvent EVENT_BEAT_KOGA
	jr .activeIfUnset
.nF
	cp SAFFRON_GYM
	jr nz, .nSa
	CheckEvent EVENT_BEAT_SABRINA
	jr .activeIfUnset
.nSa
	cp CINNABAR_GYM
	jr nz, .nCi
	CheckEvent EVENT_BEAT_BLAINE
	jr .activeIfUnset
.nCi
	cp VIRIDIAN_GYM
	jr nz, .nVi
	CheckEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	jr .activeIfUnset
.nVi
	cp ROCKET_HIDEOUT_B1F
	jr c, .silph
	cp ROCKET_HIDEOUT_ELEVATOR + 1
	jr nc, .silph
	CheckEvent EVENT_BEAT_ROCKET_HIDEOUT_GIOVANNI
	jr .activeIfUnset
.silph
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI ; in-set + not gym/rocket -> it's a Silph 2F+ map
.activeIfUnset
	jr nz, .inactive ; event set (boss beaten) -> inactive
	scf
	ret
.inactive
	and a
	ret

; a = map id. carry SET if it's in the locked set (gyms / Rocket B1F-B4F+lift / Silph 2F-11F+lift).
; 1F and the Game Corner are deliberately NOT in the set.
IsMapInLockedSet:
	cp PEWTER_GYM
	jr z, .yes
	cp CERULEAN_GYM
	jr z, .yes
	cp VERMILION_GYM
	jr z, .yes
	cp CELADON_GYM
	jr z, .yes
	cp FUCHSIA_GYM
	jr z, .yes
	cp SAFFRON_GYM
	jr z, .yes
	cp CINNABAR_GYM
	jr z, .yes
	cp VIRIDIAN_GYM
	jr z, .yes
	cp ROCKET_HIDEOUT_B1F ; $C7..$CB (B1F-B4F + elevator)
	jr c, .checkSilph
	cp ROCKET_HIDEOUT_ELEVATOR + 1
	jr c, .yes
.checkSilph
	cp SILPH_CO_2F ; $CF..$D5 (2F-8F)
	jr c, .no
	cp SILPH_CO_8F + 1
	jr c, .yes
	cp SILPH_CO_9F ; $E9..$EC (9F-11F + elevator)
	jr c, .no
	cp SILPH_CO_ELEVATOR + 1
	jr c, .yes
.no
	and a
	ret
.yes
	scf
	ret

; Names the top-affection unfainted mon, prints the warning, shows a default-NO yes/no.
; carry SET = leave (and 16 affection drained from every unfainted mon); carry CLEAR = stay.
PromptLockedExit:
	call SaveScreenTilesToBuffer2 ; snapshot the overworld so a "stay" restores it
	call FindTopAffectionMon
	ld [wWhichPokemon], a
	ld hl, wPartyMonNicks
	call GetPartyMonName ; -> wNameBuffer
	ld hl, LockedAreaExitText
	call PrintText
	; standard YES/NO box, but cursor defaults to NO and B = NO (the engine maps B to the 2nd option)
	call SaveScreenTilesToBuffer1
	ld a, 1 << BIT_SECOND_MENU_OPTION_DEFAULT ; YES_NO_MENU (0) + default to the second option (NO)
	ld [wTwoOptionMenuID], a
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	hlcoord 14, 7
	lb bc, 8, 15
	call DisplayTextBoxID
	call LoadScreenTilesFromBuffer1
	ld a, [wCurrentMenuItem]
	and a ; 0 = YES (leave), 1 = NO (stay)
	jr nz, .stay
	call DrainAffection16
	call LoadScreenTilesFromBuffer2
	scf
	ret
.stay
	call LoadScreenTilesFromBuffer2
	and a
	ret

; returns a = party slot (0-based) of the highest-affection UNFAINTED mon; ties -> highest slot.
FindTopAffectionMon:
	ld a, [wPartyCount]
	and a
	ret z ; a = 0 (no party - shouldn't happen)
	ld b, a ; count
	ld c, 0 ; slot
	ld d, 0 ; best slot
	ld e, 0 ; best affection (>= so ties prefer the later/higher slot)
.loop
	push bc
	push de
	ld a, c
	ld hl, wPartyMon1 + 1 ; HP
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hli]
	or [hl] ; 0 -> fainted
	pop de
	pop bc
	jr z, .next
	push bc
	ld b, 0
	ld hl, wPartyMonHappiness
	add hl, bc ; &happiness[slot]
	pop bc
	ld a, [hl]
	cp e
	jr c, .next ; affection < best
	ld e, a
	ld d, c
.next
	inc c
	dec b
	jr nz, .loop
	ld a, d
	ret

; subtract 16 (floored at 0) from the affection of every unfainted party mon.
DrainAffection16:
	ld a, [wPartyCount]
	and a
	ret z
	ld b, a ; count
	ld c, 0 ; slot
.loop
	push bc
	ld a, c
	ld hl, wPartyMon1 + 1 ; HP
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hli]
	or [hl]
	pop bc
	jr z, .next ; fainted
	push bc
	ld b, 0
	ld hl, wPartyMonHappiness
	add hl, bc
	pop bc
	ld a, [hl]
	sub 16
	jr nc, .store
	xor a ; underflow -> 0
.store
	ld [hl], a
.next
	inc c
	dec b
	jr nz, .loop
	ret

; queue a single forced step one tile OPPOSITE the player's facing (back off the warp/stairs).
QueueWalkBack:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_DOWN
	ld b, PAD_UP
	jr z, .gotDir
	cp SPRITE_FACING_UP
	ld b, PAD_DOWN
	jr z, .gotDir
	cp SPRITE_FACING_LEFT
	ld b, PAD_RIGHT
	jr z, .gotDir
	ld b, PAD_LEFT ; facing right -> step left
.gotDir
	ld a, b
	ld [wSimulatedJoypadStatesEnd], a
	ld a, 1
	ld [wSimulatedJoypadStatesIndex], a
	jp StartSimulatingJoypadStates

LockedAreaExitText:
	text_far _LockedAreaExitText
	text_end
