	db DEX_GOLBAT ; pokedex id

	db  75,  95,  75,  101,  75
	;   hp  atk  def  spd  spc

	db POISON, FLYING ; type
	db 90 ; catch rate
	db 171 ; base exp

	INCBIN "gfx/pokemon/front/golbat.pic", 0, 1 ; sprite dimensions
	dw GolbatPicFront, GolbatPicBackSW

	db GUST, ABSORB, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	SONICBOOM,\ ; ILL WIND
	RAZOR_WIND,\ ; ROOST
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	BARRIER,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	SLAM,\ ; WASTEMAKER
	LOVELY_KISS,\
	PSYWAVE,\ ; MINDWIPE
	SLUDGE,\ ; SLUDGE BOMB
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLY
	; end

	db BANK(GolbatPicFront)
	db BANK(GolbatPicFrontAlt)
	db BANK(GolbatPicBack)
	db BANK(GolbatPicBackSW)

	dw GolbatPicFrontAlt, GolbatPicBack

