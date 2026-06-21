ViridianMart_Script:
	call ViridianMartCheckParcelDeliveredScript
	call EnableAutoTextBoxDrawing
	ld hl, ViridianMart_ScriptPointers
	ld a, [wViridianMartCurScript]
	jp CallFunctionInTable

ViridianMartCheckParcelDeliveredScript:
	CheckEvent EVENT_OAK_GOT_PARCEL
	ld hl, ViridianMart_TextPointers2
	jr nz, .delivered_parcel
	ld hl, ViridianMart_TextPointers
.delivered_parcel
	ld a, l
	ld [wCurMapTextPtr], a
	ld a, h
	ld [wCurMapTextPtr+1], a
	ret

ViridianMart_ScriptPointers:
	def_script_pointers
	dw_const ViridianMartDefaultScript,    SCRIPT_VIRIDIANMART_DEFAULT
	dw_const ViridianMartOaksParcelScript, SCRIPT_VIRIDIANMART_OAKS_PARCEL
	dw_const DoRet,                        SCRIPT_VIRIDIANMART_NOOP

ViridianMartDefaultScript:
	call UpdateSprites
	ld a, TEXT_VIRIDIANMART_CLERK_YOU_CAME_FROM_PALLET_TOWN
	ldh [hTextID], a
	call DisplayTextID
	ld hl, wSimulatedJoypadStatesEnd
	ld de, .PlayerMovement
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_VIRIDIANMART_OAKS_PARCEL
	ld [wViridianMartCurScript], a
	ret

.PlayerMovement:
	db PAD_LEFT, 1
	db PAD_UP, 2
	db -1 ; end

ViridianMartOaksParcelScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	ld a, TEXT_VIRIDIANMART_CLERK_PARCEL_QUEST
	ldh [hTextID], a
	call DisplayTextID
	lb bc, OAKS_PARCEL, 1
	call GiveItem
	SetEvent EVENT_GOT_OAKS_PARCEL
	ld a, SCRIPT_VIRIDIANMART_NOOP
	ld [wViridianMartCurScript], a
	ret

ViridianMart_TextPointers:
	dw ViridianMartClerkSayHiToOakText
	dw ViridianMartYoungsterText
	dw ViridianMartCooltrainerMText
	dw ViridianMartTMKid
	const_def 5
	dw_const ViridianMartClerkYouCameFromPalletTownText, TEXT_VIRIDIANMART_CLERK_YOU_CAME_FROM_PALLET_TOWN
	dw_const ViridianMartClerkParcelQuestText,           TEXT_VIRIDIANMART_CLERK_PARCEL_QUEST

ViridianMart_TextPointers2:
	; This becomes the primary text pointers table when Oak's parcel has been delivered.
	def_text_pointers
	dw_const ViridianMartClerkText,        TEXT_VIRIDIANMART_CLERK
	dw_const ViridianMartYoungsterText,    TEXT_VIRIDIANMART_YOUNGSTER
	dw_const ViridianMartCooltrainerMText, TEXT_VIRIDIANMART_COOLTRAINER_M
	dw_const ViridianMartTMKid,            TEXT_VIRIDIANMART_TM_KID

ViridianMartClerkSayHiToOakText:
	text_far _ViridianMartClerkSayHiToOakText
	text_end

ViridianMartClerkYouCameFromPalletTownText:
	text_far _ViridianMartClerkYouCameFromPalletTownText
	text_end

ViridianMartClerkParcelQuestText:
; Sunsette: clerk hands the parcel, then (if you have a starter) the starter gives a brief
; cry and a curious line keyed to which starter it is. No sprite cut-in.
	text_asm
	ld hl, .clerk
	rst _PrintText
	ld a, [wPartyCount]
	and a
	jr z, .done                  ; no starter somehow -> no reaction, no harm
	ld a, [wPartySpecies]        ; slot 1 species
	push af
	call PlayCry
	xor a                        ; slot 1 -> nickname into wNameBuffer for the line
	ld hl, wPartyMonNicks
	call GetPartyMonName
	pop af
	cp CHARMANDER
	jr z, .char
	cp SQUIRTLE
	jr z, .squir
	ld hl, .bulbaReact           ; default to Bulbasaur's line (only a starter is here)
	jr .react
.char
	ld hl, .charReact
	jr .react
.squir
	ld hl, .squirReact
.react
	rst _PrintText
.done
	rst TextScriptEnd

.clerk
	text_far _ViridianMartClerkParcelQuestText
	sound_get_key_item
	text_end

.charReact
	text_far _ParcelCharReactText
	text_end
.squirReact
	text_far _ParcelSquirReactText
	text_end
.bulbaReact
	text_far _ParcelBulbaReactText
	text_end

ViridianMartYoungsterText:
	text_far _ViridianMartYoungsterText
	text_end

ViridianMartCooltrainerMText:
	text_far _ViridianMartCooltrainerMText
	text_end

ViridianMartTMKid: ; Sunsette: was the TM Kid; now just a kid lamenting that MARTs don't stock TMs/HMs (an oblique hint at what they are). Never sells anything.
	text_asm
	ld hl, ViridianMartTMHintText
	rst _PrintText
	rst TextScriptEnd

ViridianMartTMHintText:
	text_far _ViridianMartTMKid
	text_end

INCLUDE "data/items/marts/viridian.asm"
