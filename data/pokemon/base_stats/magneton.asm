; Sunsette: has a variant form -> base_stats/floating_magneton.asm (Floating Magneton).
	db DEX_MAGNETON ; pokedex id

	db  65,  60,  95,  70, 120
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 60 ; catch rate
	db 161 ; base exp

	INCBIN "gfx/pokemon/front/magneton.pic", 0, 1 ; sprite dimensions
	dw MagnetonPicFront, MagnetonPicBackSW

	db TACKLE, SCREECH, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	HYPER_BEAM,\
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

	db BANK(MagnetonPicFront)
	db 0
	db BANK(MagnetonPicBack)
	db BANK(MagnetonPicBackSW)

	dw 0, MagnetonPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CALCULATING NATURE_STOLID
;@ pal_battle   PAL_IRONMON
;@ pal_altbattle PAL_AMBERMON
;@ pal_icon     PAL_ICON_42
;@ pal_alticon  PAL_ICON_43
;@ evo_move    NO_MOVE
;@ evo_react   "It floats away" "quietly."
;@ evo_react   "Its three units" "hum in unison."
;@ evo_react   "Sparks arc between" "its cores!"
;@ evo_react   "It hovers still," "faintly buzzing."
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
