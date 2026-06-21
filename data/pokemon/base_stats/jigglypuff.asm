	db DEX_JIGGLYPUFF ; pokedex id

	db 115,  45,  20,  20,  25
	;   hp  atk  def  spd  spc

	db NORMAL, FLOATING ; type
	db 170 ; catch rate
	db 76 ; base exp

	INCBIN "gfx/pokemon/front/jigglypuff.pic", 0, 1 ; sprite dimensions
	dw JigglypuffPicFront, JigglypuffPicBackSW

	db TACKLE, SING, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ROCK_ON,\
	ADAPTATION,\
	FROST_FIST,\
	BLAZE_HAMMER,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	ICE_BEAM,\
	BLIZZARD,\
	CALM_MIND,\
	LOW_KICK,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	BARRIER,\
	SOLARBEAM,\ 
	THUNDERBOLT,\
	THUNDER,\
	DIG,\
	PSYCHIC_M,\
	MIRAGE,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	FIRE_BLAST,\
	DEMOLISH,\
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	SKITTERMIND,\
	SUBSTITUTE,\
	FLY,\
	STRENGTH,\
	FLASH
	; end


	db BANK(JigglypuffPicFront)
	db 0
	db BANK(JigglypuffPicBack)
	db BANK(JigglypuffPicBackSW)

	dw 0, JigglypuffPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_PLAYFUL NATURE_CONSIDERATE
;@ pal_battle   PAL_JIGGMON
;@ pal_altbattle PAL_IVORYMON
;@ pal_icon     PAL_ICON_26
;@ pal_alticon  PAL_ICON_27
;@ evo         EVOLVE_ITEM, MOON_STONE, 1, WIGGLYTUFF
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       9, DISABLE
;@ learn       13, ROCK_ON
;@ learn       16, DOUBLESLAP
;@ learn       24, BODY_SLAM
;@ learn       32, MINIMIZE
;@ learn       37, DIZZY_PUNCH
;@ learn       42, DOUBLE_EDGE
;@ learn       50, MAXIMIZE
;@ learn       55, SOULSTEALER
;@ learn       60, EXPLOSION
