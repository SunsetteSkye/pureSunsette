	object_const_def
	const_export CELADONPOKECENTER_NURSE
	const_export CELADONPOKECENTER_GENTLEMAN
	const_export CELADONPOKECENTER_BEAUTY
	const_export CELADONPOKECENTER_LINK_RECEPTIONIST
	const_export CELADONPOKECENTER_COUCH_GUY
	const_export CELADONPOKECENTER_COUCH_GUY2

CeladonPokecenter_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 6
	warp_event  4,  7, LAST_MAP, 6

	def_bg_events
	bg_event 0, 4, TEXT_CELADONPOKECENTER_BENCH_GUY

	def_object_events
	object_event  3,  1, SPRITE_NURSE, STAY, DOWN, TEXT_CELADONPOKECENTER_NURSE
	object_event  7,  3, SPRITE_GENTLEMAN, WALK, LEFT_RIGHT, TEXT_CELADONPOKECENTER_GENTLEMAN
	object_event 10,  5, SPRITE_BEAUTY, WALK, ANY_DIR, TEXT_CELADONPOKECENTER_BEAUTY
	object_event 11,  2, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, TEXT_CELADONPOKECENTER_LINK_RECEPTIONIST
	object_event  0,  4, SPRITE_COUCH_GUY, STAY, NONE, TEXT_CELADONPOKECENTER_COUCH_GUY ; Sunsette: couch tile is solid, so no extra collision needed
	object_event  0,  5, SPRITE_COUCH_GUY2, STAY, NONE, TEXT_CELADONPOKECENTER_COUCH_GUY2 ; Sunsette: lower half - silent decoration on the solid couch tile

	def_warps_to CELADON_POKECENTER
