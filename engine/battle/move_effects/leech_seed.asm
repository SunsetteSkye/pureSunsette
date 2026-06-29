LeechSeedEffect_:
	callfar MoveHitTest
	ld a, [wMoveMissed]
	and a
	jr nz, .moveMissed
	ld hl, wEnemyBattleStatus2
	ld de, wEnemyMonType1
	ldh a, [hWhoseTurn]
	and a
	jr z, .leechSeedEffect
	ld hl, wPlayerBattleStatus2
	ld de, wBattleMonType1
.leechSeedEffect
; miss if the target is grass-type or already seeded
	ld a, [de]
	cp GRASS
	jr z, .moveMissed
	inc de
	ld a, [de]
	cp GRASS
	jr z, .moveMissed
	bit SEEDED, [hl]
	jr nz, .moveMissed
	set SEEDED, [hl]
	callfar PlayCurrentMoveAnimation
	; Sunsette: the seeder braces (ADAPTATION-style) against the target's PRIMARY type - halves that type's
	; damage until the seeder switches. de was advanced to the target's type2 by the immunity check above; step
	; back to type1. Read it before PrintText (clobbers a/de) and stash it across the seed message.
	dec de
	ld a, [de]
	push af
	ld hl, WasSeededText
	call PrintText
	pop af
	callfar BraceUserAgainstType
	ret
.moveMissed
	ld c, 50
	rst _DelayFrames
	ld hl, EvadedAttackText
	jp PrintText

WasSeededText:
	text_far _WasSeededText
	text_end

EvadedAttackText:
	text_far _EvadedAttackText
	text_end
