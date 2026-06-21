; PureRGBnote: ADDED: LCD-STAT (HBlank) interrupt handler, ported from pokeyellow
; (home/lcdc.asm), for the Surfing Pikachu minigame's per-scanline wave warp. hLCDCPointer
; doubles as an enable flag (0 = do nothing) and holds the LOW byte of the HRAM register to
; write each scanline; wLYOverrides[rLY] is the value (wLYOverrides is page-aligned, see
; ram/wram.asm). Dormant in normal play: the LCD-STAT interrupt is only enabled inside
; SurfingPikachuMinigame, which also zeroes hLCDCPointer when it finishes. The $0048 vector
; (home/header.asm) does `jp LCDC`. Lives in the big "Home" bank-0 section (interrupt code
; and the shared BoulderText below must always be mapped; "High Home" has no room).
LCDC::
	push af
	ldh a, [hLCDCPointer] ; doubles as enabling byte
	and a
	jr z, .noLCDCInterrupt
	push hl
	; [HIGH(wLYOverrides)00 + [rLY]] --> [FF00 + [hLCDCPointer]]
	ldh a, [rLY]
	ld l, a
	ld h, HIGH(wLYOverrides)
	ld h, [hl] ; h = the override value for this scanline
	ldh a, [hLCDCPointer]
	ld l, a
	ld a, h
	ld h, $ff
	ld [hl], a
	pop hl
.noLCDCInterrupt
	pop af
	reti

; PureRGBnote: MOVED: BoulderText used to occupy the 8 free bytes at the $0048 LCD-STAT
; interrupt vector, which now holds `jp LCDC`. It is shared by many maps' text-pointer
; tables, so it must stay in always-mapped bank 0.
BoulderText::
	text_asm
	callfar CheckStrengthUsage
	rst TextScriptEnd
