	db DEX_CATERPIE ; pokedex id

	db  45,  30,  35,  45,  20
	;   hp  atk  def  spd  spc

	db BUG, BUG ; type
	db 255 ; catch rate
	db 53 ; base exp

	INCBIN "gfx/pokemon/front/caterpie.pic", 0, 1 ; sprite dimensions
	dw CaterpiePicFront, CaterpiePicBackSW

	db TACKLE, STRING_SHOT, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	DISABLE,\
	SHADOW_GAME,\
	TOXIC,\
	DOUBLE_EDGE,\
	MEGA_DRAIN,\
	REFLECT,\
	LIGHT_SCREEN,\
	BARRIER,\
	SUBSTITUTE,\
	ADAPTATION,\
	CLAY_ARMOR,\
	CUT,\
	FLASH
	; end

	db BANK(CaterpiePicFront)
	db 0
	db BANK(CaterpiePicBack)
	db BANK(CaterpiePicBackSW)

	dw 0, CaterpiePicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_GENTLE NATURE_GLUTTON
;@ pal_battle   PAL_GREENBAR
;@ pal_altbattle PAL_WHITEMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo         EVOLVE_LEVEL, 7, METAPOD
;@ evo_move    HARDEN
;@ evo_react   NONE
