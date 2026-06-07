	object_const_def
	const_export VIRIDIANPOKECENTER_NURSE
	const_export VIRIDIANPOKECENTER_GENTLEMAN
	const_export VIRIDIANPOKECENTER_COOLTRAINER_M
	const_export VIRIDIANPOKECENTER_LINK_RECEPTIONIST
	const_export VIRIDIANPOKECENTER_COUCH_GUY
	const_export VIRIDIANPOKECENTER_COUCH_GUY2

ViridianPokecenter_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 1
	warp_event  4,  7, LAST_MAP, 1

	def_bg_events
	bg_event 0, 4, TEXT_VIRIDIANPOKECENTER_BENCH_GUY

	def_object_events
	object_event  3,  1, SPRITE_NURSE, STAY, DOWN, TEXT_VIRIDIANPOKECENTER_NURSE
	object_event 10,  5, SPRITE_GENTLEMAN, WALK, UP_DOWN, TEXT_VIRIDIANPOKECENTER_GENTLEMAN
	object_event  4,  3, SPRITE_COOLTRAINER_M, STAY, NONE, TEXT_VIRIDIANPOKECENTER_COOLTRAINER_M
	object_event 11,  2, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, TEXT_VIRIDIANPOKECENTER_LINK_RECEPTIONIST
	object_event  0,  4, SPRITE_COUCH_GUY, STAY, NONE, TEXT_VIRIDIANPOKECENTER_COUCH_GUY ; Sunsette: couch tile is solid, so no extra collision needed
	object_event  0,  5, SPRITE_COUCH_GUY2, STAY, NONE, TEXT_VIRIDIANPOKECENTER_COUCH_GUY2 ; Sunsette: lower half - silent decoration on the solid couch tile

	def_warps_to VIRIDIAN_POKECENTER
