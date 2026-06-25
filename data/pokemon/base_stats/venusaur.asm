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
	DISABLE,\
	SWORDS_DANCE,\
	SHADOW_GAME,\
	TOXIC,\
	SLUDGE_BOMB,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	WATER_PULSE,\
	SUPER_SOAK,\
	HYPER_BEAM,\
	GIGA_DRAIN,\
	MEGA_DRAIN,\
	SOLARBEAM,\
	EARTHQUAKE,\
	MUD_BOMB,\
	DIG,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	ILL_WIND,\
	SHADOW_BALL,\
	BARRIER,\
	METEOR_SWEEP,\
	ROCK_SLIDE,\
	OROCLASM,\
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
;@ learn       35, SLEEP_POWDER
;@ learn       40, VENOM_LASH
;@ learn       47, TOXIC
;@ learn       56, SOLARBEAM
;@ tutor       PISTON_KICK
;@ tutor       HURRICANE
;@ tutor       METEOR_DRIVE
;@ tutor       EGG_BOMB
