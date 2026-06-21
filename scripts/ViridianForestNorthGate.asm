ViridianForestNorthGate_Script:
	call EnableAutoTextBoxDrawing
	CheckEvent EVENT_REACTED_LEFT_VIRIDIAN_FOREST
	ret nz
	ld a, [wWarpedFromWhichMap]
	cp VIRIDIAN_FOREST
	ret nz
	SetEvent EVENT_REACTED_LEFT_VIRIDIAN_FOREST
	ld a, NROW_VIRIDIAN_FOREST
	farcall ShowOverworldNature
	ret

ViridianForestNorthGate_TextPointers:
	def_text_pointers
	dw_const ViridianForestNorthGateSuperNerdText, TEXT_VIRIDIANFORESTNORTHGATE_SUPER_NERD
	dw_const ViridianForestNorthGateGrampsText,    TEXT_VIRIDIANFORESTNORTHGATE_GRAMPS

ViridianForestNorthGateSuperNerdText:
	text_far _ViridianForestNorthGateSuperNerdText
	text_end

ViridianForestNorthGateGrampsText:
	text_far _ViridianForestNorthGateGrampsText
	text_end
