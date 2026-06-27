TextBoxBorder::
; Draw a c×b text box at hl.

	; top row
	push hl
	ld a, '┌'
	ld [hli], a
	inc a ; "─"
	call .PlaceChars
	inc a ; "┐"
	ld [hl], a
	pop hl

	ld de, SCREEN_WIDTH
	add hl, de

	; middle rows
.next
	push hl
	ld a, '│'
	ld [hli], a
	ld a, ' '
	call .PlaceChars
	ld [hl], '│'
	pop hl

	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .next

	; bottom row
	ld a, '└'
	ld [hli], a
	ld a, '─'
	call .PlaceChars
	ld [hl], '┘'
	ret

.PlaceChars::
; Place char a c times.
	ld d, c
.loop
	ld [hli], a
	dec d
	jr nz, .loop
	ret

PlaceString::
	push hl

PlaceNextChar::
	ld a, [de]
	cp '@'
	jr nz, .NotTerminator
	ld a, [wVWFActive] ; VWF: place the last buffered word + finalize its tile so they show
	and a
	jr z, .terminate
	push de
	ld a, [wVWFTextDepth]
	and a
	jr nz, .flushTileOnly ; inside an insert: DON'T place the word (a mid-word insert like
	                      ; <poke>dex / <PLAYER>! must keep buffering across this @)
	call VWFFlushWordPaged ; TOP-LEVEL string end: place the last word now (during the crawl,
	                       ; before any tail delay) so a scripted text's final word shows
.flushTileOnly
	vwf_farcall VWFFlushCurrent
	pop de
.terminate
	ld b, h
	ld c, l
	pop hl
	ret
.NotTerminator
; PureRGBnote: CHANGED: Check against a jump table instead of a dictionary.
; this actually speeds up text a lot because it doesn't make do a ton of cp commands for every single character
	push hl
	cp FIRST_TEXT_SHORCUT_ID
	jr c, .no
	cp LAST_TEXT_SHORTCUT_ID + 1
	jr nc, .no
	push de
	sub FIRST_TEXT_SHORCUT_ID
	ld hl, TextShortcutCommandJumpTable
	ld d, 0
	ld e, a
	add hl, de
	add hl, de
	hl_deref
	pop de
.gotCommand
	ld b, h
	ld c, l
	pop hl
	jp_bc
.no
	pop hl
	ld a, [wVWFActive]
	and a
	jr z, .fixedChar
	; VWF Stage 2: BUFFER the char for word-wrap (no display yet); a space flushes the
	; buffered word, measuring it so it can start a new line if it would overflow. The
	; char is read HERE in the text's bank + SVBK=1; the VWF routines run at SVBK=2 via
	; vwf_farcall and never deref [de]. hl/bc are vestigial in VWF mode.
	ld a, [de]
	cp ' '
	jr z, .vwfSpace
	push de
	ld e, a
	vwf_farcall VWFAddChar
	pop de
	call PrintLetterDelay
	jp NextChar
.vwfSpace
	call VWFFlushWordPaged ; a space ends a word -> place it (wrap + auto-page if needed)
	call PrintLetterDelay
	jp NextChar
.fixedChar
	ld a, [de]
	ld [hli], a
	call PrintLetterDelay

NextChar::
	inc de
	jp PlaceNextChar

;NullChar::
;	ld b, h
;	ld c, l
;	pop hl
;	; A "<NULL>" character in a printed string
;	; displays an error message with the current value
;	; of hTextID in decimal format.
;	; This is a debugging leftover.
;	ld de, TextIDErrorText
;	dec de
;	ret

; PureRGBnote: CHANGED: many shortcut commands were added here
; because it greatly reduces text data size if certain commonly used phrases are parameterized.
; must match the order of the charmap shortcuts and no gaps are allowed
TextShortcutCommandJumpTable:
	dw CapPokemonChar   ; $3C <Pokemon> -> "Pokémon" (de-cap, sentence start)
	dw LowerPokeChar    ; $3D <poke>    -> "Poké"    (de-cap)
	dw LowerPokemonChar ; $3E <pokemon> -> "pokémon" (de-cap)
	dw OrChar
	dw IngChar
	dw TheChar
	dw YouChar
	dw OpponentChar
	dw UserChar
	dw PokemonChar
	dw TrainerTipsChar
	dw TeamChar
	dw MultiButtonPageChar
	dw PageChar
	dw PlacePKMN
	dw _ContText
	dw _ContTextNoPause
	dw IsChar
	dw NextCharCmd
	dw LineChar
	dw DoRet ; string terminator
	dw Paragraph
	dw PrintPlayerName
	dw PrintRivalName
	dw PlacePOKe
	dw ContText
	dw ThreeDotsChar
	dw DoneText
	dw PromptText
	dw PlaceMoveTargetsName
	dw PlaceMoveUsersName
	dw PCChar
	dw TMChar
	dw TrainerChar
	dw RocketChar
	dw PlaceDexEnd

	; " the "
	; " to "
	; "here"
	; " a "
	; "his"
	; "that"
	; "for"

LineChar::
	ld a, [wVWFActive]
	and a
	jp nz, VWFTextLineBreak ; jp not jr: the auto-page VWFFlushCurrent pushed this past jr range
	pop hl
	hlcoord 1, 16
	push hl
	jp NextChar

NextCharCmd::
	ld a, [wVWFActive]
	and a
	jr nz, VWFTextLineBreak
	ld bc, 2 * SCREEN_WIDTH
	ldh a, [hUILayoutFlags]
	bit 2, a
	jr z, .ok
	ld bc, SCREEN_WIDTH
.ok
	pop hl
	add hl, bc
	push hl
	jp NextChar

; Flush the buffered word, AUTO-PAGING if it overflows the full 2-line box. VWFFlushWord
; sets wUnusedFlag=1 when the word won't fit on the last line (and leaves it buffered);
; here we show the ▼, wait, clear, start a fresh page (KEEPING the buffer), and re-flush.
; Preserves de.
VWFFlushWordPaged:
	push de
	vwf_farcall VWFFlushWord
	ld a, [wUnusedFlag]
	and a
	jr nz, .page
	pop de
	ret
.page
	vwf_farcall VWFFlushCurrent ; flush the last placed word's PARTIAL tile so its final
	                            ; char shows before the page waits (auto-page parity with
	                            ; the <PARA>/prompt/done paths). Without this the last word
	                            ; on a full page loses its trailing glyph ("It"->"I").
	ld a, '▼'
	ldcoord_a 18, 16
	call ProtectedDelay3
	call ManualTextScroll
	ld a, ' '
	ldcoord_a 18, 16
	vwf_farcall VWFEndBox
	vwf_farcall VWFNewPage ; fresh page, but keep the overflowed word buffered
	vwf_farcall VWFFlushWord ; now it fits at line 0
	pop de
	ret

VWFTextLineBreak: ; VWF Stage-2 REFLOW: in-paragraph <LINE>/<NEXT> are now SOFT. Just
	; flush the pending word and let the NEXT word auto-wrap to the proportional width;
	; the hand-placed break was sized for the fixed-width box and is too short under VWF,
	; so it degrades to a word separator (a leading space). <PARA>/<CONT> stay HARD pages.
	call VWFFlushWordPaged
	jp NextChar

VWFTextPauseClear: ; VWF <PARA>/<CONT>: show all text, wait, clear, restart
	push de
	call VWFFlushWordPaged ; place the pending buffered word before paging
	vwf_farcall VWFFlushCurrent
	ld a, '▼'
	ldcoord_a 18, 16
	call ProtectedDelay3
	call ManualTextScroll
	ld a, ' '
	ldcoord_a 18, 16
	vwf_farcall VWFEndBox
	vwf_farcall VWFInitPool
	pop de
	jp NextChar

MACRO print_name
	push de
	ld de, \1
	jp PlaceCommandCharacter ; jp not jr: adding inserts pushed the far handlers out of jr range
ENDM
	

PlaceMoveTargetsName::
	ldh a, [hWhoseTurn]
	xor 1
	jr PlaceMoveUsersName.place

PlaceMoveUsersName::
	ldh a, [hWhoseTurn]

.place:
	push de
	and a
	jr nz, .enemy

	ld de, wBattleMonNick
	jr PlaceCommandCharacter

.enemy
	ld de, EnemyText
	call PlaceString
	ld h, b
	ld l, c
	ld de, wEnemyMonNick
	; fallthrough

PlaceCommandCharacter::
	ld hl, wVWFTextDepth ; entering an insert's nested PlaceString: its terminating @ must
	inc [hl]             ; NOT place the buffered word (only the top-level @, depth 0, does)
	call PlaceString
	ld hl, wVWFTextDepth
	dec [hl]
	ld h, b
	ld l, c
	pop de
	inc de
	jp PlaceNextChar

PrintPlayerName:: print_name wPlayerName
PrintRivalName::  print_name wRivalName

TrainerChar:: print_name TrainerCharText
TMChar::      print_name TMCharText
PCChar::      print_name PCCharText
RocketChar::  print_name RocketCharText
PlacePOKe::   print_name PlacePOKeText
PlacePKMN::   print_name PlacePKMNText
CapPokemonChar::   print_name CapPokemonText   ; Sunsette: <Pokemon> -> "Pokémon" (de-cap, sentence start)
LowerPokeChar::    print_name LowerPokeText    ; Sunsette: <poke>    -> "Poké"    (de-cap)
LowerPokemonChar:: print_name LowerPokemonText ; Sunsette: <pokemon> -> "pokémon" (de-cap)
TeamChar::    print_name TeamCharText
ThreeDotsChar:: print_name ThreeDotsText
TrainerTipsChar:: print_name TrainerTipsText
PokemonChar:: print_name PlaceMonText
OpponentChar:: print_name OpponentText
UserChar:: print_name UserText
TheChar:: print_name TheText
YouChar:: print_name YouText
IngChar:: print_name IngText
OrChar:: print_name OrText
IsChar:: print_name IsText


TrainerCharText:: db "TRAINER@"
TMCharText::      db "TM@"
TeamCharText::    db "TEAM @"
RocketCharText::  db "ROCKET@"
EnemyText::       db "Enemy @"
ThreeDotsText::   db "...@"
CapPokemonText::   db "Pokémon@" ; Sunsette: <Pokemon> -> "Pokémon" (capital, sentence start)
LowerPokeText::    db "Poké@"    ; Sunsette: <poke>    -> "Poké"    (initial-cap, lowercase é)
LowerPokemonText:: db "pokémon@" ; Sunsette: <pokemon> -> "pokémon" (lowercase)
TrainerTipsText:: db "<TRAINER> TIPS@"
OpponentText::    db "opponent@"
TheText::         db "t","he@" ; have to separate with a comma to avoid it entering the same macro again
YouText::         db "y","ou@" ; have to separate with a comma to avoid it entering the same macro again
IngText::         db "i","ng@" ; have to separate with a comma to avoid it entering the same macro again
OrText::          db "o","r@" ; have to separate with a comma to avoid it entering the same macro again
IsText::          db "i","s@" ; have to separate with a comma to avoid it entering the same macro again

;TextIDErrorText:: ; "[hTextID] ERROR."
;	text_far _TextIDErrorText
;	text_end

ContText::
	ld a, [wVWFActive]
	and a
	jp nz, VWFTextPauseClear
	push de
	ld b, h
	ld c, l
	ld hl, ContCharText
	call TextCommandProcessor
	ld h, b
	ld l, c
	pop de
	inc de
	jp PlaceNextChar

PlaceDexEnd::
; PureRGBnote: CHANGED: only auto-append a period when the entry text does not
; already end in terminal punctuation. This lets a dex entry end in its own
; '.', '!', '?' or "..." (which places '.' tiles) without double-printing.
	dec hl
	ld a, [hl]
	inc hl
	cp '.'
	jr z, .alreadyPunctuated
	cp '!'
	jr z, .alreadyPunctuated
	cp '?'
	jr z, .alreadyPunctuated
	ld [hl], '.'
.alreadyPunctuated
	pop hl
	ret

PromptText::
	ld a, [wVWFActive]
	and a
	jr z, .notVWF
	push de
	call VWFFlushWordPaged ; place the last buffered word before the prompt arrow
	vwf_farcall VWFFlushCurrent ; show all text before the prompt arrow
	pop de
.notVWF
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	jp z, .ok
	ld a, '▼'
	ldcoord_a 18, 16
.ok
	call ProtectedDelay3
	call ManualTextScroll
	ld a, ' '
	ldcoord_a 18, 16

DoneText::
	ld a, [wVWFActive]
	and a
	jr z, .notVWF
	push de
	call VWFFlushWordPaged ; place the last buffered word for text ending in `done`
	vwf_farcall VWFFlushCurrent ; flush the last tile for text ending in `done`
	pop de
.notVWF
	pop hl
	ld de, TextScriptEndingText
	dec de
	ret

TextScriptPromptButton::
	text_promptbutton
TextScriptEndingText::
	text_end

Paragraph::
	ld a, [wVWFActive]
	and a
	jp nz, VWFTextPauseClear
	push de
	ld a, '▼'
	ldcoord_a 18, 16
	call ProtectedDelay3
	call ManualTextScroll
	call ClearTextBox
	ld c, 20
	rst _DelayFrames
	pop de
	hlcoord 1, 14
	jp NextChar

PageChar::
	push de
	ld a, '▼'
	ldcoord_a 18, 16
	call ProtectedDelay3
	call ManualTextScroll
	hlcoord 1, 10
	lb bc, 7, 18
	call ClearScreenArea
	ld c, 20
	rst _DelayFrames
	pop de
	pop hl
	hlcoord 1, 11
	push hl
	jp NextChar

;;;;;;;;; PureRGBnote: ADDED: new text command that allows multiple buttons to be watched while waiting on a text prompt
MultiButtonPageChar::
	push de
	callfar TextCommandPromptMultiButton
	; d = what to do after this
	ld a, d
	and a
	jr nz, .exit
	pop de
	pop hl
	hlcoord 1, 11
	push hl
	jp NextChar
.exit
	pop de
	jp DoneText
;;;;;;;;;


_ContText::
	; VWF has no scrolling (Stage 1): ScrollTextUpOneLine moves the wTileMap box up
	; without updating the VWF pen, which sprays pool tiles onto the map (rows 4/5)
	; over a multi-`cont` speech. Route to the page-clear path instead (like Paragraph).
	; Gate on wVWFBoxOpen (a VWF box is rendered = pool tiles present), NOT wVWFActive:
	; wVWFActive is cleared the instant the print returns, but the box still holds pool
	; tiles until CloseTextDisplay, so a later scroll would still drag them up the map.
	ld a, [wVWFBoxOpen]
	and a
	jp nz, VWFTextPauseClear
	ld a, '▼'
	ldcoord_a 18, 16
	call ProtectedDelay3
	push de
	call ManualTextScroll
	pop de
	ld a, ' '
	ldcoord_a 18, 16
_ContTextNoPause::
	push de
	call ScrollTextUpOneLine
	call ScrollTextUpOneLine
	hlcoord 1, 16
	pop de
	jp NextChar

; move both rows of text in the normal text box up one row
; always called twice in a row
; first time, copy the two rows of text to the "in between" rows that are usually empty
; second time, copy the bottom row of text into the top row of text
ScrollTextUpOneLine::
	; VWF has no scrolling (Stage 1). The scroll copies the box rows UP in wTileMap,
	; which drags the box's bank-1 pool tiles up the visible map (uncleared) -> the
	; "letters at rows 4/5" garbage. Tear down + restart the VWF box instead (page
	; behaviour), and skip the wTileMap copy entirely. Gate on wVWFBoxOpen (box is
	; rendered), NOT wVWFActive: the latter is cleared the moment the print returns
	; while the box's pool tiles linger, so a post-print scroll would still drag them.
	ld a, [wVWFBoxOpen]
	and a
	jr z, .doScroll
	push hl
	push de
	push bc
	vwf_farcall VWFEndBox
	vwf_farcall VWFInitPool
	pop bc
	pop de
	pop hl
	ret
.doScroll
	hlcoord 0, 14 ; top row of text
	decoord 0, 13 ; empty line above text
	ld b, SCREEN_WIDTH * 3
.copyText
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .copyText
	hlcoord 1, 16
	ld a, ' '
	ld b, SCREEN_WIDTH - 2
.clearText
	ld [hli], a
	dec b
	jr nz, .clearText

	ld b, 5
.WaitFrame
	rst _DelayFrame
	dec b
	jr nz, .WaitFrame

	ret

ProtectedDelay3::
	push bc
	call Delay3
	pop bc
	ret

TextCommandProcessor::
	ld a, [wLetterPrintingDelayFlags]
	push af
	set BIT_TEXT_DELAY, a
	ld e, a
	ldh a, [hClearLetterPrintingDelayFlags]
	xor e
	ld [wLetterPrintingDelayFlags], a
	ld a, c
	ld [wTextDest], a
	ld a, b
	ld [wTextDest + 1], a

NextTextCommand::
	ld a, [hli]
	cp TX_END
	jr nz, .TextCommand
.NoNextTextCommand:
	pop af
	ld [wLetterPrintingDelayFlags], a
	ret

.TextCommand:
	push hl
	cp TX_FAR
	jp z, TextCommand_FAR
	cp TX_SOUND_POKEDEX_RATING
	jp nc, TextCommand_SOUND
	ld hl, TextCommandJumpTable
	push bc
	add a
	ld b, 0
	ld c, a
	add hl, bc
	pop bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

TextCommand_BOX::
; draw a box (height, width)
	pop hl
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	push hl
	ld h, d
	ld l, e
	call TextBoxBorder
	pop hl
	jr NextTextCommand

TextCommand_START_storeFlags:
	ld a, [wLetterPrintingDelayFlags]
	push af
	jr TextCommand_START_noPop

TextCommand_START::
; write text until "@"
	pop hl
TextCommand_START_noPop::
	ld d, h
	ld e, l
	ld h, b
	ld l, c
	call PlaceString
	ld h, d
	ld l, e
	inc hl
	jr NextTextCommand

TextCommand_RAM::
; write text from a ram address (little endian)
	pop hl
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
	ld h, b
	ld l, c
	call PlaceString
	pop hl
	jr NextTextCommand

TextCommand_RAM_CHECK_CONT::
	pop hl
	push hl
	push de
	decoord 17, 16
	call DoesTextPtrHLFitOnBCCoordLine
	jr nc, .yes
	ld a, '▼'
	ldcoord_a 18, 16
	call Delay3
	call ManualTextScroll
	ld a, ' '
	ldcoord_a 18, 16
	call ScrollTextUpOneLine
	call ScrollTextUpOneLine
	bccoord 1, 16
.yes
	pop de
	jr TextCommand_RAM

TextCommand_RAM_CHECK_LINE::
	pop hl
	push hl
	push de
	decoord 19, 14
	call DoesTextPtrHLFitOnBCCoordLine
	pop de
	jr nc, .fits
	bccoord 1, 16
.fits
	jr TextCommand_RAM

TextCommand_BCD::
; write bcd from address, typically ram
	pop hl
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	push hl
	ld h, b
	ld l, c
	ld c, a
	call PrintBCDNumber
	ld b, h
	ld c, l
	pop hl
	jp NextTextCommand

; PureRGBnote: ADDED: jump to a different address in the same text bank so we can reuse text
TextCommand_JUMP::
	pop hl
	hl_deref
	push hl
	jr TextCommand_START

; PureRGBnote: ADDED: call different text in the same bank then come back
TextCommand_CALL::
	pop hl
	push hl
	hl_deref
	ResetFlag FLAG_INTERRUPTED_TEXT
	call TextCommand_START_storeFlags
	ld b, h
	ld c, l
	pop hl
	CheckFlag FLAG_INTERRUPTED_TEXT
	jp nz, NextTextCommand.NoNextTextCommand
	; inc hl twice to increment past the text_call address
	inc hl
	inc hl
	jp TextCommand_START_noPop ; assumes after returning from call we will do additional text

TextCommand_MOVE::
; move to a new tile
	pop hl
	ld a, [hli]
	ld [wTextDest], a
	ld c, a
	ld a, [hli]
	ld [wTextDest + 1], a
	ld b, a
	jp NextTextCommand

TextCommand_LOW::
; write text at (1,16)
	pop hl
	bccoord 1, 16 ; second line of dialogue text box
	jp NextTextCommand

TextCommand_PROMPT_BUTTON::
; wait for button press; show arrow
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	jp z, TextCommand_WAIT_BUTTON
	ld a, '▼'
	ldcoord_a 18, 16 ; place down arrow in lower right corner of dialogue text box
	push bc
	call ManualTextScroll ; blink arrow and wait for A or B to be pressed
	pop bc
	ld a, ' '
	ldcoord_a 18, 16 ; overwrite down arrow with blank space
	pop hl
	jp NextTextCommand

TextCommand_SCROLL::
; pushes text up two lines and sets the BC cursor to the border tile
; below the first character column of the text box.
	ld a, ' '
	ldcoord_a 18, 16 ; place blank space in lower right corner of dialogue text box
	call ScrollTextUpOneLine
	call ScrollTextUpOneLine
	pop hl
	bccoord 1, 16 ; second line of dialogue text box
	jp NextTextCommand

TextCommand_START_ASM::
; run assembly code
	pop hl
	ld de, NextTextCommand
	push de
	jp hl

TextCommand_NUM::
; print a number
	pop hl
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	push hl
	ld h, b
	ld l, c
	ld b, a
	and $0f
	ld c, a
	ld a, b
	and $f0
	swap a
	set BIT_LEFT_ALIGN, a
	ld b, a
	call PrintNumber
	ld b, h
	ld c, l
	pop hl
	jp NextTextCommand

TextCommand_PAUSE::
; wait for button press or 30 frames
	push bc
	call Joypad
	ldh a, [hJoyHeld]
	and PAD_A | PAD_B
	jr nz, .done
	ld c, 30 ; half a second
	rst _DelayFrames
.done
	pop bc
	pop hl
	jp NextTextCommand

TextCommand_SOUND::
; play a sound effect from TextCommandSounds
	pop hl
	push bc
	dec hl
	ld a, [hli]
	ld b, a ; b = text command number that got us here
	push hl
	ld hl, TextCommandSounds
.loop
	ld a, [hli]
	cp b
	jr z, .play
	inc hl
	jr .loop

.play
;;;;;;;;;; shinpokerednote: FIXED: when there's 0 delay on text, we need to wait here to get text command sounds to work right.
	ld a, [wOptions]
	and TEXT_DELAY_MASK
	call z, WaitForSoundToFinish
	ld a, [wAudioFadeOutControl]
	push af
	xor a
	ld [wAudioFadeOutControl], a ; don't allow fading out audio to skip the sound being played below
	ld a, [hl]
	rst _PlaySound
	call WaitForSoundToFinish
	pop af
	ld [wAudioFadeOutControl], a
;;;;;;;;;;
	pop hl
	pop bc
	jp NextTextCommand

TextCommandSounds::
	db TX_SOUND_GET_ITEM_1,           SFX_GET_ITEM_1 ; actually plays SFX_LEVEL_UP when the battle music engine is loaded
	db TX_SOUND_CAUGHT_MON,           SFX_CAUGHT_MON
	db TX_SOUND_POKEDEX_RATING,       SFX_POKEDEX_RATING ; unused
	db TX_SOUND_GET_ITEM_2,           SFX_GET_ITEM_2
	db TX_SOUND_GET_KEY_ITEM,         SFX_GET_KEY_ITEM
	db TX_SOUND_DEX_PAGE_ADDED,       SFX_DEX_PAGE_ADDED

TextCommand_DOTS::
; wait for button press or 30 frames while printing "…"s
	pop hl
	ld a, [hli]
	ld d, a
	push hl
	ld h, b
	ld l, c

.loop
	ld a, '…'
	ld [hli], a
	push de
	call Joypad
	pop de
	ldh a, [hJoyHeld] ; joypad state
	and PAD_A | PAD_B
	jr nz, .next ; if so, skip the delay
	ld c, 10
	rst _DelayFrames
.next
	dec d
	jr nz, .loop

	ld b, h
	ld c, l
	pop hl
	jp NextTextCommand

TextCommand_WAIT_BUTTON::
; wait for button press; don't show arrow
	push bc
	call ManualTextScroll
	pop bc
	pop hl
	jp NextTextCommand

TextCommand_FAR::
; write text from a different bank (little endian)
	pop hl
	ldh a, [hLoadedROMBank]
	push af

	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	call SetCurBank

	push hl
	ld l, e
	ld h, d
	call TextCommandProcessor
	pop hl

	pop af
	call SetCurBank
	jp NextTextCommand

TextCommand_PLURALIZE::
	pop hl
	push hl
	hl_deref
	ld a, [hl]
	dec a
	jr z, .skip
	ld a, 's'
	ld [bc], a
	inc bc
.skip
	pop hl
	inc hl
	inc hl
	jp NextTextCommand

TextCommand_STRINGBUFFER::
	ld de, wStringBuffer
	jr PlaceStringFromDENextTextCommand

TextCommand_NAMEBUFFER::
	ld de, wNameBuffer
	; fall through
PlaceStringFromDENextTextCommand:
; write text from de then next text comment
	ld h, b
	ld l, c
	call PlaceString
	pop hl
	jp NextTextCommand


; Checks if variable wram text pointer in hl fits on the same line as the current text printing coordinate bc
; with line endpoint coords de
; sets carry if it does not fit
DoesTextPtrHLFitOnBCCoordLine:
	push bc
	hl_deref
	ld b, -1
.loopCount
	inc b
	ld a, [hli]
	cp '@'
	jr nz, .loopCount
	ld h, 0
	ld l, b
	pop bc
	push bc
	add hl, bc
	ld a, l
	cp e
	jr nc, .nope
	pop bc
	and a
	ret
.nope
	pop bc
	scf
	ret

TextCommandJumpTable::
; entries correspond to TX_* constants (see macros/scripts/text.asm)
	dw TextCommand_START         ; TX_START
	dw TextCommand_RAM           ; TX_RAM
	dw TextCommand_BCD           ; TX_BCD
	dw TextCommand_MOVE          ; TX_MOVE
	dw TextCommand_BOX           ; TX_BOX
	dw TextCommand_LOW           ; TX_LOW
	dw TextCommand_PROMPT_BUTTON ; TX_PROMPT_BUTTON
IF DEF(_DEBUG)
	dw _ContTextNoPause          ; TX_SCROLL
ELSE
	dw TextCommand_SCROLL        ; TX_SCROLL
ENDC
	dw TextCommand_START_ASM     ; TX_START_ASM
	dw TextCommand_NUM           ; TX_NUM
	dw TextCommand_PAUSE         ; TX_PAUSE
	dw TextCommand_SOUND         ; TX_SOUND_GET_ITEM_1 (also handles other TX_SOUND_* commands)
	dw TextCommand_DOTS          ; TX_DOTS
	dw TextCommand_WAIT_BUTTON   ; TX_WAIT_BUTTON
	dw TextCommand_JUMP          ; TX_JUMP
	dw TextCommand_CALL          ; TX_CALL
	dw TextCommand_RAM_CHECK_CONT   ; TX_RAM_CONT
	dw TextCommand_RAM_CHECK_LINE   ; TX_RAM_LINE
	dw TextCommand_PLURALIZE     ; TX_PLURALIZE
	dw TextCommand_STRINGBUFFER  ; TX_RAM_STRINGBUFFER
	dw TextCommand_NAMEBUFFER    ; TX_RAM_NAMEBUFFER
	; greater TX_* constants are handled directly by NextTextCommand
