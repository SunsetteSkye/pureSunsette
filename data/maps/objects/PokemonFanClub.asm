	object_const_def
	const_export POKEMONFANCLUB_PIKACHU_FAN
	const_export POKEMONFANCLUB_SEEL_FAN
	const_export POKEMONFANCLUB_PIKACHU
	const_export POKEMONFANCLUB_SEEL
	const_export POKEMONFANCLUB_CHAIRMAN
	const_export POKEMONFANCLUB_RECEPTIONIST
	const_export POKEMONFANCLUB_ROCKET_GIRL

PokemonFanClub_Object:
	db $d ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 2
	warp_event  3,  7, LAST_MAP, 2

	def_bg_events
	bg_event  1,  0, TEXT_POKEMONFANCLUB_SIGN_1
	bg_event  6,  0, TEXT_POKEMONFANCLUB_SIGN_2

	def_object_events
	object_event  6,  3, SPRITE_FISHER, STAY, LEFT, TEXT_POKEMONFANCLUB_PIKACHU_FAN 
	object_event  1,  3, SPRITE_GIRL, STAY, RIGHT, TEXT_POKEMONFANCLUB_SEEL_FAN 
	object_event  6,  4, SPRITE_FAIRY, STAY, LEFT, TEXT_POKEMONFANCLUB_PIKACHU 
	object_event  1,  4, SPRITE_SEEL, STAY, RIGHT, TEXT_POKEMONFANCLUB_SEEL 
	object_event  3,  1, SPRITE_GENTLEMAN, STAY, DOWN, TEXT_POKEMONFANCLUB_CHAIRMAN 
	object_event  5,  1, SPRITE_SUPERNEET, STAY, DOWN, TEXT_POKEMONFANCLUB_RECEPTIONIST
	object_event  1,  1, SPRITE_ROCKET_QUEEN, STAY, DOWN, TEXT_POKEMONFANCLUB_ROCKET_GIRL ; Sunsette: TEAM ROCKET girl lurking in the back-left corner (second-wind explainer)

	def_warps_to POKEMON_FAN_CLUB
