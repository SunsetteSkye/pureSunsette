; Sunsette: Sabrina's badge info text (her badge is now named the SOULBADGE), relocated here to keep
; Text 9 in budget. Reached cross-bank via text_far from scripts/SaffronGym.asm.
_SaffronGymSabrinaMarshBadgeInfoText::
	text_asm
	callfar ComputeExpGrowthThresholdLeader
	ld hl, .body
	ret
.body:
	text "The SOULBADGE is"
	line "proof of your"
	cont "psychic bond"
	cont "with #MON!"

	para "It lets #MON"
	line "TELEPORT like FLY-"
	cont "from anywhere,"
	cont "even indoors!"

	para "And your #MON"
	line "up to L"
	text_decimal wExpGrowthThreshold, 1, 2
	text " grow"
	cont "more efficiently!"
	text_asm
	ld b, POCKET_ABRA
	call IsItemInBag
	ld hl, .takeTM
	ret z
	ld hl, .withAbra
	ret
.withAbra:
	para "Oh- I sense your"
	line "ABRA's question."

	para "Yes! It can do"
	line "the same!"
.takeTM:
	para "Wait, please take"
	line "this <TM> with you!"
	done
