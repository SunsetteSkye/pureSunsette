	db DEX_PIDGEOT ; pokedex id

	db  72,  85,  68, 121, 104
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 65 ; catch rate
	db 172 ; base exp

	INCBIN "gfx/pokemon/front/pidgeot.pic", 0, 1 ; sprite dimensions
	dw PidgeotPicFront, PidgeotPicBackSW

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	tmhm \
	DISABLE,\
	SONICBOOM,\ ; ILL WIND
	RAZOR_WIND,\ ; ROOST
	PIN_MISSILE,\
	TOXIC,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
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
	MEDITATE,\
	LIGHT_SCREEN,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	STRENGTH
	; end


	db BANK(PidgeotPicFront)
	db BANK(PidgeotPicFrontAlt)
	db BANK(PidgeotPicBack)
	db BANK(PidgeotPicBackSW)

	dw PidgeotPicFrontAlt, PidgeotPicBack

