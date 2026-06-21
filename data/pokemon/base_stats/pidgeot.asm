	db DEX_PIDGEOT ; pokedex id

	db  72,  85,  68, 121, 104
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 65 ; catch rate
	db 172 ; base exp

	INCBIN "gfx/pokemon/front/pidgeot.pic", 0, 1 ; sprite dimensions
	dw PidgeotPicFront, PidgeotPicBackSW

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	tmhm \
	ROOST,\
	MUD_BOMB,\
	PIN_MISSILE,\
	TOXIC,\
	HONE_EDGE,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	HYPER_BEAM,\
	BARRIER,\
	ADAPTATION,\
	WYRM_WRATH,\
	THUNDERBOLT,\
	THUNDER,\
	MIRAGE,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	TWISTER,\
	DEMOLISH,\
	VOID_MIND,\
	BRAVE_BIRD,\
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	FLASH
	; end


	db BANK(PidgeotPicFront)
	db BANK(PidgeotPicFrontAlt)
	db BANK(PidgeotPicBack)
	db BANK(PidgeotPicBackSW)

	dw PidgeotPicFrontAlt, PidgeotPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_ARROGANT NATURE_WISE
;@ pal_battle   PAL_BROWNMON2
;@ pal_altbattle PAL_BROWNGOLDMON
;@ pal_icon     PAL_ICON_10
;@ pal_alticon  PAL_ICON_11
;@ evo_move    NO_MOVE
;@ evo_react   "A gust of wind" "sends debris up!"
;@ evo_react   "It soars high," "feathers blazing!"
;@ evo_react   "Its plume flares" "bright and bold!"
;@ evo_react   "It dives fast," "talons spread!"
;@ learn       6, GUST
;@ learn       9, SAND_ATTACK
;@ learn       14, AGILITY
;@ learn       17, SWIFT
;@ learn       23, WING_ATTACK
;@ learn       28, RAZOR_LEAF
;@ learn       32, BLITZ_STRIKE
;@ learn       35, HONE_EDGE
;@ learn       41, HURRICANE
;@ learn       48, SENBONZAKURA
;@ learn       54, DOUBLE_EDGE
;@ learn       60, MOCKINGBIRD
