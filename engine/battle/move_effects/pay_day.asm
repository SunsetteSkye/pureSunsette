PayDayEffect_:
	xor a
	ld hl, wPayDayMoney
	ld [hli], a
	ldh a, [hWhoseTurn]
	and a
	ld a, [wBattleMonLevel]
	jr z, .payDayEffect
	ld a, [wEnemyMonLevel]
.payDayEffect
; Sunsette: payout = (6*L*L + 200*L) / 100 = L * (6L + 200) / 100.
; L1 stays 2 (unchanged) and it rises every level to exactly 800 at L100 (4x the old 2*L).
	ld d, a              ; d = level (L)
; hl = 6L + 200
	ld h, 0
	ld l, a
	add hl, hl           ; hl = 2L
	ld b, h
	ld c, l              ; bc = 2L
	add hl, hl           ; hl = 4L
	add hl, bc           ; hl = 6L
	ld a, l
	add 200
	ld l, a
	ld a, h
	adc 0
	ld h, a              ; hl = 6L + 200
; (7L + 200) * L  ->  hProduct (which aliases hDividend)
	xor a
	ldh [hMultiplicand], a
	ld a, h
	ldh [hMultiplicand + 1], a
	ld a, l
	ldh [hMultiplicand + 2], a
	ld a, d
	ldh [hMultiplier], a
	call Multiply
; / 100  ->  hQuotient (aliases hDividend) = payout value
	ld a, 100
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ld hl, wPayDayMoney + 1
; convert to BCD
	ld a, 100
	ldh [hDivisor], a
	ld b, $4
	call Divide
	ldh a, [hQuotient + 3]
	ld [hli], a ; wPayDayMoney + 1
	ldh a, [hRemainder]
	ldh [hDividend + 3], a
	ld a, 10
	ldh [hDivisor], a
	ld b, $4
	call Divide
	ldh a, [hQuotient + 3]
	swap a
	ld b, a
	ldh a, [hRemainder]
	add b
	ld [hl], a ; wPayDayMoney + 2
	ld de, wTotalPayDayMoney + 2
	ld c, $3
	predef AddBCDPredef
	ld hl, CoinsScatteredText
	rst _PrintText
	ret

CoinsScatteredText:
	text_far _CoinsScatteredText
	text_end
