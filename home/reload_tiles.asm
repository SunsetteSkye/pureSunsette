; reloads text box tile patterns, current map view, and tileset tile patterns
ReloadMapData::
	ldh a, [hLoadedROMBank]
	push af
	ld a, [wCurMap]
	call SwitchToMapRomBank
	call DisableLCD
	call LoadTextBoxTilePatterns
	call LoadCurrentMapView
	call LoadTilesetTilePatternData
	call EnableLCD
	callfar LoadExtraTiles ; PureRGBnote: ADDED: in some maps we overwrite unused tiles for the given map.
	pop af
	jp SetCurBank

; reloads tileset tile patterns
ReloadTilesetTilePatterns::
	ldh a, [hLoadedROMBank]
	push af
	ld a, [wCurMap]
	call SwitchToMapRomBank
	call DisableLCD
	call LoadTilesetTilePatternData
	call EnableLCD
	pop af
	jp SetCurBank

; shows the town map and lets the player choose a destination to fly to
ChooseFlyDestination::
	ld hl, wd72e
	res 4, [hl]
	farjp LoadTownMap_Fly

; causes the text box to close without waiting for a button press after displaying text
DisableWaitingAfterTextDisplay::
	ld a, $01
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ret
