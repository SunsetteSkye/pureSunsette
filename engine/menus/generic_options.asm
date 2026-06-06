; Sunsette: shared generic option-menu helpers, extracted from the removed battle_options page.
; Still used by options_menu3 and world_options.

GenericOptionsCursorToggleFunc:
	ld hl, wCurrentOptionIndex
	ld e, [hl]
	ld d, 0
	ld hl, wOptions1CursorX
	add hl, de
	ld a, [hl]
	xor b
	ld [hl], a
	jp EraseOldMenuCursor

; sets the options variable according to the current placement of the menu cursors in the options menu
LoopGenericSetOptionsFromCursorPositions:
.loopOptions
	push bc
	ld c, [hl]
	cp -1
	jr z, .skip
	inc hl
	inc hl
	ld a, [hli]
	ld b, a
	ld a, [hli]
	push hl
	ld h, [hl]
	ld l, a
	ld a, [de]
	call SetSingleBitOption
	pop hl
	inc hl
	inc de
	pop bc
	dec b
	jr nz, .loopOptions
	ret
.skip
	push de
	lb de, 0, 5
	add hl, de
	pop de
	inc de
	pop bc
	dec b
	jr nz, .loopOptions
	ret

SetGenericCursorPositionFromOptions:
	ld d, 0
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	push af
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	jp SetSingleBitOptionCursorPosition
