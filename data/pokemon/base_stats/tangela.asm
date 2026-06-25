	db DEX_TANGELA ; pokedex id

	db  65,  55, 140,  60, 100
	;   hp  atk  def  spd  spc

	db GRASS, WATER ; type
	db 85 ; catch rate
	db 166 ; base exp

	INCBIN "gfx/pokemon/front/tangela.pic", 0, 1 ; sprite dimensions
	dw TangelaPicFront, TangelaPicBackSW

	db VINE_WHIP, BUBBLE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

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
	AURORA_MIST,\
	HYPER_BEAM,\
	CALM_MIND,\
	BARRIER,\
	ADAPTATION,\
	SOLARBEAM,\
	RIPTIDE,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	STRENGTH,\
	FLASH
	; end


	db BANK(TangelaPicFront)
	db 0
	db BANK(TangelaPicBack)
	db BANK(TangelaPicBackSW)

	dw 0, TangelaPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CAUTIOUS NATURE_DITZ
;@ pal_battle   PAL_KELPMON
;@ pal_altbattle PAL_REDPURPLEMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       14, POISONPOWDER
;@ learn       18, WRAP
;@ learn       23, MEGA_DRAIN
;@ learn       26, WATER_PULSE
;@ learn       30, SHELL_GAME
;@ learn       34, SPORE
;@ learn       44, POWER_BIND
;@ learn       49, HYDRO_PUMP
;@ learn       54, VENOM_LASH
;@ tutor       EXPLOSION
;@ tutor       SOULSTEALER
;@ tutor       EGG_BOMB
;@ tutor       SCREECH
