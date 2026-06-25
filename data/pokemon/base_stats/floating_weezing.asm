; Sunsette VARIANT FORM: Floating Weezing, an alternate form of WEEZING. Its base data reuses WEEZING's dex slot (db DEX_WEEZING). See base_stats/weezing.asm.
	db DEX_WEEZING ; pokedex id

	db  85,  90, 120,  60,  85
	;   hp  atk  def  spd  spc

	db POISON, FLOATING ; type
	db 70 ; catch rate
	db 173 ; base exp

	INCBIN "gfx/pokemon/front/floating_weezing.pic", 0, 1 ; sprite dimensions
	dw FloatingWeezingPicFront, WeezingPicBackSW

	db TACKLE, SMOG, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ADAPTATION,\
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	CALM_MIND,\
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	FIRE_BLAST,\
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	FLASH
	; end

	db BANK(FloatingWeezingPicFront)
	db 0
	db BANK(WeezingPicBack)
	db BANK(WeezingPicBackSW)

	dw 0, WeezingPicBack

