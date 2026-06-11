; Sunsette: TIME-BASED daycare (replaces the old per-step EXP tick). The deposited mon no longer trains
; per step; instead, at WITHDRAWAL we apply a one-shot reward based on how much PLAY-TIME elapsed since
; deposit (play time advances during battles/fishing/slots/menus, not just walking) scaled by badges:
;   regular EXP   = elapsed_minutes * 2^(badge count)
;   HP stat exp   = elapsed_minutes * 2^(Cascade+Rainbow+Marsh+Earth count)   [the four "doubler" badges]
;   + the same gain to Attack/Speed/Defense/Special if you own Boulder/Thunder/Soul/Volcano respectively
;   affection     = + elapsed_minutes
; Stat exp saturates at 65535, affection at 255, EXP at the old $50xxxx ceiling (the script then caps the
; resulting level). Cost stays the script's existing per-level model.

DEF DAYCARE_EXP_CEIL_HI EQU $50

; Returns the 24-bit total play-minutes (hours*60 + minutes) big-endian in a (hi) : h (mid) : l (lo).
; PlayTimeHours is a big-endian 2-byte value (+0 high, +1 low) that caps near $FF00 h, so hours*60 can
; exceed 16 bits - we carry the full 24-bit Multiply product through (FF95 stays 0 for any valid playtime).
DayCareNowMinutes:
	xor a
	ldh [hMultiplicand], a
	ld a, [wPlayTimeHours]
	ldh [hMultiplicand + 1], a
	ld a, [wPlayTimeHours + 1]
	ldh [hMultiplicand + 2], a
	ld a, 60
	ldh [hMultiplier], a
	call Multiply ; 24-bit product at hMultiplicand+0 (hi) / +1 (mid) / +2 (lo)
	ldh a, [hMultiplicand + 2]
	ld l, a ; lo
	ldh a, [hMultiplicand + 1]
	ld h, a ; mid
	ldh a, [hMultiplicand]
	ld b, a ; hi
	ld a, [wPlayTimeMinutes]
	add l
	ld l, a
	jr nc, .done
	inc h
	jr nz, .done
	inc b
.done
	ld a, b ; a = hi, h = mid, l = lo
	ret

; DEPOSIT hook (party slot of the deposited mon in wWhichPokemon). Stamp the time + save its affection,
; because the box_struct the daycare stores has no happiness field.
StampDayCareDeposit::
	call DayCareNowMinutes ; a = hi, h = mid, l = lo
	ld [wDayCareDepositMinutes], a ; +0 hi
	ld a, h
	ld [wDayCareDepositMinutes + 1], a ; +1 mid
	ld a, l
	ld [wDayCareDepositMinutes + 2], a ; +2 lo
	ld a, [wWhichPokemon]
	ld e, a
	ld d, 0
	ld hl, wPartyMonHappiness
	add hl, de
	ld a, [hl]
	ld [wDayCareMonHappiness], a
	ret

; WITHDRAWAL hook - call BEFORE the script reads the mon / computes its level. Applies the one-shot time
; reward directly into wDayCareMon (exp + stat exp) and wDayCareMonHappiness.
ApplyDayCareTimeGains::
	call DayCareNowMinutes ; a = nowHi, h = nowMid, l = nowLo (24-bit)
	ld d, a
	ld b, h
	ld c, l ; d:b:c = now (hi:mid:lo)
	ld hl, wDayCareDepositMinutes + 2 ; deposit lo (stamp is big-endian +0 hi/+1 mid/+2 lo)
	ld a, c
	sub [hl]
	ld e, a ; elapsed lo
	dec hl
	ld a, b
	sbc [hl]
	ld b, a ; elapsed mid
	dec hl
	ld a, d
	sbc [hl] ; a = elapsed hi
	jr c, .underflow ; deposit later than now (should never happen) -> fail safe to 0
	and a
	jr z, .fits16 ; elapsed fits in 16 bits
	ld b, $ff ; > 16 bits elapsed (~45+ days in one deposit) -> clamp to the max
	ld e, $ff
.fits16
	ld d, b ; de = 16-bit elapsed (d hi, e lo)
	jr .haveElapsed
.underflow
	ld de, 0
.haveElapsed
	ld a, d ; stash elapsed in the (now-free) multiply scratch: +1 = hi, +2 = lo
	ldh [hMultiplicand + 1], a
	ld a, e
	ldh [hMultiplicand + 2], a
	ld a, d
	or e
	ret z ; no whole minutes elapsed -> nothing to grant
; --- affection += elapsed (cap 255) ---
	ld a, d
	and a
	jr nz, .happyCap ; elapsed > 255 -> straight to the cap
	ld a, [wDayCareMonHappiness]
	add e
	jr nc, .happyStore
.happyCap
	ld a, $ff
.happyStore
	ld [wDayCareMonHappiness], a
; --- regular EXP += elapsed << badgeCount ---
	ld hl, wObtainedBadges
	ld b, 1
	call CountSetBits ; -> wNumSetBits
	ld a, [wNumSetBits]
	call DayCareShiftedGain ; c:d:e = elapsed << a
	ld hl, wDayCareMonExp + 2 ; big-endian: +0 hi, +1 mid, +2 lo
	ld a, [hl]
	add e
	ld [hl], a
	dec hl
	ld a, [hl]
	adc d
	ld [hl], a
	dec hl
	ld a, [hl]
	adc c
	ld [hl], a ; hl now at wDayCareMonExp+0
	jr c, .clampExp
	cp DAYCARE_EXP_CEIL_HI + 1
	jr c, .expDone
.clampExp
	ld a, DAYCARE_EXP_CEIL_HI
	ld [hli], a
	ld a, $ff
	ld [hli], a
	ld [hl], a
.expDone
; --- stat exp: gain = elapsed << doublerCount (clamped to 65535), added to HP + per-stat badges ---
	ld a, [wObtainedBadges]
	ld b, 0
	bit BIT_CASCADEBADGE, a
	jr z, .nd1
	inc b
.nd1
	bit BIT_RAINBOWBADGE, a
	jr z, .nd2
	inc b
.nd2
	bit BIT_PSYCHICBADGE, a ; Marsh (6th badge)
	jr z, .nd3
	inc b
.nd3
	bit BIT_EARTHBADGE, a
	jr z, .nd4
	inc b
.nd4
	ld a, b
	call DayCareShiftedGain ; c:d:e = elapsed << doublerCount
	ld a, c
	and a
	jr z, .statGainOk
	ld d, $ff ; over 16 bits -> clamp the gain to the field cap
	ld e, $ff
.statGainOk
	ld b, d
	ld c, e ; bc = stat-exp gain (16-bit, <= 65535)
	ld hl, wDayCareMonHPExp ; HP always
	call SatAdd16BE
	ld a, [wObtainedBadges]
	bit BIT_BOULDERBADGE, a
	jr z, .noAtk
	ld hl, wDayCareMonAttackExp
	call SatAdd16BE
.noAtk
	ld a, [wObtainedBadges]
	bit BIT_THUNDERBADGE, a
	jr z, .noSpd
	ld hl, wDayCareMonSpeedExp
	call SatAdd16BE
.noSpd
	ld a, [wObtainedBadges]
	bit BIT_POISONBADGE, a ; Soul (5th badge)
	jr z, .noDef
	ld hl, wDayCareMonDefenseExp
	call SatAdd16BE
.noDef
	ld a, [wObtainedBadges]
	bit BIT_VOLCANOBADGE, a
	jr z, .noSpc
	ld hl, wDayCareMonSpecialExp
	call SatAdd16BE
.noSpc
	ret

; WITHDRAWAL hook - call AFTER the mon is added back to the party. Restores the saved+grown affection to
; the new party slot (the mon is appended, so its slot is wPartyCount-1).
RestoreDayCareHappiness::
	ld a, [wPartyCount]
	dec a
	ld e, a
	ld d, 0
	ld hl, wPartyMonHappiness
	add hl, de
	ld a, [wDayCareMonHappiness]
	ld [hl], a
	ret

; a = shift count. Returns c:d:e = (stashed elapsed at hMultiplicand+1/+2) << a (24-bit big-endian c:d:e),
; SATURATING at $FFFFFF if a bit would shift off the top (callers clamp this down to their field ceiling).
DayCareShiftedGain:
	ld b, a
	ldh a, [hMultiplicand + 1]
	ld d, a
	ldh a, [hMultiplicand + 2]
	ld e, a
	ld c, 0
	ld a, b
	and a
	ret z
.shiftLoop
	sla e
	rl d
	rl c
	jr c, .saturate ; carry out of the 24-bit value -> overflow
	dec b
	jr nz, .shiftLoop
	ret
.saturate
	ld c, $ff
	ld d, $ff
	ld e, $ff
	ret

; add bc to the big-endian 16-bit value at hl (hl = high byte), saturating at $FFFF. Preserves bc.
SatAdd16BE:
	inc hl ; -> low byte
	ld a, [hl]
	add c
	ld [hl], a
	dec hl ; -> high byte
	ld a, [hl]
	adc b
	ld [hl], a
	ret nc
	ld a, $ff
	ld [hli], a
	ld [hl], a
	ret
