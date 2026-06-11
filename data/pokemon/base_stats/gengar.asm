	db DEX_GENGAR ; pokedex id

	db  60,  65,  60, 110, 130
	;   hp  atk  def  spd  spc

	db GHOST, FLOATING ; type
	db 45 ; catch rate
	db 190 ; base exp

	INCBIN "gfx/pokemon/front/gengar.pic", 0, 1 ; sprite dimensions
	dw GengarPicFront, GengarPicBackSW

	db LICK, HAZE, GUST, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	DISABLE,\
	SONICBOOM,\ ; ILL WIND
	ICE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	HYPER_BEAM,\
	LOW_KICK,\
	THUNDERPUNCH,\
	ROLLING_KICK,\ ; METEOR SWEEP
	THUNDERBOLT,\
	THUNDER,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	KINESIS,\ ; MIRAGE
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	SLAM,\ ; WASTEMAKER
	KARATE_CHOP,\
	LOVELY_KISS,\
	PSYWAVE,\ ; MINDWIPE
	SLUDGE,\ ; SLUDGE BOMB
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH,\
	FLASH
	; end

	db BANK(GengarPicFront)
	db BANK(GengarPicFrontAlt)
	db BANK(GengarPicBack)
	db BANK(GengarPicBackSW)

	dw GengarPicFrontAlt, GengarPicBack

