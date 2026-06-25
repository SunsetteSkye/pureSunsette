; Sunsette VARIANT FORM: Floating Magneton, an alternate form of MAGNETON. Its base data reuses MAGNETON's dex slot (db DEX_MAGNETON). See base_stats/magneton.asm.
	db DEX_MAGNETON ; pokedex id

	db  65,  60,  95,  70, 120
	;   hp  atk  def  spd  spc

	db ELECTRIC, FLOATING ; type
	db 60 ; catch rate
	db 161 ; base exp

	INCBIN "gfx/pokemon/front/floating_magneton.pic", 0, 1 ; sprite dimensions
	dw FloatingMagnetonPicFront, MagnetonPicBackSW

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

	db BANK(FloatingMagnetonPicFront)
	db 0
	db BANK(MagnetonPicBack)
	db BANK(MagnetonPicBackSW)

	dw 0, MagnetonPicBack

