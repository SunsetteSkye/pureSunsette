; Sunsette: the COMEBACK / desperation system shared by the comeback move family (SENBONZAKURA, BLOOD RUSH,
; QUICK ATTACK, BLITZ STRIKE, HYPER BEAM, COMBOBREAKER, UNDERBUG, ROCK ON). Floated into its own ROMX section
; because the modifier bank (newCode) and Battle Core are both full.
;
; "Desperation stage" = how cornered the attacker is, clamped to 0..3:
;   stage = HP-bar colour (green 0 / yellow 1 / red 2)  +1 if self has a non-sleep status  +1 if self confused
; (raw max is 4 = red + status + confuse; we clamp to 3). Power-table moves index a 4-byte table by this stage.
; The design rule: a move's signature rider is live by stage 2, and stage 3 only ever adds magnitude.
SECTION "Sunsette Comeback", ROMX

; Returns e = desperation stage (0..3) for the attacker (the hWhoseTurn side). Reached by callfar, so the
; verdict rides home in e (the bankswitch preserves de/hl for the caller).
GetDesperationStage::
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerHPBarColor]
	ld hl, wBattleMonStatus
	ld de, wPlayerBattleStatus1
	jr z, .gotPtrs
	ld a, [wEnemyHPBarColor]
	ld hl, wEnemyMonStatus
	ld de, wEnemyBattleStatus1
.gotPtrs
	ld b, a                ; b = HP bar colour (0 green / 1 yellow / 2 red)
	ld a, [hl]
	and $78                ; PSN | BRN | FRZ | PAR (non-sleep statuses)
	jr z, .noStatus
	inc b
.noStatus
	ld a, [de]
	bit CONFUSED, a
	jr z, .noConfuse
	inc b
.noConfuse
	ld a, b
	cp 4
	jr c, .store           ; clamp the raw 0..4 down to 0..3
	ld a, 3
.store
	ld e, a
	ret

; Print the shared desperation flavour for the stage in e. Stage 0 = silent (the move's plain floor),
; stage 1 = "the heat of battle made it stronger!", stages 2-3 = "a desperate power!". Call pre-damage,
; after the "<mon> used <move>!" line.
PrintDesperationText::
	ld a, e
	and a
	ret z                  ; stage 0 -> no flavour
	dec a
	jr nz, .desperate      ; stages 2-3
	ld hl, HeatOfBattleText ; stage 1
	jp PrintText
.desperate
	ld hl, DesperatePowerText
	jp PrintText

HeatOfBattleText:
	text "The heat of battle"
	line "made it stronger!"
	prompt

DesperatePowerText:
	text "A desperate power!"
	prompt

; ============================== power scaling ==============================
; Reached by `jpfar ComebackApplyPower` from the tiny ComebackModifier stub in the full newCode bank (modifier
; slot 18, shared by every power-scaling comeback move). Looks up the current move's 4-byte power table, writes
; the stage-scaled power straight into the live move power, then prints the shared desperation flavour. Tail
; into PrintDesperationText, so its ret returns to the modifier dispatch's caller.
ComebackApplyPower::
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMovePower
	ld a, [wPlayerMoveNum]
	jr z, .gotMove
	ld hl, wEnemyMovePower
	ld a, [wEnemyMoveNum]
.gotMove
	push hl                          ; save the live move-power pointer
	ld b, a                          ; b = move id
	ld hl, ComebackPowerTables
.search
	ld a, [hli]
	cp -1
	jr z, .notFound
	cp b
	jr z, .found
	inc hl                           ; skip the 2-byte table pointer
	inc hl
	jr .search
.found
	ld a, [hli]
	ld h, [hl]
	ld l, a                          ; hl = this move's 4-byte power table
	push hl
	call GetDesperationStage         ; e = desperation stage 0..3
	pop hl
	ld d, 0
	add hl, de                       ; hl = &table[stage]
	ld a, [hl]                       ; a = stage-scaled power
	pop hl                           ; hl = live move-power pointer
	ld [hl], a                       ; apply it
	call ComboBreakerAccuracy        ; e = stage; COMBOBREAKER is very inaccurate at stage 0
	jp PrintDesperationText          ; e still = stage
.notFound
	pop hl
	ret

; Sunsette: COMBOBREAKER always carries +1 priority (PriorityMoves list), so to stop a healthy 0-power
; priority-Disable from being reliable, it is VERY inaccurate at desperation stage 0 and reliable from stage 1.
; e = stage. No-op for every other move.
ComboBreakerAccuracy:
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveNum]
	ld hl, wPlayerMoveAccuracy
	jr z, .got
	ld a, [wEnemyMoveNum]
	ld hl, wEnemyMoveAccuracy
.got
	cp COMBOBREAKER
	ret nz
	ld a, e
	and a
	jr z, .stage0
	ld a, 100 percent                ; stages 1-3 -> reliable
	ld [hl], a
	ret
.stage0
	ld a, 30 percent                 ; stage 0 -> very inaccurate
	ld [hl], a
	ret

; move id -> 4-byte power table { stage0, stage1, stage2, stage3 }. -1 terminated.
ComebackPowerTables:
	db SENBONZAKURA
	dw SenbonzakuraPowerTable
	db BLITZ_STRIKE
	dw BlitzStrikePowerTable
	db HYPER_BEAM
	dw HyperBeamPowerTable
	db BLOOD_RUSH
	dw BloodRushPowerTable
	db COMBOBREAKER
	dw ComboBreakerPowerTable
	db UNDERBUG
	dw UnderBugPowerTable
	db QUICK_ATTACK
	dw QuickAttackPowerTable
	db -1

SenbonzakuraPowerTable: db  60,  90, 120, 150
BlitzStrikePowerTable:  db  70,  80,  90, 100
HyperBeamPowerTable:    db 120, 140, 160, 200
BloodRushPowerTable:    db  50,  50,  50,  50 ; static; the comeback is the on-hit Attack ramp, not the power
ComboBreakerPowerTable: db  40,  60,  75,  90 ; stage 0 is a real 40 BP hit, but the 30% accuracy at stage 0 is the downside (and 40 BP rolls accuracy, unlike a 0 BP move which skips the hit-test)
UnderBugPowerTable:     db  70,  75,  80,  90
QuickAttackPowerTable:  db  45,  50,  65,  70 ; weak early priority comeback; BLITZ STRIKE is the upgrade

; ========================= desperate animation swap =========================
; Reached by `callfar MaybeDesperateAnim` from PlayAnimation, right after MaybeSeismicTossPsychicAnim. If the
; animation about to play is a comeback move AND the attacker is at desperation stage 2-3, swap wAnimationID to
; that move's DesperateXXXXAnim. Non-comeback animations fall straight through unchanged.
MaybeDesperateAnim::
	ld a, [wAnimationID]
	ld b, a
	ld hl, DesperateAnimTable
.loop
	ld a, [hli]
	cp -1
	ret z
	cp b
	jr z, .match
	inc hl                           ; skip the desperate anim id
	jr .loop
.match
	ld a, [hl]                       ; a = this move's desperate anim id
	push af
	call GetDesperationStage         ; e = stage
	pop bc                           ; b = desperate anim id
	ld a, e
	cp 2
	ret c                            ; stage 0/1 -> keep the base animation
	ld a, b
	ld [wAnimationID], a             ; stage 2-3 -> desperate animation
	ret

; Sunsette: comeback can't-miss rider. Returns e=1 if the current move is BLITZ STRIKE (or QUICK ATTACK) AND
; the attacker is at desperation stage 2-3, so the hit-test (CheckReachAndAutoHit) auto-hits it. e=0 otherwise.
; callfar'd from the newCode hit-test path; the verdict rides home in e.
ComebackCantMiss::
	ld e, 0
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveNum]
	jr z, .got
	ld a, [wEnemyMoveNum]
.got
	cp BLITZ_STRIKE
	jr z, .check
	cp QUICK_ATTACK
	ret nz
.check
	call GetDesperationStage          ; e = stage
	ld a, e
	cp 2
	ld e, 0
	ret c                             ; stage 0-1 -> can still miss
	ld e, 1                           ; stage 2-3 -> never miss
	ret

; Sunsette: UNDERBUG's scaling-confuse rider (post-damage, jpfar'd from SpeciesMoveBonus in the full newCode
; bank). Confuse chance by desperation stage: 0% at stage 0, 30% at stage 1, 100% at stages 2-3. Reuses the
; engine's ConfusionSideEffectSuccess (sets CONFUSED + a 2-5 turn counter, handles SLOWPOKE/SLOWBRO immunity).
UnderBugConfuse_::
	call GetDesperationStage          ; e = stage
	ld a, e
	and a
	ret z                             ; stage 0 -> no confuse
	cp 2
	jr nc, .confuse                   ; stages 2-3 -> always
	callfar FarBattleRandom           ; d = random byte; stage 1 -> 30% roll
	ld a, d
	cp 30 percent + 1
	ret nc
.confuse
	callfar ConfusionSideEffectSuccess
	ret

; move id -> its DESPERATE_*_ANIM id. -1 terminated.
DesperateAnimTable:
	db SENBONZAKURA, DESPERATE_SENBONZAKURA_ANIM
	db BLITZ_STRIKE, DESPERATE_BLITZ_STRIKE_ANIM
	db HYPER_BEAM,   DESPERATE_HYPER_BEAM_ANIM
	db BLOOD_RUSH,   DESPERATE_BLOOD_RUSH_ANIM
	db COMBOBREAKER, DESPERATE_COMBOBREAKER_ANIM
	db UNDERBUG,     DESPERATE_UNDERBUG_ANIM
	db QUICK_ATTACK, DESPERATE_QUICK_ATTACK_ANIM
	db -1

; Sunsette: MAD RUSH's power rider, floated out of the full newCode bank (reached via `jpfar UnleashRageModifier_`
; from the tiny stub there). 40 BP normally, tripled to 120 the moment the user is in any desperation, which is
; exactly desperation stage >= 1 (HP off green, OR a non-sleep status, OR confused) - so it just reuses the
; shared GetDesperationStage. (Folds fully into the comeback family when MAD RUSH becomes BLOOD RUSH.) The
; matching on-hit status/confusion clear lives in SpeciesMoveBonus.
UnleashRageModifier_::
	call GetDesperationStage          ; e = stage (0 = not desperate)
	ld a, e
	and a
	ld a, 40
	jr z, .store                      ; stage 0 -> base 40
	ld a, 120                         ; any desperation -> 120
.store
	ld c, a
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMovePower
	jr z, .got
	ld hl, wEnemyMovePower
.got
	ld [hl], c
	ret
