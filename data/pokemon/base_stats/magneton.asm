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
	DISABLE,\
	AURORA_MIST,\
	SHADOW_GAME,\
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
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

	db BANK(MagnetonPicFront)
	db 0
	db BANK(MagnetonPicBack)
	db BANK(MagnetonPicBackSW)

	dw 0, MagnetonPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_STOLID NATURE_CALCULATING
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
