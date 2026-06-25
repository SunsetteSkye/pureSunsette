; Sunsette: centre-stage cutscene special effects (SE_$C2-$C8). Floated out of bank1E (the battle
; animation engine bank) so it stays under 0x4000. PlayAnimation range-checks the SE id and farcalls
; CenterStageSEDispatch below; these bodies call back into bank1E primitives via farcall/jpfar.
SECTION "Sunsette Center Stage SE", ROMX

; Sunsette: the GB BG tilemap is 32 tiles wide (vBGMap0). SetMapRowsAttr steps across it; this constant
; was referenced by the centre-stage code but never defined in the repo, so define it here.
IF !DEF(BG_MAP_WIDTH)
DEF BG_MAP_WIDTH EQU 32
ENDC

; Out-of-bank dispatch: PlayAnimation (bank1E) farcalls here with a = SE id ($C2-$C8); jump to its body.
; This + the range check replace the 7 in-bank trampolines / SpecialEffectPointers entries that overflowed bank1E.
CenterStageSEDispatch::
	sub $C2
	add a
	ld e, a
	ld d, 0
	ld hl, .table
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
.table:
	dw RedBarOff_CS              ; $C2 SE_RED_BAR_OFF
	dw RedBarOn_CS               ; $C3 SE_RED_BAR_ON
	dw ResetTargetPosition_CS    ; $C4 SE_RESET_TARGET_POSITION
	dw MoveTargetToCenter_CS     ; $C5 SE_MOVE_TARGET_TO_CENTER
	dw RestoreBattleHUDs_CS      ; $C6 SE_RESTORE_HUDS
	dw HideBattleHUDs_CS         ; $C7 SE_HIDE_HUDS
	dw RestoreMonFromMinimize_CS ; $C8 SE_RESTORE_MON_FROM_MINIMIZE

;;;;;;;;;; Sunsette: undo a TEMPORARY minimize.
; The existing SE_MINIMIZE_MON / AnimationMinimizeMon shrinks the active mon to
; the little black blob, but it stays small because nothing reloads the sprite.
; RestoreMonFromMinimize re-decompresses a mon's real sprite back into VRAM and
; redraws it, so a temporary shrink only lasts as long as your animation. It restores
; BOTH sides (so SE_MINIMIZE_MON or SE_MINIMIZE_ENEMY_MON both undo with this one SE),
; reloading a non-shrunk mon is just a harmless identical redraw.
;
; CRUCIAL: each side is guarded on wPlayerMonMinimized / wEnemyMonMinimized. The temporary
; minimize leaves those CLEAR; the actual Minimize MOVE sets them. So a mon that used
; Minimize (permanently small) is left untouched here and stays minimized.
;
; Exposed to move animations as SE_RESTORE_MON_FROM_MINIMIZE. Usage:
;   battle_anim NO_MOVE, SE_MINIMIZE_MON / SE_MINIMIZE_ENEMY_MON   ; shrink
;   ; ... your subanimation frames / delays here ...
;   battle_anim NO_MOVE, SE_RESTORE_MON_FROM_MINIMIZE              ; put it back
RestoreMonFromMinimize_CS::
	call .oneSide              ; current turn's mon
	ldh a, [hWhoseTurn]
	push af
	xor 1
	ldh [hWhoseTurn], a
	call .oneSide              ; the other mon
	pop af
	ldh [hWhoseTurn], a
	ret
.oneSide:
	ldh a, [hWhoseTurn]
	and a
	jr nz, .enemySide
; player side: reload the back sprite, UNLESS permanently minimized (Minimize move)
	ld a, [wPlayerMonMinimized]
	and a
	ret nz
	ld a, [wBattleMonSpecies2]
	ld [wCurSpecies], a
	call GetMonHeader
	callfar LoadMonBackPic
	callfar AnimationShowMonPic
	ret
.enemySide:
; enemy side: reload the front sprite, UNLESS permanently minimized
	ld a, [wEnemyMonMinimized]
	and a
	ret nz
	ld a, [wEnemyMonSpecies]
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	xor a
	ld [wSpriteFlipped], a
	call GetMonHeader
	hlcoord 12, 0
	call LoadFrontSpriteByMonIndex ; home routine
	ret
;;;;;;;;;;

;;;;;;;;;; Sunsette: hide / restore the battle HUDs (the name/level/HP info boxes) for a
; cutscene-style animation. Reusable. The two boxes are just BG tiles in fixed rects that
; don't overlap the mon pics, so clearing them leaves a clean field with only the Pokemon.
; RestoreBattleHUDs rebuilds everything (name/level/status/HP-bar colour/EXP bar/low-health
; alarm), so you don't reconstruct anything by hand.
;
; Exposed as SE_HIDE_HUDS / SE_RESTORE_HUDS. Hide before the dramatic part, restore after.
HideBattleHUDs_CS::
	xor a
	ldh [hAutoBGTransferEnabled], a
	hlcoord 0, 0      ; enemy info box: rows 0-3, cols 0-11
	lb bc, 4, 12
	call ClearScreenArea
	hlcoord 9, 7      ; player info box: rows 7-11, cols 9-19
	lb bc, 5, 11
	call ClearScreenArea
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	jp Delay3

RestoreBattleHUDs_CS::
	jpfar DrawHUDsAndHPBars
;;;;;;;;;;

;;;;;;;;;; Sunsette: "centre stage" cutscene unit -------------------------------------
; Relocates the DEFENDING mon to the evolution-screen centre (hlcoord 7,2) and frames it
; on a full-width #E00000 bar (rows 2-8 = 56px, fully containing the mon) over a blacked
; field. Built from four special effects so a move animation can sequence them:
;   SE_MOVE_TARGET_TO_CENTER -> SE_RED_BAR_ON -> (your impacts) -> SE_RED_BAR_OFF ->
;   SE_RESET_TARGET_POSITION
; All four are turn-symmetric: target = enemy front (player attacks) OR player back (enemy
; attacks). The clean silhouette comes from setting the target mon's own BG palette (enemy
; pal 3 / player pal 2, per BGMapAttributes_Battle) colour 0 to red, with the whole band on
; that palette so the empty area and the mon's surround both read red.
;
; PLAYTEST knobs: RED_BAR_COLOR (exact red), the four wAnimOffset values (impact placement),
; and that the GBC blackout reads cleanly. DMG/SGB get no bar (guarded by hGBC).
DEF RED_BAR_TOP_ROW   EQU 2    ; band starts at tile row 2 (y=16)
DEF RED_BAR_ROW_COUNT EQU 7    ; 7 rows = 56px (rows 2-8); fully contains the centred mon
DEF RED_BAR_COLOR     EQU $001B ; RGB555 ~#E00000 (R=27,G=0,B=0); PLAYTEST: tweak to taste
DEF BLACKOUT_PAL      EQU 7     ; spare BG palette used to black out everything off the band

GetTargetMonPalette:
; returns the defending mon's BG palette index in a (enemy front = 3, player back = 2)
	ldh a, [hWhoseTurn]
	and a
	ld a, 3
	ret z
	ld a, 2
	ret

SetMapRowsAttr:
; fills the BG attribute map (VRAM bank 1) for a block of rows with one palette.
; in: a = palette index, d = first row (0-17), e = number of rows.
; di/ei per row so audio/VBlank can breathe between rows (slower is fine for drama).
	ld c, a               ; c = palette value
	ld l, d
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl            ; hl = firstRow * 32
	ld a, l
	add LOW(vBGMap0)
	ld l, a
	ld a, h
	adc HIGH(vBGMap0)
	ld h, a               ; hl = vBGMap0 + firstRow*32
.row
	di
	ld a, 1
	ldh [rVBK], a
	ld b, SCREEN_WIDTH
.col
	ldh a, [rSTAT]
	and %10               ; wait for HBlank/VBlank (safe VRAM access)
	jr nz, .col
	ld a, c
	ld [hli], a
	dec b
	jr nz, .col
	xor a
	ldh [rVBK], a
	ei
	ld a, l
	add BG_MAP_WIDTH - SCREEN_WIDTH
	ld l, a
	jr nc, .nc
	inc h
.nc
	dec e
	jr nz, .row
	ret

SetBGPalColor:
; writes one CGB BG palette colour, timing-safe (modelled on SetAttackAnimPal).
; in: a = palette index (0-7), c = colour slot (0-3), de = RGB555 colour.
	add a
	add a
	add a                 ; pal * 8
	ld b, a
	ld a, c
	add a                 ; slot * 2
	add b                 ; byte offset into palette RAM
	or $80                ; auto-increment
	ld b, a
	di
.w1
	ldh a, [rSTAT]
	and %10
	jr nz, .w1
	ld a, b
	ldh [rBGPI], a
	ld a, e               ; low byte
	ldh [rBGPD], a
.w2
	ldh a, [rSTAT]
	and %10
	jr nz, .w2
	ld a, d               ; high byte
	ldh [rBGPD], a
	ei
	ret

MoveTargetToCenter_CS::
; relocate the defender to centre, set the band palette, arm the impact offset
	ldh a, [hWhoseTurn]
	push af
	xor 1
	ldh [hWhoseTurn], a
	call .relocate
	pop af
	ldh [hWhoseTurn], a
	ldh a, [hWhoseTurn]
	and a
	jr nz, .enemyAttacker
	ld a, -40             ; PLAYTEST: enemy-target X offset (home x96 -> centre x56)
	ld [wAnimOffsetX], a
	ld a, 16              ; PLAYTEST: enemy-target Y offset (home y0 -> centre y16)
	ld [wAnimOffsetY], a
	jr .bandPalette
.enemyAttacker
	ld a, 48              ; PLAYTEST: player-target X offset (home x8 -> centre x56)
	ld [wAnimOffsetX], a
	ld a, -24             ; PLAYTEST: player-target Y offset (home y40 -> centre y16)
	ld [wAnimOffsetY], a
.bandPalette
	ldh a, [hGBC]
	and a
	jr z, .done
	call GetTargetMonPalette
	ld d, RED_BAR_TOP_ROW
	ld e, RED_BAR_ROW_COUNT
	call SetMapRowsAttr   ; band on the target's palette so the centred mon colours correctly
.done
	jp Delay3
.relocate
	farcall AnimationHideMonPic
	hlcoord 7, 2
	xor a ; TILEMAP_MON_PIC
	push hl
	farcall GetTileIDList
	pop hl
	jpfar CopyPicTiles

RedBarOn_CS::
	ldh a, [hGBC]
	and a
	ret z                 ; PLAYTEST: no DMG/SGB fallback (the .gbc targets are GBC)
	ld a, $e4             ; un-darken pals 0-3 (undo SE_DARK_SCREEN_PALETTE) so the mon shows
	ldh [rBGP], a
	call UpdateGBCPal_BGP
	ld c, 0               ; blackout palette -> all black
.blackLoop
	push bc
	ld a, BLACKOUT_PAL
	ld de, $0000
	call SetBGPalColor
	pop bc
	inc c
	ld a, c
	cp 4
	jr nz, .blackLoop
	ld a, BLACKOUT_PAL    ; rows above the band -> black
	ld d, 0
	ld e, RED_BAR_TOP_ROW
	call SetMapRowsAttr
	call GetTargetMonPalette ; band rows -> target palette
	ld d, RED_BAR_TOP_ROW
	ld e, RED_BAR_ROW_COUNT
	call SetMapRowsAttr
	ld a, BLACKOUT_PAL    ; rows below the band -> black
	ld d, RED_BAR_TOP_ROW + RED_BAR_ROW_COUNT
	ld e, SCREEN_HEIGHT - (RED_BAR_TOP_ROW + RED_BAR_ROW_COUNT)
	call SetMapRowsAttr
	call GetTargetMonPalette ; paint the band: target palette colour 0 -> red
	ld c, 0
	ld de, RED_BAR_COLOR
	call SetBGPalColor
	jp Delay3

RedBarOff_CS::
	ldh a, [hGBC]
	and a
	ret z
	call GetTargetMonPalette ; band background red -> black (mon stays, bar gone)
	ld c, 0
	ld de, $0000
	call SetBGPalColor
	jp Delay3

ResetTargetPosition_CS::
	xor a
	ld [wAnimOffsetX], a
	ld [wAnimOffsetY], a
	ldh a, [hWhoseTurn]
	push af
	xor 1
	ldh [hWhoseTurn], a
	call .resetDefender
	pop af
	ldh [hWhoseTurn], a
	ldh a, [hGBC]
	and a
	ret z
	ld d, 11              ; BGMapAttributes_Battle (1-based packet) -> restore normal attributes
	farcall LoadBGMapAttributes
	ret
.resetDefender
	hlcoord 7, 2
	lb bc, 7, 7
	call ClearScreenArea
	jpfar AnimationShowMonPic
;;;;;;;;;;

;;;;;;;;;; Sunsette: SE_RED_SCREEN_PALETTE body (floated out of bank1E). Floods every active BG
; palette with a 4-shade ramp chosen by wScreenFloodRamp (set from the battle_anim FLOOD_* operand
; by PlayAnimation's .floodScreenPalette). The colour can't come from the dark effect's BGP-remap
; (no such colour in the base palettes), so it writes the ramp straight into palette RAM. GBC only;
; DMG/SGB degrade to dark. Undone by SE_RESET_SCREEN_PALETTE. PLAYTEST: ScreenFloodRamps_CS rows.
AnimationFloodScreenPalette_CS::
	ldh a, [hGBC]
	and a
	jr nz, .gbc
	farcall AnimationDarkScreenPalette ; no CGB colour on DMG/SGB
	ret
.gbc
	ld a, [wScreenFloodRamp]           ; ramp base = ScreenFloodRamps_CS + index*8
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, ScreenFloodRamps_CS
	add hl, de
	ld d, h
	ld e, l                            ; de = ramp base (preserved across the loop)
	ld c, NUM_ACTIVE_PALS
	xor a                              ; a = palette index
.loop
	push bc
	push de
	push af
	call SetBGPalRamp_CS
	pop af
	pop de
	pop bc
	inc a
	dec c
	jr nz, .loop
	ret

SetBGPalRamp_CS:
; write a 4-colour ramp (de) into BG palette (a = index), timing-safe
	add a
	add a
	add a               ; a = pal * 8 (byte offset)
	or $80              ; auto-increment from colour 0
	ld h, d
	ld l, e             ; hl = ramp source
	ld c, 8             ; 4 colours * 2 bytes
	di
	ldh [rBGPI], a
.byte
	ldh a, [rSTAT]
	and %10
	jr nz, .byte        ; wait for HBlank/VBlank before each write
	ld a, [hli]
	ldh [rBGPD], a
	dec c
	jr nz, .byte
	ei
	ret

ScreenFloodRamps_CS:
; One 4-colour ramp per FLOOD_* selector, written with the engine's RGB macro (channels 0-31).
; The four colours recolour BG colour indices 0,1,2,3 in order: slot 0 = the scene's lightest /
; background pixels, slot 3 = its darkest / text-glyph pixels. So for white text on a colour, put
; the colour in slot 0 and white in slot 3 (see GREEN). Four identical colours = a flat block.
; To add a colour: add a row here AND a FLOOD_x constant in data/moves/animations.asm.
; PLAYTEST: RED is the eyeballed original; BLUE/GOLD/WHITE are starting points.
	RGB 31,06,06, 27,00,00, 18,00,00, 09,00,00 ; 0 FLOOD_RED   (~#E00000)
	RGB 10,12,31, 04,06,24, 00,02,16, 00,00,08 ; 1 FLOOD_BLUE
	RGB 00,13,00, 00,20,00, 18,28,18, 31,31,31 ; 2 FLOOD_GREEN  (#006800 bg -> white text)
	RGB 31,27,06, 28,20,00, 20,12,00, 10,05,00 ; 3 FLOOD_GOLD
	RGB 31,31,31, 21,21,21, 10,10,10, 00,00,00 ; 4 FLOOD_WHITE  (white -> black)
;;;;;;;;;;
