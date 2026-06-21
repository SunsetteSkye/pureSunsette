LavenderMart_Script:
	jp EnableAutoTextBoxDrawing

LavenderMart_TextPointers:
	def_text_pointers
	dw_const LavenderMartClerkText,        TEXT_LAVENDERMART_CLERK
	dw_const LavenderMartBaldingGuyText,   TEXT_LAVENDERMART_BALDING_GUY
	dw_const LavenderMartCooltrainerMText, TEXT_LAVENDERMART_COOLTRAINER_M

LavenderMartBaldingGuyText:
	text_far _LavenderMartBaldingGuyText
	text_end

LavenderMartCooltrainerMText:
	text_asm
	CheckEvent EVENT_RESCUED_MR_FUJI
	ld hl, .NuggetText
	jr nz, .gotText
	ld hl, .ReviveText
.gotText
	rst _PrintText
	rst TextScriptEnd

.ReviveText
	text_far _LavenderMartCooltrainerMReviveText
	text_end

.NuggetText
	text_far _LavenderMartCooltrainerMNuggetText
	text_end

INCLUDE "data/items/marts/lavender.asm"