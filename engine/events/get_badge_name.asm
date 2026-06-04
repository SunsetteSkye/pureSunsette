_GetBadgeName::
	ld a, [wNamedObjectIndex]
	ld hl, BadgeNames
	ld bc, ITEM_NAME_LENGTH
	jp GetFixedLengthString
	
BadgeNames:
	table_width ITEM_NAME_LENGTH
	db "BOULDERBADGE@"
	db "CASCADEBADGE@"
	db "THUNDERBADGE@"
	db "RAINBOWBADGE@"
	db "MARSHBADGE@@@" ; Sunsette: Soul/Marsh names swapped (Fuchsia=Marsh, Saffron=Soul)
	db "SOULBADGE@@@@"
	db "VOLCANOBADGE@"
	db "EARTHBADGE@@@"
	assert_table_length NUM_BADGES