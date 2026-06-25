ClearVariablesOnEnterMap::
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
	ldh [rWY], a
	xor a
	ldh [hAutoBGTransferEnabled], a
	ld [wStepCounter], a
	ld [wGymLeaderNo], a
	ldh [hJoyPressed], a
	ldh [hJoyReleased], a
	ldh [hJoyHeld], a
	ld [wMuteAudioAndPauseMusic], a
	ld [wActionResultOrTookBattleTurn], a
	ld [wUnusedMapVariable], a ; Sunsette: also clears the CONFUSE RAY (bit 0) + MYSTIC-invert (bit 1) field-move flags on map change (FLOURISH)
	; Sunsette: the FLASH-in-cave run-out timer (wFlashStepsRemaining/wFlashSavedDarkOffset) is NOT cleared
	; here anymore - it must PERSIST across internal cave-floor warps so one FLASH lasts ~200 steps through
	; the WHOLE cave (the dark offset is already inherited across internal warps, keeping floors lit). It is
	; instead cleared only on entry FROM an outside map (in the warp handler: .outsideMaps / .goBackOutside),
	; i.e. a fresh cave visit or returning to the overworld.
	ld [wIsAltPalettePkmn], a
	ld [wIsAltPalettePkmnData], a
	ld [wOverworldAnimationCounter], a
	ld hl, wSavedY
	ld bc, wStandingOnWarpPadOrHole - wSavedY
	call FillMemory
;;;;;;;;;; PureRGBnote: ADDED: code that helps track which of the new music tracks is playing if any are
	ld a, [wCurrentMapScriptFlags]
	bit BIT_MAP_LOADED_AFTER_BATTLE, a
	jr nz, .clear
	ld a, [wCurMapConnections]
	bit BIT_EXTRA_MUSIC_MAP, a ; bit that indicates the map has extra music
	ret nz ; when going between maps that have extra music, we need to see the current music in case multiple maps have extra music and are connected
.clear
	xor a
	ld [wReplacedMapMusic], a ; clear this variable in places where we don't have replaced map music
;;;;;;;;;;
	ld hl, wStatusFlags2
	bit BIT_WILD_ENCOUNTER_COOLDOWN, [hl]
	jr z, .skipGivingThreeStepsOfNoRandomBattles
	ld a, 3 ; minimum number of steps between battles
	ld [wNumberOfNoRandomBattleStepsLeft], a
.skipGivingThreeStepsOfNoRandomBattles
	ld hl, wStatusFlags3
	res BIT_NO_NPC_FACE_PLAYER, [hl]
	ret
