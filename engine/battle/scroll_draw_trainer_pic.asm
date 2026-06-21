_ScrollTrainerPicAfterBattle:
; Load the enemy trainer's pic and scrolls it into
; the screen from the right.
; Sunsette: color the reappearing trainer pic (slot 3) for its class via the trainer-pic palette override.
; wWasTrainerBattle (survives end-of-battle) + wEnemyMonSpecies2 == 0 make SetPal_Battle use it; slot 2 stays
; the player's mon.
	; Sunsette: drop any WATERIFY "force PAL_CYANMON" soak (bit 1) left on the just-fainted enemy mon
	; BEFORE the SET_PAL_BATTLE below, so the defeated trainer's reappearing pic isn't tinted blue.
	ld hl, wEnemyMonFlags
	res 1, [hl]
	xor a
	ld [wEnemyMonSpecies2], a ; trainer pic up -> slot 3 uses wEnemyTrainerPicPalette (set at this battle's intro), see SetPal_Battle
	ld d, SET_PAL_BATTLE
	call RunPaletteCommand
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
