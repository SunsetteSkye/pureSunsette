	db DEX_WARTORTLE ; pokedex id

	db  59,  73,  90,  58,  65
	;   hp  atk  def  spd  spc

	db WATER, FIGHTING ; type
	db 45 ; catch rate
	db 143 ; base exp

	INCBIN "gfx/pokemon/front/wartortle.pic", 0, 1 ; sprite dimensions
	dw WartortlePicFront, WartortlePicBackSW

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

	db BANK(WartortlePicFront)
	db 0
	db BANK(WartortlePicBack)
	db BANK(WartortlePicBackSW)

	dw 0, WartortlePicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_SCRAPPY NATURE_ARROGANT
;@ pal_battle   PAL_WARTORTLEMON
;@ pal_altbattle PAL_PEWTER
;@ pal_icon     PAL_ICON_07
;@ pal_alticon  PAL_ICON_06
;@ evo         EVOLVE_LEVEL, 36, BLASTOISE
;@ evo_move    SURF
;@ evo_react   "It hunches down," "tail flowing."
;@ evo_react   "It surges up" "in a foam burst!"
;@ evo_react   "Its furred tail" "swishes proudly!"
;@ evo_react   "It snaps its jaws" "with a sharp bite!"
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
