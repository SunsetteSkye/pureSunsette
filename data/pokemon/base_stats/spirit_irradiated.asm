	db DEX_HITMONCHAN ; pokedex id

	db  90, 115,  115,  50,  115
	;   hp  atk  def  spd  spc

	db FIGHTING, GHOST ; type
	db 95 ; catch rate
	db 140 ; base exp

	INCBIN "gfx/battle/spirit_irradiated.pic", 0, 1 ; sprite dimensions
	dw IrradiatedPicFront, HitmonchanPicBackSW

	db GROWTH, SLUDGE, STRUGGLE, DRAGON_RAGE ; level 1 learnset (WYRM WRATH, FLOURISH) (SLUDGE BOMB)
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	SONICBOOM,\ ; ILL WIND
	ICE_PUNCH,\
	FIRE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	LOW_KICK,\
	THUNDERPUNCH,\
	ROLLING_KICK,\ ; METEOR SWEEP
	BARRIER,\
	EARTHQUAKE,\
	SWORDS_DANCE,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	SLAM,\ ; WASTEMAKER
	KARATE_CHOP,\
	MEDITATE,\ ; VOID MIND
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH
	; end

	db BANK(IrradiatedPicFront)
	db 0
	db BANK(HitmonchanPicBack)
	db BANK(HitmonchanPicBackSW)

	dw 0, HitmonchanPicBack

