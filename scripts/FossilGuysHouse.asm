; PureRGBnote: ADDED: new house in saffron city. The super nerd from Mt Moon returns and will teleport to cinnabar with his teleporter
; in order to revive fossils for you early. There is also a bunch of amusing text to read in his house.
; PureRGBnote: ADDED: this map is also used for the MOVE MYSTIC's house and scripts.
FossilGuysHouse_Script:
	call WasMapJustLoaded
	jr z, .skip
	; on map load
	ResetEvent EVENT_TALKED_TO_MOVE_MYSTIC_ONCE
.skip
	jp EnableAutoTextBoxDrawing


FossilGuysHouse_TextPointers:
	def_text_pointers
	dw_const FossilGuysHouseFossilGuyText,   TEXT_FOSSILGUYSHOUSE_FOSSIL_GUY
	dw_const FossilGuysHouseCatText,         TEXT_FOSSILGUYSHOUSE_MEOWTH
	dw_const FossilGuysHousePaperText,       TEXT_FOSSILGUYSHOUSE_PAPER
	dw_const FossilGuysHouseRockText,        TEXT_FOSSILGUYSHOUSE_ROCK
	dw_const DoRet,                          TEXT_MOVE_MYSTIC
	dw_const MoveMysticCrystalBallText,      TEXT_MOVE_MYSTIC_CRYSTAL_BALL
	dw_const FossilGuysHouseTeleporterText,  TEXT_FOSSILGUYSHOUSE_TELEPORTER1
	dw_const FossilGuysHouseTeleporterText,  TEXT_FOSSILGUYSHOUSE_TELEPORTER2
	dw_const FossilGuysHousePosterText,      TEXT_FOSSILGUYSHOUSE_POSTER
	dw_const FossilGuysHouseDeskText,        TEXT_FOSSILGUYSHOUSE_DESK
	dw_const FossilGuysComputerText,         TEXT_FOSSILGUYSHOUSE_COMPUTER

FossilGuysHouseFossilGuyText:
	text_asm
	CheckEitherEventSet EVENT_GOT_DOME_FOSSIL, EVENT_GOT_HELIX_FOSSIL
	jp z, .neverMet
	CheckEvent EVENT_SUPER_NERD_GOING_TO_CINNABAR
	jp nz, .comeBackLater
	CheckEvent EVENT_RECEIVED_AERODACTYL_FROM_SUPER_NERD
	jp nz, .stageThreeStart
	CheckEvent EVENT_GAVE_OLD_AMBER_TO_SUPER_NERD
	jp nz, .doneRevivedAmber
	CheckEvent EVENT_RECEIVED_FOSSIL_PKMN_FROM_SUPER_NERD
	jp nz, .stageTwoStart
	CheckEvent EVENT_SKIP_FOSSIL_GUY_GREETING
	jr nz, .skip
	ld hl, FossilGuyGreeting
	rst _PrintText
.skip
	CheckEvent EVENT_GAVE_FOSSIL_TO_SUPER_NERD
	jr nz, .doneRevivedFossil
.stageOneStart
	CheckEvent EVENT_SEAFOAM_FOUND_OTHER_FOSSIL
	jp nz, .goToCinnabar
	CheckEvent EVENT_GOT_HELIX_FOSSIL
	jr nz, .checkHelix
	CheckEvent EVENT_GOT_DOME_FOSSIL
	jr nz, .checkDome
.noFossil
	ld hl, FossilGuyWhereFossilText
	rst _PrintText
	rst TextScriptEnd
.checkHelix
	ld b, HELIX_FOSSIL
	jr .checkItemFossil
.checkDome
	ld b, DOME_FOSSIL
.checkItemFossil
	predef GetIndexOfItemInBag
	ld a, b
	cp $FF ; not in bag
	jr z, .noFossil
	push bc
	ld hl, FossilGuyHaveFossil
	rst _PrintText
	call YesNoChoice
	pop bc
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .suitYourself
.removeItem
	ld a, b
	ld [wWhichPokemon], a ; load item index to be removed
	ld hl, wNumBagItems
	ld a, 1 ; one item
	ld [wItemQuantity], a
	call RemoveItemFromInventory
	SetEvents EVENT_GAVE_FOSSIL_TO_SUPER_NERD, EVENT_SUPER_NERD_GOING_TO_CINNABAR, EVENT_SKIP_FOSSIL_GUY_GREETING
	ld hl, FossilGuyGaveFossil
	rst _PrintText
	rst TextScriptEnd
.suitYourself
	ld hl, FossilGuyDenied
	rst _PrintText
	rst TextScriptEnd
.doneRevivedFossil
	ld hl, FossilGuyCameBackFossil
	rst _PrintText
	CheckEvent EVENT_GOT_DOME_FOSSIL
	ld a, KABUTO
	jr nz, .finishGiveFossil
	ld a, OMANYTE
.finishGiveFossil
	ld b, a
	ld c, 24
	call GivePokemon
	jr nc, .finishGiveFossilEnd
	SetEvent EVENT_RECEIVED_FOSSIL_PKMN_FROM_SUPER_NERD
	ResetEvent EVENT_SKIP_FOSSIL_GUY_GREETING
.finishGiveFossilEnd
	rst TextScriptEnd
.stageTwoStart
	ld b, OLD_AMBER
	predef GetIndexOfItemInBag
	ld a, b
	cp $FF ; not in bag
	jr z, .greetingEnd
	push bc
	ld hl, FossilGuyHaveAmber
	rst _PrintText
	call YesNoChoice
	pop bc
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .suitYourself
.removeAmber
	ld a, b
	ld [wWhichPokemon], a ; load item index to be removed
	ld hl, wNumBagItems
	ld a, 1 ; one item
	ld [wItemQuantity], a
	call RemoveItemFromInventory
	SetEvents EVENT_GAVE_OLD_AMBER_TO_SUPER_NERD, EVENT_SUPER_NERD_GOING_TO_CINNABAR
	ld hl, FossilGuyGaveAmber
	rst _PrintText
	rst TextScriptEnd
.doneRevivedAmber
	ld hl, FossilGuyCameBackAmber
	rst _PrintText
	lb bc, AERODACTYL, 24
	call GivePokemon
	jr nc, .doneRevivedAmberEnd
	SetEvent EVENT_RECEIVED_AERODACTYL_FROM_SUPER_NERD
.doneRevivedAmberEnd
	rst TextScriptEnd
.stageThreeStart
	CheckEvent EVENT_SEAFOAM_FOUND_OTHER_FOSSIL
	jr nz, .goToCinnabar
.endText
	ld hl, FossilGuyEndText
	rst _PrintText
	rst TextScriptEnd
.goToCinnabar
	CheckEvent EVENT_GOT_HELIX_FOSSIL
	jr nz, .checkDome2
.checkHelix2
	ld b, HELIX_FOSSIL
	jr .checkItemFossil2
.checkDome2
	ld b, DOME_FOSSIL
.checkItemFossil2
	predef GetIndexOfItemInBag
	ld a, b
	cp $FF ; not in bag
	jr z, .endText
	ld hl, FossilGuyGoToCinnabarText
	rst _PrintText
	rst TextScriptEnd
.greetingEnd
	ld hl, FossilGuyGreetingEnd
	rst _PrintText
	rst TextScriptEnd
.comeBackLater
	ld hl, FossilGuyComeBackLater
	rst _PrintText
	rst TextScriptEnd
.neverMet
	ld hl, FossilGuyNeverMet
	rst _PrintText
	rst TextScriptEnd

; Conversation text

FossilGuyGreeting:
	text_far _FossilGuyGreeting
	text_end

FossilGuyGreetingEnd:
	text_far _FossilGuyGreetingEnd
	text_end

FossilGuyComeBackLater:
	text_far _FossilGuyComeBackLater
	text_end

FossilGuyNeverMet:
	text_far _FossilGuyNeverMet
	text_end

FossilGuyWhereFossilText:
	text_far _FossilGuyWhereFossilText
	text_end

FossilGuyHaveFossil:
	text_far _FossilGuyHaveFossil
	text_end

FossilGuyDenied:
	text_far _FossilGuyDenied
	text_end

FossilGuyGaveFossil:
	text_far _FossilGuyGaveFossil
	text_end

FossilGuyCameBackFossil:
	text_far _FossilGuyCameBackFossil
	text_end

FossilGuyHaveAmber:
	text_far _FossilGuyHaveOldAmber
	text_end

FossilGuyGaveAmber:
	text_far _FossilGuyGiveOldAmber
	text_end

FossilGuyCameBackAmber:
	text_far _FossilGuyGiveAerodactyl
	text_end

FossilGuyEndText:
	text_far _FossilGuyEndingText
	text_end

FossilGuyGoToCinnabarText:
	text_far _FossilGuyGoToCinnabarText
	text_end

; cat text

FossilGuysHouseCatText:
	text_asm
	ld c, DEX_MEOWTH - 1
	callfar SetMonSeen
	CheckEvent EVENT_MET_FOSSIL_GUYS_CAT
	jr nz, .metCatAlready
	SetEvent EVENT_MET_FOSSIL_GUYS_CAT
	ld hl, FossilGuysHouseCatText1
	rst _PrintText
	call FossilGuyFacesPlayerDirection
	ld hl, FossilGuysHouseCatText2
	jr .done
.metCatAlready
	ld hl, FossilGuysHouseCatText3
	rst _PrintText
	call FossilGuyFacesPlayerDirection
	ld hl, FossilGuysHouseCatText4
.done
	rst _PrintText
	rst TextScriptEnd

; makes fossil guy face the player
FossilGuyFacesPlayerDirection:
	ld a, 1
	ldh [hSpriteIndex], a
	ld a, [wXCoord]
	cp 1
	jr z, .checkYcoord
	and a
	ld a, SPRITE_FACING_LEFT
	jr z, .doFacing
	ld a, SPRITE_FACING_RIGHT
	jr .doFacing
.checkYcoord
	ld a, [wYCoord]
	cp 4
	ret c ; don't need to change facing if facing up is the best option
	ld a, SPRITE_FACING_DOWN
.doFacing
  	ldh [hSpriteFacingDirection], a
  	jp SetSpriteFacingDirection	

FossilGuysHouseCatText1:
	text_far _CeladonMansion1FMeowthText
	text_asm
.MeowthCry
	ld a, MEOWTH
	call PlayCry
	call DisplayTextPromptButton
	rst TextScriptEnd

FossilGuysHouseCatText2:
	text_far _FossilGuysCat2
	text_end

FossilGuysHouseCatText3:
	text_far _FossilGuysCat1
	text_asm
	jr FossilGuysHouseCatText1.MeowthCry

FossilGuysHouseCatText4:
	text_far _FossilGuysCat3
	text_end

; sign/house object text

FossilGuysHousePaperText:
	text_asm
	CheckEitherEventSet EVENT_GOT_DOME_FOSSIL, EVENT_GOT_HELIX_FOSSIL
	jr z, .done
	ld hl, FossilGuysPaperText
	rst _PrintText
	CheckEvent EVENT_GOT_HELIX_FOSSIL
	ld hl, FossilGuysKabutoText
	jr nz, .print
	ld hl, FossilGuysOmanyteText
.print
	rst _PrintText
.done
	rst TextScriptEnd

FossilGuysPaperText:
	text_far _FossilGuysPaperText
	text_end

FossilGuysKabutoText:
	text_far _FossilGuysPaperTextKabuto
	text_end

FossilGuysOmanyteText:
	text_far _FossilGuysPaperTextOmanyte
	text_end

FossilGuysHouseRockText:
	text_far _FossilGuysRock
	text_end

FossilGuysHouseTeleporterText:
	text_far _FossilGuysTeleporterText
	text_end

FossilGuysHousePosterText:
	text_far _FossilGuysPosterText
	text_end

FossilGuysHouseDeskText:
	text_far _FossilGuysDesk
	text_end

FossilGuysPC::
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	ld a, TEXT_FOSSILGUYSHOUSE_COMPUTER
	ldh [hTextID], a
	jp DisplayTextID

FossilGuysComputerText::
	text_asm
	ld hl, .text1
	rst _PrintText
	ld a, 1
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_RIGHT
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
	ld hl, .text2
	rst _PrintText
	rst TextScriptEnd
.text1
	text_far _FossilGuysComputer1
	text_end
.text2
	text_far _FossilGuysComputer2
	text_end
	
MoveMysticCrystalBallText:
	text_asm
	call SaveScreenTilesToBuffer2
	CheckAndSetEvent EVENT_TALKED_TO_MOVE_MYSTIC_ONCE
	jr nz, .talkedOnce
	CheckAndSetEvent EVENT_MET_MOVE_MYSTIC
	ld hl, .MoveMysticAgain
	jr nz, .met
	ld hl, .MoveMysticIntro
.met
	rst _PrintText
.talkedOnce
	ld hl, .MoveMysticQuestion
	rst _PrintText
	ld a, [wListScrollOffset]
	push af ; save list scroll offset to preserve item list index
	xor a
	ld [wCurrentMenuItem], a
	ld [wListScrollOffset], a
.loop
	call FormulateMoveMysticMonList
	ld hl, wItemList
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	xor a
	ld [wPrintItemPrices], a
	ld [wMenuItemToSwap], a
	ld [wListMenuCustomType], a
	ld [wListMenuHoverTextType], a
	ld a, CUSTOMLISTMENU
	ld [wListMenuID], a
	call DisplayListMenuID
	jp c, .comeAgain
	ld hl, wItemList + 1
	ld d, 0
	ld a, [wChosenMenuItem]
	ld e, a
	ld a, [wListScrollOffset]
	add e
	ld e, a
	add hl, de
	ld a, [hl] ; chosen mon
	push af
	ld [wNamedObjectIndex], a
	call GetMonName
	call CopyToStringBuffer
	pop af
	ld b, a
	push bc
	ld hl, MoveMysticMonsList
	ld de, 2
	call IsInArray
	ld a, b
	pop bc
	jp nc, .comeAgain
	push bc
	ld hl, MoveMysticMonTextEntries
	ld bc, 5
	call AddNTimes
	; hl = text entry address
	push hl
	call LoadScreenTilesFromBuffer2
	ld hl, .lookdeep
	rst _PrintText
	call WaitForSoundToFinish
	; start the "crystal ball" animation
	call PauseMusic
	call DisableSpriteUpdates
	ld a, [wAudioROMBank]
	push af
	ld a, BANK(SFX_Psybeam)
	ld [wAudioROMBank], a
	ld a, SFX_PSYBEAM
	call PlaySoundResetSFXModifiers
	ld a, 4
	call .sparkleCrystalBall
	ld a, 5
	call .sparkleCrystalBall
	ld a, SFX_POUND
	rst _PlaySound ; by playing this short sound we can end the psybeam sound effect early
	call WaitForSoundToFinish
	pop af
	ld [wAudioROMBank], a
	call ResumeMusic
	; a = 0 after ResumeMusic
	ld [wMapPalOffset], a
	inc a
	ld [wUpdateSpritesEnabled], a
	call LoadGBPal
	; done crystal ball animation
	ld hl, .ahyes
	rst _PrintText
	pop hl ; pokemon-specific text
	call TextCommandProcessor
	pop de
	; d = which pokemon we chose
	ld a, d
	cp BEEDRILL
	ld hl, .beedrillInfoText
	jp z, .printDone
	cp ARBOK ; Sunsette: ACID priority signature (Ekans line) - strikes first; lives in priority_moves.asm, not a remap
	ld hl, .arbokInfoText
	jp z, .printDone
	cp EKANS ; Sunsette: shares ARBOK's ACID priority signature -> same info text
	ld hl, .arbokInfoText
	jp z, .printDone
	cp PIDGEOT
	ld hl, .pidgeotInfoText
	jp z, .printDone
	; Sunsette: BLASTOISE / DRAGONITE / MOLTRES / ZAPDOS / ARTICUNO are no longer MOVE MYSTIC
	; signature mons (the birds' effects moved onto their own dedicated moves).
	; Sunsette: KRABBY / KINGLER removed - CRABHAMMER is a flat 100-BP move now, no longer their signature.
	cp SNORLAX ; Sunsette: REST bonus is an effect add (not a power remap), so custom text
	ld hl, .snorlaxInfoText
	jp z, .printDone
	cp SEAKING ; Sunsette: RIPTIDE always raises SPEED - the GYARADOS / SEAKING / GOLDEEN signature
	ld hl, .riptideInfoText
	jp z, .printDone
	cp GOLDEEN
	ld hl, .riptideInfoText
	jp z, .printDone
	cp GYARADOS
	ld hl, .riptideInfoText
	jp z, .printDone
	cp WEEZING ; Sunsette: SLUDGE BOMB burns instead of poisoning - custom text
	ld hl, .weezingInfoText
	jp z, .printDone
	cp PIKACHU ; Sunsette: SURF WATERIFIES (effect signature, not a power remap) - custom text
	ld hl, .surfSigInfoText
	jp z, .printDone
	cp RAICHU
	ld hl, .surfSigInfoText
	jp z, .printDone
	cp CLEFAIRY ; Sunsette: METRONOME also raises a random stat (signature)
	ld hl, .clefairyInfoText
	jp z, .printDone
	cp CLEFABLE
	ld hl, .clefairyInfoText
	jp z, .printDone
	push de
	cp JIGGLYPUFF
	jr z, .forceSING
	cp WIGGLYTUFF
	jr z, .forceSING
	jr .remapCheck
.forceSING
	ld d, SING
	jr .gotMove
.remapCheck
	callfar GetRemappedMoveAndPowerFromPokemon
	pop bc
	jr nc, .done
	push bc
.gotMove
	; d = move ID, e = remapped power
	ld a, e
	ld [w2CharStringBuffer], a
	ld a, d
	ld [wNamedObjectIndex], a
	call GetMoveName
	call Random
	and %11
	ld hl, .masterOfMove
	jr z, .printMoveSpecialty
	dec a
	ld hl, .talentOfMove
	jr z, .printMoveSpecialty
	dec a
	ld hl, .soulCallsForMove
	jr z, .printMoveSpecialty
	ld hl, .lovesToUseMove
.printMoveSpecialty
	rst _PrintText
	pop bc
	ld a, b
	cp JIGGLYPUFF
	ld hl, .jigglywigglytext
	jr z, .printDone
	cp WIGGLYTUFF
	jr z, .printDone
	cp HYPNO
	ld hl, .hypnoText
	jr z, .printDone
	ld hl, .genericMovePowerIncreasesText
.printDone
	rst _PrintText
.done
	xor a
	ld [wListMenuHoverTextType], a
	ld [wCurrentMenuItem], a
	pop af
	ld [wListScrollOffset], a ; restore list scroll offset to preserve item list index
	rst TextScriptEnd
.comeAgain
	ld hl, .comeAgainText
	rst _PrintText
	jr .done
.sparkleCrystalBall
	ld [wMapPalOffset], a
	call LoadGBPal
	ld a, 8
.loop2
	push af
	ld hl, wShadowOAMSprite08TileID
	call HorizontalFlipOverworldSprite
	ld c, 4
	rst _DelayFrames
	pop af
	dec a
	jr nz, .loop2
	ret
.MoveMysticIntro
	text_far _MoveMysticIntro
	text_end
.MoveMysticAgain
	text_far _MoveMysticAgain
	text_end
.MoveMysticQuestion
	text_far _MoveMysticQuestion
	text_end
.ahyes
	text_far _MoveMysticAhYes
	text_end
.comeAgainText
	text_far _Museum1FScientist1ComeAgainText
	text_end
.lookdeep
	text_far _MoveMysticLookDeep
	text_end
.beedrillInfoText
	text_far _MoveMysticBeedrillText
	text_end
.arbokInfoText
	text_far _MoveMysticArbokText
	text_end
.pidgeotInfoText
	text_far _MoveMysticPidgeotText
	text_end
	; Sunsette: .krabbyInfoText / .kinglerInfoText removed - CRABHAMMER is no longer a signature.
.snorlaxInfoText
	text_far _MoveMysticSnorlaxText
	text_end
.riptideInfoText
	text_far _MoveMysticRiptideText
	text_end
.weezingInfoText
	text_far _MoveMysticWeezingBurnText
	text_end
.surfSigInfoText
	text_far _MoveMysticSurfSigText
	text_end
.clefairyInfoText
	text_far _MoveMysticClefairyText
	text_end
.masterOfMove
	text_far _MoveMysticMasterOfMoveText
	text_end
.talentOfMove
	text_far _MoveMysticTalentOfMoveText
	text_end
.soulCallsForMove
	text_far _MoveMysticSoulCallsForMoveText
	text_end
.lovesToUseMove
	text_far _MoveMysticLovesMoveText
	text_end
.genericMovePowerIncreasesText
	text_far _GenericMovePowerIncreasesText
	text_end
.jigglywigglytext
	text_far _MoveMysticAccuracy85
	text_far _MoveMysticJigglyWigglyOnlyLevel20Text
	text_end
.hypnoText
	text_far _MoveMysticAccuracy85
	text_end

; hl = start of sprite in wShadowOAM at tile ID attribute
HorizontalFlipOverworldSprite:
	call .exchangeAndFlipTwoOAMEntries
	call .nextSprite
	; fall through
.exchangeAndFlipTwoOAMEntries
	call .nextSprite
	ld a, [hl]
	call .previousSprite
	ld b, [hl]
	ld [hli], a
	ld a, [hl]
	xor %00100000 ; toggle horizontal flip
	ld [hl], a
	call .nextSprite
	ld a, [hl]
	xor %00100000 ; toggle horizontal flip
	ld [hl], a
	dec hl
	ld [hl], b
	ret
.nextSprite
	ld de, 4
	add hl, de
	ret
.previousSprite
	dec hl
	dec hl
	dec hl
	dec hl
	ret



FormulateMoveMysticMonList:
	ld hl, MoveMysticMonsList
	ld de, wItemList + 1
	ld b, 0
.loop
	ld a, [hli]
	cp -1
	jr z, .done
	ld a, [hld]
	cp $FF
	ld c, a
	ld a, [hl]
	jr z, .seen
	push hl
	push bc
	dec c
	ld hl, wPokedexSeen
	ld b, FLAG_TEST
	call FlagAction
	pop bc
	pop hl
	ld a, [hl]
	jr z, .skipSeen
.seen
	ld [de], a
	inc de
	inc b
.skipSeen
	inc hl
	inc hl
	jr .loop
.done
	ld a, -1
	ld [de], a ; end of list
	ld hl, wItemList
	ld [hl], b ; length of list
	ret

; mon ID, mon dex ID (needed for checking if it's seen)
; if it's guaranteed to be seen at meeting this NPC $FF is used instead for dex ID
MoveMysticMonsList:
	db BEEDRILL, $FF
	db ARBOK, DEX_ARBOK
	db EKANS, DEX_EKANS ; Sunsette: shares ARBOK's ACID priority signature (parallel text entry added too)
	db JIGGLYPUFF, $FF
	db WIGGLYTUFF, DEX_WIGGLYTUFF
	db GOLDUCK, DEX_GOLDUCK
	db GOLEM, DEX_GOLEM
	db HYPNO, DEX_HYPNO
	; Sunsette: LICKITUNG removed - LICK is no longer a signature (VENOM LASH covers it).
	; (Its parallel text entry in MoveMysticMonTextEntries was removed too, to keep the tables index-parallel.)
	db SEAKING, DEX_SEAKING ; Sunsette: RIPTIDE always +1 SPEED (GYARADOS/SEAKING/GOLDEEN signature)
	db GOLDEEN, DEX_GOLDEEN ; Sunsette: ditto (parallel text entry added below)
	db GYARADOS, DEX_GYARADOS ; Sunsette: ditto (parallel text entry added below)
	db JYNX, DEX_JYNX
	db ELECTABUZZ, DEX_ELECTABUZZ
	db MAGMAR, DEX_MAGMAR
	db OMASTAR, DEX_OMASTAR
	; Sunsette: DRAGONITE / BLASTOISE / MOLTRES / ZAPDOS / ARTICUNO removed - no longer signature mons.
	db PIDGEOT, DEX_PIDGEOT
	; Sunsette: TANGELA removed - VENOM LASH no longer a signature (parallel text entry removed too).
	; Sunsette: KRABBY / KINGLER removed - CRABHAMMER is a flat 100-BP move now, no longer their signature
	; (parallel text entries removed below to keep the tables index-parallel).
	db SNORLAX, DEX_SNORLAX ; Sunsette: REST -> FLOURISH (GROWING) + SPEED +1
	db KANGASKHAN, DEX_KANGASKHAN ; Sunsette: DIZZY PUNCH -> 90 BP (signature); generic power-increase path
	db WEEZING, DEX_WEEZING ; Sunsette: SLUDGE BOMB now BURNS (special-cased info text)
	db PIKACHU, DEX_PIKACHU ; Sunsette: SURF WATERIFIES once the player has surfed at the Summer Beach House
	db RAICHU, DEX_RAICHU   ; Sunsette: ditto (parallel text entry below)
	db CLEFAIRY, DEX_CLEFAIRY ; Sunsette: METRONOME also raises one random stat (parallel text entry below)
	db CLEFABLE, DEX_CLEFABLE ; Sunsette: ditto
	db -1

MoveMysticMonTextEntries:
BeedrillMoveMysticText:
	text_far _BeedrillMoveMysticText
	text_end
ArbokMoveMysticText::
	text_far _ArbokMoveMysticText
	text_end
EkansMoveMysticText:: ; Sunsette: index-parallel with EKANS in MoveMysticMonsList
	text_far _EkansMoveMysticText
	text_end
JigglypuffMoveMysticText::
	text_far _JigglypuffMoveMysticText
	text_end
WigglytuffMoveMysticText::
	text_far _WigglytuffMoveMysticText
	text_end
GolduckMoveMysticText::
	text_far _GolduckMoveMysticText
	text_end
GolemMoveMysticText::
	text_far _GolemMoveMysticText
	text_end
HypnoMoveMysticText::
	text_far _HypnoMoveMysticText
	text_end
; Sunsette: LickitungMoveMysticText removed (LICK no longer a signature) - stays index-parallel with MoveMysticMonsList.
SeakingMoveMysticText::
	text_far _SeakingMoveMysticText
	text_end
GoldeenMoveMysticText:: ; Sunsette: index-parallel with GOLDEEN in MoveMysticMonsList
	text_far _GoldeenMoveMysticText
	text_end
GyaradosMoveMysticText:: ; Sunsette: index-parallel with GYARADOS in MoveMysticMonsList
	text_far _GyaradosMoveMysticText
	text_end
JynxMoveMysticText::
	text_far _JynxMoveMysticText
	text_end
ElectabuzzMoveMysticText::
	text_far _ElectabuzzMoveMysticText
	text_end
MagmarMoveMysticText::
	text_far _MagmarMoveMysticText
	text_end
OmastarMoveMysticText::
	text_far _OmastarMoveMysticText
	text_end
	; Sunsette: DRAGONITE entry removed here to stay index-parallel with MoveMysticMonsList.
PidgeotMoveMysticText::
	text_far _PidgeotMoveMysticText
	text_end
	; Sunsette: BLASTOISE / MOLTRES / ZAPDOS / ARTICUNO entries removed here (index-parallel removal).
	; Sunsette: TangelaMoveMysticText removed (VENOM LASH no longer a signature) - stays index-parallel.
	; Sunsette: KrabbyMoveMysticText / KinglerMoveMysticText removed (CRABHAMMER no longer a signature) - stays index-parallel.
SnorlaxMoveMysticText::
	text_far _SnorlaxMoveMysticText
	text_end
KangaskhanMoveMysticText:: ; Sunsette: index-parallel with KANGASKHAN in MoveMysticMonsList
	text_far _KangaskhanMoveMysticText
	text_end
WeezingMoveMysticText:: ; Sunsette: index-parallel with WEEZING in MoveMysticMonsList
	text_far _WeezingMoveMysticText
	text_end
PikachuMoveMysticText:: ; Sunsette: index-parallel with PIKACHU in MoveMysticMonsList
	text_far _PikachuMoveMysticText
	text_end
RaichuMoveMysticText:: ; Sunsette: index-parallel with RAICHU in MoveMysticMonsList
	text_far _RaichuMoveMysticText
	text_end
ClefairyMoveMysticText:: ; Sunsette: index-parallel with CLEFAIRY in MoveMysticMonsList
	text_far _ClefairyMoveMysticText
	text_end
ClefableMoveMysticText:: ; Sunsette: index-parallel with CLEFABLE; shares the epithet text
	text_far _ClefairyMoveMysticText
	text_end
