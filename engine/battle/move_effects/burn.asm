; PureRGBnote: CHANGED: Mirage (formerly Firewall / the move "Kinesis"). A no-damage FIRE
; status move (a ResidualEffects1 entry, so it runs its own accuracy test and animation like
; Thunder Wave). It confuses a non-Fire target; it additionally burns the target (only when
; the target has no major status yet) if the user is Fire-type OR the target was already
; confused. Fire-type targets are immune to the whole move. No damage escalation anymore.

MirageEffect_:
; Fire-type targets are immune to the entire move.
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyMonType1
	jr z, .gotTargetType
	ld hl, wBattleMonType1
.gotTargetType
	ld a, [hli]
	cp FIRE
	jp z, .doesntAffect
	ld a, [hl]
	cp FIRE
	jp z, .doesntAffect
; A Substitute blocks it entirely.
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyBattleStatus2
	jr z, .gotSub
	ld hl, wPlayerBattleStatus2
.gotSub
	bit HAS_SUBSTITUTE_UP, [hl]
	jp nz, .didntAffect
; 0-power moves skip the engine's accuracy test, so run it ourselves.
	callfar MoveHitTest
	ld a, [wMoveMissed]
	and a
	jp nz, .didntAffect
; The move lands: play its animation.
	callfar PlayCurrentMoveAnimation
; Confuse the target unless it is already confused.
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyBattleStatus1
	jr z, .gotConfuse
	ld hl, wPlayerBattleStatus1
.gotConfuse
	bit CONFUSED, [hl]
	jr nz, .burn ; already confused -> escalate straight to a burn
	set CONFUSED, [hl]
	callfar FarBattleRandom ; random value returned in d (a is clobbered by the bankswitch)
	ld a, d
	and $3
	inc a
	inc a
	ld b, a ; confusion lasts 2-5 turns
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyConfusedCounter
	jr z, .gotCounter
	ld hl, wPlayerConfusedCounter
.gotCounter
	ld [hl], b
	ld hl, MirageConfusedText
	rst _PrintText
; Freshly confused: only burn as well if the user itself is Fire-type.
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonType1
	jr z, .gotUserType
	ld hl, wEnemyMonType1
.gotUserType
	ld a, [hli]
	cp FIRE
	jr z, .burn
	ld a, [hl]
	cp FIRE
	ret nz ; user not Fire -> target is left confused only
.burn
; Burn the target if it has no major status yet (Fire immunity was handled above).
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyMonStatus
	jr z, .gotStatus
	ld hl, wBattleMonStatus
.gotStatus
	ld a, [hl]
	and a
	ret nz ; target already has a major status -> can't burn it
	set BRN, [hl]
	callfar HalveAttackDueToBurn
	jpfar PrintBurnText
.didntAffect
	ld c, 50
	rst _DelayFrames
	jpfar PrintDidntAffectText
.doesntAffect
	ld c, 50
	rst _DelayFrames
	jpfar PrintDoesntAffectText

MirageConfusedText:
	text_far _BecameConfusedText
	text_end

; input de = wBattleMonStatus or wEnemyMonStatus
AutoBurnEffect::
	ld h, d
	ld l, e
	set BRN, [hl]
	callfar HalveAttackDueToBurn
	jpfar PrintBurnText
