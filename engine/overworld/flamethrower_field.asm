; Sunsette: ADDED: FLAMETHROWER field move. Burns down EVERY cuttable block (tall grass and
; cut-trees alike) in the visible map window in one shot. Modeled on UsedCut's screen
; choreography (engine/overworld/cut.asm), but swaps the whole visible window via
; BurnVisibleCutBlocks instead of just the single block in front of the player. The swaps are
; written straight into wOverworldMap, so the burned tiles persist until the map is reloaded
; (re-entering the map regrows everything). Gated behind the Cascade Badge in start_sub_menus.asm.
; Lives in its own floating section because bank3 (where cut.asm lives) is full.
UsedFlamethrower::
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	call GBPalWhiteOutWithDelay3
	call ClearSprites
	call RestoreScreenTilesAndReloadTilePatterns
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
	call Delay3
	call LoadGBPal
	call LoadCurrentMapView ; rebuild the view from the still-unburned block map
	call SaveScreenTilesToBuffer2
	call Delay3
	xor a
	ldh [hWY], a
	ld hl, UsedFlamethrowerText
	rst _PrintText
	call LoadScreenTilesFromBuffer2
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	call DisableSpriteUpdates
	callfar RedrawMapView ; show the unburned overworld so the fire sweeps over the real scene
	ld a, SFX_CUT
	rst _PlaySound
; Play the battle "fire everywhere" effect over the overworld. It loads its own animation tiles
; into sprite VRAM ($31-$7F) and fills OAM with a grid of fire sprites drawn with the CURRENT
; object palette (the overworld human-sprite palette) - so no palette swap is needed. This is a
; transient borrow of sprite VRAM + OAM, not a permanent still-sprite slot, so it doesn't run into
; the 2-still-sprite-slot limit. The caller's CloseTextDisplay tail then runs InitMapSprites +
; LoadPlayerSpriteGraphics + LoadCurrentMapView + UpdateSprites, which restores the clobbered sprite
; tiles/OAM AND re-decodes the now-burned map - revealing the scorched ground.
	farcall AnimationFireEverywhere
	call BurnVisibleCutBlocks ; scorch the blocks now; CloseTextDisplay's LoadCurrentMapView reveals it
	call EnableSpriteUpdates
	ld a, $90
	ldh [hWY], a
	ret

UsedFlamethrowerText:
	text_far _UsedFlamethrowerText
	text_end

; Walk the visible block window (SCREEN_BLOCK_WIDTH x SCREEN_BLOCK_HEIGHT blocks from
; wCurrentTileBlockMapViewPointer, row stride wCurMapWidth+6 - the same walk LoadCurrentMapView
; uses) and replace every block found in the swap table with its cut version, in place in
; wOverworldMap.
BurnVisibleCutBlocks::
	ld hl, wCurrentTileBlockMapViewPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a ; hl = top-left visible block in wOverworldMap
	ld b, SCREEN_BLOCK_HEIGHT
.rowLoop
	push hl
	ld c, SCREEN_BLOCK_WIDTH
.colLoop
	push bc
	ld a, [hl]
	ld c, a ; c = block id at this cell
	ld de, FlamethrowerCutSwaps
.findLoop
	ld a, [de]
	inc de
	inc de
	cp $ff
	jr z, .noSwap
	cp c
	jr nz, .findLoop
	dec de
	ld a, [de] ; replacement (cut) block id
	ld [hl], a
.noSwap
	pop bc
	inc hl
	dec c
	jr nz, .colLoop
	pop hl ; hl = this row's start
	ld a, [wCurMapWidth]
	add 6 ; full map-row stride (wCurMapWidth + MAP_BORDER * 2)
	add l
	ld l, a
	jr nc, .noCarry
	inc h
.noCarry
	dec b
	jr nz, .rowLoop
	ret

; Local copy of CutTreeBlockSwaps (data/tilesets/cut_tree_blocks.asm). Kept here because that
; table lives in bank3 and BurnVisibleCutBlocks reads it from this (different) bank. KEEP IN SYNC
; with cut_tree_blocks.asm: first byte = block with grass/tree, second = block after it's cut.
FlamethrowerCutSwaps:
	db $32, $6D
	db $33, $6C
	db $34, $6F
	db $35, $4C
	db $60, $6E
	db $0B, $0A
	db $3C, $35
	db $3F, $35
	db $3D, $36
	db $04, $0A
	db -1 ; end
