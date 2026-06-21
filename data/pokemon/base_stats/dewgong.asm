	db DEX_DEWGONG ; pokedex id

	db  90,  70,  80,  90,  95
	;   hp  atk  def  spd  spc

	db WATER, ICE ; type
	db 75 ; catch rate
	db 176 ; base exp

	INCBIN "gfx/pokemon/front/dewgong.pic", 0, 1 ; sprite dimensions
	dw DewgongPicFront, DewgongPicBackSW

	db TACKLE, SUPER_SOAK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	MUD_BOMB,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AQUA_RING,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	CALM_MIND,\
	BARRIER,\
	RIPTIDE,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	TWISTER,\
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	SUBSTITUTE,\
	SURF,\
	STRENGTH,\
	FLASH

	db BANK(DewgongPicFront)
	db 0
	db BANK(DewgongPicBack)
	db BANK(DewgongPicBackSW)

	dw 0, DewgongPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_GENTLE NATURE_CAUTIOUS
;@ pal_battle   PAL_FROSTMON
;@ pal_altbattle PAL_CYANMON
;@ pal_icon     PAL_ICON_47
;@ pal_alticon  PAL_ICON_18
;@ evo_move    NO_MOVE
;@ evo_react   "A pleasant chill" "swirls through."
;@ evo_react   "It dives, leaving" "a frosty trail!"
;@ evo_react   "It barks, breath" "fogging cold!"
;@ evo_react   "It glides on ice" "with a happy spin!"
;@ learn       16, HEADBUTT
;@ learn       21, AURORA_BEAM
;@ learn       24, WATER_PULSE
;@ learn       26, VENOM_LASH
;@ learn       30, REST
;@ learn       32, BODY_SLAM
;@ learn       35, ICE_BEAM
;@ learn       39, METEOR_DRIVE
;@ learn       41, AURORA_MIST
;@ learn       43, CALM_MIND
;@ learn       50, BLIZZARD
;@ learn       55, SWIFT
;@ learn       59, SHELL_GAME
