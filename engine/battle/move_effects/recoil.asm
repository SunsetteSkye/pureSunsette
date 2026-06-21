; PureRGBnote: ADDED: same as big recoil effect but if the move missed, still damage the user.
; Used with explosion/selfdestruct.
ExplodeRecoilEffect_:
	ld a, [wMoveMissed]
	and a
	jr z, BigRecoilEffect_
	; if explosion/selfdestruct missed, the recoil will be 1/4 the max health of the user
	call GetMaxHPIntoDE
	ld h, d
	ld l, e
	call CalculateRecoilDamage ; 1/2 of max HP
	srl b
	rr c ; 1/4
	jr GotRecoilDamage

; PureRGBnote: ADDED: big recoil effect does 50% of the damage inflicted, used with struggle.
BigRecoilEffect_: 
	call RecoilEffect_
	jr GotRecoilDamage

DefaultRecoilEffect_:
	; Sunsette: recoil is 1/3 of the damage dealt (was 1/4). Approximate wDamage/3 as wDamage * 86 / 256
	; (86 ~= 256/3) via Multiply - exact for typical damage, at most +2 HP at very high damage.
	xor a
	ldh [hMultiplicand], a
	ld a, [wDamage]
	ldh [hMultiplicand+1], a
	ld a, [wDamage+1]
	ldh [hMultiplicand+2], a
	ld a, 86
	ldh [hMultiplier], a
	call Multiply
	ldh a, [hProduct+1] ; (wDamage*86) >> 8 -> ~wDamage/3 (fits in 2 bytes)
	ld b, a
	ldh a, [hProduct+2]
	ld c, a
	call GetMaxHPIntoDE ; hl = the user's max HP address, as GotRecoilDamage expects
	ld h, d
	ld l, e
	jr GotRecoilDamage

GetMaxHPIntoDE:
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveNum]
	ld de, wBattleMonMaxHP
	ret z
	ld a, [wEnemyMoveNum]
	ld de, wEnemyMonMaxHP
	ret

RecoilEffect_:
	ld hl, wDamage 
CalculateRecoilDamage:
	call GetMaxHPIntoDE
.recoilEffect
	push af
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld h, d
	ld l, e
	pop af
	ld d, a
	srl b
	rr c
	ret

GotRecoilDamage:
	; Sunsette: ROCK-type users shrug off half the recoil from their own moves (Take Down, Double-Edge,
	; Submission, Struggle, ...). The min-1 floor just below still applies, so it never zeroes out.
	push hl ; user max HP address
	push bc ; recoil amount
	call IsUserRockType
	pop bc
	pop hl
	jr nz, .afterRockHalve
	srl b
	rr c ; half recoil for ROCK types
.afterRockHalve
	ld a, b
	or c
	jr nz, .updateHP
	inc c ; minimum recoil damage is 1
.updateHP
; subtract HP from user due to the recoil damage
	ld a, [hli]
	ld [wHPBarMaxHP+1], a
	ld a, [hl]
	ld [wHPBarMaxHP], a
	push bc
	ld bc, wBattleMonHP - wBattleMonMaxHP
	add hl, bc
	pop bc
	ld a, [hl]
	ld [wHPBarOldHP], a
	sub c
	ld [hld], a
	ld [wHPBarNewHP], a
	ld a, [hl]
	ld [wHPBarOldHP+1], a
	sbc b
	ld [hl], a
	ld [wHPBarNewHP+1], a
	jr nc, .getHPBarCoords
; if recoil damage is higher than the Pokemon's HP, set its HP to 0
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, wHPBarNewHP
	ld [hli], a
	ld [hl], a
.getHPBarCoords
	hlcoord 10, 9
	ldh a, [hWhoseTurn]
	and a
	ld a, $1
	jr z, .updateHPBar
	hlcoord 2, 2
	xor a
.updateHPBar
	ld [wHPBarType], a
	predef UpdateHPBar
	callfar DrawUserHPBar ; PureRGBnote: ADDED: ensures correct color of HP bar after recoil damage
	ld hl, HitWithRecoilText
	jp PrintText
HitWithRecoilText:
	text_far _HitWithRecoilText
	text_end

; Sunsette: z = the move's USER is a ROCK type (either of its two types), nz otherwise. Clobbers a, hl.
; Shared by the recoil halving above and HalveCrashIfRock below.
IsUserRockType::
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonType1
	jr z, .gotTypes
	ld hl, wEnemyMonType1
.gotTypes
	ld a, [hli]
	cp ROCK
	ret z
	ld a, [hl]
	cp ROCK
	ret

; Sunsette: ROCK-type users take half the crash damage from a missed Jump Kick / Hi Jump Kick (their own
; move). wDamage already holds the crash amount (big-endian: hi at wDamage, lo at wDamage+1); halve it with
; a min-1 floor so it still registers. No-op for non-ROCK users. callfar'd from the JUMP_KICK_EFFECT miss
; branch in core.asm so the near-full Battle Core only spends one call.
HalveCrashIfRock::
	call IsUserRockType
	ret nz
	ld hl, wDamage
	srl [hl] ; halve hi
	inc hl
	rr [hl] ; ...lo
	ld a, [wDamage]
	or [hl]
	ret nz ; nonzero -> done
	inc [hl] ; floor the crash at 1 HP
	ret
