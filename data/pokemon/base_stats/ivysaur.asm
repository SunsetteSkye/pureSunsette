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
	DISABLE,\
	SWORDS_DANCE,\
	SHADOW_GAME,\
	TOXIC,\
	SLUDGE_BOMB,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	WATER_PULSE,\
	SUPER_SOAK,\
	GIGA_DRAIN,\
	MEGA_DRAIN,\
	SOLARBEAM,\
	MUD_BOMB,\
	DIG,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	ILL_WIND,\
	SHADOW_BALL,\
	BARRIER,\
	METEOR_SWEEP,\
	SUBSTITUTE,\
	AQUA_RING,\
	ADAPTATION,\
	CALM_MIND,\
	VOID_MIND,\
	PSYCHO_SHIFT,\
	LEAP_ATTACK,\
	PIN_MISSILE,\
	LEECH_LIFE,\
	TEMPEST,\
	ROCK_ON,\
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
;@ evo_move    SENBONZAKURA
;@ evo_react   "It hops up," "ready to go!"
;@ evo_react   "Its bud swells," "full of new life!"
;@ evo_react   "Roots burst out," "gripping the dirt!"
;@ evo_react   "Fresh leaves open" "into the sun!"
;@ learn_like  BULBASAUR
;@ tutor       PISTON_KICK
;@ tutor       HURRICANE
;@ tutor       METEOR_DRIVE
;@ tutor       EGG_BOMB
