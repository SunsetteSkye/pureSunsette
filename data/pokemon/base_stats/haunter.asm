	db DEX_HAUNTER ; pokedex id

	db  45,  50,  45,  95, 115
	;   hp  atk  def  spd  spc

	db GHOST, FLOATING ; type
	db 90 ; catch rate
	db 126 ; base exp

	INCBIN "gfx/pokemon/front/haunter.pic", 0, 1 ; sprite dimensions
	dw HaunterPicFront, HaunterPicBackSW

	db LICK, HAZE, GUST, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	DISABLE,\
	SONICBOOM,\ ; ILL WIND
	ICE_PUNCH,\ ; FROST FIST
	TOXIC,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	THUNDERPUNCH,\ ; ZAPPERCUT
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
	PSYWAVE,\ ; SKITTERMIND
	SLUDGE,\ ; SLUDGE BOMB
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLASH
	; end

	db BANK(HaunterPicFront)
	db 0
	db BANK(HaunterPicBack)
	db BANK(HaunterPicBackSW)

	dw 0, HaunterPicBack

