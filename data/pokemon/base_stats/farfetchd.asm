	db DEX_FARFETCHD ; pokedex id

	db  90,  80,  55,  85,  80
	;   hp  atk  def  spd  spc

	db GRASS, FLYING ; type
	db 85 ; catch rate
	db 130 ; base exp

	INCBIN "gfx/pokemon/front/farfetchd.pic", 0, 1 ; sprite dimensions
	dw FarfetchdPicFront, FarfetchdPicBackSW

	db GUST, BUBBLE, LEER, NO_MOVE
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	FURY_ATTACK,\ ; MUD BOMB
	SONICBOOM,\ ; ILL WIND
	RAZOR_WIND,\ ; ROOST
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	HYPER_BEAM,\
	LOW_KICK,\
	ROLLING_KICK,\ ; METEOR SWEEP
	BARRIER,\
	RAZOR_LEAF,\
	DIG,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	SLAM,\ ; WASTEMAKER
	KARATE_CHOP,\
	MEDITATE,\ ; VOID MIND
	SKY_ATTACK,\ ; BRAVE BIRD
	LIGHT_SCREEN,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	SURF,\
	STRENGTH,\
	FLASH
	; end


	db BANK(FarfetchdPicFront)
	db BANK(FarfetchdPicFrontAlt)
	db BANK(FarfetchdPicBack)
	db BANK(FarfetchdPicBackSW)

	dw FarfetchdPicFrontAlt, FarfetchdPicBack

