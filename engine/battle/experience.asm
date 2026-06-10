GainExperience:
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	ret z ; return if link battle
; Sunsette: always-on EXP ALL once the Pokedex is obtained
	xor a
	ld [wExpAllActive], a
	ld [wTeamExpGained], a
	ld [wTeamExpGained + 1], a
	CheckEvent EVENT_GOT_POKEDEX
	jr z, .noExpAll
	ld a, 1
	ld [wExpAllActive], a
	jr .afterDivide ; exp-all gives each mon a fixed fraction of the full (undivided) yield
.noExpAll
	call DivideExpDataByNumMonsGainingExp
.afterDivide
	ld hl, wPartyMon1
	xor a
	ld [wWhichPokemon], a
.partyMonLoop ; loop over each mon and add gained exp
	CheckEvent EVENT_IN_FITNESS_BATTLE
	jr z, .notFitnessBattle1
	push hl
	ld bc, wPartyMon1Level - wPartyMon1
	add hl, bc
	ld c, [hl]
	ld a, [wLevelLimit]
	dec a
	cp c
	pop hl
	jp c, .nextMon ; no EXP gain for pokemon over fitness level limit
.notFitnessBattle1
	ld a, 4
	ld [wTempByteValue], a ; Sunsette: share sentinel - 4 = unfainted participant (60% of yield); 1 = "other" mon (20%)
	inc hl
	ld a, [hli]
	or [hl] ; is mon's HP 0?
	jr nz, .notFainted
	ld a, [wExpAllActive]
	and a
	jp z, .nextMon ; original: a fainted mon gains nothing
	ld a, 1
	ld [wTempByteValue], a ; exp-all: fainted mon is an "other" -> 20% of yield (x1 then /5)
.notFainted
	push hl
	ld hl, wPartyGainExpFlags
	ld a, [wWhichPokemon]
	ld c, a
	ld b, FLAG_TEST
	call FlagAction
	pop hl
	jr nz, .gainsExp ; flag set -> direct participant
	ld a, [wExpAllActive]
	and a
	jp z, .nextMon ; original: a non-participant gains nothing
	ld a, 1
	ld [wTempByteValue], a ; exp-all: non-participant -> 20% of yield (x1 then /5)
.gainsExp
	ld de, (MON_HP_EXP + 1) - (MON_HP + 1)
	add hl, de ; hl = this mon's stat-exp base pointer
; Sunsette: decide how many times to add the enemy's base stats as stat exp.
; "other" mons (share multiplier != 4) get none; participants get 1x in the wild, 3x vs trainers.
	ld a, [wTempByteValue]
	cp 4
	jr z, .statExpParticipant
	ld b, 0 ; other mon -> no stat exp
	jr .statExpRepsReady
.statExpParticipant
	ld b, 1 ; participant baseline (wild)
	ld a, [wExpAllActive]
	and a
	jr z, .statExpRepsReady ; pre-Pokedex -> normal 1x stat exp
	ld a, [wIsInBattle]
	dec a ; wild == 1 -> 0, trainer == 2 -> nonzero
	jr z, .statExpRepsReady ; wild -> 1x
	ld b, 3 ; trainer battle -> triple stat exp
.statExpRepsReady
	; b = rep count (0/1/3); hl = stat-exp base pointer
.statExpRepLoop
	ld a, b
	and a
	jr z, .statExpRepsDone
	push hl ; preserve the base pointer for the next rep
	push bc ; preserve the rep counter
	ld d, h
	ld e, l
	ld hl, wEnemyMonBaseStats
	ld c, NUM_STATS
.gainStatExpLoop
	ld a, [hli]
	ld b, a ; enemy mon base stat
	ld a, [de] ; stat exp
	add b ; add enemy mon base state to stat exp
	ld [de], a
	jr nc, .nextBaseStat
; if there was a carry, increment the upper byte
	dec de
	ld a, [de]
	inc a
	jr z, .maxStatExp ; jump if the value overflowed
	ld [de], a
	inc de
	jr .nextBaseStat
.maxStatExp ; if the upper byte also overflowed, then we have hit the max stat exp
	ld a, $ff
	ld [de], a
	inc de
	ld [de], a
.nextBaseStat
	dec c
	jr z, .statExpPassDone
	inc de
	inc de
	jr .gainStatExpLoop
.statExpPassDone
	pop bc
	pop hl
	dec b
	jr .statExpRepLoop
.statExpRepsDone
; Sunsette: leave de where a single original pass would (base + 2*(NUM_STATS-1)); the OTID
; lookup below relies on this regardless of how many reps actually ran.
	ld d, h
	ld e, l
	ld a, NUM_STATS - 1
.advanceStatExpDe
	inc de
	inc de
	dec a
	jr nz, .advanceStatExpDe
.statExpDone
	xor a
	ldh [hMultiplicand], a
	ldh [hMultiplicand + 1], a
	ld a, [wEnemyMonBaseExp]
	ldh [hMultiplicand + 2], a
	ld a, [wEnemyMonLevel]
	ldh [hMultiplier], a
	call Multiply
	ld a, 7
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ld hl, MON_OTID - (MON_DVS - 1)
	add hl, de
	ld a, [hli]
	ld b, a ; party mon OTID
	CheckEvent EVENT_IN_FITNESS_BATTLE
	ld a, 1
	jr nz, .next ; won't get even more of an EXP boost from the booster chip in fitness battles, the boost is already crazy
;;;;;;;;;; PureRGBnote: ADDED: new item that causes all pokemon to gain EXP as if they were received from a trade.
	CheckEvent EVENT_BOOSTER_CHIP_ACTIVE ; always get traded pokemon boost if BOOSTER CHIP was used.
	jr nz, .tradedMon
;;;;;;;;;;
	ld a, [wPlayerID]
	cp b
	jr nz, .tradedMon
	ld b, [hl]
	ld a, [wPlayerID + 1]
	cp b
	ld a, 0
	jr z, .next
.tradedMon
	call BoostExp ; traded mon exp boost
	ld a, 1
.next
	ld [wGainBoostedExp], a
;;;;;;;;;; PureRGBnote: ADDED: on route 23 we will boost exp gain to make training for elite four quicker. EXP gain will be like you were
;;;;;;;;;; fighting a trainer battle.
	ld a, [wCurMap]
	cp ROUTE_23
	call z, BoostExp
;;;;;;;;;;
	ld a, [wIsInBattle]
	dec a ; is it a trainer battle?
	call nz, BoostExp ; if so, boost exp
	CheckEvent EVENT_IN_FITNESS_BATTLE
	call nz, TripleExp
; Sunsette: badge/level EXP scaling (Pokedex only) - applied to every mon before the participant fraction
	ld a, [wExpAllActive]
	and a
	call nz, ApplyExpLevelScale
; Sunsette: exp-all -> scale to this mon's share (participant 60% = x3 then /5 ; other 20% = x1 then /5)
	ld a, [wExpAllActive]
	and a
	jr z, .noExpAllFraction
	ld a, [wTempByteValue]
	cp 4
	jr nz, .shareDivide ; multiplier 1 (other) -> no pre-multiply
	call TripleExp ; participant -> x3 (60% after the /5 below)
.shareDivide
	ld a, 5
	call DivideExpInPlace
.noExpAllFraction
	inc hl
	inc hl
	inc hl
; add the gained exp to the party mon's exp
	ld b, [hl]
	ldh a, [hQuotient + 3]
	ld [wExpAmountGained + 1], a
	add b
	ld [hld], a
	ld b, [hl]
	ldh a, [hQuotient + 2]
	ld [wExpAmountGained], a
	adc b
	ld [hl], a
	jr nc, .noCarry
	dec hl
	inc [hl]
	inc hl
.noCarry
; Sunsette: accumulate this mon's gain into the team total for the single message
	ld a, [wExpAllActive]
	and a
	jr z, .noTeamAccum
	ld a, [wExpAmountGained + 1]
	ld b, a
	ld a, [wTeamExpGained + 1]
	add b
	ld [wTeamExpGained + 1], a
	ld a, [wExpAmountGained]
	ld b, a
	ld a, [wTeamExpGained]
	adc b
	ld [wTeamExpGained], a
.noTeamAccum
; calculate exp for the mon at max level, and cap the exp at that value
	inc hl
	push hl
	ld a, [wWhichPokemon]
	ld c, a
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	ld a, [hl]
	ld [wCurSpecies], a
	call GetMonHeader
	pop hl
	push hl
	ld d, MAX_LEVEL
	call GetArbitraryLevelExp
	jr nc, .capExp
	pop hl
	CheckEvent EVENT_IN_FITNESS_BATTLE
	dec hl
	jr z, .next2
	inc hl
	ld a, [wLevelLimit]
	ld d, a
	call GetArbitraryLevelExp ; cap at the level limit's EXP
	jr c, .next2b
	jr .capExp2
.capExp
	pop af ; "pop hl" into af throwing it away since it's not needed
.capExp2
; the mon's exp is greater than the max exp, so overwrite it with the max exp
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, d
	ld [hld], a
.next2
	dec hl
.next2b
	push hl
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a
	ld a, [wExpAllActive]
	and a
	jr nz, .expAllBarOnly ; Sunsette: exp-all uses one team message - skip the per-mon "gained" text,
	ld a, [wWhichPokemon] ; but still animate the bar below for the active mon (don't leave it static)
	ld hl, wPartyMonNicks
	call GetPartyMonName
	ld hl, GainedText
	rst _PrintText
	jr .doExpBar
.expAllBarOnly
	; only the active mon's bar is on screen, so skip the bar for the rest of the team
	ld a, [wPlayerMonNumber]
	ld b, a
	ld a, [wWhichPokemon]
	cp b
	jr nz, .noExpBar
.doExpBar
;;;;;;;;;; PureRGBnote: ADDED: EXP bar is optional and will only render if the option is enabled.
	call HasExpBar
	jr z, .noExpBar
	farcall AnimateEXPBar	;shinpokerednote: ADDED: animate the exp bar
.noExpBar
;;;;;;;;;;
	call LoadMonData
	pop hl
	ld bc, MON_LEVEL - MON_EXP
	add hl, bc
	push hl
	farcall CalcLevelFromExperience
	pop hl
	ld a, [hl] ; current level
;;;;;;;;;; PureRGBnote: FIXED: fixing skip move-learn glitch: need to store the current level in wram
	ld [wTempLevelStore], a
	cp d
	jp z, .nextMon ; if level didn't change, go to next mon
	push de ; Sunsette: preserve the new level in d across the farcall
	push hl
	farcall GainLevelUpHappiness ; Sunsette: +3 happiness on level up
	pop hl
	pop de
	call HasExpBar
	jr z, .noExpBar2
	push hl
	farcall KeepEXPBarFull	;joenote - animate the exp bar
	pop hl
.noExpBar2
;;;;;;;;;;
	ld a, [wCurEnemyLevel]
	push af
	push hl
	ld a, d
	ld [wCurEnemyLevel], a
	ld [hl], a
	ld bc, MON_SPECIES - MON_LEVEL
	add hl, bc
	ld a, [hl]
	ld [wCurSpecies], a
	ld [wPokedexNum], a
	call GetMonHeader
	ld bc, (MON_MAXHP + 1) - MON_SPECIES
	add hl, bc
	push hl
	ld a, [hld]
	ld c, a
	ld b, [hl]
	push bc ; push max HP (from before levelling up)
	ld d, h
	ld e, l
	ld bc, (MON_HP_EXP - 1) - MON_MAXHP
	add hl, bc
	ld b, $1 ; consider stat exp when calculating stats
	call CalcStats
	pop bc ; pop max HP (from before levelling up)
	pop hl
	ld a, [hld]
	sub c
	ld c, a
	ld a, [hl]
	sbc b
	ld b, a ; bc = difference between old max HP and new max HP after levelling
	ld de, (MON_HP + 1) - MON_MAXHP
	add hl, de
; add to the current HP the amount of max HP gained when levelling
	ld a, [hl] ; wPartyMon*HP + 1
	add c
	ld [hld], a
	ld a, [hl] ; wPartyMon*HP + 1
	adc b
	ld [hl], a ; wPartyMon*HP
	ld a, [wPlayerMonNumber]
	ld b, a
	ld a, [wWhichPokemon]
	cp b ; is the current mon in battle?
	jr nz, .printGrewLevelText
; current mon is in battle
	ld de, wBattleMonHP
; copy party mon HP to battle mon HP
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
; copy other stats from party mon to battle mon
	ld bc, MON_LEVEL - (MON_HP + 1)
	add hl, bc
	push hl
	ld de, wBattleMonLevel
	ld bc, 1 + NUM_STATS * 2 ; size of stats
	rst _CopyData
	pop hl
	ld a, [wPlayerBattleStatus3]
	bit TRANSFORMED, a
	jr nz, .recalcStatChanges
; the mon is not transformed, so update the unmodified stats
	ld de, wPlayerMonUnmodifiedLevel
	ld bc, 1 + NUM_STATS * 2
	rst _CopyData
.recalcStatChanges
	xor a ; battle mon
	ld [wCalculateWhoseStats], a
	callfar CalculateModifiedStats
	callfar ApplyBurnAndParalysisPenaltiesToPlayer
	callfar ApplyBadgeStatBoosts
	callfar DrawPlayerHUDAndHPBar
	callfar PrintEmptyString
	call SaveScreenTilesToBuffer1
.printGrewLevelText
	ld a, [wWhichPokemon] ; Sunsette: reload this mon's nick here. With EXP-All on, the per-mon name
	ld hl, wPartyMonNicks ; load up top is skipped, so wNameBuffer would still hold a stale battle
	call GetPartyMonName ; move name - making every level-up message show that move instead.
	ld hl, GrewLevelText
	rst _PrintText
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a
;;;;;;;;;; PureRGBnote: ADDED: EXP bar is optional and will only render if the option is enabled.
	call HasExpBar
	jr z, .noExpBar3
	farcall AnimateEXPBarAgain	;shinpokerednote: ADDED: animate the exp bar
.noExpBar3
;;;;;;;;;;
	call LoadMonData
	ld d, LEVEL_UP_STATS_BOX
	callfar PrintStatsBox
	call WaitForTextScrollButtonPress
	call LoadScreenTilesFromBuffer1
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a
	ld a, [wCurSpecies]
	ld [wPokedexNum], a
;;;;;;;;;;;;;;;;;;;;
;shinpokerednote: FIXED: fixing skip move-learn glitch: here is where moves are learned from level-up
	ld a, [wCurEnemyLevel]	; load the level to advance to into a. this starts out as the final level.
	ld c, a	; load the final level to grow to over to c
	ld a, [wTempLevelStore]	; load the current level into a
	ld b, a	; load the current level over to b
.inc_level	; marker for looping back 
	inc b	;increment 	the current level
	ld a, b	;put the current level in a
	ld [wCurEnemyLevel], a	;and reset the level to advance to as merely 1 higher
	push bc	;save b & c on the stack as they hold the current a true final level
	predef LearnMoveFromLevelUp
	pop bc	;get the current and final level values back from the stack
	ld a, b	;load the current level into a
	cp c	;compare it with the final level
	jr nz, .inc_level	;loop back again if final level has not been reached
;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;
; pureRGBnote: ADDED: we want to avoid ghost cubone or dragonair evolving during a event fights
	ld a, [wIsInBattle]
	dec a
	jr nz, .skipEventEvos
	; no cubone evolutions while facing the maw (ghost cubone intended to stay cubone until after this event)
	ld a, [wEnemyMonSpecies]
	cp SPIRIT_THE_MAW
	jr nz, .skipMaw
	ld a, [wCurSpecies]
	cp CUBONE
	jr z, .noEvos
.skipMaw
	CheckEvent EVENT_DRAGONAIR_EVENT_BATTLING_CLOYSTER
	jr z, .skipEventEvos
	ld a, [wCurSpecies]
	cp DRAGONAIR
	jr z, .noEvos
.skipEventEvos
;;;;;;;;;;;;;;;;;;;;
	ld hl, wCanEvolveFlags
	ld a, [wWhichPokemon]
	ld c, a
	ld b, FLAG_SET
	call FlagAction
.noEvos
	pop hl
	pop af
	ld [wCurEnemyLevel], a

.nextMon
	ld a, [wPartyCount]
	ld b, a
	ld a, [wWhichPokemon]
	inc a
	cp b
	jr z, .done
	ld [wWhichPokemon], a
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1
	call AddNTimes
	jp .partyMonLoop
.done
; Sunsette: one team-wide EXP message (exp-all only)
	ld a, [wExpAllActive]
	and a
	jr z, .doneClearFlags
	ld a, [wTeamExpGained]
	ld [wExpAmountGained], a
	ld a, [wTeamExpGained + 1]
	ld [wExpAmountGained + 1], a
	ld hl, TeamGainedText
	rst _PrintText
.doneClearFlags
	ld hl, wPartyGainExpFlags
	xor a
	ld [hl], a ; clear gain exp flags
	ld a, [wPlayerMonNumber]
	ld c, a
	ld b, FLAG_SET
	push bc
	call FlagAction ; set the gain exp flag for the mon that is currently out
	ld hl, wPartyFoughtCurrentEnemyFlags
	xor a
	ld [hl], a
	pop bc
	jp FlagAction ; set the fought current enemy flag for the mon that is currently out

; divide enemy base stats, catch rate, and base exp by the number of mons gaining exp
DivideExpDataByNumMonsGainingExp:
	ld a, [wPartyGainExpFlags]
	ld b, a
	xor a
	ld c, $8
	ld d, $0
.countSetBitsLoop ; loop to count set bits in wPartyGainExpFlags
	xor a
	srl b
	adc d
	ld d, a
	dec c
	jr nz, .countSetBitsLoop
	cp $2
	ret c ; return if only one mon is gaining exp
	ld [wTempByteValue], a ; store number of mons gaining exp
	ld hl, wEnemyMonBaseStats
	ld c, wEnemyMonBaseExp + 1 - wEnemyMonBaseStats
.divideLoop
	xor a
	ldh [hDividend], a
	ld a, [hl]
	ldh [hDividend + 1], a
	ld a, [wTempByteValue]
	ldh [hDivisor], a
	ld b, $2
	call Divide ; divide value by number of mons gaining exp
	ldh a, [hQuotient + 3]
	ld [hli], a
	dec c
	jr nz, .divideLoop
	ret

; multiplies exp by 1.5
BoostExp:
	ldh a, [hQuotient + 2]
	ld b, a
	ldh a, [hQuotient + 3]
	ld c, a
	srl b
	rr c
	add c
	ldh [hQuotient + 3], a
	ldh a, [hQuotient + 2]
	adc b
	ldh [hQuotient + 2], a
	ret

TripleExp:
	push bc
	push hl
	ldh a, [hQuotient + 2]
	ld b, a
	ldh a, [hQuotient + 3]
	ld c, a
	ld h, b
	ld l, c
	add hl, bc
	add hl, bc
	ld a, h
	ldh [hQuotient + 2], a
	ld a, l
	ldh [hQuotient + 3], a
	pop hl
	pop bc
	ret

; Sunsette: scales a mon's EXP yield by its level vs badge-based thresholds (Pokedex/exp-all only).
;   level < T1 -> x1.5 ; level > T2 (the over-threshold penalty) -> x0.25 ; otherwise unchanged.
; Thresholds (ExpLevelScaleThresholds) are indexed by badge count (0-8), or by the Champion row (9).
; Operates on the 4-byte hQuotient in place; preserves hl/de/bc.
ApplyExpLevelScale:
	push hl
	push de
	push bc
; this party mon's level -> d
	ld hl, wPartyMon1Level
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wWhichPokemon]
	call AddNTimes
	ld d, [hl] ; d = level
; pick the threshold row: Champion (row 9), otherwise the number of badges obtained (0-8)
	CheckEvent EVENT_BEAT_CHAMPION_RIVAL
	jr z, .notChampion
	ld a, 9
	jr .gotRow
.notChampion
	ld a, [wObtainedBadges]
	ld c, 0
.countBadges
	and a
	jr z, .countDone
	srl a
	jr nc, .countBadges
	inc c
	jr .countBadges
.countDone
	ld a, c
.gotRow
; hl = ExpLevelScaleThresholds + row * 3
	ld hl, ExpLevelScaleThresholds
	ld c, a
	add a
	add c
	ld c, a
	ld b, 0
	add hl, bc
; [hl] = T1 (boost-below), [hl+1] = T2 (half-above), [hl+2] = T3 (quarter-above) ; d = level
	ld a, [hli] ; T1
	cp d
	jr c, .checkUpper ; T1 < level -> not below T1
	jr z, .checkUpper ; T1 == level -> not below T1
	jr .boost         ; level < T1
.checkUpper
	ld a, [hli] ; T2 (hl now -> T3)
	ld e, a     ; save T2
	ld a, [hl]  ; T3
	cp d
	jr c, .quarter ; T3 < level -> level > T3
	ld a, e      ; T2
	cp d
	jr c, .half  ; T2 < level -> level > T2
	jr .scaleDone ; within T1..T2 -> unchanged
.boost
	call BoostExp ; level < T1 -> x1.5
	jr .scaleDone
.half
	ld a, 4
	call DivideExpInPlace ; level > T2 -> x0.25 (over-threshold penalty)
	jr .scaleDone
.quarter
	ld a, 4
	call DivideExpInPlace ; level > T3 -> x0.25 (same depth; T3 row kept for future tuning)
.scaleDone
	pop bc
	pop de
	pop hl
	ret

; divides the 4-byte hQuotient in place by the divisor in register a (result back in hQuotient)
DivideExpInPlace:
	push af
	ldh a, [hQuotient]
	ldh [hDividend], a
	ldh a, [hQuotient + 1]
	ldh [hDividend + 1], a
	ldh a, [hQuotient + 2]
	ldh [hDividend + 2], a
	ldh a, [hQuotient + 3]
	ldh [hDividend + 3], a
	pop af
	ldh [hDivisor], a
	ld b, 4
	jp Divide ; preserves hl/de/bc

; doubles the 4-byte hQuotient in place (shift left, LSB first); preserves bc/de/hl
DoubleExp:
	ldh a, [hQuotient + 3]
	add a
	ldh [hQuotient + 3], a
	ldh a, [hQuotient + 2]
	adc a
	ldh [hQuotient + 2], a
	ldh a, [hQuotient + 1]
	adc a
	ldh [hQuotient + 1], a
	ldh a, [hQuotient]
	adc a
	ldh [hQuotient], a
	ret

ExpLevelScaleThresholds:
; boost-below (T1, x1.5), penalty-above (T2, x0.25), deeper-penalty-above (T3, also x0.25)
; Sunsette: tuned to THIS hack's level curve - T2 caps just below the NEXT leader's ace, T1 just
; below the PREVIOUS leader's ace (so the bands chain). Next-leader aces in the comments.
	db  8,  12,  14 ; 0 badges -> Brock (14)
	db 12,  21,  23 ; 1 badge  -> Misty (23)
	db 21,  26,  28 ; 2 badges -> Lt. Surge (28)
	db 26,  35,  37 ; 3 badges -> Erika (37)
	db 35,  48,  50 ; 4 badges -> Koga (50)
	db 48,  56,  58 ; 5 badges -> Sabrina (58)
	db 56,  60,  62 ; 6 badges -> Blaine (62)
	db 60,  62,  64 ; 7 badges -> Giovanni (64)
	db 62,  64,  66 ; 8 badges -> Elite Four / Lorelei (66)
	db 70, 100, 100 ; Champion (post-game; T1 = champ ace 72 - 2, T2 effectively no cap)

; Sunsette: count obtained badges -> a (0-8); preserves bc
CountObtainedBadges:
	push bc
	ld a, [wObtainedBadges]
	ld b, 0
.loop
	and a
	jr z, .done
	srl a
	jr nc, .loop
	inc b
	jr .loop
.done
	ld a, b
	pop bc
	ret

; Sunsette: store the half-XP threshold (T2) for badge-row a (0-9) into wExpGrowthThreshold
StoreExpGrowthThreshold:
	cp 9
	jr c, .rowOk
	ld a, 9 ; clamp to the Champion row
.rowOk
	push hl
	push bc
	ld c, a
	add a
	add c ; a = row * 3
	inc a ; +1 -> the T2 (half-above) column
	ld c, a
	ld b, 0
	ld hl, ExpLevelScaleThresholds
	add hl, bc
	ld a, [hl] ; T2
	cp 100
	jr c, .store
	ld a, 99 ; keep it within the 2-digit text field
.store
	ld [wExpGrowthThreshold], a
	pop bc
	pop hl
	ret

; entry point for the Cerulean badge house (all earned badges already set): true count
ComputeExpGrowthThreshold::
	call CountObtainedBadges
	jr StoreExpGrowthThreshold

; entry point for a gym leader's badge-info text (the just-won badge isn't set yet): count + 1
ComputeExpGrowthThresholdLeader::
	call CountObtainedBadges
	inc a
	jr StoreExpGrowthThreshold

GainedText:
	text_far _GainedText
	text_asm
	;ld a, [wBoostExpByExpAll]
	;ld hl, WithExpAllText
	;and a
	;ret nz
	ld hl, ExpPointsText
	ld a, [wGainBoostedExp]
	and a
	ret z
	ld hl, BoostedText
	ret

WithExpAllText:
	text_far _WithExpAllText
	text_asm
	ld hl, ExpPointsText
	ret

BoostedText:
	text_far _BoostedText

ExpPointsText:
	text_far _ExpPointsText
	text_end

TeamGainedText:
	text_far _TeamGainedText
	text_asm
	ld hl, TeamExpText
	ret

TeamExpText:
	text_far _TeamExpText
	text_end

GrewLevelText:
	text_far _GrewLevelText
	sound_level_up
	text_end

HasExpBar:
	ld a, 1 ; Sunsette: EXP bar is always on
	and a
	ret

GetArbitraryLevelExp:
	push hl
	callfar CalcExperience ; get max exp
; compare max exp with current exp
	ldh a, [hExperience]
	ld b, a
	ldh a, [hExperience + 1]
	ld c, a
	ldh a, [hExperience + 2]
	ld d, a
	pop hl
	ld a, [hld]
	sub d
	ld a, [hld]
	sbc c
	ld a, [hl]
	sbc b
	ret