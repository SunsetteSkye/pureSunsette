	db DEX_IVYSAUR ; pokedex id

	db  80,  62,  63,  60,  80
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 141 ; base exp

	INCBIN "gfx/pokemon/front/ivysaur.pic", 0, 1 ; sprite dimensions
	dw IvysaurPicFront, IvysaurPicBackSW

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	MUD_BOMB,\
	PIN_MISSILE,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AQUA_RING,\
	CALM_MIND,\
	LOW_KICK,\
	METEOR_SWEEP,\
	BARRIER,\
	ADAPTATION,\
	SOLARBEAM,\ 
	DIG,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	TWISTER,\
	VOID_MIND,\
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	ROCK_ON,\
	SUBSTITUTE,\
	CUT,\
	FLASH
	; end

	db BANK(IvysaurPicFront)
	db 0
	db BANK(IvysaurPicBack)
	db BANK(IvysaurPicBackSW)

	dw 0, IvysaurPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_GENTLE NATURE_CAUTIOUS
;@ pal_battle   PAL_ICON_02
;@ pal_altbattle PAL_IVYALT
;@ pal_icon     PAL_ICON_02
;@ pal_alticon  $FF
;@ evo         EVOLVE_LEVEL, 32, VENUSAUR
;@ evo_move    NO_MOVE
;@ evo_react   "It hops up," "ready to go!"
;@ evo_react   "Its bud swells," "full of new life!"
;@ evo_react   "Roots burst out," "gripping the dirt!"
;@ evo_react   "Fresh leaves open" "into the sun!"
;@ learn_like  BULBASAUR
