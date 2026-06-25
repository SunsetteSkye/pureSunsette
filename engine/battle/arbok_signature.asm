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
	jp EkansLineFocusEnergyHeal ; Sunsette: EKANS/ARBOK signature - FOCUS ENERGY also mends 1/4 max HP

; Sunsette: EKANS/ARBOK FOCUS ENERGY signature - the coiling snake also mends 1/4 of its max HP. Modeled on
; HandleGrowthRegen (growth_regen.asm): derives the acting mon's HP pointer from hWhoseTurn, heals maxHP/4
; capped at max, and refreshes the HP bar. No-op for any other species, and respects the "signatures off" option.
EkansLineFocusEnergyHeal:
	ldh a, [hWhoseTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .gotSpecies
	ld a, [wEnemyMonSpecies]
.gotSpecies
	cp EKANS
	jr z, .isSnake
	cp ARBOK
	ret nz
.isSnake
	CheckEvent FLAG_SIGNATURE_MOVES_TURNED_OFF
	ret nz ; signatures globally disabled -> no heal
	ld hl, wBattleMonHP
	ldh a, [hWhoseTurn]
	and a
	jr z, .gotHP
	ld hl, wEnemyMonHP
.gotHP
	push hl          ; bc = max HP, also stored to wHPBarMaxHP
	ld bc, $e
	add hl, bc
	ld a, [hli]
	ld [wHPBarMaxHP+1], a
	ld b, a
	ld a, [hl]
	ld [wHPBarMaxHP], a
	ld c, a
	pop hl           ; hl = current HP (high byte)
	srl b
	rr c
	srl b
	rr c             ; bc = max HP / 4
	ld a, c
	and a
	jr nz, .nonZero
	inc c            ; heal at least 1
.nonZero
	ld b, 0
	inc hl           ; hl -> current HP low byte
	ld a, [hl]
	ld [wHPBarOldHP], a
	add c
	ld [hld], a
	ld [wHPBarNewHP], a
	ld a, [hl]
	ld [wHPBarOldHP+1], a
	adc b
	ld [hli], a
	ld [wHPBarNewHP+1], a
	ld a, [wHPBarMaxHP] ; cap at max HP
	ld c, a
	ld a, [hld]
	sub c
	ld a, [wHPBarMaxHP+1]
	ld b, a
	ld a, [hl]
	sbc b
	jr c, .noOverfull
	ld a, b          ; overfull -> set HP to max
	ld [hli], a
	ld [wHPBarNewHP+1], a
	ld a, c
	ld [hl], a
	ld [wHPBarNewHP], a
.noOverfull
	callfar UpdateCurMonHPBar
	ret
