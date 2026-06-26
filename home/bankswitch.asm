BankswitchHome::
; switches to bank # in a
; Only use this when in the home bank!
	ld [wBankswitchHomeTemp], a
	ldh a, [hLoadedROMBank]
	ld [wBankswitchHomeSavedROMBank], a
	ld a, [wBankswitchHomeTemp]
	jr SetCurBank

BankswitchBack::
; returns from BankswitchHome
	ld a, [wBankswitchHomeSavedROMBank]
	jr SetCurBank

Bankswitch::
; self-contained bankswitch, use this when not in the home bank
; switches to the bank in b
	ldh a, [hLoadedROMBank]
	push af
	ld a, b
	call SetCurBank
	call hl_caller
	pop bc
	ld a, b
BankswitchCommon:: ; shinpokerednote: audionote: gbcnote: new function jump address from yellow
SetCurBank:: ; PureRGBnote: CHANGED: a lot of functions in home bank ran the next 2 lines of code, we can save a lot of space in home by simply calling this subroutine instead.
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	ret

hl_caller::
	jp hl

; Sunsette FIX 2026-06-25: read a move's 3-byte MoveSoundTable entry from its far bank ($1A), safely
; from HOME. The animation engine's GetMoveSound (bank $1E) must NOT switch the ROMX window itself - it
; executes from that window, so switching it returns into the wrong bank's bytes and crashes (a "soft
; reset" to the title on every move). Home code stays mapped across the switch, so the read is safe here.
; In: a = move sound index. Out: b = sound id, d = pitch modifier, e = tempo modifier. Clobbers a/hl.
GetMoveSoundEntry::
	ld e, a
	ld d, 0
	ld hl, MoveSoundTable
	add hl, de
	add hl, de
	add hl, de              ; hl -> this move's 3-byte entry
	ldh a, [hLoadedROMBank]
	push af                 ; save the caller's (animation) bank
	ld a, BANK(MoveSoundTable)
	call SetCurBank
	ld a, [hli]
	ld b, a                 ; b = sound id
	ld a, [hli]
	ld d, a                 ; d = pitch modifier
	ld a, [hl]
	ld e, a                 ; e = tempo modifier
	pop af
	jp SetCurBank           ; restore the caller's bank, then ret
