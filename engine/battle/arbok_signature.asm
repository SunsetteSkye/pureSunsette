; Sunsette: ARBOK's signature move bonuses, kept here in newCode3 because both Battle Core (effects.asm)
; and newCode (volcano_battle_init.asm) are full. Both routines are self-contained (they derive the
; acting side from hWhoseTurn) so they callfar/jpfar cleanly from the move-effect handlers, and both honor
; the MOVE MYSTIC signature toggle (FLAG_SIGNATURE_MOVES_TURNED_OFF).

; FOCUS ENERGY (ARBOK): on a SUCCESSFUL use, also raise the user's SPEED by 1. jpfar'd from
; FocusEnergyEffect_ only on the fresh-use path, so the "already pumped -> it failed" rule still prevents
; the boost from being re-stacked. Borrows StatModifierUpEffect via a temp effect/move-num swap (set the
; effect to SPEED_UP1, zero the move num to dodge the Minimize/substitute path), like SnorlaxRestBonus.
; No-op for any non-ARBOK user, so FocusEnergyEffect_ can tail-jump here unconditionally.
ArbokFocusEnergyBonus::
	CheckEvent FLAG_SIGNATURE_MOVES_TURNED_OFF
	ret nz
	ldh a, [hWhoseTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .gotSpecies
	ld a, [wEnemyMonSpecies]
.gotSpecies
	cp ARBOK
	ret nz
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMoveEffect
	ld de, wPlayerMoveNum
	jr z, .gotPtrs
	ld hl, wEnemyMoveEffect
	ld de, wEnemyMoveNum
.gotPtrs
	ld a, [hl]
	push af ; save the real move effect (FOCUS_ENERGY_EFFECT)
	ld a, [de]
	push af ; save the real move num (FOCUS_ENERGY)
	ld a, SPEED_UP1_EFFECT
	ld [hl], a
	xor a
	ld [de], a ; zero move num -> dodge the Minimize/substitute path
	SetFlag FLAG_SKIP_STAT_ANIMATION
	callfar StatModifierUpEffect ; +1 SPEED to the user
	ResetFlag FLAG_SKIP_STAT_ANIMATION
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMoveEffect
	ld de, wPlayerMoveNum
	jr z, .restoreFocus
	ld hl, wEnemyMoveEffect
	ld de, wEnemyMoveNum
.restoreFocus
	pop af
	ld [de], a ; restore move num
	pop af
	ld [hl], a ; restore move effect
	ret

; WRAP (ARBOK): the trap lasts 2 rounds longer. callfar'd from TrappingEffect right after the base
; duration is written to wPlayer/EnemyNumAttacksLeft; we re-derive that byte from hWhoseTurn and add 2,
; only for ARBOK using WRAP (other trapping moves / users are untouched).
ArbokWrapBonus::
	CheckEvent FLAG_SIGNATURE_MOVES_TURNED_OFF
	ret nz
	ldh a, [hWhoseTurn]
	and a
	jr nz, .enemy
	ld a, [wPlayerMoveNum]
	cp WRAP
	ret nz
	ld a, [wBattleMonSpecies]
	cp ARBOK
	ret nz
	ld hl, wPlayerNumAttacksLeft
	jr .addRounds
.enemy
	ld a, [wEnemyMoveNum]
	cp WRAP
	ret nz
	ld a, [wEnemyMonSpecies]
	cp ARBOK
	ret nz
	ld hl, wEnemyNumAttacksLeft
.addRounds
	ld a, [hl]
	add 2 ; +2 trapping rounds
	ld [hl], a
	ret
