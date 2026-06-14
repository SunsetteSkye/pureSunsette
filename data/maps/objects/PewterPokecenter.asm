	object_const_def
	const_export PEWTERPOKECENTER_NURSE
	const_export PEWTERPOKECENTER_GENTLEMAN
	const_export PEWTERPOKECENTER_JIGGLYPUFF
	const_export PEWTERPOKECENTER_LINK_RECEPTIONIST
	const_export PEWTERPOKECENTER_COUCH_GUY
	const_export PEWTERPOKECENTER_COUCH_GUY2

PewterPokecenter_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 7
	warp_event  4,  7, LAST_MAP, 7

	def_bg_events
	bg_event 0, 4, TEXT_PEWTERPOKECENTER_BENCH_GUY

	def_object_events
	object_event  3,  1, SPRITE_NURSE, STAY, DOWN, TEXT_PEWTERPOKECENTER_NURSE
	object_event 11,  7, SPRITE_GENTLEMAN, STAY, LEFT, TEXT_PEWTERPOKECENTER_GENTLEMAN
	object_event  1,  3, SPRITE_FAIRY, STAY, DOWN, TEXT_PEWTERPOKECENTER_JIGGLYPUFF
	object_event 11,  2, SPRITE_SUPERNEET, STAY, DOWN, TEXT_PEWTERPOKECENTER_LINK_RECEPTIONIST
	object_event  0,  4, SPRITE_COUCH_GUY, STAY, NONE, TEXT_PEWTERPOKECENTER_COUCH_GUY ; Sunsette: couch tile is solid, so no extra collision needed
	object_event  0,  5, SPRITE_COUCH_GUY2, STAY, NONE, TEXT_PEWTERPOKECENTER_COUCH_GUY2 ; Sunsette: lower half - silent decoration on the solid couch tile

	def_warps_to PEWTER_POKECENTER
