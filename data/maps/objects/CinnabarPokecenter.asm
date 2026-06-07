	object_const_def
	const_export CINNABARPOKECENTER_NURSE
	const_export CINNABARPOKECENTER_COOLTRAINER_F
	const_export CINNABARPOKECENTER_GENTLEMAN
	const_export CINNABARPOKECENTER_LINK_RECEPTIONIST
	const_export CINNABARPOKECENTER_COUCH_GUY
	const_export CINNABARPOKECENTER_COUCH_GUY2

CinnabarPokecenter_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 4
	warp_event  4,  7, LAST_MAP, 4

	def_bg_events
	bg_event 0, 4, TEXT_CINNABARPOKECENTER_BENCH_GUY

	def_object_events
	object_event  3,  1, SPRITE_NURSE, STAY, DOWN, TEXT_CINNABARPOKECENTER_NURSE
	object_event  9,  4, SPRITE_COOLTRAINER_F, WALK, ANY_DIR, TEXT_CINNABARPOKECENTER_COOLTRAINER_F
	object_event  2,  6, SPRITE_GENTLEMAN, STAY, NONE, TEXT_CINNABARPOKECENTER_GENTLEMAN
	object_event 11,  2, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, TEXT_CINNABARPOKECENTER_LINK_RECEPTIONIST
	object_event  0,  4, SPRITE_COUCH_GUY, STAY, NONE, TEXT_CINNABARPOKECENTER_COUCH_GUY ; Sunsette: couch tile is solid, so no extra collision needed
	object_event  0,  5, SPRITE_COUCH_GUY2, STAY, NONE, TEXT_CINNABARPOKECENTER_COUCH_GUY2 ; Sunsette: lower half - silent decoration on the solid couch tile

	def_warps_to CINNABAR_POKECENTER
