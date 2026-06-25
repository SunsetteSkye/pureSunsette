	db DEX_MAGNEMITE ; pokedex id

	db  25,  35,  70,  45,  95
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 190 ; catch rate
	db 89 ; base exp

	INCBIN "gfx/pokemon/front/magnemite.pic", 0, 1 ; sprite dimensions
	dw MagnemitePicFront, MagnemitePicBackSW

	db TACKLE, SCREECH, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	DISABLE,\
	AURORA_MIST,\
	SHADOW_GAME,\
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	THUNDERBOLT,\
	THUNDER,\
	REFLECT,\
	LIGHT_SCREEN,\
	HEAT_RUSH,\
	ILL_WIND,\
	SHADOW_BALL,\
	BARRIER,\
	ENERGY_FLUX,\
	THUNDER_WAVE,\
	SUBSTITUTE,\
	ADAPTATION,\
	VOID_MIND,\
	PSYCHO_SHIFT,\
	ROCK_ON,\
	FLY,\
	FLASH
	; end


	db BANK(MagnemitePicFront)
	db 0
	db BANK(MagnemitePicBack)
	db BANK(MagnemitePicBackSW)

	dw 0, MagnemitePicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_STOLID NATURE_CALCULATING
;@ pal_battle   PAL_IRONMON
;@ pal_altbattle PAL_AMBERMON
;@ pal_icon     PAL_ICON_42
;@ pal_alticon  PAL_ICON_43
;@ evo         EVOLVE_LEVEL, 30, MAGNETON
;@ evo_move    TRI_ATTACK
;@ evo_react   NONE
;@ learn       13, THUNDERSHOCK
;@ learn       16, THUNDER_WAVE
;@ learn       19, CONVERSION
;@ learn       22, SUPERSONIC
;@ learn       25, SPARK
;@ learn       29, ILL_WIND
;@ learn       33, TELEPORT
;@ learn       37, ENERGY_FLUX
;@ learn       41, PLASMA_BURN
;@ learn       46, PSYSHOCK
;@ learn       52, EXPLOSION
;@ tutor       EXPLOSION
;@ tutor       TRI_ATTACK
;@ tutor       TELEPORT
;@ tutor       SWIFT
;@ tutor       EGG_BOMB
;@ tutor       SCREECH
