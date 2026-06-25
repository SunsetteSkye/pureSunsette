; Sunsette VARIANT FORM: Armored Mewtwo, an alternate form of MEWTWO. Its base data reuses MEWTWO's dex slot (db DEX_MEWTWO). See base_stats/mewtwo.asm.
	db DEX_MEWTWO ; pokedex id

	db 130, 110,  130, 115, 154
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 25 ; catch rate
	db 220 ; base exp

	INCBIN "gfx/pokemon/front/armored_mewtwo.pic", 0, 1 ; sprite dimensions
	dw ArmoredMewtwoPicFront, ArmoredMewtwoPicBackSW

	db CONFUSION, DISABLE, SWIFT, PSYCHIC_M ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	FROST_FIST,\
	BLAZE_HAMMER,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	CALM_MIND,\
	FINISHER,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	BARRIER,\
	SOLARBEAM,\
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
	PSYCHIC_M,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	FIRE_BLAST,\
	DEMOLISH,\
	VOID_MIND,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	SKITTERMIND,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH,\
	FLASH
	; end


	db BANK(ArmoredMewtwoPicFront)
	db BANK(ArmoredMewtwoPicFrontAlt)
	db BANK(ArmoredMewtwoPicBack)
	db BANK(ArmoredMewtwoPicBackSW)

	dw ArmoredMewtwoPicFrontAlt, ArmoredMewtwoPicBack

