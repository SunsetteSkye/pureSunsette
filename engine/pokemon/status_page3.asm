; Sunsette: ADDED: status-screen PAGE 3.
; Reached after page 2 from both status-screen loops (callfar DrawStatusPage3). What it shows
; depends on context:
;   - in battle, viewing the ACTIVE mon  -> battle effects (stat stages + screens/seed/etc.)
;   - in battle, viewing any OTHER mon   -> a textual "eagerness to fight" (HP+status+affection)
;   - out of battle, any mon             -> a personality reaction (HP/status, or map type/nature)
; All text pools live in data/pokemon/status_page3_text.asm (same floating SECTION).
; The battle-effects list is paginated: a row cursor lives in wBuffer (lo) / wBuffer+1 (hi), and the
; pager keeps wBuffer+3 = window start (first logical line drawn on this page), wBuffer+4 = running
; logical-line index, wBuffer+5 = lines placed this page, wBuffer+6 = overflow flag (more remain).
; If the active mon has more battle effects than fit, the list spills onto further pages (page 4, ...).

DEF SP3_BATTLE_CAP EQU 12 ; battle-effect lines per page (rows 3..14); row 15 is left for the "more" footer

DrawStatusPage3::
	xor a
	ld [wBuffer + 3], a ; first page: window starts at logical line 0
	ld [wBuffer + 6], a ; no overflow yet (also clears it for the non-paginated modes)
	call SP3_BeginRender
	ld a, [wIsInBattle]
	and a
	jr z, .outOfBattle
	; in battle: is this the mon currently out?
	ld a, [wWhichPokemon]
	ld b, a
	ld a, [wPlayerMonNumber]
	cp b
	jr nz, .eagerness
	call SP3_DrawBattleEffects
	jr .done
.eagerness
	call SP3_DrawEagerness
	jr .done
.outOfBattle
	call SP3_DrawReaction
.done
	jp SP3_EndRender

; Sunsette: draw the NEXT overflow page of the active mon's battle effects. The status-screen drivers
; call this after the player presses A past page 3. Returns carry SET if another page was drawn (more
; effects remained), carry CLEAR if there was nothing more (only the battle-effects mode ever overflows).
DrawStatusPage3Next::
	ld a, [wBuffer + 6] ; did the previous render overflow?
	and a
	ret z ; nothing more (carry already clear)
	ld a, [wBuffer + 3]
	add SP3_BATTLE_CAP
	ld [wBuffer + 3], a ; advance the window
	call SP3_BeginRender
	call SP3_DrawBattleEffects
	call SP3_EndRender
	scf
	ret

; blank the screen + suspend auto-transfer; shared by every page-3 render
SP3_BeginRender:
	xor a
	ldh [hTileAnimations], a
	ldh [hAutoBGTransferEnabled], a
	hlcoord 0, 0
	lb bc, SCREEN_HEIGHT, SCREEN_WIDTH
	jp ClearScreenArea

SP3_EndRender:
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	jp Delay3

; ---------------------------------------------------------------------------------------------
; MODE A: active player mon's battle effects.
SP3_DrawBattleEffects:
	hlcoord 0, 0
	lb bc, 15, 18
	call TextBoxBorder
	hlcoord 1, 1
	ld de, SP3_BattleStateHeader
	call PlaceString
	; row cursor starts at (1, 3); reset this page's pager counters (window start in wBuffer+3 is set by caller)
	hlcoord 1, 3
	ld a, l
	ld [wBuffer], a
	ld a, h
	ld [wBuffer + 1], a
	xor a
	ld [wBuffer + 4], a ; logical line index
	ld [wBuffer + 5], a ; lines placed this page
	ld [wBuffer + 6], a ; overflow flag
	; stat stages
	ld hl, wPlayerMonStatMods
	ld c, 0
.statLoop
	push bc
	push hl
	ld a, [hl]
	sub BASE_STAT_LEVEL
	jr z, .statSkip
	push af ; delta
	call SP3_LineGate ; preserves c (stat index); a/b clobbered
	jr nc, .statSkipPop
	ld a, c
	call SP3_PlaceStatName
	pop af
	call SP3_PlaceSignedDelta
	call SP3_AdvanceLine
	jr .statSkip
.statSkipPop
	pop af
.statSkip
	pop hl
	pop bc
	inc hl
	inc c
	ld a, c
	cp 6
	jr nz, .statLoop
	; flag effects
	ld a, [wPlayerBattleStatus3]
	bit HAS_LIGHT_SCREEN_UP, a
	jr z, .noScreen
	ld de, SP3_ScreenedStr
	call SP3_EmitFlag
.noScreen
	ld a, [wPlayerBattleStatus3]
	bit HAS_REFLECT_UP, a
	jr z, .noWall
	ld de, SP3_WalledStr
	call SP3_EmitFlag
.noWall
	ld a, [wPlayerBattleStatus2]
	bit SEEDED, a
	jr z, .noSeed
	ld de, SP3_LeechedStr
	call SP3_EmitFlag
.noSeed
	ld a, [wPlayerBattleStatus3]
	bit FLOURISH, a
	jr z, .noFlourish
	ld de, SP3_FlourishStr
	ld a, [wPlayerBattleStatus2]
	bit DOUBLE_FLOURISH, a
	jr z, .flourishGo
	ld de, SP3_FlourishX2Str
.flourishGo
	call SP3_EmitFlag
.noFlourish
	ld a, [wPlayerBattleStatus1]
	bit CONFUSED, a
	jr z, .noConf
	ld a, [wPlayerConfusedCounter]
	ld de, SP3_ConfusedStr
	call SP3_EmitCount
.noConf
	ld a, [wLoadedMonStatus]
	and SLP_MASK
	jr z, .noSleep
	ld de, SP3_AsleepStr
	call SP3_EmitCount
.noSleep
	; Sunsette: ADAPTATION - show the type this mon currently takes half damage from (wPlayerAdaptType = type+1)
	ld a, [wPlayerAdaptType]
	and a
	jr z, .noAdapt
	call SP3_LineGate
	jr nc, .noAdapt
	ld a, [wPlayerAdaptType]
	dec a
	ld b, a                      ; b = adapted-to type (survives PlaceString)
	call SP3_GetLineHL
	ld de, SP3_AdaptedStr
	push bc
	call PlaceString
	pop bc
	ld a, [wPlayerMoveType]      ; FarPrintType reads wPlayerMoveType; stash + restore the live value
	push af
	ld a, b
	ld [wPlayerMoveType], a
	call SP3_GetLineHL
	ld de, 9
	add hl, de                   ; column 10 (line base is column 1)
	ld d, h
	ld e, l
	callfar FarPrintType         ; places the type name at de
	pop af
	ld [wPlayerMoveType], a
	call SP3_AdvanceLine
.noAdapt
	; more effects than fit? show the standard down-arrow cursor in the box's bottom-right corner
	ld a, [wBuffer + 6]
	and a
	jr z, .checkEmpty
	ld a, '▼'
	ldcoord_a 18, 15
.checkEmpty
	; first page and nothing placed? -> "battle is on!"
	ld a, [wBuffer + 3]
	and a
	ret nz ; an overflow page, not the first
	ld a, [wBuffer + 5]
	and a
	ret nz ; something was placed
	hlcoord 1, 3
	ld de, SP3_NoEffectsStr
	jp PlaceString

; ---------------------------------------------------------------------------------------------
; Pager gate. Call once per logical effect line. Increments the line index and returns carry SET if
; this line falls inside the current page's window AND there is still room (caller then draws it and
; calls SP3_AdvanceLine); carry CLEAR means skip it. Lines past the page capacity set the overflow flag.
SP3_LineGate:
	ld a, [wBuffer + 4] ; this line's logical index
	ld b, a
	inc a
	ld [wBuffer + 4], a ; advance for the next line
	ld a, [wBuffer + 3] ; window start
	cp b
	jr z, .inWindow     ; start == index
	jr nc, .before      ; start > index -> shown on an earlier page
.inWindow               ; index >= start
	ld a, [wBuffer + 5] ; lines placed this page
	cp SP3_BATTLE_CAP
	jr nc, .full
	inc a
	ld [wBuffer + 5], a
	scf                 ; render this line
	ret
.full
	ld a, 1
	ld [wBuffer + 6], a ; more lines remain than fit
.before
	and a               ; carry clear -> skip
	ret

; ---------------------------------------------------------------------------------------------
; MODE B: a benched mon's eagerness to fight. grid index = affection*SP3_NUM_HEALTH + health.
SP3_DrawEagerness:
	call SP3_AffectionBucket
	add a
	add a                        ; * SP3_NUM_HEALTH (4)
	ld b, a
	call SP3_HealthState
	add b
	ld hl, SP3_EagernessLines
	call SP3_IndexTextTable
	jp SP3_ShowText

; ---------------------------------------------------------------------------------------------
; MODE C: out-of-battle personality reaction.
SP3_DrawReaction:
	; fainted?
	ld a, [wLoadedMonHP]
	ld b, a
	ld a, [wLoadedMonHP + 1]
	or b
	jr nz, .notFainted
	call SP3_AffectionBucket
	ld hl, SP3_FaintedLines
	call SP3_IndexTextTable
	jp SP3_ShowText
.notFainted
	; status condition?
	ld a, [wLoadedMonStatus]
	and a
	jr z, .checkHP
	call SP3_GetNatureIndex
	ld hl, SP3_StatusNatureLines
	call SP3_IndexTextTable
	jp SP3_ShowText
.checkHP
	call SP3_HealthState         ; 0..2 here (fainted handled above)
	cp SP3_HEALTH_GOOD
	jr z, .healthy
	call SP3_GetNatureIndex
	ld hl, SP3_HurtNatureLines
	call SP3_IndexTextTable
	jp SP3_ShowText
.healthy
	call SP3_GetSceneId
	ld b, a                      ; b = scene
	cp SP3_FIRST_GENERIC_SCENE
	jr nc, .natureForScene       ; generic terrain has no type reaction
	push bc
	call SP3_TryTypeReaction     ; b = scene -> carry + de = text if a type matched
	pop bc
	jr nc, .natureForScene
	jp SP3_ShowText
.natureForScene
	push bc
	call SP3_GetNatureIndex
	ld c, a                      ; c = nature
	pop af                       ; a = scene (was b)
	add a
	ld e, a
	ld d, 0
	ld hl, SP3_SceneLineTables
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a                      ; hl = this scene's 16-entry nature table
	ld a, c
	call SP3_IndexTextTable
	jp SP3_ShowText

; ---------------------------------------------------------------------------------------------
; Draw the reaction text box and print the string in de (PlaceString format, up to ~6 lines).
SP3_ShowText:
	push de
	hlcoord 0, 5
	lb bc, 6, 18
	call TextBoxBorder
	pop de
	hlcoord 1, 6
	jp PlaceString

; ---------------------------------------------------------------------------------------------
; a = affection bucket (SP3_AFF_LOW/MID/HIGH). Box/daycare mons use a neutral value.
SP3_AffectionBucket:
	ld a, [wMonDataLocation]
	and a                        ; PLAYER_PARTY_DATA == 0
	jr nz, .neutral
	ld a, [wWhichPokemon]
	affection_addr ; hl = &affection (in the mon's origin field)
	ld a, [hl]
	jr .classify
.neutral
	ld a, SP3_AFFECTION_NEUTRAL
.classify
	cp SP3_AFFECTION_HIGH_MIN
	jr nc, .high
	cp SP3_AFFECTION_LOW_MAX + 1
	jr c, .low
	ld a, SP3_AFF_MID
	ret
.high
	ld a, SP3_AFF_HIGH
	ret
.low
	ld a, SP3_AFF_LOW
	ret

; ---------------------------------------------------------------------------------------------
; a = health state of the LOADED mon (SP3_HEALTH_*). Status downgrades a healthy mon to HURT.
SP3_HealthState:
	ld a, [wLoadedMonHP]
	ld b, a
	ld a, [wLoadedMonHP + 1]
	ld c, a
	or b
	jr nz, .alive
	ld a, SP3_HEALTH_FAINTED
	ret
.alive
	ld a, [wLoadedMonMaxHP]
	ld d, a
	ld a, [wLoadedMonMaxHP + 1]
	ld e, a
	predef HPBarLength           ; e = bar length in pixels (0-48)
	ld a, e
	cp SP3_HP_GOOD_MIN
	jr nc, .hpGood
	cp SP3_HP_HURT_MIN
	jr nc, .hurt
	ld a, SP3_HEALTH_BAD
	ret
.hurt
	ld a, SP3_HEALTH_HURT
	ret
.hpGood
	ld a, [wLoadedMonStatus]
	and a
	jr z, .good
	ld a, SP3_HEALTH_HURT
	ret
.good
	ld a, SP3_HEALTH_GOOD
	ret

; ---------------------------------------------------------------------------------------------
; a = scene id (SP3_SCENE_*) for the current map. Themed scenes are checked before the generic
; terrain split (city / route / cave / house / building).
SP3_GetSceneId:
	ld a, [wCurMap]
	cp SEAFOAM_ISLANDS_1F
	jr z, .seafoam
	cp SEAFOAM_ISLANDS_B1F
	jr z, .seafoam
	cp SEAFOAM_ISLANDS_B2F
	jr z, .seafoam
	cp SEAFOAM_ISLANDS_B3F
	jr z, .seafoam
	cp SEAFOAM_ISLANDS_B4F
	jr z, .seafoam
	cp ROUTE_19
	jr z, .sea
	cp ROUTE_20
	jr z, .sea
	cp ROUTE_21
	jr z, .sea
	cp CINNABAR_ISLAND
	jr z, .sea
	cp LAVENDER_TOWN
	jr z, .tower
	ld a, [wCurMapTileset]
	cp CEMETERY
	jr z, .tower
	cp VOLCANO
	jr z, .volcano
	cp FOREST
	jr z, .forest
	; generic terrain
	ld a, [wCurMap]
	cp NUM_CITY_MAPS
	jr c, .city
	cp FIRST_INDOOR_MAP
	jr c, .route
	ld a, [wCurMapTileset]
	cp CAVERN
	jr z, .cave
	cp UNDERGROUND
	jr z, .cave
	cp HOUSE
	jr z, .house
	cp REDS_HOUSE_1
	jr z, .house
	cp REDS_HOUSE_2
	jr z, .house
	cp INTERIOR
	jr z, .house
	ld a, SP3_SCENE_BUILDING
	ret
.seafoam
	ld a, SP3_SCENE_SEAFOAM
	ret
.sea
	ld a, SP3_SCENE_SEA
	ret
.tower
	ld a, SP3_SCENE_TOWER
	ret
.volcano
	ld a, SP3_SCENE_VOLCANO
	ret
.forest
	ld a, SP3_SCENE_FOREST
	ret
.city
	ld a, SP3_SCENE_CITY
	ret
.route
	ld a, SP3_SCENE_ROUTE
	ret
.cave
	ld a, SP3_SCENE_CAVE
	ret
.house
	ld a, SP3_SCENE_HOUSE
	ret

; ---------------------------------------------------------------------------------------------
; b = themed scene id. Scans that scene's type-reaction table for one of the loaded mon's types
; (or the wildcard). carry set + de = text on match; carry clear if none.
SP3_TryTypeReaction:
	ld a, b
	add a
	ld e, a
	ld d, 0
	ld hl, SP3_TypeReactionTables
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a                      ; hl = scene's type table
.scan
	ld a, [hl]
	cp SP3_TYPE_END
	jr z, .noMatch
	cp SP3_TYPE_WILDCARD
	jr z, .matched
	ld b, a
	ld a, [wLoadedMonType1]
	cp b
	jr z, .matched
	ld a, [wLoadedMonType2]
	cp b
	jr z, .matched
	inc hl
	inc hl
	inc hl
	jr .scan
.matched
	inc hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	scf
	ret
.noMatch
	and a
	ret

; ---------------------------------------------------------------------------------------------
; a = a rolled reaction nature (0-15) for the loaded mon.
SP3_GetNatureIndex:
	callfar GetLoadedMonReactionNature
	ret

; hl = base of a dw text-pointer table, a = index. Returns de = table[a].
SP3_IndexTextTable:
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret

; battle-effects row cursor helpers (wBuffer = lo, wBuffer+1 = hi)
SP3_GetLineHL:
	ld a, [wBuffer]
	ld l, a
	ld a, [wBuffer + 1]
	ld h, a
	ret

SP3_AdvanceLine:
	ld hl, wBuffer
	ld a, [hl]
	add SCREEN_WIDTH
	ld [hli], a
	ret nc
	inc [hl]
	ret

; a = stat index (0-5). Places that stat's name at the current line (column 1).
SP3_PlaceStatName:
	add a
	ld e, a
	ld d, 0
	ld hl, SP3_StatNames
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld d, h
	ld e, l                      ; de = name string
	call SP3_GetLineHL
	jp PlaceString

; a = signed stat delta (nonzero, -6..+6). Places "+N" / "-N" at column 11 of the current line.
SP3_PlaceSignedDelta:
	ld c, '+'
	bit 7, a
	jr z, .pos
	ld c, '-'
	cpl
	inc a
.pos
	add '0'
	ld b, a
	call SP3_GetLineHL
	ld de, 10
	add hl, de
	ld a, c
	ld [hli], a
	ld a, b
	ld [hl], a
	ret

; de = label. Gated: if the line is in the current page's window, place it and advance; else skip.
SP3_EmitFlag:
	push de
	call SP3_LineGate
	pop de
	ret nc
	push de
	call SP3_GetLineHL
	pop de
	call PlaceString
	jp SP3_AdvanceLine

; de = label, a = a 0-7 counter. Gated: places "<label>  N" and advances, if in the page's window.
SP3_EmitCount:
	ld c, a ; c = count
	push bc
	push de
	call SP3_LineGate
	pop de
	pop bc
	ret nc
	push bc
	push de
	call SP3_GetLineHL
	pop de
	call PlaceString
	call SP3_GetLineHL
	ld de, 10
	add hl, de
	pop bc
	ld a, c
	add '0'
	ld [hl], a
	jp SP3_AdvanceLine

; ---------------------------------------------------------------------------------------------
; Sunsette: page-3 button waits that ALSO blink the overflow down-arrow (coord 18,15) while waiting,
; matching the game's text-continuation cursor. Floated here (Battle Engine 1 was full); the status
; drivers reach them via callfar, so the pressed buttons are returned in e (callfar clobbers a). The
; arrow tile only exists on a page that has more after it, and HandleDownArrowBlinkTiming is a no-op on
; a blank tile, so these are safe on the final (arrow-less) page too. Both helpers (HandleDownArrowBlink-
; Timing, JoypadLowSensitivity) live in the home bank, so plain calls work from this floating bank.

; mask = A | B only (the Pokedex status driver, which has no up/down mon-switching)
StatusPage3WaitNoDir::
	ld b, PAD_A | PAD_B
	jr StatusPage3WaitLoop

; mask = A | B, plus UP unless viewing the first mon and DOWN unless viewing the last (party driver)
StatusPage3WaitParty::
	ld b, PAD_A | PAD_B
	ld a, [wWhichPokemon]
	and a
	jr z, .checkRight
	ld a, b
	or PAD_UP
	ld b, a
.checkRight
	ld a, [wPartyCount]
	dec a
	ld c, a
	ld a, [wWhichPokemon]
	cp c
	jr z, StatusPage3WaitLoop
	ld a, b
	or PAD_DOWN
	ld b, a
	; fall through

; b = allowed button mask. Blinks the arrow until a masked button is pressed; returns it in e.
StatusPage3WaitLoop:
	ldh a, [hDownArrowBlinkCount1]
	push af
	ldh a, [hDownArrowBlinkCount2]
	push af
	xor a
	ldh [hDownArrowBlinkCount1], a
	ld a, 6
	ldh [hDownArrowBlinkCount2], a
.loop
	push bc
	hlcoord 18, 15
	call HandleDownArrowBlinkTiming
	call JoypadLowSensitivity
	pop bc
	ldh a, [hJoy5]
	and b
	jr z, .loop
	ld c, a ; stash the pressed buttons across the count restore
	pop af
	ldh [hDownArrowBlinkCount2], a
	pop af
	ldh [hDownArrowBlinkCount1], a
	ld e, c ; return in e (survives the callfar bank restore)
	ret

INCLUDE "data/pokemon/status_page3_text.asm"
