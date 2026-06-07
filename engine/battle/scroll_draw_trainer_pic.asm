_ScrollTrainerPicAfterBattle:
; Load the enemy trainer's pic and scrolls it into
; the screen from the right.
; Sunsette: color the trainer pic for its class (slot 3) instead of reverting to MEWMON. The
; class + OPP_ID_OFFSET is the NonMonCustomPalettes sentinel; slot 2 stays the player's mon.
	ld a, [wTrainerClass]
	add OPP_ID_OFFSET
	ld [wEnemyMonSpecies2], a
	ld d, SET_PAL_BATTLE
	call RunPaletteCommand
	xor a
	ld [wEnemyMonSpecies2], a ; restore the original 0 post-condition
	callfar _LoadTrainerPic
	hlcoord 19, 0
	ld c, 0
.scrollLoop
	inc c
	ld a, c
	cp 7
	ret z
	ld d, $0
	push bc
	push hl
.drawTrainerPicLoop
	call DrawTrainerPicColumn
	inc hl
	ld a, 7
	add d
	ld d, a
	dec c
	jr nz, .drawTrainerPicLoop
	ld c, 4
	rst _DelayFrames
	pop hl
	pop bc
	dec hl
	jr .scrollLoop

; write one 7-tile column of the trainer pic to the tilemap
DrawTrainerPicColumn:
	push hl
	push de
	push bc
	ld e, 7
.loop
	ld [hl], d
	ld bc, SCREEN_WIDTH
	add hl, bc
	inc d
	dec e
	jr nz, .loop
	pop bc
	pop de
	pop hl
	ret
