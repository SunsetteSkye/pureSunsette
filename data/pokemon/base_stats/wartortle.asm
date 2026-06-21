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
;@ evo_move    NO_MOVE
;@ evo_react   "It hunches down," "tail flowing."
;@ evo_react   "It surges up" "in a foam burst!"
;@ evo_react   "Its furred tail" "swishes proudly!"
;@ evo_react   "It snaps its jaws" "with a sharp bite!"
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
