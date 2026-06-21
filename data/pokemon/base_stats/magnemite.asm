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
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	MIRAGE,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	VOID_MIND,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	SKITTERMIND,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	FLASH
	; end


	db BANK(MagnemitePicFront)
	db 0
	db BANK(MagnemitePicBack)
	db BANK(MagnemitePicBackSW)

	dw 0, MagnemitePicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CALCULATING NATURE_STOLID
;@ pal_battle   PAL_IRONMON
;@ pal_altbattle PAL_AMBERMON
;@ pal_icon     PAL_ICON_42
;@ pal_alticon  PAL_ICON_43
;@ evo         EVOLVE_LEVEL, 30, MAGNETON
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       13, THUNDERSHOCK
;@ learn       16, SUPERSONIC
;@ learn       19, SPARK
;@ learn       22, THUNDER_WAVE
;@ learn       26, ILL_WIND
;@ learn       31, TELEPORT
;@ learn       34, THUNDERBOLT
;@ learn       38, TRI_ATTACK
;@ learn       43, CONVERSION
;@ learn       47, THUNDER
;@ learn       52, SUPERNOVA
