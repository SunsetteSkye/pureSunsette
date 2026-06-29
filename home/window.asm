HandleMenuInput::
	xor a
	ld [wPartyMenuAnimMonEnabled], a

HandleMenuInput_::
	ldh a, [hDownArrowBlinkCount1]
	push af
	ldh a, [hDownArrowBlinkCount2]
	push af ; save existing values on stack
	xor a
	ldh [hDownArrowBlinkCount1], a ; blinking down arrow timing value 1
	ld a, 6
	ldh [hDownArrowBlinkCount2], a ; blinking down arrow timing value 2
.loop1
	xor a
	ld [wAnimCounter], a ; counter for pokemon shaking animation
	call PlaceMenuCursor
	call Delay3
.loop2
	push hl
	ld a, [wPartyMenuAnimMonEnabled]
	and a ; is it a pokemon selection menu?
	jr z, .getJoypadState
	farcall AnimatePartyMon ; shake mini sprite of selected pokemon
.getJoypadState
	pop hl
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	and a ; was a key pressed?
	jr nz, .keyPressed
	push hl
	hlcoord 18, 11 ; coordinates of blinking down arrow in some menus
	call HandleDownArrowBlinkTiming ; blink down arrow (if any)
	pop hl
	ld a, [wMenuJoypadPollCount]
	dec a
	jr nz, .loop2
.giveUpWaiting
; if a key wasn't pressed within the specified number of checks
	pop af
	ldh [hDownArrowBlinkCount2], a
	pop af
	ldh [hDownArrowBlinkCount1], a ; restore previous values
	xor a
	ld [wMenuWrappingEnabled], a ; disable menu wrapping
	ret
.keyPressed
	ldh a, [hJoy5]
	ld b, a
	;shinpokerednote: FIXED: fix from pokeyellow to prioritize the A button over the directional buttons
	bit B_PAD_A, a ; pressed A key?
	jr nz, .checkOtherKeys

	bit B_PAD_UP, a ; pressed Up key?
	jr z, .checkIfDownPressed
; Up pressed
	ld a, [wCurrentMenuItem] ; selected menu item
	and a ; already at the top of the menu?
	jr z, .alreadyAtTop
; not at top
	dec a
	ld [wCurrentMenuItem], a ; move selected menu item up one space
	call CheckForHoverText ; PureRGBnote: ADDED: when moving up and down (but not scrolling) specific list menus, we need to display TM text
	jr .checkOtherKeys
.alreadyAtTop
	ld a, [wMenuWrappingEnabled]
	and a ; is wrapping around enabled?
	jr z, .noWrappingAround
	ld a, [wMaxMenuItem]
	ld [wCurrentMenuItem], a ; wrap to the bottom of the menu
	jr .checkOtherKeys
.checkIfDownPressed
	bit B_PAD_DOWN, a
	jr z, .checkOtherKeys
; Down pressed
	ld a, [wCurrentMenuItem]
	inc a
	ld c, a
	ld a, [wMaxMenuItem]
	cp c
	jr nc, .notAtBottom
; already at bottom
	ld a, [wMenuWrappingEnabled]
	and a ; is wrapping around enabled?
	jr z, .noWrappingAround
	ld c, $00 ; wrap from bottom to top
.notAtBottom
	ld a, c
	ld [wCurrentMenuItem], a
	call CheckForHoverText ; PureRGBnote: ADDED: when moving up and down (but not scrolling) specific list menus, we need to display TM text
.checkOtherKeys
	ld a, [wMenuWatchedKeys]
	and b ; does the menu care about any of the pressed keys?
	jp z, .loop1
.checkIfAButtonOrBButtonPressed
	ld a, b ; shinpokerednote: CHANGED: load from b, which contains [hJoy5], to save 1 byte
	and PAD_A | PAD_B
	jr z, .skipPlayingSound
.AButtonOrBButtonPressed
	ld a, [wMiscFlags] ;shinpokerednote: CHANGED: remove push/pop with hl to save 2 bytes
	bit BIT_NO_MENU_BUTTON_SOUND, a
	jr nz, .skipPlayingSound
	ld a, SFX_PRESS_AB
	rst _PlaySound
.skipPlayingSound
	pop af
	ldh [hDownArrowBlinkCount2], a
	pop af
	ldh [hDownArrowBlinkCount1], a ; restore previous values
	xor a
	ld [wMenuWrappingEnabled], a ; disable menu wrapping
	ld a, b ; shinpokerednote: CHANGED: load from b, which contains [hJoy5], to save 1 byte
	ret
.noWrappingAround
	ld a, [wMenuWatchMovingOutOfBounds]
	and a ; should we return if the user tried to go past the top or bottom?
	jr z, .checkOtherKeys
	jr .checkIfAButtonOrBButtonPressed

PlaceMenuCursor::
	ld a, [wTopMenuItemY]
	and a ; is the y coordinate 0?
	jr z, .adjustForXCoord
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH
.topMenuItemLoop
	add hl, bc
	dec a
	jr nz, .topMenuItemLoop
.adjustForXCoord
	ld a, [wTopMenuItemX]
	ld b, 0
	ld c, a
	add hl, bc
	push hl
	ld a, [wLastMenuItem]
	and a ; was the previous menu id 0?
	jr z, .checkForArrow1
	push af
	ldh a, [hUILayoutFlags]
	bit BIT_DOUBLE_SPACED_MENU, a
	jr z, .doubleSpaced1
	ld bc, SCREEN_WIDTH
	jr .getOldMenuItemScreenPosition
.doubleSpaced1
	ld bc, SCREEN_WIDTH * 2
.getOldMenuItemScreenPosition
	pop af
.oldMenuItemLoop
	add hl, bc
	dec a
	jr nz, .oldMenuItemLoop
.checkForArrow1
	ld a, [hl]
	cp '▶' ; was an arrow next to the previously selected menu item?
	jr nz, .skipClearingArrow
; clear arrow
	ld a, [wTileBehindCursor]
	ld [hl], a
.skipClearingArrow
	pop hl
	ld a, [wCurrentMenuItem]
	and a
	jr z, .checkForArrow2
	push af
	ldh a, [hUILayoutFlags]
	bit BIT_DOUBLE_SPACED_MENU, a
	jr z, .doubleSpaced2
	ld bc, SCREEN_WIDTH
	jr .getCurrentMenuItemScreenPosition
.doubleSpaced2
	ld bc, SCREEN_WIDTH * 2
.getCurrentMenuItemScreenPosition
	pop af
.currentMenuItemLoop
	add hl, bc
	dec a
	jr nz, .currentMenuItemLoop
.checkForArrow2
	ld a, [hl]
	cp '▶' ; has the right arrow already been placed?
	jr z, .skipSavingTile ; if so, don't lose the saved tile
	ld [wTileBehindCursor], a ; save tile before overwriting with right arrow
.skipSavingTile
	ld [hl], '▶'
	ld a, l
	ld [wMenuCursorLocation], a
	ld a, h
	ld [wMenuCursorLocation + 1], a
	ld a, [wCurrentMenuItem]
	ld [wLastMenuItem], a
	ret

; PureRGBnote: ADDED: function for displaying text while hovering on a list menu entry.
CheckForHoverText::
	ld a, [wListMenuHoverTextType]
	and a
	ret z ; if wListMenuHoverTextType is 0, we aren't in a list menu containing hover text.
	; keep in mind we only need to display TM names in a list menu, other menu types never need to
	; Sunsette FIX 2026-06-28: CheckLoadHoverText lives in bank 1, but the hover-text routine it calls
	; ends in `jpfar CheckDrawItemCount` (bank $3A) which never restores bank 1 -- so after the FIRST
	; hover display the loaded bank is no longer 1. HandleMenuInput's own input loop can then reach
	; CheckForHoverText again (cursor move + scroll) with a non-1 bank mapped, and the old tail
	; `jp CheckLoadHoverText` jumped to $7BBA in the WRONG bank = a wild jump into data (crash, e.g.
	; pulling items from the PC while mashing buttons; landed in bank-6 tile data). Switch to bank 1
	; explicitly and restore the caller's bank on the way out, so this is safe no matter what bank is
	; currently mapped. Same class of bug + same fix shape as GetMoveSoundEntry (home/bankswitch.asm).
	ldh a, [hLoadedROMBank]
	push af ; save the caller's bank
	ld a, BANK(CheckLoadHoverText)
	call SetCurBank
	ld a, [wListMenuHoverTextType] ; CheckLoadHoverText takes the hover type in a (it `dec a`'s to index)
	call CheckLoadHoverText
	pop af
	jp SetCurBank ; restore the caller's bank, then ret

; This is used to mark a menu cursor other than the one currently being
; manipulated. In the case of submenus, this is used to show the location of
; the menu cursor in the parent menu. In the case of swapping items in list,
; this is used to mark the item that was first chosen to be swapped.
PlaceUnfilledArrowMenuCursor::
	ld b, a
	hl_deref wMenuCursorLocation
	ld [hl], '▷'
	ld a, b
	ret

; Replaces the menu cursor with a blank space.
EraseMenuCursor::
	hl_deref wMenuCursorLocation
	ld [hl], ' '
	ret

; This toggles a blinking down arrow at hl on and off after a delay has passed.
; This is often called even when no blinking is occurring.
; The reason is that most functions that call this initialize hDownArrowBlinkCount1 to 0.
; The effect is that if the tile at hl is initialized with a down arrow,
; this function will toggle that down arrow on and off, but if the tile isn't
; initialized with a down arrow, this function does nothing.
; That allows this to be called without worrying about if a down arrow should
; be blinking.
HandleDownArrowBlinkTiming::
	ld a, [hl]
	ld b, a
	ld a, '▼'
	cp b
	jr nz, .downArrowOff
.downArrowOn
	ldh a, [hDownArrowBlinkCount1]
	dec a
	ldh [hDownArrowBlinkCount1], a
	ret nz
	ldh a, [hDownArrowBlinkCount2]
	dec a
	ldh [hDownArrowBlinkCount2], a
	ret nz
	ld [hl], ' '
	ld a, $ff
	ldh [hDownArrowBlinkCount1], a
	ld a, $06
	ldh [hDownArrowBlinkCount2], a
	ret
.downArrowOff
	ldh a, [hDownArrowBlinkCount1]
	and a
	ret z
	dec a
	ldh [hDownArrowBlinkCount1], a
	ret nz
	dec a
	ldh [hDownArrowBlinkCount1], a
	ldh a, [hDownArrowBlinkCount2]
	dec a
	ldh [hDownArrowBlinkCount2], a
	ret nz
	ld a, $06
	ldh [hDownArrowBlinkCount2], a
	ld [hl], '▼'
	ret

; The following code either enables or disables the automatic drawing of
; text boxes by DisplayTextID. Both functions cause DisplayTextID to wait
; for a button press after displaying text (unless [wEnteringCableClub] is set).

EnableAutoTextBoxDrawing::
	xor a
	jr AutoTextBoxDrawingCommon

DisableAutoTextBoxDrawing::
	ld a, 1 << BIT_NO_AUTO_TEXT_BOX

AutoTextBoxDrawingCommon::
	ld [wAutoTextBoxDrawingControl], a
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a ; make DisplayTextID wait for button press
	ret

PrintText::
; Print text hl at (1, 14).
	push hl
	ld a, MESSAGE_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call UpdateSpritesAndDelay3
	pop hl
PrintText_NoCreatingTextBox::
; Route prose through the variable-width font, GBC-only. Two surfaces:
;   * overworld dialogue -- OPT-IN via wVWFEnable (DisplayTextID's NPC/sign path);
;     PrintText is shared by menus/intro/system text, so the opt-in flag scopes it tight.
;   * battle messages -- ALL battle PrintText (always the bottom box at (1,14)); the
;     FIGHT/PKMN/ITEM/RUN menu + HP/name HUD use PlaceString, so they stay fixed-width.
; Both render on the WINDOW layer (VWFAttrTable). Battle's attribute-reset flash is
; handled in TranslatePalPacketToBGMapAttributes (engine/gfx/palettes.asm).
	xor a
	ld [wVWFActive], a
	ldh a, [hGBC]
	and a
	jr z, .noVWF ; CGB-only (DMG keeps fixed-width)
	ld a, [wIsInBattle]
	and a
	jr nz, .battleVWF ; battle: VWF ALL battle-message PrintText. The FIGHT/PKMN/ITEM/RUN
	                  ; menu + HP/name HUD use PlaceString (not PrintText) so they stay fixed.
	ld a, [wVWFEnable] ; overworld: opt-in only (set by DisplayTextID's NPC/sign path)
	and a
	jr z, .noVWF
	ld a, 1
	ld [wVWFActive], a
	ld [wVWFBoxOpen], a ; box is rendered; CloseTextDisplay tears it down via this flag
	xor a
	ld [wVWFTextDepth], a ; reset insert-nesting depth for this top-level print
	push hl
	push de ; VWFInitPool clobbers de, but TextCommandProcessor needs it (TX_FAR)
	vwf_farcall VWFInitPool
	pop de
	pop hl
	jr .noTeardown ; VWF box freshly set up -- DON'T fall into the fixed-width teardown
	               ; below (it would clear wVWFBoxOpen + EndBox the box we just opened,
	               ; disarming the scroll gate so post-print scrolls spray pool tiles).
.battleVWF
	; Battle reuses ONE message box with no per-message CloseTextDisplay, so VWFInitPoolBattle
	; wipes the prior message's stale box (attrs + bytes) before composing the new one.
	ld a, 1
	ld [wVWFActive], a
	xor a
	ld [wVWFTextDepth], a
	push hl
	push de
	vwf_farcall VWFInitPoolBattle
	pop de
	pop hl
	jr .noTeardown
.noVWF
	; This print is FIXED-WIDTH (non-prose menu/system text). A prior VWF dialogue
	; may have left bank-1 (pool) attributes + pool tile bytes on the message box;
	; fixed-width font printed over them fetches pool tiles = garbage (the PC-withdraw
	; / "what will you do" bug). The wVWFBoxOpen flag proved unreliable across menu
	; re-entry, so just blank the box UNCONDITIONALLY here on GBC overworld. (Battle
	; has no VWF box -- shelved -- and uses its own box palette, so skip it there.)
	ldh a, [hGBC]
	and a
	jr z, .noTeardown
	ld a, [wIsInBattle]
	and a
	jr nz, .noTeardown
	xor a
	ld [wVWFBoxOpen], a
	push hl
	push de
	vwf_farcall VWFEndBox
	pop de
	pop hl
.noTeardown
	bccoord 1, 14
	call TextCommandProcessor
	; The dialogue print (incl. name inserts + cont/para) is done. Clear wVWFActive
	; so the PlaceNextChar VWF hooks stop firing -- otherwise a menu/screen drawn
	; afterward (PC submenus, Pokedex) that prints via PlaceString/TextCommandProcessor
	; at its OWN coords gets hijacked into the VWF box. The box stays rendered;
	; wVWFBoxOpen drives its teardown at close. Preserve regs the caller may use.
	push af
	xor a
	ld [wVWFActive], a
	pop af
	ret
