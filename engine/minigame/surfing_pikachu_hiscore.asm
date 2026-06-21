; PureRGBnote: ADDED: support code for the ported pokeyellow Surfing Pikachu minigame.
; Lives in the same ROM section/bank as the minigame so SurfingPikachuMinigame can
; `call ReloadMapAfterSurfingMinigame` (a near call).

; Returns to the overworld after the full-screen minigame: the minigame overwrote
; the BG tile patterns, tilemap and OAM, so do a full map reload + sprite-tile reload.
; pokeyellow had a bespoke ReloadMapAfterSurfingMinigame in home; pureRGB's ReloadMapData
; already does the tileset/textbox/map-view restore, so we just wrap it.
ReloadMapAfterSurfingMinigame::
	; wLYOverrides is unioned over wOverworldMap, so the minigame clobbered the loaded map
	; blocks. Rebuild them before ReloadMapData (which reads wOverworldMap via LoadCurrentMapView).
	ldh a, [hLoadedROMBank]
	push af
	ld a, [wCurMap]
	call SwitchToMapRomBank
	call LoadTileBlockMap
	pop af
	call BankswitchCommon
	call ReloadMapData
	jp ReloadMapSpriteTilePatterns

; Draws the "Pikachu's Beach" hi-score screen (ported from pokeyellow's
; Printer_PrepareSurfingMinigameHighScoreTileMap, with the Game Boy Printer path
; dropped). Shows the player's best score in the Summer Beach House "printer".
SurfingMinigameDisplayHighScore::
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	ld de, SurfingPikachu2Graphics
	ld hl, vChars2
	lb bc, BANK(SurfingPikachu2Graphics), (SurfingPikachu2GraphicsEnd - SurfingPikachu2Graphics) / $10
	call CopyVideoData
	hlcoord 0, 0
	call .PlaceRowAlternatingTiles
	hlcoord 0, 17
	call .PlaceRowAlternatingTiles
	hlcoord 0, 0
	call .PlaceColumnAlternatingTiles
	hlcoord 19, 0
	call .PlaceColumnAlternatingTiles
	ld a, $4
	hlcoord 0, 0
	ld [hl], a
	hlcoord 0, 17
	ld [hl], a
	hlcoord 19, 0
	ld [hl], a
	hlcoord 19, 17
	ld [hl], a
	ld de, .Tilemap1
	hlcoord 10, 8
	lb bc, 3, 8
	call .CopyBox
	ld de, .Tilemap2
	hlcoord 2, 11
	lb bc, 6, 16
	call .CopyBox
	ld de, .PikachusBeachString
	hlcoord 3, 2
	call PlaceString
	ld de, .HiScoreString
	hlcoord 9, 4
	call PlaceString
	ld de, .PointsString
	hlcoord 12, 6
	call PlaceString
	ld de, wPlayerName
	ld hl, wPlayerName
	ld bc, 0
.find_end_of_name
	ld a, [hli]
	inc c
	cp TX_END ; "@" string terminator (matches pureRGB convention; avoids string-as-number warning)
	jr nz, .find_end_of_name
	ld a, 8
	sub c
	jr nc, .got_name_length
	xor a
.got_name_length
	ld c, a
	hlcoord 2, 4
	add hl, bc
	call PlaceString
	call .CopyScore
	ld b, SET_PAL_GENERIC
	call RunPaletteCommand
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	call Delay3
	jp GBPalNormal

.PlaceRowAlternatingTiles:
	ld c, SCREEN_WIDTH / 2
.row_loop
	ld [hl], $0
	inc hl
	ld [hl], $1
	inc hl
	dec c
	jr nz, .row_loop
	ret

.PlaceColumnAlternatingTiles:
	ld c, SCREEN_HEIGHT / 2
	ld de, SCREEN_WIDTH
.col_loop
	ld [hl], $2
	add hl, de
	ld [hl], $3
	add hl, de
	dec c
	jr nz, .col_loop
	ret

.Tilemap1:
INCBIN "gfx/surfing_pikachu/high_score_1.tilemap"

.Tilemap2:
INCBIN "gfx/surfing_pikachu/high_score_2.tilemap"

.PikachusBeachString:
	db "Pikachu's Beach@"
.HiScoreString:
	db "'s Hi-Score@"
.PointsString:
	db "Points@"

.CopyBox:
.y
	push bc
	push hl
.x
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .x
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .y
	ret

.CopyScore:
	ld de, wSurfingMinigameHiScore + 1
	hlcoord 7, 6
	ld a, [de]
	call .BCDConvertScore
	ld a, [de]
.BCDConvertScore:
	ld c, a
	swap a
	and $f
	add -10
	ld [hli], a
	ld a, c
	and $f
	add -10
	ld [hli], a
	dec de
	ret
