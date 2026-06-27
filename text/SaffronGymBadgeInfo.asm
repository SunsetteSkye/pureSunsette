; Sunsette: Sabrina's badge info text (her badge is now named the SOULBADGE), relocated here to keep
; Text 9 in budget. Reached cross-bank via text_far from scripts/SaffronGym.asm.
_SaffronGymSabrinaMarshBadgeInfoText::
	text "The Soul Badge is proof of your psychic bond with <Pokemon>!"
	para "It lets <Pokemon> Teleport like Fly from anywhere, even indoors!"
	text_asm
	ld b, POCKET_ABRA
	call IsItemInBag
	ld hl, .takeTM
	ret z
	ld hl, .withAbra
	ret
.withAbra:
	para "Oh, I sense your Abra's question."
	para "Yes! It can do the same!"
.takeTM:
	para "Wait, please take this <TM> with you!"
	done
