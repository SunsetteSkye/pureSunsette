; Sunsette: every damaging hit landed on a SLEEPING target shortens its sleep. Each hit removes one round,
; a critical hit removes two, and the total is applied once after the attacker's whole turn finishes - so a
; multi-strike move (Double Slap, Fury Swipes, ...) shaves off one round per individual strike. If the count
; reaches zero the target wakes immediately.

; The bookkeeping is split across the turn:
;   - wSleepRoundReduction is zeroed at the top of each attacker's move (ExecutePlayerMove / ExecuteEnemyMove).
;   - AccumulateSleepHit runs from the real-damage branch of ApplyDamageTo{Enemy,Player}Pokemon, once per
;     connecting strike, and is gated by the caller to genuine attacks on the opponent (confusion / crash
;     self-hits go through the same ApplyDamage code but are excluded there).
;   - ApplySleepHitTally runs from ExecutePlayerMoveDone / ExecuteEnemyMoveDone and does the actual subtract.

; Self-contained ROMX section so it does not eat into the near-full Battle Core bank.
SECTION "Sunsette Sleep Hit Reduction", ROMX

; Called once per connecting damaging strike against the opponent. Adds this move's weight to the running
; sleep-reduction total. The weight (1, or 2 for a critical hit) is latched from wCriticalHitOrOHKO on the
; first strike of the move: a multi-hit move only rolls its crit once, and PrintCriticalOHKOText clears the
; crit flag after the first strike, so we capture it while it is still live and reuse it for every strike.
AccumulateSleepHit::
	ld hl, wSleepRoundReduction
	ld a, [hl]
	and a
	jr nz, .haveWeight ; not the first strike -> weight already latched
	ld a, [wCriticalHitOrOHKO]
	cp 1 ; 1 = critical hit (2 = OHKO, which faints the target anyway)
	ld a, 1
	jr nz, .storeWeight
	inc a ; critical hit -> weight 2
.storeWeight
	ld [wMoveSleepWeight], a
.haveWeight
	ld a, [wMoveSleepWeight]
	add [hl] ; hl still = wSleepRoundReduction
	ld [hl], a
	ret

; Sunsette: ADAPTATION's damage halving. Called from RandomizeDamage (same bank, so it runs for every type-adjusted
; damaging hit, both sides). If the DEFENDER (opposite hWhoseTurn) is adapted to the current move's type, halve
; wDamage (floored at 1). AdaptType stores type+1, so 0 = not adapted.
ApplyAdaptationResist::
	ldh a, [hWhoseTurn]
	and a
	ld a, [wEnemyAdaptType] ; player attacking -> defender = enemy
	jr z, .gotAdapt
	ld a, [wPlayerAdaptType] ; enemy attacking -> defender = player
.gotAdapt
	and a
	ret z ; not adapted to anything
	dec a ; a = adapted-to type
	ld b, a
	ld a, [wMoveType]
	cp b
	ret nz ; incoming move isn't the adapted type
	ld hl, wDamage
	srl [hl] ; halve the 16-bit damage (hi:lo, big-endian)
	inc hl
	rr [hl]
	ld a, [hld] ; lo
	or [hl] ; | hi
	ret nz ; nonzero -> done
	inc hl
	ld [hl], 1 ; floor at 1 so a resisted hit still registers
	ret

; Sunsette: RandomizeDamage - floated out of the near-full Battle Core bank (reached via callfar). Multiplies
; wDamage by a random ~85%-100%, after first applying ADAPTATION's type-based halving (same-bank call). The
; underlying BattleRandom lives in the Battle Core bank, so it is reached here via FarBattleRandom (d = byte).
RandomizeDamage::
	call ApplyAdaptationResist ; ADAPTATION halves damage of the type the defender adapted to
	ld hl, wDamage
	ld a, [hli]
	and a
	jr nz, .DamageGreaterThanOne
	ld a, [hl]
	cp 2
	ret c ; return if damage is equal to 0 or 1
.DamageGreaterThanOne
	xor a
	ldh [hMultiplicand], a
	dec hl
	ld a, [hli]
	ldh [hMultiplicand + 1], a
	ld a, [hl]
	ldh [hMultiplicand + 2], a
; loop until a random number greater than or equal to 217 is generated
.loop
	callfar FarBattleRandom ; d = random byte (BattleRandom lives in the Battle Core bank; de survives)
	ld a, d
	rrca
	cp 85 percent + 1
	jr c, .loop
	ldh [hMultiplier], a
	call Multiply ; multiply damage by the random number, which is in the range [217, 255]
	ld a, 255
	ldh [hDivisor], a
	ld b, $4
	call Divide ; divide the result by 255
; store the modified damage
	ldh a, [hQuotient + 2]
	ld hl, wDamage
	ld [hli], a
	ldh a, [hQuotient + 3]
	ld [hl], a
	ret

; Sunsette: ADAPTATION effect. The user takes HALF damage from the type of the move the FOE last used (this
; turn if the user acts after the foe, last turn if it acts first - wEnemyMoveType/wPlayerMoveType still holds
; the foe's most recent move type in both cases). Fails if the foe has never used a move (wUsedMove == 0). On
; success it cures the user's status and grants FLOURISH (1/16-per-turn) regen. Using ADAPTATION a second time
; while still out simply overwrites *AdaptType, so the latest adaptation replaces the previous one. Relocated
; here (newCode full); reached via jpfar from GrowthEffect. *AdaptType stores (type + 1), so 0 = none.
AdaptationEffect::
	ldh a, [hWhoseTurn]
	and a
	jr nz, .enemyUser
	; the player's mon is adapting -> it is hit by the ENEMY's moves
	ld a, [wEnemyUsedMove]
	and a
	jp z, .failed ; foe has never moved -> nothing to adapt to
	ld a, [wEnemyMoveType]
	jr .gotType
.enemyUser
	ld a, [wPlayerUsedMove]
	and a
	jp z, .failed
	ld a, [wPlayerMoveType]
.gotType
	; a = the foe's last move type. SOFT restriction: ADAPTATION only braces against SPECIAL types (and
	; GHOST); a physical, non-GHOST hit still cures + regens but sets no resist. (BUNKER DOWN covers the
	; physical types.) 0 = no resist sentinel.
	ld b, a
	cp SPECIAL
	jr nc, .adaptable ; type >= SPECIAL -> special
	cp GHOST
	jr z, .adaptable
	xor a ; physical, non-GHOST -> cure + regen only, no resist
	jr .haveType
.adaptable
	ld a, b
	inc a ; type + 1
.haveType
	push af ; save the resist byte (type + 1, or 0 = brace only)
	callfar PlayCurrentMoveAnimation2
	callfar CureUserStatus
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus3
	jr z, .gotFlourish
	ld hl, wEnemyBattleStatus3
.gotFlourish
	set FLOURISH, [hl] ; 1/16-per-turn regen until the user leaves battle
	pop af ; a = resist byte
	and a
	jr z, .braceOnly ; physical hit -> cured + regen, but nothing to adapt to
	ld b, a
	ldh a, [hWhoseTurn]
	and a
	ld a, b
	jr nz, .storeEnemyAdapt
	ld [wPlayerAdaptType], a ; overwrites any prior adaptation this time out
	jr .announce
.storeEnemyAdapt
	ld [wEnemyAdaptType], a
.announce
	ld a, b ; b = resist byte (type + 1)
	dec a
	ld e, a ; e = braced type
	callfar AnnounceBrace ; "It braced against <TYPE>!"
	ret
.braceOnly
	ld hl, AdaptedBraceText
	rst _PrintText
	ret
.failed
	jpfar PrintButItFailedText_

AdaptedText:
	text "It adapted to"
	line "the last attack!"
	prompt

AdaptedBraceText:
	text "It steadied"
	line "itself!"
	prompt

; Called when the attacker's turn is fully over. If the opponent is asleep, subtract the accumulated rounds
; from its sleep counter; if that empties the counter, wake it up (with a message). hWhoseTurn still points
; at the attacker here, so the opponent is the defender.
ApplySleepHitTally::
	ld a, [wSleepRoundReduction]
	and a
	ret z ; no damaging hits landed this turn
	ld d, a ; d = rounds to remove
	ldh a, [hWhoseTurn]
	and a
	ld bc, wEnemyMonStatus
	jr z, .gotStatus
	ld bc, wBattleMonStatus
.gotStatus
; Sunsette: SNORLAX is too deep a sleeper - hits never shorten its sleep.
	ldh a, [hWhoseTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .checkDeepSleeper
	ld a, [wBattleMonSpecies]
.checkDeepSleeper
	cp SNORLAX
	ret z
	ld a, [bc]
	and SLP_MASK
	ret z ; defender is not asleep
	sub d ; remaining rounds - reduction
	jr z, .wake
	jr c, .wake
	; still asleep, just fewer rounds: merge the new count back into the status byte
	ld d, a
	ld a, [bc]
	and %11111000 ; clear the sleep counter bits, keep everything else
	or d
	ld [bc], a
	ret
.wake
	ld a, [bc]
	and %11111000 ; clear the sleep counter -> awake
	ld [bc], a
	ld hl, SleepHitWokeUpText
	jp PrintText

SleepHitWokeUpText:
	text_far _SleepHitWokeUpText
	text_end

; Sunsette: DOUBLESLAP ("wake-up slap") vs an AWAKE target. SNORLAX and ABRA are perpetually drowsy, so
; they still take the asleep-target damage bonus even while awake. (SNORLAX also never wakes - see the
; deep-sleeper guard in ApplySleepHitTally above; ABRA wakes normally, it just always eats the bonus.)
; Doubles this side's move power and announces it. No-op for any other awake target. Reached via callfar
; from DoubleSlapModifier so the Battle Core stays small. hWhoseTurn points at the attacker, so the
; opponent is the defender (= the target).
DoubleSlapAwakeBonus::
	ldh a, [hWhoseTurn]
	and a
	jr nz, .enemyTurn
	ld a, [wEnemyMonSpecies] ; player attacking -> target is the enemy mon
	ld hl, wPlayerMovePower
	jr .checkDrowsy
.enemyTurn
	ld a, [wBattleMonSpecies] ; enemy attacking -> target is the player's mon
	ld hl, wEnemyMovePower
.checkDrowsy
	cp SNORLAX
	jr z, .drowsy
	cp ABRA
	ret nz
.drowsy
	sla [hl] ; always-drowsy SNORLAX/ABRA take the doubled wake-up hit (base power is small; no overflow)
	ld hl, AlwaysDrowsyText
	jp PrintText

AlwaysDrowsyText:
	text_far _AlwaysDrowsyText
	text_end
