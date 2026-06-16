DrainHPEffect_:
	; Sunsette: SOULSTEALER (move DREAM_EATER) only heals when the foe is afflicted - any non-volatile
	; status (PSN/BRN/PAR/FRZ/SLP) OR confusion. Damage is dealt regardless; this just gates the heal.
	; Other drain users (Absorb/Mega Drain/Leech Life, and SolarBeam's charge) keep healing - different move nums.
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveNum]
	jr z, .checkSoulstealer
	ld a, [wEnemyMoveNum]
.checkSoulstealer
	cp DREAM_EATER ; SOULSTEALER
	jr nz, .drain
	call SoulstealerFoeAfflicted
	ret z ; foe has no status and isn't confused -> damage only, no heal
.drain
	ld hl, wDamage
	ld a, [hl]
	srl a ; divide damage by 2
	ld [hli], a
	ld a, [hl]
	rra
	ld [hld], a
	or [hl] ; is damage 0?
	jr nz, .getAttackerHP
; if damage is 0, increase to 1 so that the attacker gains at least 1 HP
	inc hl
	inc [hl]
.getAttackerHP
	ld hl, wBattleMonHP
	ld de, wBattleMonMaxHP
	ldh a, [hWhoseTurn]
	and a
	jp z, .addDamageToAttackerHP
	ld hl, wEnemyMonHP
	ld de, wEnemyMonMaxHP
.addDamageToAttackerHP
	ld bc, wHPBarOldHP+1
; copy current HP to wHPBarOldHP
	ld a, [hli]
	ld [bc], a
	ld a, [hl]
	dec bc
	ld [bc], a
; copy max HP to wHPBarMaxHP
	ld a, [de]
	dec bc
	ld [bc], a
	inc de
	ld a, [de]
	dec bc
	ld [bc], a
; add damage to attacker's HP and copy new HP to wHPBarNewHP
	ld a, [wDamage + 1]
	ld b, [hl]
	add b
	ld [hld], a
	ld [wHPBarNewHP], a
	ld a, [wDamage]
	ld b, [hl]
	adc b
	ld [hli], a
	ld [wHPBarNewHP+1], a
	jr c, .capToMaxHP ; if HP > 65,535, cap to max HP
; compare HP with max HP
	ld a, [hld]
	ld b, a
	ld a, [de]
	dec de
	sub b
	ld a, [hli]
	ld b, a
	ld a, [de]
	inc de
	sbc b
	jr nc, .next
.capToMaxHP
	ld a, [de]
	ld [hld], a
	ld [wHPBarNewHP], a
	dec de
	ld a, [de]
	ld [hli], a
	ld [wHPBarNewHP+1], a
	inc de
.next
	ldh a, [hWhoseTurn]
	and a
	hlcoord 10, 9
	ld a, $1
	jr z, .next2
	hlcoord 2, 2
	xor a
.next2
	ld [wHPBarType], a
	predef UpdateHPBar
	callfar DrawPlayerHUDAndHPBar
	callfar DrawEnemyHUDAndHPBar
	callfar ReadPlayerMonCurHPAndStatus
	ld hl, SuckedHealthText
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveEffect]
	jr z, .next3
	ld a, [wEnemyMoveEffect]
.next3
	cp DREAM_EATER_EFFECT
	jr z, .dreamEater
	; Sunsette: SolarBeam's charge turn drains like Mega Drain but prints its own "took in energy!" line.
	; (The effect is temporarily SOLARBEAM-ish here, so we key off the move NUMBER, not the effect.)
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveNum]
	jr z, .checkSolar
	ld a, [wEnemyMoveNum]
.checkSolar
	cp SOLARBEAM ; SOLARBEAM
	jr nz, .printText
	ld hl, SolarBeamEnergyText
	jr .printText
.dreamEater
	ld hl, DreamWasEatenText
.printText
	rst _PrintText
	ret

SuckedHealthText:
	text_far _SuckedHealthText
	text_end

DreamWasEatenText:
	text_far _DreamWasEatenText
	text_end

SolarBeamEnergyText:
	text_far _SolarBeamChargeText
	text_end

; Sunsette: z if the TARGET (the opponent of hWhoseTurn) has neither a non-volatile status nor confusion;
; nz if it is afflicted. Used to gate SOULSTEALER's heal.
SoulstealerFoeAfflicted:
	ldh a, [hWhoseTurn]
	and a
	ld a, [wEnemyMonStatus]
	jr z, .gotStatus
	ld a, [wBattleMonStatus]
.gotStatus
	and a
	ret nz ; any status byte set -> afflicted
	ldh a, [hWhoseTurn]
	and a
	ld a, [wEnemyBattleStatus1]
	jr z, .gotConfusion
	ld a, [wPlayerBattleStatus1]
.gotConfusion
	and 1 << CONFUSED ; nz only if confused
	ret
