; PureRGBnote: ADDED: new area with a guy who can remap typings back to their original ones.

TypeGuysHouse_Script:
	call TypeGuysHouseCheckTurnOffLights
	callfar CheckUsedFlash
	jp EnableAutoTextBoxDrawing

TypeGuysHouse_TextPointers:
	def_text_pointers
	dw_const TypeGuysHouseTypeGuyText,              TEXT_TYPE_GUYS_HOUSE_TYPE_GUY
	dw_const TypeGuysHouseShortBookCaseText,        TEXT_TYPE_GUYS_HOUSE_SHORT_BOOKCASE
	dw_const TypeGuysHouseSculptureText,            TEXT_TYPE_GUYS_HOUSE_SCULPTURE
	dw_const TypeGuysHouseRightTallBookcaseText,    TEXT_TYPE_GUYS_HOUSE_RIGHT_TALL_BOOKCASE
	dw_const TypeGuysHouseLeftTallBookcaseText,     TEXT_TYPE_GUYS_HOUSE_LEFT_TALL_BOOKCASE
	dw_const TypeGuysHouseComputer.text,            TEXT_TYPE_GUYS_HOUSE_COMPUTER

TypeGuysHouseCheckTurnOffLights:
	call WasMapJustLoaded
	ret z
	ld a, [wXCoord]
	cp 8
	jr c, .notDark
	; turn off the lights if you just entered the type guy's room
	ResetEvent EVENT_TYPE_GUY_SKIP_INTRO
	jr TypeGuysHouseTurnOffLights
.notDark
	xor a
	ld [wMapPalOffset], a
	ret

CheckLoadLightSwitch::
	CheckEvent EVENT_TYPE_GUY_LIGHT_SWITCH
	jr nz, LoadLightSwitchOnGraphic
	; fall through

LoadLightSwitchOffGraphic:
	ld de, LightSwitchOff
	lb bc, BANK(LightSwitchOff), 1
	jr LoadLightSwitchGraphicCommon
LoadLightSwitchOnGraphic:
	ld de, LightSwitchOn
	lb bc, BANK(LightSwitchOn), 1
	; fall through
LoadLightSwitchGraphicCommon:
	ld hl, vChars2 tile $46
	jp CopyVideoDataDouble

TypeGuysHouseLightSwitch::
	ld a, SFX_TELEPORT_ENTER_2
	rst _PlaySound
	CheckEvent EVENT_TYPE_GUY_LIGHT_SWITCH
	jr nz, .turnOff
	SetEvent EVENT_TYPE_GUY_LIGHT_SWITCH
	; turn on the lights
	xor a
	ld [wMapPalOffset], a
	call ResumeMusic
	; add the "on" light switch tile
	jr LoadLightSwitchOnGraphic
.turnOff
	; fall through
TypeGuysHouseTurnOffLights:
	ResetEvent EVENT_TYPE_GUY_LIGHT_SWITCH
	; turn off the lights
	ld a, 6
	ld [wMapPalOffset], a
	call PauseMusic
	; add the "off" light switch tile
	jr LoadLightSwitchOffGraphic

TypeGuysHouseTooDarkText:
	text_far _TypeGuysHouseTooDarkText
	text_end

CheckLightsTurnedOn:
	ld a, [wMapPalOffset]
	cp 6
	ret

TypeGuysHouseComputer::
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	ld a, TEXT_TYPE_GUYS_HOUSE_COMPUTER
	ldh [hTextID], a
	jp DisplayTextID
.text
	text_asm
	call CheckLightsTurnedOn
	ld hl, TypeGuysHouseTooDarkText
	jr z, .done
	ld hl, .computer
.done
	rst _PrintText
	rst TextScriptEnd
.computer
	text_far _TypeGuysHouseTypeGuysComputerText
	text_end

TypeGuysHouseShortBookCaseText:
	text_asm 
	call CheckLightsTurnedOn
	ld hl, TypeGuysHouseTooDarkText
	jr z, .done
	ld a, [wXCoord]
	cp 12
	ld hl, .smallShelf
	jr nz, .done
	ld hl, .smallShelfSide
.done
	rst _PrintText
	rst TextScriptEnd
.smallShelfSide
	text_far _TypeGuysHouseShortBookCaseSideText
	text_end
.smallShelf
	text_far _TypeGuysHouseShortBookCaseText
	text_far _FlippedToARandomPage
	text_far _TypeGuysHouseShortBookCaseText2
	text_end

TypeGuysHouseSculptureText:
	text_asm 
	call CheckLightsTurnedOn
	ld hl, TypeGuysHouseTooDarkText
	jr z, .done
	ld hl, .sculpture
.done
	rst _PrintText
	rst TextScriptEnd
.sculpture
	text_far _TypeGuysHouseSculptureText
	text_end


TypeGuysHouseRightTallBookcaseText:
	text_asm 
	call CheckLightsTurnedOn
	ld hl, TypeGuysHouseTooDarkText
	jr z, .print
	ld hl, .rightTallBookcase
.print
	rst _PrintText
.done
	rst TextScriptEnd
.rightTallBookcase
	text_far _TypeGuysHouseRightTallBookcaseText
	text_far _FlippedToARandomPage
	text_far _TypeGuysHouseRightTallBookcaseText2
	text_end

TypeGuysHouseLeftTallBookcaseText:
	text_asm 
	call CheckLightsTurnedOn
	ld hl, TypeGuysHouseTooDarkText
	jr z, .done
	ld hl, .leftTallBookcase
.done
	rst _PrintText
.done2
	rst TextScriptEnd
.leftTallBookcase
	text_far _TypeGuysHouseLeftTallBookcaseText
	text_far _FlippedToARandomPage
	text_far _TypeGuysHouseLeftTallBookcaseText2
	text_asm
	CheckEvent FLAG_GOLEM_FAMILY_LEARNSET
	jr nz, .done2
	ld d, DEX_GEODUDE
	jpfar KeepReadingBookLearnset



TypeGuysHouseTypeGuyText: ; Sunsette: type-remap service removed; he now sells a stash of TMs
	text_asm
	call CheckLightsTurnedOn
	jr nz, .typeGuyTalks
	; asleep
	ld hl, .sleeping
	rst _PrintText
	rst TextScriptEnd
.typeGuyTalks
	CheckEvent EVENT_TYPE_GUY_SKIP_INTRO
	jr nz, .skip
	SetEvent EVENT_TYPE_GUY_SKIP_INTRO
	ld hl, .awake
	rst _PrintText
.skip
	ld hl, .awake2
	rst _PrintText
	ld hl, TypeGuyTMShop
	call DisplayPokemartNoGreeting
	rst TextScriptEnd
.sleeping
	text_far _TypeGuysHouseTypeGuySleepingText
	text_end
.awake
	text_far _TypeGuysHouseTypeGuyAwakeText
	text_end
.awake2
	text_far _TypeGuysHouseTypeGuyAwakeText2
	text_end

INCLUDE "data/items/marts/type_guy.asm"