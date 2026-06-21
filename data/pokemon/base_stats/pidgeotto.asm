	db DEX_PIDGEOTTO ; pokedex id

	db  63,  70,  55, 86,  80
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 120 ; catch rate
	db 113 ; base exp

	INCBIN "gfx/pokemon/front/pidgeotto.pic", 0, 1 ; sprite dimensions
	dw PidgeottoPicFront, PidgeottoPicBackSW

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	ROOST,\
	MUD_BOMB,\
	PIN_MISSILE,\
	TOXIC,\
	HONE_EDGE,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
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
	BRAVE_BIRD,\
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	FLASH
	; end

	db BANK(PidgeottoPicFront)
	db BANK(PidgeottoPicFrontAlt)
	db BANK(PidgeottoPicBack)
	db BANK(PidgeottoPicBackSW)

	dw PidgeottoPicFrontAlt, PidgeottoPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_SCRAPPY NATURE_ARROGANT
;@ pal_battle   PAL_BROWNMON2
;@ pal_altbattle PAL_BROWNGOLDMON
;@ pal_icon     PAL_ICON_10
;@ pal_alticon  PAL_ICON_11
;@ evo         EVOLVE_LEVEL, 48, PIDGEOT
;@ evo_move    NO_MOVE
;@ evo_react   "It flares its" "wings and shrieks!"
;@ evo_react   "It beats its wings" "into a gale!"
;@ evo_react   "It tilts its head," "eyes razor sharp!"
;@ evo_react   "It springs aloft" "with a cry!"
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
