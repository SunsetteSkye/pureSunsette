	db DEX_SQUIRTLE ; pokedex id

	db  44,  48,  65,  43,  50
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 45 ; catch rate
	db 66 ; base exp

	INCBIN "gfx/pokemon/front/squirtle.pic", 0, 1 ; sprite dimensions
	dw SquirtlePicFront, SquirtlePicBackSW

	db TACKLE, TAIL_WHIP, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	FROST_FIST,\
	MUD_BOMB,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AQUA_RING,\
	ICE_BEAM,\
	BLIZZARD,\
	CALM_MIND,\
	LOW_KICK,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	BARRIER,\
	RIPTIDE,\
	DIG,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	DEMOLISH,\
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	ROCK_ON,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	STRENGTH

	db BANK(SquirtlePicFront)
	db BANK(SquirtlePicFrontAlt)
	db BANK(SquirtlePicBack)
	db BANK(SquirtlePicBackSW)

	dw SquirtlePicFrontAlt, SquirtlePicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_PLAYFUL NATURE_SCRAPPY
;@ pal_battle   PAL_AQUAMON
;@ pal_altbattle PAL_PEWTER
;@ pal_icon     PAL_ICON_05
;@ pal_alticon  PAL_ICON_06
;@ evo         EVOLVE_LEVEL, 16, WARTORTLE
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       6, BUBBLE
;@ learn       8, HARDEN
;@ learn       11, SUPER_SOAK
;@ learn       14, LOW_KICK
;@ learn       18, BITE
;@ learn       23, SHELL_GAME
;@ learn       28, CLAMP
;@ learn       33, DIZZY_PUNCH
;@ learn       35, BLOOD_RUSH
;@ learn       42, METEOR_DRIVE
;@ learn       50, HYDRO_PUMP
