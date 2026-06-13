	db DEX_EKANS ; pokedex id

	db  35,  60,  44,  55,  40
	;   hp  atk  def  spd  spc

	db POISON, NORMAL ; type
	db 255 ; catch rate
	db 90 ; base exp

	INCBIN "gfx/pokemon/front/ekans.pic", 0, 1 ; sprite dimensions
	dw EkansPicFront, EkansPicBackSW

	db WRAP, LEER, POISON_STING, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	DISABLE,\
	SONICBOOM,\ ; ILL WIND
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	BARRIER,\
	EARTHQUAKE,\
	DIG,\
	MEGA_DRAIN,\
	KINESIS,\ ; MIRAGE
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	SLAM,\ ; WASTEMAKER
	KARATE_CHOP,\
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	SLUDGE,\ ; SLUDGE BOMB
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH
	; end


	db BANK(EkansPicFront)
	db 0
	db BANK(EkansPicBack)
	db BANK(EkansPicBackSW)

	dw 0, EkansPicBack

