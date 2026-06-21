	db DEX_DRATINI ; pokedex id

	db  41,  64,  45,  50,  50
	;   hp  atk  def  spd  spc

	db DRAGON, DRAGON ; type
	db 45 ; catch rate
	db 67 ; base exp

	INCBIN "gfx/pokemon/front/dratini.pic", 0, 1 ; sprite dimensions
	dw DratiniPicFront, DratiniPicBackSW

	db WRAP, LEER, BELLOW, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	ADAPTATION,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	ICE_BEAM,\
	BLIZZARD,\
	SOLARBEAM,\ 
	WYRM_WRATH,\
	THUNDERBOLT,\
	THUNDER,\
	RIPTIDE,\
	MIRAGE,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	FIRE_BLAST,\
	TWISTER,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	FLASH
	; end


	db BANK(DratiniPicFront)
	db 0
	db BANK(DratiniPicBack)
	db BANK(DratiniPicBackSW)

	dw 0, DratiniPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_WISE NATURE_CAUTIOUS
;@ pal_battle   PAL_ICON_59
;@ pal_altbattle PAL_ICON_62
;@ pal_icon     PAL_ICON_69
;@ pal_alticon  PAL_ICON_09
;@ evo         EVOLVE_LEVEL, 30, DRAGONAIR
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       20, THUNDER_WAVE
;@ learn       25, RIPTIDE
;@ learn       29, AURORA_MIST
;@ learn       33, TWISTER
;@ learn       38, BLITZ_STRIKE
;@ learn       46, AGILITY
;@ learn       52, HYPER_BEAM
;@ learn       60, OUTRAGE
