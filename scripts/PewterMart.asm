PewterMart_Script:
	jp DisableAutoTextBoxDrawing

PewterMart_TextPointers:
	def_text_pointers
	dw_const PewterMartClerkText,     TEXT_PEWTERMART_CLERK
	dw_const PewterMartYoungsterText, TEXT_PEWTERMART_YOUNGSTER
	dw_const PewterMartSuperNerdText, TEXT_PEWTERMART_SUPER_NERD
	dw_const PewterMartTMKid,         TEXT_PEWTERMART_TM_KID

PewterMartYoungsterText:
	text_asm
	ld hl, .Text
	rst _PrintText
	rst TextScriptEnd

.Text:
	text_far _PewterMartYoungsterText
	text_end
	
PewterMartTMKid: ; Sunsette: was the TM Kid; now a kid selling FRESH WATER as a leg up vs BROCK, until you earn the THUNDERBADGE (then "sold out")
	text_asm
	ld a, [wObtainedBadges]
	bit BIT_THUNDERBADGE, a
	jr nz, .soldOut
	ld hl, .FreshWaterText
	rst _PrintText
	ld hl, PewterMartFreshWaterShop
	call DisplayPokemartNoGreeting
	rst TextScriptEnd
.soldOut
	ld hl, .SoldOutText
	rst _PrintText
	rst TextScriptEnd

.FreshWaterText
	text_far _PewterMartFreshWaterText
	text_end

.SoldOutText
	text_far _PewterMartFreshWaterSoldOutText
	text_end

INCLUDE "data/items/marts/pewter_fresh_water.asm"

PewterMartSuperNerdText:
	text_asm
	ld hl, .Text
	rst _PrintText
	rst TextScriptEnd

.Text:
	text_far _PewterMartSuperNerdText
	text_end

INCLUDE "data/items/marts/pewter.asm"