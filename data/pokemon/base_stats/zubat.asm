	db DEX_ZUBAT ; pokedex id

	db  40,  45,  35,  55,  40
	;   hp  atk  def  spd  spc

	db POISON, FLYING ; type
	db 255 ; catch rate
	db 54 ; base exp

	INCBIN "gfx/pokemon/front/zubat.pic", 0, 1 ; sprite dimensions
	dw ZubatPicFront, ZubatPicBackSW

	db GUST, ABSORB, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	SONICBOOM,\ ; ILL WIND
	RAZOR_WIND,\ ; ROOST
	TOXIC,\
	DISABLE,\
	DOUBLE_EDGE,\
	BARRIER,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	SLAM,\ ; WASTEMAKER
	LOVELY_KISS,\
	PSYWAVE,\ ; MINDWIPE
	SLUDGE,\ ; SLUDGE BOMB
	SUBSTITUTE,\
	CUT,\
	FLY
	; end


	db BANK(ZubatPicFront)
	db 0
	db BANK(ZubatPicBack)
	db BANK(ZubatPicBackSW)

	dw 0, ZubatPicBack

