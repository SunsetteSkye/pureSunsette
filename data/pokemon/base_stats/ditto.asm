	db DEX_DITTO ; pokedex id

	db  90,  48,  48,  48,  48
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 95 ; base exp

	INCBIN "gfx/pokemon/front/ditto.pic", 0, 1 ; sprite dimensions
	dw DittoPicFront, DittoPicBackSW

	db TRANSFORM, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ROCK_ON,\
	ADAPTATION,\
	AURORA_MIST

	db BANK(DittoPicFront)
	db 0
	db BANK(DittoPicBack)
	db BANK(DittoPicBackSW)

	dw 0, DittoPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CALCULATING NATURE_DITZ
;@ pal_battle   PAL_PINKMON
;@ pal_altbattle PAL_GREENMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_react   NONE
