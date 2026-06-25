	db DEX_SEADRA ; pokedex id

	db  55,  65,  95,  85,  120
	;   hp  atk  def  spd  spc

	db WATER, DRAGON ; type
	db 95 ; catch rate
	db 155 ; base exp

	INCBIN "gfx/pokemon/front/seadra.pic", 0, 1 ; sprite dimensions
	dw SeadraPicFront, SeadraPicBackSW

	db BUBBLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	LEAP_ATTACK,\
	ADAPTATION,\
	MUD_BOMB,\
	PIN_MISSILE,\
	TOXIC,\
	DISABLE,\
	DOUBLE_EDGE,\
	AQUA_RING,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	CALM_MIND,\
	BARRIER,\
	WYRM_WRATH,\
	RIPTIDE,\
	MEGA_DRAIN,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	FIRE_BLAST,\
	TEMPEST,\
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	SURF,\
	FLASH
	; end

	db BANK(SeadraPicFront)
	db 0
	db BANK(SeadraPicBack)
	db BANK(SeadraPicBackSW)

	dw 0, SeadraPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CAUTIOUS NATURE_SCRAPPY
;@ pal_battle   PAL_CERULEAN
;@ pal_altbattle PAL_KELPMON
;@ pal_icon     PAL_ICON_58
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   "Its spines flare" "up with a hiss!"
;@ evo_react   "It darts off in" "a swift spiral!"
;@ evo_react   "It puffs up," "fins fanned out!"
;@ evo_react   "It spits a jet" "of stinging water!"
;@ learn       14, SUPER_SOAK
;@ learn       17, SMOKESCREEN
;@ learn       21, GUST
;@ learn       24, WATER_PULSE
;@ learn       26, AGILITY
;@ learn       31, TEMPEST
;@ learn       35, RIPTIDE
;@ learn       39, DOUBLE_TEAM
;@ learn       44, WYRM_WRATH
;@ learn       49, HYDRO_PUMP
