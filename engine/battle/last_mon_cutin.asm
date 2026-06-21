; Sunsette: last-mon trainer cut-ins. When a tough trainer (the gym leaders, the 3 Giovanni
; fights, the rival per-location, Oak, and the Elite Four) is about to send out their LAST
; Pokemon, their battle pic scrolls back onto the screen as if they step in to speak, a
; character line is shown, then the pic slides off and the mon is sent out as normal.
;
; Hooked via `callfar HandleLastMonCutIn` from EnemySendOut (core.asm), right before the
; generic "<Trainer> sent out <MON>!" text. Self-contained floating section: the logic,
; dispatch tables, and the line text all live together so rst _PrintText reads each line from
; this bank directly (no text_far indirection). Callers reach it via farcall, so the bank is
; irrelevant.

HandleLastMonCutIn::
	ld a, [wIsInBattle]
	cp 2
	ret nz ; trainer battles only
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	ret z ; never in link battles
	call CountLivingEnemyMons
	cp 1
	ret nz ; only fire when the mon being sent is the trainer's LAST one
	call GetLastMonCutInText
	ret nc ; no line for this trainer -> ordinary silent send-out
	; show the cut-in
	push hl ; the line's text pointer
	ld a, [wEnemyMonSpecies2]
	push af ; ScrollTrainerPicAfterBattle zeroes wEnemyMonSpecies2 (so slot 3 colors the pic)
	farcall _ScrollTrainerPicAfterBattle ; trainer pic scrolls in from the right
	pop af
	ld [wEnemyMonSpecies2], a ; restore the incoming mon's species for the send-out below
	pop hl
	rst _PrintText ; the line; each ends with `prompt` so it waits for the button
	farcall SlideEnemyTrainerPicOffScreen ; pic slides off to the right
	; restore a clean send-out scene (enemy HUD area) + battle palette for the incoming mon
	call ClearSprites
	hlcoord 0, 0
	lb bc, 4, 11
	call ClearScreenArea
	ld d, SET_PAL_BATTLE
	call RunPaletteCommand
	jp GBPalNormal

; returns a = number of enemy party mons with HP > 0. At send-out the just-fainted mon is 0 and
; the incoming mon is > 0, so a result of 1 means the incoming mon is the trainer's last.
CountLivingEnemyMons:
	ld a, [wEnemyPartyCount]
	ld b, a
	ld c, 0
	ld hl, wEnemyMon1HP
	ld de, PARTYMON_STRUCT_LENGTH
.loop
	ld a, [hli]
	or [hl]
	dec hl
	jr z, .skip
	inc c
.skip
	add hl, de
	dec b
	jr nz, .loop
	ld a, c
	ret

; out: hl = text pointer, carry set if this trainer has a cut-in line (carry clear = none).
GetLastMonCutInText:
	ld a, [wTrainerClass]
	ld b, a
	cp RIVAL1
	jr z, .rivalByMap
	cp RIVAL2
	jr z, .rivalByMap
	cp RIVAL3
	jr z, .rival3
	cp GIOVANNI
	jr z, .giovanni
	; gym leaders / Oak / Elite Four: look up by class
	ld hl, CutInClassTable
.classLoop
	ld a, [hli]
	cp -1
	jr z, .none
	cp b
	jr z, .found
	inc hl
	inc hl
	jr .classLoop
.found
	ld a, [hli]
	ld h, [hl]
	ld l, a
	scf
	ret
.none
	and a ; carry clear
	ret
.rival3
	; Indigo champion + the Champ Arena rematch both use the one champion line
	ld hl, RivalIndigoText
	scf
	ret
.giovanni
	; the 3 Giovanni fights share the class; wTrainerNo tells them apart
	ld a, [wTrainerNo]
	cp 1
	jr z, .gioCeladon
	cp 2
	jr z, .gioSaffron
	ld hl, GiovanniViridianText ; 3 (and any default)
	scf
	ret
.gioCeladon
	ld hl, GiovanniCeladonText
	scf
	ret
.gioSaffron
	ld hl, GiovanniSaffronText
	scf
	ret
.rivalByMap
	; the rival's per-location line is keyed on the current map (Oak's Lab = no line)
	ld a, [wCurMap]
	ld e, a
	ld hl, RivalMapTable
.mapLoop
	ld a, [hli]
	cp -1
	jr z, .none
	cp e
	jr z, .found
	inc hl
	inc hl
	jr .mapLoop

CutInClassTable:
	dbw BROCK,    BrockCutInText
	dbw MISTY,    MistyCutInText
	dbw LT_SURGE, SurgeCutInText
	dbw ERIKA,    ErikaCutInText
	dbw KOGA,     KogaCutInText
	dbw SABRINA,  SabrinaCutInText
	dbw BLAINE,   BlaineCutInText
	dbw PROF_OAK, OakCutInText
	dbw LORELEI,  LoreleiCutInText
	dbw BRUNO,    BrunoCutInText
	dbw AGATHA,   AgathaCutInText
	dbw LANCE,    LanceCutInText
	db -1

RivalMapTable:
	dbw ROUTE_22,         RivalRoute22Text
	dbw CERULEAN_CITY,    RivalCeruleanText
	dbw SS_ANNE_2F,       RivalSSAnneText
	dbw POKEMON_TOWER_2F, RivalLavenderText
	dbw SILPH_CO_7F,      RivalSilphText
	db -1

; --- gym leaders ---
BrockCutInText:
	text "Not bad. But I've"
	line "saved my best for"
	cont "last!"
	prompt

MistyCutInText:
	text "Here comes the"
	line "tidal wave!"
	prompt

SurgeCutInText:
	text "Time to go home"
	line "and be a family"
	cont "mon."
	prompt

ErikaCutInText:
	text "The reed yields..."
	line "but endures!"
	prompt

KogaCutInText:
	text "And now, the"
	line "final stroke!"
	prompt

SabrinaCutInText:
	text "... ... ..."
	prompt

BlaineCutInText:
	text "Bahahaha!"
	line "You're on fire!"
	prompt

; --- Giovanni (by wTrainerNo) ---
GiovanniViridianText:
	text "Your spirit must"
	line "be crushed."
	prompt

GiovanniCeladonText:
	text "Interesting. I've"
	line "grown rusty, it"
	cont "seems."
	prompt

GiovanniSaffronText:
	text "Behold! the might"
	line "of TEAM ROCKET!"
	prompt

; --- rival (by map) ---
RivalRoute22Text:
	text "Should have known."
	line "Still got my real"
	cont "ace, though!"
	prompt

RivalCeruleanText:
	text "I'll show you the"
	line "power of TWO"
	cont "badges!"
	prompt

RivalSSAnneText:
	text "Get ready to wave"
	line "goodbye!"
	prompt

RivalLavenderText:
	text "We're in a"
	line "cemetery, and"
	cont "you're about to"
	cont "be ASH!"
	prompt

RivalSilphText:
	text "Watch and learn,"
	line "<PLAYER>!"
	cont "Watch and learn!"
	prompt

RivalIndigoText:
	text "This one counts,"
	line "<PLAYER>."
	para "Everything on the"
	line "line, and it's"
	cont "all mine!"
	prompt

; --- Oak / Elite Four ---
OakCutInText:
	text "Marvelous! I feel"
	line "younger already!"
	prompt

LoreleiCutInText:
	text "I can see the"
	line "sweat turning to"
	cont "ice on your brow,"
	cont "boy!"
	prompt

BrunoCutInText:
	text "Strength is a"
	line "many-tiered thing."
	prompt

AgathaCutInText:
	text "(The old woman"
	line "simply looks"
	cont "at you.)"
	prompt

LanceCutInText:
	text "Behold, the true"
	line "fury of the"
	cont "Blackthorne Clan!"
	prompt
