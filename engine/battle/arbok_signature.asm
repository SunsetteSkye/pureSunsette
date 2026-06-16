; Sunsette: ARBOK's two signatures (FOCUS ENERGY -> +1 SPEED, WRAP -> +2 trap rounds) were retired as part
; of trimming species signatures. What remains here is the now-generic FOCUS ENERGY defense bonus, kept in
; this roomier bank (newCode3) because both Battle Core (effects.asm) and newCode (volcano_battle_init.asm)
; are full. (File name kept to avoid churning the main.asm include.)

; FOCUS ENERGY also raises the user's DEFENSE by 1, for EVERYONE. jpfar'd from FocusEnergyEffect_ only on
; the fresh-use path, so the "already pumped -> it failed" rule still prevents the boost from re-stacking.
; Borrows StatModifierUpEffect via a temp effect/move-num swap (set the effect to DEFENSE_UP1, zero the move
; num to dodge the Minimize/substitute path), like SnorlaxRestBonus. Self-contained (derives the acting side
; from hWhoseTurn) so FocusEnergyEffect_ can tail-jump here unconditionally.
FocusEnergyDefenseBonus::
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
	ld a, DEFENSE_UP1_EFFECT
	ld [hl], a
	xor a
	ld [de], a ; zero move num -> dodge the Minimize/substitute path
	SetFlag FLAG_SKIP_STAT_ANIMATION
	callfar StatModifierUpEffect ; +1 DEFENSE to the user
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
