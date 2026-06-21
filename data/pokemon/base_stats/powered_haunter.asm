; Sunsette VARIANT FORM: Powered Haunter, an alternate form of HAUNTER. Its base data reuses HAUNTER's dex slot (db DEX_HAUNTER). See base_stats/haunter.asm.
	db DEX_HAUNTER ; pokedex id

	db  60,  65,  60, 110, 130
	;   hp  atk  def  spd  spc

	db GHOST, FLOATING ; type
	db 45 ; catch rate
	db 190 ; base exp

	INCBIN "gfx/pokemon/front/haunter.pic", 0, 1 ; sprite dimensions
	dw HaunterPicFront, HaunterPicBackSW

	db LICK, CONFUSE_RAY, PHANTASM, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	FROST_FIST,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	HYPER_BEAM,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	THUNDERBOLT,\
	THUNDER,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	MIRAGE,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	DEMOLISH,\
	LOVELY_KISS,\
	SKITTERMIND,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH,\
	FLASH
	; end

	db BANK(HaunterPicFront)
	db 0
	db BANK(HaunterPicBack)
	db BANK(HaunterPicBackSW)

	dw 0, HaunterPicBack

