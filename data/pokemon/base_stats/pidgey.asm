	db DEX_PIDGEY ; pokedex id

	db  40,  45,  40,  66,  49
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 255 ; catch rate
	db 55 ; base exp

	INCBIN "gfx/pokemon/front/pidgey.pic", 0, 1 ; sprite dimensions
	dw PidgeyPicFront, PidgeyPicBackSW

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	FURY_ATTACK,\ ; MUD BOMB
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
	KARATE_CHOP,\
	SKY_ATTACK,\ ; BRAVE BIRD
	LIGHT_SCREEN,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	FLASH
	; end


	db BANK(PidgeyPicFront)
	db 0
	db BANK(PidgeyPicBack)
	db BANK(PidgeyPicBackSW)

	dw 0, PidgeyPicBack

