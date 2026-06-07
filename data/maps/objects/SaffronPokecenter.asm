	object_const_def
	const_export SAFFRONPOKECENTER_NURSE
	const_export SAFFRONPOKECENTER_BEAUTY
	const_export SAFFRONPOKECENTER_GENTLEMAN
	const_export SAFFRONPOKECENTER_LINK_RECEPTIONIST
	const_export SAFFRONPOKECENTER_COUCH_GUY
	const_export SAFFRONPOKECENTER_COUCH_GUY2

SaffronPokecenter_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 7
	warp_event  4,  7, LAST_MAP, 7

	def_bg_events
	bg_event 0, 4, TEXT_SAFFRONPOKECENTER_BENCH_GUY

	def_object_events
	object_event  3,  1, SPRITE_NURSE, STAY, DOWN, TEXT_SAFFRONPOKECENTER_NURSE
	object_event  5,  5, SPRITE_BEAUTY, STAY, NONE, TEXT_SAFFRONPOKECENTER_BEAUTY
	object_event  8,  3, SPRITE_GENTLEMAN, STAY, DOWN, TEXT_SAFFRONPOKECENTER_GENTLEMAN
	object_event 11,  2, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, TEXT_SAFFRONPOKECENTER_LINK_RECEPTIONIST
	object_event  0,  4, SPRITE_COUCH_GUY, STAY, NONE, TEXT_SAFFRONPOKECENTER_COUCH_GUY ; Sunsette: couch tile is solid, so no extra collision needed
	object_event  0,  5, SPRITE_COUCH_GUY2, STAY, NONE, TEXT_SAFFRONPOKECENTER_COUCH_GUY2 ; Sunsette: lower half - silent decoration on the solid couch tile

	def_warps_to SAFFRON_POKECENTER
