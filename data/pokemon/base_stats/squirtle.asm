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
	DISABLE,\
	AURORA_MIST,\
	TOXIC,\
	SLUDGE_BOMB,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	WATER_PULSE,\
	SUPER_SOAK,\
	ICE_BEAM,\
	BLIZZARD,\
	ZAPPERCUT,\
	FROST_FIST,\
	SEISMIC_TOSS,\
	MUD_BOMB,\
	DIG,\
	FINISHER,\
	DEMOLISH,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	SHADOW_BALL,\
	SHADOW_BOX,\
	BARRIER,\
	METEOR_SWEEP,\
	ROCK_SLIDE,\
	OROCLASM,\
	SUBSTITUTE,\
	RIPTIDE,\
	AQUA_RING,\
	VOID_MIND,\
	LEAP_ATTACK,\
	CLAY_ARMOR,\
	ROCK_ON,\
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
;@ pal_battle   PAL_AQUASAND
;@ pal_altbattle PAL_PEWTER
;@ pal_icon     PAL_ICON_05
;@ pal_alticon  PAL_ICON_06
;@ evo         EVOLVE_LEVEL, 16, WARTORTLE
;@ evo_move    MACH_PUNCH
;@ evo_react   NONE
;@ learn       6, BUBBLE
;@ learn       8, HARDEN
;@ learn       11, SUPER_SOAK
;@ learn       14, SEISMIC_TOSS
;@ learn       18, BITE
;@ learn       23, SHELL_GAME
;@ learn       28, CLAMP
;@ learn       33, CLOBBERCLOCK
;@ learn       40, BLOOD_RUSH
;@ learn       44, METEOR_DRIVE
;@ learn       50, HYDRO_PUMP
;@ learn       56, SUBMISSION
;@ tutor       CLOBBERCLOCK
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
;@ tutor       EGG_BOMB
