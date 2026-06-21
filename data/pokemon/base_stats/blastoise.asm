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
	HYPER_BEAM,\
	CALM_MIND,\
	LOW_KICK,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	BARRIER,\
	EARTHQUAKE,\
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
;@ learn       14, LOW_KICK
;@ learn       18, BITE
;@ learn       23, SHELL_GAME
;@ learn       28, CLAMP
;@ learn       33, DIZZY_PUNCH
;@ learn       35, BLOOD_RUSH
;@ learn       42, METEOR_DRIVE
;@ learn       50, HYDRO_PUMP
