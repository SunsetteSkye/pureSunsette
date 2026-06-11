	db DEX_GASTLY ; pokedex id

	db  30,  35,  30,  80, 100
	;   hp  atk  def  spd  spc

	db GHOST, FLOATING ; type
	db 190 ; catch rate
	db 95 ; base exp

	INCBIN "gfx/pokemon/front/gastly.pic", 0, 1 ; sprite dimensions
	dw GastlyPicFront, GastlyPicBackSW

	db LICK, HAZE, GUST, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	DISABLE,\
	SONICBOOM,\ ; ILL WIND
	TOXIC,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	THUNDERBOLT,\
	THUNDER,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	KINESIS,\ ; MIRAGE
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	SLAM,\ ; WASTEMAKER
	LOVELY_KISS,\
	PSYWAVE,\ ; MINDWIPE
	SLUDGE,\ ; SLUDGE BOMB
	GLARE,\
	SUBSTITUTE,\
	FLASH
	; end


	db BANK(GastlyPicFront)
	db 0
	db BANK(GastlyPicBack)
	db BANK(GastlyPicBackSW)

	dw 0, GastlyPicBack

