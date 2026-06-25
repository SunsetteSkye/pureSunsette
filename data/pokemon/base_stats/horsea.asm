	db DEX_HORSEA ; pokedex id

	db  30,  40,  70,  60,  70
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 225 ; catch rate
	db 83 ; base exp

	INCBIN "gfx/pokemon/front/horsea.pic", 0, 1 ; sprite dimensions
	dw HorseaPicFront, HorseaPicBackSW

	db BUBBLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	LEAP_ATTACK,\
	MUD_BOMB,\
	TOXIC,\
	DISABLE,\
	DOUBLE_EDGE,\
	AQUA_RING,\
	ICE_BEAM,\
	BLIZZARD,\
	CALM_MIND,\
	BARRIER,\
	WYRM_WRATH,\
	RIPTIDE,\
	MEGA_DRAIN,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	TEMPEST,\
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	SURF,\
	FLASH
	; end


	db BANK(HorseaPicFront)
	db 0
	db BANK(HorseaPicBack)
	db BANK(HorseaPicBackSW)

	dw 0, HorseaPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CAUTIOUS NATURE_SCRAPPY
;@ pal_battle   PAL_CERULEAN
;@ pal_altbattle PAL_KELPMON
;@ pal_icon     PAL_ICON_58
;@ pal_alticon  $FF
;@ evo         EVOLVE_LEVEL, 27, SEADRA
;@ evo_move    NO_MOVE
;@ evo_react   NONE
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
