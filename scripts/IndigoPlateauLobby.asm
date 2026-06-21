IndigoPlateauLobby_Script:
	call SetLastBlackoutMap ; PureRGBnote: ADDED: set blackout map on entering pokemon center
	call Serial_TryEstablishingExternallyClockedConnection
	call EnableAutoTextBoxDrawing
	call CheckArenaAssistantWalking
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_2, [hl]
	res BIT_CUR_MAP_LOADED_2, [hl]
	ret z
	ResetEvent EVENT_VICTORY_ROAD_1_BOULDER_ON_SWITCH
	; Reset Elite Four events if the player started challenging them before
	ld hl, wElite4Flags
	bit BIT_STARTED_ELITE_4, [hl]
	res BIT_STARTED_ELITE_4, [hl]
	ret z
	ResetEventRange INDIGO_PLATEAU_EVENTS_START, EVENT_LANCES_ROOM_LOCK_DOOR
	ret

IndigoPlateauLobby_TextPointers:
	def_text_pointers
	dw_const IndigoPlateauLobbyNurseText,            TEXT_INDIGOPLATEAULOBBY_NURSE
	dw_const IndigoPlateauLobbyGymGuideText,         TEXT_INDIGOPLATEAULOBBY_GYM_GUIDE
	dw_const IndigoPlateauLobbyCooltrainerFText,     TEXT_INDIGOPLATEAULOBBY_COOLTRAINER_F
	dw_const IndigoPlateauLobbyClerkText,            TEXT_INDIGOPLATEAULOBBY_CLERK
	dw_const IndigoPlateauLobbyLinkReceptionistText, TEXT_INDIGOPLATEAULOBBY_LINK_RECEPTIONIST
	dw_const IndigoPlateauArenaAssistantText,        TEXT_INDIGOPLATEAULOBBY_ARENA_ASSISTANT

IndigoPlateauLobbyNurseText:
	script_pokecenter_nurse

IndigoPlateauLobbyGymGuideText: ; Sunsette: APEX CHIPs moved to the Silph president; guide just greets
	text_asm
	CheckEvent EVENT_BECAME_CHAMP
	jr nz, .afterChamp
	ld hl, IndigoPlateauLobbyGymGuideText2
	rst _PrintText
	rst TextScriptEnd
.afterChamp
	CheckEvent EVENT_TALKED_GYM_GUIDE_AFTER_CHAMP
	jr nz, .quickGreet
	SetEvent EVENT_TALKED_GYM_GUIDE_AFTER_CHAMP
	ld hl, IndigoPlateauGymGuideChampGreeting
	rst _PrintText
	rst TextScriptEnd
.quickGreet
	ld hl, IndigoPlateauGymGuideChampAfterGreet
	rst _PrintText
	rst TextScriptEnd

IndigoPlateauLobbyGymGuideText2:
	text_far _GymGuideChampInMakingText
	text_far _IndigoPlateauLobbyGymGuideText
	text_end

IndigoPlateauLobbyCooltrainerFText:
	text_far _IndigoPlateauLobbyCooltrainerFText
	text_end

IndigoPlateauGymGuideChampGreeting:
	text_far _IndigoPlateauGymGuideChampGreeting
	text_end

IndigoPlateauGymGuideChampAfterGreet:
	text_far _IndigoPlateauGymGuideChampAfterGreet
	text_end

IndigoPlateauLobbyLinkReceptionistText:
IF DEF(_DEBUG)
	text_asm ;DEBUGMODE
	SetEvent EVENT_BECAME_CHAMP
	rst TextScriptEnd
ELSE
	script_cable_club_receptionist
ENDC

INCLUDE "data/items/marts/indigo_plateau.asm"

; PureRGBnote: ADDED: new NPC arena assistant who will let you enter the champ arena after becoming champ
IndigoPlateauArenaAssistantText:
	text_asm
	CheckEvent EVENT_BECAME_CHAMP
	ld hl, .onlyEliteFourAllowed
	jr z, .printDone
.becameChamp
	SetEvent EVENT_ARENA_ASSISTANT_WALKING
	; walks into door and leaves
	ld de, AssistantWalksUp
	ld a, INDIGOPLATEAULOBBY_ARENA_ASSISTANT
	ldh [hSpriteIndex], a
	call MoveSpriteButAllowAOrBPress
	ld hl, .champAttained
.printDone
	rst _PrintText
	rst TextScriptEnd
.onlyEliteFourAllowed
	text_far _IndigoPlateauArenaAssistantOnlyEliteFourAllowed
	text_end
.champAttained
	text_far _IndigoPlateauArenaAssistantChampAttained
	text_end

AssistantWalksUp:
	db NPC_MOVEMENT_UP
	db -1

CheckArenaAssistantWalking:
	CheckEvent EVENT_ARENA_ASSISTANT_WALKING
	ret z
	call DisableAllJoypad
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ResetEvent EVENT_ARENA_ASSISTANT_WALKING
	call EnableAllJoypad
	ld a, SFX_GO_OUTSIDE
	rst _PlaySound
	ld c, TOGGLE_INDIGO_PLATEAU_LOBBY_CHAMP_ARENA_ASSISTANT
	jp HideExtraObject

