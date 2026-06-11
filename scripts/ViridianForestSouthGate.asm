ViridianForestSouthGate_Script:
	jp EnableAutoTextBoxDrawing

ViridianForestSouthGate_TextPointers:
	def_text_pointers
	dw_const ViridianForestSouthGateGirlText,       TEXT_VIRIDIANFORESTSOUTHGATE_GIRL
	dw_const ViridianForestSouthGateLittleGirlText, TEXT_VIRIDIANFORESTSOUTHGATE_LITTLE_GIRL
	dw_const ViridianForestSouthGateOaksAideText,   TEXT_VIRIDIANFORESTSOUTHGATE_OAKS_AIDE

ViridianForestSouthGateGirlText:
	text_far _ViridianForestSouthGateGirlText
	text_end

ViridianForestSouthGateLittleGirlText:
	text_far _ViridianForestSouthGateLittleGirlText
	text_asm
	ld d, RATTATA
	callfar IsMonInParty
	jr nc, .done
	call DisplayTextPromptButton
	ld hl, .rightOn
	rst _PrintText
.done
	rst TextScriptEnd
.rightOn
	text_far _ViridianForestSouthGateLittleGirl2Text
	text_end

; Sunsette: an Oak's Aide who, once you have the #DEX, reminds you that you can check in with PROF.OAK
; from any <PC> (this took over the old "contact OAK via PC" trainer tip, which now warns about field moves).
ViridianForestSouthGateOaksAideText:
	text_asm
	CheckEvent EVENT_GOT_POKEDEX
	ld hl, .NoDexText
	jr z, .print
	ld hl, .HasDexText
.print
	rst _PrintText
	rst TextScriptEnd
.NoDexText
	text_far _ViridianForestSouthGateOaksAideNoDexText
	text_end
.HasDexText
	text_far _ViridianForestSouthGateOaksAideHasDexText
	text_end
