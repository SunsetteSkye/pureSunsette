Route16FlyHouse_Script:
	jp EnableAutoTextBoxDrawing

Route16FlyHouse_TextPointers:
	def_text_pointers
	dw_const Route16FlyHouseBrunetteGirlText, TEXT_ROUTE16FLYHOUSE_BRUNETTE_GIRL
	dw_const Route16FlyHouseFearowText,       TEXT_ROUTE16FLYHOUSE_FEAROW

Route16FlyHouseBrunetteGirlText:
	text_asm
	CheckEvent EVENT_GOT_FAMOUS_GIRL_TM
	ld hl, .TMExplanationText
	jr nz, .printDone
	ld hl, .Text
	rst _PrintText
	lb bc, TM_ROUTE_16_FLY_HOUSE_FAMOUS_GIRL, 1 ; ILL WIND
	call GiveItem
	ld hl, .NoRoomText
	jr nc, .printDone
	SetEvent EVENT_GOT_FAMOUS_GIRL_TM
	ld hl, .ReceivedTMText
.printDone
	rst _PrintText
	rst TextScriptEnd

.Text:
	text_far _Route16FlyHouseBrunetteGirlText
	text_end

.ReceivedTMText:
	text_far _Route16FlyHouseBrunetteGirlReceivedTMText
	sound_get_item_1
	text_end

.TMExplanationText:
	text_far _Route16FlyHouseBrunetteGirlTMExplanationText
	text_end

.NoRoomText:
	text_far _Route16FlyHouseBrunetteGirlNoRoomText
	text_end

Route16FlyHouseFearowText:
	text_far _Route16FlyHouseFearowText
	text_asm
	ld a, FEAROW
	call PlayCry
	call WaitForSoundToFinish
	call DisplayTextPromptButton
	ld a, ROUTE16FLYHOUSE_BRUNETTE_GIRL
	call SetSpriteFacingDown
	ld de, .famousGirlName
	call CopyTrainerName
	ld hl, .polly
	rst _PrintText
	ld c, DEX_FEAROW - 1
	callfar SetMonSeen
	lb hl, DEX_FEAROW, $FF
	ld de, TextNothing
	ld bc, LearnsetFadeOutInStory
	predef_jump LearnsetTrainerScriptMain
.polly:
	text_far _Route16FlyHouseFearow2Text
	text_end
.famousGirlName
	db "FAMOUS GIRL@"