	db DEX_CLEFABLE ; pokedex id

	db  95,  70,  73,  60,  95
	;   hp  atk  def  spd  spc

	db NORMAL, PSYCHIC_TYPE ; type
	db 65 ; catch rate
	db 129 ; base exp

	INCBIN "gfx/pokemon/front/clefable.pic", 0, 1 ; sprite dimensions
	dw ClefablePicFront, ClefablePicBackSW

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ROCK_ON,\
	ADAPTATION,\
	FROST_FIST,\
	BLAZE_HAMMER,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	CALM_MIND,\
	LOW_KICK,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	BARRIER,\
	SOLARBEAM,\ 
	WYRM_WRATH,\
	THUNDERBOLT,\
	THUNDER,\
	DIG,\
	PSYCHIC_M,\
	MIRAGE,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	FIRE_BLAST,\
	DEMOLISH,\
	VOID_MIND,\
	LOVELY_KISS,\
	BRAVE_BIRD,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	SKITTERMIND,\
	SUBSTITUTE,\
	FLY,\
	STRENGTH,\
	FLASH
	; end

	db BANK(ClefablePicFront)
	db 0
	db BANK(ClefablePicBack)
	db BANK(ClefablePicBackSW)

	dw 0, ClefablePicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_PLAYFUL NATURE_GENTLE
;@ pal_battle   PAL_CLEFMON
;@ pal_altbattle PAL_GAMEFREAK
;@ pal_icon     PAL_ICON_23
;@ pal_alticon  PAL_ICON_24
;@ evo_move    NO_MOVE
;@ evo_react   "A finger wiggle," "and up it floats!"
;@ evo_react   "It bounces up" "on springy feet!"
;@ evo_react   "Its wings flick," "sparkling softly!"
;@ evo_react   "It twirls once," "light as a puff!"
;@ learn       13, SING
;@ learn       15, DOUBLESLAP
;@ learn       17, METRONOME
;@ learn       21, PSYBEAM
;@ learn       25, LIGHT_SCREEN
;@ learn       28, MIMIC
;@ learn       33, LOVELY_KISS
;@ learn       38, PSYCHIC_M
;@ learn       45, AURORA_MIST
;@ learn       54, SENBONZAKURA
;@ learn       59, TRI_ATTACK
;@ learn       65, MINIMIZE
