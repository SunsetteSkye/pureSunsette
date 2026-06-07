	object_const_def
	const_export FUCHSIAPOKECENTER_NURSE
	const_export FUCHSIAPOKECENTER_ROCKER
	const_export FUCHSIAPOKECENTER_COOLTRAINER_F
	const_export FUCHSIAPOKECENTER_LINK_RECEPTIONIST
	const_export FUCHSIAPOKECENTER_COUCH_GUY
	const_export FUCHSIAPOKECENTER_COUCH_GUY2

FuchsiaPokecenter_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 3
	warp_event  4,  7, LAST_MAP, 3

	def_bg_events
	bg_event 0, 4, TEXT_FUCHSIAPOKECENTER_BENCH_GUY

	def_object_events
	object_event  3,  1, SPRITE_NURSE, STAY, DOWN, TEXT_FUCHSIAPOKECENTER_NURSE
	object_event  2,  3, SPRITE_ROCKER, STAY, NONE, TEXT_FUCHSIAPOKECENTER_ROCKER
	object_event  6,  5, SPRITE_COOLTRAINER_F, WALK, LEFT_RIGHT, TEXT_FUCHSIAPOKECENTER_COOLTRAINER_F
	object_event 11,  2, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, TEXT_FUCHSIAPOKECENTER_LINK_RECEPTIONIST
	object_event  0,  4, SPRITE_COUCH_GUY, STAY, NONE, TEXT_FUCHSIAPOKECENTER_COUCH_GUY ; Sunsette: couch tile is solid, so no extra collision needed
	object_event  0,  5, SPRITE_COUCH_GUY2, STAY, NONE, TEXT_FUCHSIAPOKECENTER_COUCH_GUY2 ; Sunsette: lower half - silent decoration on the solid couch tile

	def_warps_to FUCHSIA_POKECENTER
