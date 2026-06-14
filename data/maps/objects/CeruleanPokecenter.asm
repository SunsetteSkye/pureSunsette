	object_const_def
	const_export CERULEANPOKECENTER_NURSE
	const_export CERULEANPOKECENTER_SUPER_NERD
	const_export CERULEANPOKECENTER_GENTLEMAN
	const_export CERULEANPOKECENTER_LINK_RECEPTIONIST
	const_export CERULEANPOKECENTER_COUCH_GUY
	const_export CERULEANPOKECENTER_COUCH_GUY2

CeruleanPokecenter_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 3
	warp_event  4,  7, LAST_MAP, 3

	def_bg_events
	bg_event 0, 4, TEXT_CERULEANPOKECENTER_BENCH_GUY

	def_object_events
	object_event  3,  1, SPRITE_NURSE, STAY, DOWN, TEXT_CERULEANPOKECENTER_NURSE
	object_event 10,  5, SPRITE_SCRUFFY_GUY, WALK, ANY_DIR, TEXT_CERULEANPOKECENTER_SUPER_NERD
	object_event  4,  3, SPRITE_GENTLEMAN, STAY, DOWN, TEXT_CERULEANPOKECENTER_GENTLEMAN
	object_event 11,  2, SPRITE_SUPERNEET, STAY, DOWN, TEXT_CERULEANPOKECENTER_LINK_RECEPTIONIST
	object_event  0,  4, SPRITE_COUCH_GUY, STAY, NONE, TEXT_CERULEANPOKECENTER_COUCH_GUY ; Sunsette: couch tile is solid, so no extra collision needed
	object_event  0,  5, SPRITE_COUCH_GUY2, STAY, NONE, TEXT_CERULEANPOKECENTER_COUCH_GUY2 ; Sunsette: lower half - silent decoration on the solid couch tile

	def_warps_to CERULEAN_POKECENTER
