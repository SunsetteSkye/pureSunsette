ViridianNicknameHouse_Script:
	jp EnableAutoTextBoxDrawing

ViridianNicknameHouse_TextPointers:
	def_text_pointers
	dw_const ViridianNicknameHouseBaldingGuyText, TEXT_VIRIDIANNICKNAMEHOUSE_BALDING_GUY
	dw_const ViridianNicknameHouseLittleGirlText, TEXT_VIRIDIANNICKNAMEHOUSE_LITTLE_GIRL
	dw_const ViridianNicknameHouseSpearowText,    TEXT_VIRIDIANNICKNAMEHOUSE_SPEAROW
	dw_const ViridianNicknameHouseSpearySignText, TEXT_VIRIDIANNICKNAMEHOUSE_SPEARY_SIGN

; Sunsette: after his nickname spiel, the balding guy offers to rename a party #MON (the NAME RATER
; function, minus the "official NAME RATER" framing). Reuses NameRatersHouse's generic prompt strings.
ViridianNicknameHouseBaldingGuyText:
	text_asm
	; Sunsette: once LAVENDER's fly point is unlocked (its OFFICIAL NAME RATER is reachable), this
	; unofficial one gives up renaming - just a line.
	ld c, LAVENDER_TOWN
	ld b, FLAG_TEST
	ld hl, wTownVisitedFlag
	call FlagAction
	and a
	jr z, .stillRating
	ld hl, .OfficialText
	rst _PrintText
	rst TextScriptEnd
.stillRating
	call SaveScreenTilesToBuffer2
	ld hl, .SpielText
	rst _PrintText
	ld hl, .OfferText
	rst _PrintText
	call YesNoChoice
	jr nz, .comeAnyTime
	ld hl, .WhichPokemonText
	rst _PrintText
	xor a
	ld [wPartyMenuTypeOrMessageID], a
	ld [wUpdateSpritesEnabled], a
	ld [wMenuItemToSwap], a
	call DisplayPartyMenu
	push af
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call LoadGBPal
	pop af
	jr c, .comeAnyTime
	call GetPartyMonName2
	ld hl, .GiveItANiceNameText
	rst _PrintText
	call YesNoChoice
	jr nz, .comeAnyTime
	ld hl, .WhatShouldWeNameItText
	rst _PrintText
	farcall DisplayNameRaterScreen
	ld hl, .PokemonHasBeenRenamedText
	jr nc, .printDone
.comeAnyTime
	ld hl, .ComeAnyTimeText
.printDone
	rst _PrintText
	rst TextScriptEnd

.SpielText:
	text_far _ViridianNicknameHouseBaldingGuyText
	text_end
.OfficialText:
	text_far _ViridianNicknameHouseOfficialText
	text_end
.OfferText:
	text_far _ViridianNicknameHouseNameOfferText
	text_end
.WhichPokemonText:
	text_far _NameRatersHouseNameRaterWhichPokemonText
	text_end
.GiveItANiceNameText:
	text_far _NameRatersHouseNameRaterGiveItANiceNameText
	text_end
.WhatShouldWeNameItText:
	text_far _NameRatersHouseNameRaterWhatShouldWeNameItText
	text_end
.PokemonHasBeenRenamedText:
	text_far _NameRatersHouseNameRaterPokemonHasBeenRenamedText
	text_end
.ComeAnyTimeText:
	text_far _NameRatersHouseNameRaterComeAnyTimeYouLikeText
	text_end

ViridianNicknameHouseLittleGirlText:
	text_far _ViridianNicknameHouseLittleGirlText
	text_end

ViridianNicknameHouseSpearowText:
	text_asm
	ld hl, .Text
	rst _PrintText
	ld a, SPEAROW
	call PlayCry
.done
	ld c, DEX_SPEAROW - 1
	callfar SetMonSeen
	rst TextScriptEnd

.Text:
	text_far _ViridianNicknameHouseSpearowText
	text_end

ViridianNicknameHouseSpearySignText:
	text_far _ViridianNicknameHouseSpearySignText
	text_asm
	jr ViridianNicknameHouseSpearowText.done
