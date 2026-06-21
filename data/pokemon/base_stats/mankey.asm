	db DEX_MANKEY ; pokedex id

	db  40,  80,  35,  70,  50
	;   hp  atk  def  spd  spc

	db NORMAL, FIGHTING ; type
	db 190 ; catch rate
	db 74 ; base exp

	INCBIN "gfx/pokemon/front/mankey.pic", 0, 1 ; sprite dimensions
	dw MankeyPicFront, MankeyPicBackSW

	db SCRATCH, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ADAPTATION,\
	FROST_FIST,\
	MUD_BOMB,\
	BLAZE_HAMMER,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	LOW_KICK,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	WYRM_WRATH,\
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
	DIG,\
	SWORDS_DANCE,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	DEMOLISH,\
	VOID_MIND,\
	SHADOW_GAME,\
	ROCK_SLIDE,\
	ROCK_ON,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
	CUT,\
	STRENGTH
	; end


	db BANK(MankeyPicFront)
	db BANK(MankeyPicFrontAlt)
	db BANK(MankeyPicBack)
	db BANK(MankeyPicBackSW)

	dw MankeyPicFrontAlt, MankeyPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_RAGE NATURE_HYPER
;@ pal_battle   PAL_MOCHAMON
;@ pal_altbattle PAL_REDBAR
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo         EVOLVE_LEVEL, 27, PRIMEAPE
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       9, DEMOLISH
;@ learn       12, MUD_CLAW
;@ learn       15, SCREECH
;@ learn       18, FOCUS_ENERGY
;@ learn       20, LOW_KICK
;@ learn       23, SEISMIC_TOSS
;@ learn       25, BLOOD_RUSH
;@ learn       27, ILL_WIND
;@ learn       35, UNDERBUG
;@ learn       39, MACH_PUNCH
;@ learn       45, SHADOW_BOX
;@ learn       51, OUTRAGE
;@ learn       54, COMBOBREAKER
