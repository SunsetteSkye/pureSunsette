; Sunsette: MOVED out of full bank3 (player_state.asm) into the movedCode floating section to make
; room for the ROUTE24_TS tileset header. Both callers already use callfar/farcall, so this is
; bank-agnostic. Kept next to its WarpTileIDPointers data (included right after) so the in-bank
; `ld hl, WarpTileIDPointers` read stays co-banked.
IsPlayerStandingOnDoorTileOrWarpTile::
	push hl
	push de
	push bc
	farcall IsPlayerStandingOnDoorTile
	jr c, .done
	ld a, [wCurMapTileset]
	add a
	ld c, a
	ld b, $0
	ld hl, WarpTileIDPointers
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	lda_coord 8, 9
	call IsInSingleByteArray
	jr nc, .done
	ld hl, wMovementFlags
	res BIT_STANDING_ON_WARP, [hl]
.done
	pop bc
	pop de
	pop hl
	ret
