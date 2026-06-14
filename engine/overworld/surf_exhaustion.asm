; Sunsette: SURF exhaustion. While surfing, every 12 steps 1 HP is drained from the surf CARRIER (the mon
; that started surfing; fallback = the highest-HP party mon if the carrier fainted), floored at 1 HP so surf
; can never faint a mon (no mid-ocean blackout/strand). Each drain fires a non-blocking, EASED rich-blue
; screen pulse (not the poison strobe) + the potion heal SFX. See also the encounter half-rate while surfing
; in wild_encounters.asm (ModifyEncounterRateForMovement).

DEF SURF_DRAIN_STEPS    EQU 12 ; drain 1 HP every this many surfing steps
DEF SURF_PULSE_FRAMES   EQU 33 ; non-blocking pulse length in overworld frames (~0.55s, eased up then down)

SECTION "Surf Exhaustion", ROMX

; Per-step hook (farcall'd from the overworld step-counter block, real player steps only). Counts surfing
; steps; every SURF_DRAIN_STEPS it drains the carrier's HP and arms the blue pulse + SFX.
HandleSurfExhaustion::
	ld a, [wWalkBikeSurfState]
	cp 2 ; surfing?
	ret nz
	ld hl, wSurfStepCounter
	inc [hl]
	ld a, [hl]
	cp SURF_DRAIN_STEPS
	ret c ; not enough surfing steps yet
	ld [hl], 0 ; reset the step counter
	call SurfDrainCarrierHP
	ld a, SURF_PULSE_FRAMES
	ld [wSurfPulseTimer], a ; arm the non-blocking pulse (SurfPulseTick animates it)
	ld a, SFX_HEAL_HP
	rst _PlaySound
	; surf has no HP floor - if that drain emptied the last living mon, flag a blackout so the overworld
	; warps to a Center. This must run AFTER the poison homecall (which also writes wOutOfBattleBlackout),
	; so HandleSurfExhaustion is hooked right after it; only set $FF (never clear poison's own blackout).
	callfar AnyPartyAlive ; d = number of party mons still alive
	ld a, d
	and a
	ret nz ; someone's still up -> leave wOutOfBattleBlackout as poison set it
	ld a, $FF
	ld [wOutOfBattleBlackout], a
	ret

; Drain 1 HP from the surf-drain target. NO floor - surf CAN faint a mon (HP -> 0); the carrier-validity
; check / highest-HP fallback then move the drain to a living mon, and HandleSurfExhaustion blacks you out
; if that empties the whole party.
SurfDrainCarrierHP:
	call GetSurfDrainTarget ; a = party index
	ld hl, wPartyMon1HP
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes ; hl -> target's HP (big-endian: hi then lo)
	ld a, [hl]
	ld b, a ; HP hi
	inc hl
	ld a, [hl]
	ld c, a ; HP lo ; hl -> HP lo
	ld a, b
	or c
	ret z ; already at 0 (shouldn't happen - target is living) -> avoid underflow
	dec bc
	ld [hl], c ; write lo (hl -> HP lo)
	dec hl
	ld [hl], b ; write hi
	ret

; Pick the party index to drain: the recorded carrier if it's a valid, living party member; otherwise the
; highest-HP party mon (the user's "if the surfer fainted already" fallback). out: a = party index.
GetSurfDrainTarget:
	ld a, [wSurfCarrier]
	cp $FF
	jp z, FindHighestHPPartyMon ; no carrier recorded (e.g. auto-surf) -> fallback
	ld hl, wPartyCount
	cp [hl]
	jp nc, FindHighestHPPartyMon ; carrier index out of range -> fallback
	push af ; save carrier index
	ld hl, wPartyMon1HP
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes ; hl -> carrier HP
	ld a, [hli]
	or [hl] ; HP hi | lo == 0?
	pop bc ; b = carrier index
	ld a, b
	ret nz ; carrier alive -> use it
	jp FindHighestHPPartyMon ; carrier fainted -> fallback

; out: a = party index of the mon with the most current HP. Uses wBuffer[0..2] as scratch (16-bit best HP +
; best index); safe in the per-step overworld context.
FindHighestHPPartyMon:
	xor a
	ld [wBuffer], a   ; best HP hi
	ld [wBuffer + 1], a ; best HP lo
	ld [wBuffer + 2], a ; best index
	ld a, [wPartyCount]
	and a
	ret z ; (no party - shouldn't happen) a = 0
	ld c, a ; count
	ld b, 0 ; current index
	ld hl, wPartyMon1HP
.loop
	ld a, [hli]
	ld d, a ; cur HP hi
	ld a, [hl] ; cur HP lo ; hl -> lo
	ld e, a
	dec hl ; hl -> hi (this mon's HP start)
	push hl
	; compare de (current) > [wBuffer] (best, 16-bit)?
	ld a, [wBuffer] ; best hi
	cp d
	jr c, .newBest ; best hi < cur hi
	jr nz, .notBest ; best hi > cur hi
	ld a, [wBuffer + 1] ; best lo
	cp e
	jr nc, .notBest ; best lo >= cur lo -> not greater
.newBest
	ld a, d
	ld [wBuffer], a
	ld a, e
	ld [wBuffer + 1], a
	ld a, b
	ld [wBuffer + 2], a
.notBest
	pop hl
	ld a, l
	add PARTYMON_STRUCT_LENGTH
	ld l, a
	jr nc, .noCarry
	inc h
.noCarry
	inc b
	dec c
	jr nz, .loop
	ld a, [wBuffer + 2]
	ret

; Non-blocking eased blue pulse on BG palette slot 0, color 0. callfar'd once per overworld frame from
; OverworldLoop (same post-DelayFrame VBlank window as XfadeTick) while wSurfPulseTimer > 0. Eases color 0
; from its normal value up to a rich deep blue and back (triangle envelope), then restores the real color 0
; from wBGPPalsBuffer. GBC-only (rBGPI/rBGPD); on DMG it's a harmless no-op (the HP drain + SFX still happen).
SurfPulseTick::
	ld a, [wSurfPulseTimer]
	and a
	ret z
	dec a
	ld [wSurfPulseTimer], a
	jr z, .restore ; pulse just ended -> put color 0 back
	ld b, a ; remaining (1..FRAMES-1)
	ld a, SURF_PULSE_FRAMES - 1
	sub b ; elapsed (0..FRAMES-2)
	srl a ; e2 = elapsed/2 (0..15)
	ld b, a ; e2
	ld a, 16
	sub b ; 16 - e2
	cp b
	jr c, .gotIdx ; (16-e2) < e2 -> descending half, idx = 16-e2
	ld a, b ; ascending half, idx = e2
.gotIdx
	cp 9
	jr c, .clamped
	ld a, 8 ; clamp to peak
.clamped
	add a ; *2 (2 bytes per color)
	ld e, a
	ld d, 0
	ld hl, SurfBlueTable
	add hl, de
	ld a, $80 ; auto-increment, BG palette 0 / color 0
	ldh [rBGPI], a
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hl]
	ldh [rBGPD], a
	ret
.restore
	ld a, $80
	ldh [rBGPI], a
	ld hl, wBGPPalsBuffer ; the engine's live slot-0 colors (color 0 = first 2 bytes)
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hl]
	ldh [rBGPD], a
	ret

; Ease ramp for BG slot-0 color 0: white -> rich deep blue (idx 0..8). The peak (RGB 6,12,30) is a vivid,
; blue-dominant color clearly deeper/more saturated than the pale route/city water blue (~RGB 20,26,31 /
; 12,27,27). GBC 15-bit RGB555, little-endian (RGB macro), read low byte first into rBGPD.
SurfBlueTable:
	RGB 31, 31, 31
	RGB 28, 29, 31
	RGB 25, 27, 31
	RGB 22, 24, 31
	RGB 19, 22, 31
	RGB 16, 19, 31
	RGB 13, 17, 30
	RGB 10, 14, 30
	RGB  6, 12, 30
