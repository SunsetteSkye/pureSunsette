	db DEX_BLASTOISE ; pokedex id

	db  79,  93, 115,  63,  95
	;   hp  atk  def  spd  spc

	db WATER, FIGHTING ; type
	db 45 ; catch rate
	db 210 ; base exp

	INCBIN "gfx/pokemon/front/blastoise.pic", 0, 1 ; sprite dimensions
	dw BlastoisePicFront, BlastoisePicBackSW

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
	HYPER_BEAM,\
	ZAPPERCUT,\
	FROST_FIST,\
	SEISMIC_TOSS,\
	EARTHQUAKE,\
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

	db BANK(BlastoisePicFront)
	db BANK(BlastoisePicFrontAlt)
	db BANK(BlastoisePicBack)
	db BANK(BlastoisePicBackSW)

	dw BlastoisePicFrontAlt, BlastoisePicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_STOLID NATURE_CONSIDERATE
;@ pal_battle   PAL_MUDDYWATER
;@ pal_altbattle PAL_PEWTER
;@ pal_icon     PAL_ICON_08
;@ pal_alticon  PAL_ICON_06
;@ evo_move    NO_MOVE
;@ evo_react   "Look at those" "cannons go! Gonna" "need a poncho!"
;@ evo_react   "It braces low," "cannons aimed!"
;@ evo_react   "Water blasts" "from its shell!"
;@ evo_react   "It stomps forward," "heavy and sure!"
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
