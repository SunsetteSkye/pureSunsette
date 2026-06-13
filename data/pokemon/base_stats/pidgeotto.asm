	db DEX_PIDGEOTTO ; pokedex id

	db  63,  70,  55, 86,  80
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 120 ; catch rate
	db 113 ; base exp

	INCBIN "gfx/pokemon/front/pidgeotto.pic", 0, 1 ; sprite dimensions
	dw PidgeottoPicFront, PidgeottoPicBackSW

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	DISABLE,\
	SONICBOOM,\ ; ILL WIND
	RAZOR_WIND,\ ; ROOST
	PIN_MISSILE,\
	TOXIC,\
	DOUBLE_EDGE,\
	DRAGON_RAGE,\ ; WYRM WRATH
	BARRIER,\
	RAZOR_LEAF,\
	THUNDERBOLT,\
	THUNDER,\
	SWORDS_DANCE,\
	KINESIS,\ ; MIRAGE
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	SLAM,\ ; WASTEMAKER
	SKY_ATTACK,\
	LIGHT_SCREEN,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	FLASH
	; end

	db BANK(PidgeottoPicFront)
	db BANK(PidgeottoPicFrontAlt)
	db BANK(PidgeottoPicBack)
	db BANK(PidgeottoPicBackSW)

	dw PidgeottoPicFrontAlt, PidgeottoPicBack

