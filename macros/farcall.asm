; Far calls to another bank

; There is no difference between `farcall` and `callfar`, except the arbitrary
; order in which they set `b` and `hl` before calling `FarCall`.
; We use the more natural name "farcall" for the more common order.
; The same goes for `farjp` and `jpfar`.

MACRO farcall
	ld b, BANK(\1)
	ld hl, \1
	rst _Bankswitch ; pureRGBnote: CHANGED: using a rst vector here saves a bunch of space
ENDM

; farcall into a VWF routine with WRAM bank 2 selected (the VWF state lives
; there because bank 1/WRAM0 are full). Restores SVBK=1 on return. Only reached
; on GBC behind a wVWFActive gate, so the SVBK writes are GBC-only. Preserves de.
MACRO vwf_farcall
	ld a, 2
	ldh [rSVBK], a
	farcall \1
	ld a, 1
	ldh [rSVBK], a
ENDM

MACRO callfar
	ld hl, \1
	ld b, BANK(\1)
	rst _Bankswitch ; pureRGBnote: CHANGED: using a rst vector here saves a bunch of space
ENDM

MACRO farjp
	ld b, BANK(\1)
	ld hl, \1
	rst _Bankswitch
	ret
ENDM

MACRO jpfar
	ld hl, \1
	ld b, BANK(\1)
	rst _Bankswitch
	ret
ENDM

MACRO callbs	; shinpokerednote: audionote: added from pokeyellow
	ld a, BANK(\1)
	call BankswitchCommon
	call \1
ENDM

MACRO homecall
	ldh a, [hLoadedROMBank]
	push af
	ld a, BANK(\1)
	call SetCurBank
	call \1
	pop af
	call SetCurBank
ENDM

MACRO homecall_sf ; homecall but save flags by popping into bc instead of af
	ldh a, [hLoadedROMBank]
	push af
	ld a, BANK(\1)
	call SetCurBank
	call \1
	pop bc
	ld a, b
	call SetCurBank
ENDM
