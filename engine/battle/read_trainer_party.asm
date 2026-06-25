ReadTrainer:

; don't change any moves in a link battle
	ld a, [wLinkState]
	and a
	ret nz

; set [wEnemyPartyCount] to 0, [wEnemyPartySpecies] to FF
; XXX first is total enemy pokemon?
; XXX second is species of first pokemon?
	ld hl, wEnemyPartyCount
	xor a
	ld [wIsAltPalettePkmnData], a ; PureRGBnote: ADDED: NPC trainers by default have normal palette pokemon, only specific party types can have alt palettes
	ld [hli], a
	dec a
	ld [hl], a

; get the pointer to trainer data for this class
	ld a, [wTrainerClass] ; Sunsette: raw class now (no OPP_ID_OFFSET)
	dec a ; class - 1 (0-based index)
	add a
	ld hl, TrainerDataPointers
	ld c, a
	ld b, 0
	add hl, bc ; hl points to trainer class
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wTrainerNo]
	ld b, a
; At this point b contains the trainer number,
; and hl points to the trainer class.
; Our next task is to iterate through the trainers,
; decrementing b each time, until we get to the right one.
.CheckNextTrainer
	dec b
	jr z, .IterateTrainer
.SkipTrainer
	ld a, [hli]
	and a
	jr nz, .SkipTrainer
	jr .CheckNextTrainer

; if the first byte of trainer data is FF,
; - each pokemon has a specific level
;      (as opposed to the whole team being of the same level)
; else the first byte is the level of every pokemon on the team
.IterateTrainer
	CheckEvent EVENT_IN_FITNESS_BATTLE
	jr z, .notFitnessBattle
	callfar GetFitnessTrainerPartyPointer
	ld h, d
	ld l, e
.notFitnessBattle
	ld a, [hli]
	cp $FF ; is the trainer special?
	jr z, .SpecialTrainer ; if so, check for special moves
;;;;;;;;;; PureRGBnote: ADDED: parties that start with $FE are considered alt palette teams.
	cp $FE ; is the trainer special with alt palettes?
	jr z, .SpecialTrainer ; if so, load their alt palette flags as well as levels
;;;;;;;;;;
	cp $FD
	jr z, .CustomMovesetTrainer
	call AdjustGymTrainerLevel ; Sunsette: scale gym-trainer level to the player's badge tier
	ld [wCurEnemyLevel], a
	CheckEvent EVENT_IN_FITNESS_BATTLE
	jr z, .LoopTrainerData
	ld a, [wFitnessOpponentLevel]
	ld [wCurEnemyLevel], a
.LoopTrainerData
	ld a, [hli]
	and a ; have we reached the end of the trainer data?
	jp z, .FinishUp
	ld [wCurPartySpecies], a
	CheckEvent EVENT_IN_FITNESS_BATTLE
	jr z, .noRandomFitnessPokemon
	push hl
	callfar GetRandomFitnessPokemon
	pop hl
.noRandomFitnessPokemon
	ld a, ENEMY_PARTY_DATA
	ld [wMonDataLocation], a
	push hl
	call AddPartyMon
	pop hl
	jr .LoopTrainerData
.SpecialTrainer
	call .SpecialTrainerLoop
	jr .FinishUp
;;;;;;;;;; PureRGBnote: ADDED: code that facilitates assigning custom moves to pokemon
.CustomMovesetTrainer
	ld a, [hli] ; which moveset will be used
	push af
	call .SpecialTrainerLoop
	pop af
	ld d, a
	callfar LoadTrainerMoveSet
	jr .FinishUp
;;;;;;;;;;
.SpecialTrainerLoop
; if this code is being run:
; - each pokemon has a specific level stored in the first byte
;      (as opposed to the whole team being of the same level)
; - the level byte's last bit indicates whether the pokemon uses alternate palette
;   bit 7 (the final bit) of the level byte is only possible to be set if the level is above 127.
;   Since max is 100, we'll never set it. So we can use it to indicate whether the pokemon is using an alternate palette.
	ld a, [hli]
	and a ; have we reached the end of the trainer data?
	ret z
;;;;;;;;;; PureRGBnote: ADDED: final bit of "pokemon level" in special parties is used to indicate pokemon having alternate palette.
	bit BIT_ALT_PALETTE_TRAINER_MON, a
	push af
	ld a, 1 
	jr nz, .altPalette
	xor a
.altPalette
	ld [wIsAltPalettePkmnData], a
	pop af
	and %01111111
;;;;;;;;;;
	call AdjustGymTrainerLevel ; Sunsette: scale gym-trainer level to the player's badge tier (leaders skipped by class)
	ld [wCurEnemyLevel], a
	ld a, [hli]
	ld [wCurPartySpecies], a
	ld a, ENEMY_PARTY_DATA
	ld [wMonDataLocation], a
	push hl
	call AddPartyMon
	pop hl
	jr .SpecialTrainerLoop
.FinishUp
; clear wAmountMoneyWon addresses
	xor a
;;;;;;;;;; PureRGBnote: ADDED: can't have alt palette pokemon at this point.
	ld [wIsAltPalettePkmnData], a
;;;;;;;;;;
	ld de, wAmountMoneyWon
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	ld a, [wCurEnemyLevel]
	ld b, a
.LastLoop
; update wAmountMoneyWon addresses (money to win) based on enemy's level
	ld hl, wTrainerBaseMoney + 1
	ld c, 2 ; wAmountMoneyWon is a 3-byte number
	push bc
	predef AddBCDPredef
	pop bc
	inc de
	inc de
	dec b
	jr nz, .LastLoop ; repeat wCurEnemyLevel times
	ret

; Sunsette: auto-scale a GYM TRAINER's mon level to the player's badge tier.
; Applies ONLY inside the seven first-seven gyms AND when the opponent is NOT a leader class
; (leaders carry their own per-tier levels and are skipped by class). delta = anchor[playerTier] -
; anchor[gymNaturalTier]; new level clamped 1..100. Raw level rides the stack across CountSetBits.
; In:  a = raw level.  Out: a = adjusted level. Preserves hl/de/bc.
AdjustGymTrainerLevel:
	push hl
	push de
	push bc
	ld c, a ; c = raw level (kept until match)
	ld a, [wTrainerClass]
	cp BROCK
	jr c, .findMap ; class < BROCK -> not a leader
	cp SABRINA + 1
	jr c, .restoreRaw ; BROCK..SABRINA -> leader, never scale
.findMap
	ld a, [wCurMap]
.scan
	ld hl, GymScalingMaps
.scanLoop
	ld b, [hl] ; map id (or -1)
	inc hl
	ld d, [hl] ; natural tier
	inc hl
	ld e, b
	ld b, a ; b = wCurMap
	ld a, e
	cp -1
	jr z, .restoreRawA ; end of table -> not a scaling gym
	cp b
	ld a, b ; restore a = wCurMap for next iteration
	jr nz, .scanLoop
	; matched: d = gym natural tier, c = raw level
	push bc ; [stack] raw level (in c)
	push de ; [stack] gym tier (in d)
	ld hl, wObtainedBadges
	ld b, 1
	call CountSetBits ; clobbers a/b/c/d/e/hl
	ld a, [wNumSetBits]
	cp 7
	jr c, .pok
	ld a, 6
.pok
	inc a ; player tier (1..7)
	dec a
	ld e, a
	ld d, 0
	ld hl, GymTierAnchors
	add hl, de
	ld a, [hl] ; player anchor
	pop de ; d = gym tier
	ld c, a ; c = player anchor
	ld a, d
	dec a
	ld e, a
	ld d, 0
	ld hl, GymTierAnchors
	add hl, de
	ld b, [hl] ; b = gym anchor
	pop hl ; l = raw level (pushed as bc)
	ld a, l
	add c ; raw + player anchor (<=161)
	sub b ; - gym anchor
	jr c, .clampLow ; borrow -> negative
	and a
	jr z, .clampLow ; 0 -> 1
	cp 101
	jr c, .ret
	ld a, 100
	jr .ret
.clampLow
	ld a, 1
	jr .ret
.restoreRawA
	ld a, c
.restoreRaw
	ld a, c
.ret
	pop bc
	pop de
	pop hl
	ret

; (mapid, naturalTier) pairs for the seven scaling gyms; -1 terminated. Natural tier = the leader's
; home slot (Brock 1 ... Blaine 7), matching wGymLeaderNo.
GymScalingMaps:
	db PEWTER_GYM, 1
	db CERULEAN_GYM, 2
	db VERMILION_GYM, 3
	db CELADON_GYM, 4
	db FUCHSIA_GYM, 5
	db SAFFRON_GYM, 6
	db CINNABAR_GYM, 7
	db -1

; representative level per tier (1..7); trainer scaling shifts by the difference between the player's
; tier anchor and the gym's home-tier anchor.
GymTierAnchors:
	db 13, 22, 27, 36, 48, 56, 61
