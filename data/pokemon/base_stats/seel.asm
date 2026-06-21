	db DEX_SEEL ; pokedex id

	db  65,  45,  55,  45,  70
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 190 ; catch rate
	db 100 ; base exp

	INCBIN "gfx/pokemon/front/seel.pic", 0, 1 ; sprite dimensions
	dw SeelPicFront, SeelPicBackSW

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
	CALM_MIND,\
	BARRIER,\
	RIPTIDE,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	TWISTER,\
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	SURF,\
	STRENGTH,\
	FLASH
	; end


	db BANK(SeelPicFront)
	db 0
	db BANK(SeelPicBack)
	db BANK(SeelPicBackSW)

	dw 0, SeelPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_GENTLE NATURE_CAUTIOUS
;@ pal_battle   PAL_PEARLMON
;@ pal_altbattle PAL_AQUAMON
;@ pal_icon     PAL_ICON_45
;@ pal_alticon  PAL_ICON_46
;@ evo         EVOLVE_LEVEL, 27, DEWGONG
;@ evo_move    NO_MOVE
;@ evo_react   NONE
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
