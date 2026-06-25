; Sunsette POKEMON TOWER B1F SPIRIT: Spirit (Irradiated). Borrows HITMONCHAN's dex slot for its base data (db DEX_HITMONCHAN). See base_stats/hitmonchan.asm.
	db DEX_HITMONCHAN ; pokedex id

	db  90, 115,  115,  50,  115
	;   hp  atk  def  spd  spc

	db FIGHTING, GHOST ; type
	db 95 ; catch rate
	db 140 ; base exp

	INCBIN "gfx/battle/spirit_irradiated.pic", 0, 1 ; sprite dimensions
	dw IrradiatedPicFront, HitmonchanPicBackSW

	db ADAPTATION, SLUDGE_BOMB, STRUGGLE, WYRM_WRATH ; level 1 learnset (WYRM WRATH, ADAPTATION)
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	LEAP_ATTACK,\
	FROST_FIST,\
	BLAZE_HAMMER,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	FINISHER,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	BARRIER,\
	EARTHQUAKE,\
	SWORDS_DANCE,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	DEMOLISH,\
	VOID_MIND,\
	SHADOW_GAME,\
	ROCK_SLIDE,\
	ROCK_ON,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
	CUT,\
	STRENGTH
	; end

	db BANK(IrradiatedPicFront)
	db 0
	db BANK(HitmonchanPicBack)
	db BANK(HitmonchanPicBackSW)

	dw 0, HitmonchanPicBack

