; Sunsette: TIME-BASED daycare (replaces the old per-step EXP tick). The deposited mon no longer trains
; per step; instead, at WITHDRAWAL we apply a one-shot reward based on how much PLAY-TIME elapsed since
; deposit (play time advances during battles/fishing/slots/menus, not just walking). Elapsed is measured
; in whole play-clock HOURS now (stored in the mon's origin cooldown byte, not a separate save field),
; converted to minutes (*60) for the formulas below; scaled by badges:
;   regular EXP   = elapsed_minutes * 2^(badge count)
;   HP stat exp   = elapsed_minutes * 2^(Cascade+Rainbow+Marsh+Earth count)   [the four "doubler" badges]
;   + the same gain to Attack/Speed/Defense/Special if you own Boulder/Thunder/Soul/Volcano respectively
;   affection     = + elapsed_minutes
; Stat exp saturates at 65535, affection at 255, EXP at the old $50xxxx ceiling (the script then caps the
; resulting level). Cost stays the script's existing per-level model.

DEF DAYCARE_EXP_CEIL_HI EQU $50

; No deposit hook needed: the deposited mon's AFFECTION rides in its origin field
; (MON_ORIGIN_AFFECTION) and its deposit-TIME in the origin cooldown byte
; (MON_ORIGIN_COOLDOWN), both copied into wDayCareMon* by the party->daycare MoveMon.
; Affection grows in place below and the daycare->party MoveMon copies it back on withdrawal.

; WITHDRAWAL hook - call BEFORE the script reads the mon / computes its level. Applies the
; one-shot time reward directly into wDayCareMon (exp + stat exp) and the mon's affection.
ApplyDayCareTimeGains::
; elapsed minutes = (now play-hours - deposit play-hours) * 60. The deposit-hours
; snapshot rode in with the mon (MoveMon stamped its origin cooldown byte). The 8-bit
; subtraction wraps cleanly, so it is correct for any stay under ~256 play-hours; the
; reward is now quantized to whole play-hours rather than minutes.
	ld a, [wDayCareMonOT + MON_ORIGIN_COOLDOWN]
	ld b, a
	ld a, [wPlayTimeHours + 1]
	sub b ; a = elapsed whole hours (0-255, mod 256)
	jr z, .noElapsed
	ldh [hMultiplicand + 2], a
	xor a
	ldh [hMultiplicand], a
	ldh [hMultiplicand + 1], a
	ld a, 60
	ldh [hMultiplier], a
	call Multiply ; elapsed_hours * 60 -> minutes (24-bit; hi byte stays 0)
	ldh a, [hMultiplicand + 1]
	ld d, a
	ldh a, [hMultiplicand + 2]
	ld e, a ; de = 16-bit elapsed minutes
	jr .haveElapsed
.noElapsed
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
	ld a, [wDayCareMonOT + MON_ORIGIN_AFFECTION]
	add e
	jr nc, .happyStore
.happyCap
	ld a, $ff
.happyStore
	ld [wDayCareMonOT + MON_ORIGIN_AFFECTION], a
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

; No withdrawal affection-restore hook needed: the grown affection lives in the daycare
; mon's origin field (MON_ORIGIN_AFFECTION) and the daycare->party MoveMon copies it onto
; the new party slot automatically.

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
