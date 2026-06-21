	db DEX_VENUSAUR ; pokedex id

	db 100,  82,  83,  80, 100
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 208 ; base exp

	INCBIN "gfx/pokemon/front/venusaur.pic", 0, 1 ; sprite dimensions
	dw VenusaurPicFront, VenusaurPicBackSW

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
	HYPER_BEAM,\
	CALM_MIND,\
	LOW_KICK,\
	METEOR_SWEEP,\
	BARRIER,\
	ADAPTATION,\
	SOLARBEAM,\ 
	WYRM_WRATH,\
	EARTHQUAKE,\
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
	STRENGTH,\
	FLASH
	; end

	db BANK(VenusaurPicFront)
	db 0
	db BANK(VenusaurPicBack)
	db BANK(VenusaurPicBackSW)

	dw 0, VenusaurPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_STOLID NATURE_WISE
;@ pal_battle   PAL_ICON_02
;@ pal_altbattle PAL_IVYALT
;@ pal_icon     PAL_ICON_02
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   "A heavy aroma" "settles around it."
;@ evo_react   "Its great bloom" "throws open wide!"
;@ evo_react   "Petals fan out," "drinking in light!"
;@ evo_react   "It plants itself," "vast and unmoving."
;@ learn       6, LEECH_SEED
;@ learn       8, VINE_WHIP
;@ learn       11, POISONPOWDER
;@ learn       14, ADAPTATION
;@ learn       18, STUN_SPORE
;@ learn       21, RAZOR_LEAF
;@ learn       25, EMETIC_PURGE
;@ learn       33, SLEEP_POWDER
;@ learn       38, VENOM_LASH
;@ learn       45, SENBONZAKURA
;@ learn       52, TOXIC
