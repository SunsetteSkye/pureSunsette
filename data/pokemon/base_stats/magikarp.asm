	db DEX_MAGIKARP ; pokedex id

	db  20,  10,  55,  80,  20
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 255 ; catch rate
	db 20 ; base exp

	INCBIN "gfx/pokemon/front/magikarp.pic", 0, 1 ; sprite dimensions
	dw MagikarpPicFront, MagikarpPicBackSW

	db SPLASH, TACKLE, BUBBLE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	LEAP_ATTACK,\
	DISABLE,\
	AQUA_RING,\
	BULK_UP,\
	TEMPEST
	; end


	db BANK(MagikarpPicFront)
	db 0
	db BANK(MagikarpPicBack)
	db BANK(MagikarpPicBackSW)

	dw 0, MagikarpPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_DITZ NATURE_NONE
;@ pal_battle   PAL_EMBERMON
;@ pal_altbattle PAL_GAMEFREAK
;@ pal_icon     PAL_ICON_04
;@ pal_alticon  PAL_ICON_67
;@ evo         EVOLVE_LEVEL, 30, GYARADOS
;@ evo         15, TACKLE
;@ evo         20, BITE
;@ evo         25, LEER
;@ evo_move    NO_MOVE
;@ evo_react   NONE
