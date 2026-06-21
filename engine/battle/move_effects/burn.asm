; Sunsette: MIRAGE (a no-damage FIRE status move; a ResidualEffects1 entry, so it runs its own
; accuracy test and animation like Thunder Wave). On a non-Fire target it BURNS the target even
; through an existing major status (overwriting it), and additionally drops the target's SPECIAL by
; one stage UNLESS the target was already burned (so the drop can't be re-stacked). FIRE-types are
; immune to the whole move; ROCK-types are immune to the burn only (they still take the Special drop,
; matching the engine-wide ROCK burn immunity in effects.asm). No damage.

MirageEffect_:
; Fire-type targets are immune to the entire move (no Special drop, no burn).
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
; Point hl at the target's status byte.
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyMonStatus
	jr z, .gotStatus
	ld hl, wBattleMonStatus
.gotStatus
; Special -1, but only if the target is not already burned (can't re-stack the drop).
	bit BRN, [hl]
	jr nz, .doBurn
	push hl
	ldh a, [hWhoseTurn]
	ld b, a ; target side (0 = enemy on player's turn, 1 = player on enemy's turn)
	ld c, SPECIAL_DOWN1_EFFECT
	callfar ApplyStatDownToTarget
	pop hl
.doBurn
; ROCK-types are immune to the burn (they still took the Special drop above).
	ldh a, [hWhoseTurn]
	and a
	ld de, wEnemyMonType1
	jr z, .gotBurnType
	ld de, wBattleMonType1
.gotBurnType
	ld a, [de]
	cp ROCK
	ret z
	inc de
	ld a, [de]
	cp ROCK
	ret z
; Burn the target, overwriting any existing major status.
	ld [hl], 1 << BRN
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

; input de = wBattleMonStatus or wEnemyMonStatus
AutoBurnEffect::
	ld h, d
	ld l, e
	set BRN, [hl]
	callfar HalveAttackDueToBurn
	jpfar PrintBurnText
