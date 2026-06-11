	db DEX_ARTICUNO ; pokedex id

	db  90,  85, 100,  85, 125
	;   hp  atk  def  spd  spc

	db ICE, FLYING ; type
	db 25 ; catch rate
	db 215 ; base exp

	INCBIN "gfx/pokemon/front/articuno.pic", 0, 1 ; sprite dimensions
	dw ArticunoPicFront, ArticunoPicBackSW

	db WING_ATTACK, ICE_BEAM, MIST, NO_MOVE ; level 1 learnset (ETHEREAL)
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	SONICBOOM,\ ; ILL WIND
	RAZOR_WIND,\ ; ROOST
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	ICE_BEAM,\
	BLIZZARD,\ ; SLEET STORM
	HYPER_BEAM,\
	AMNESIA,\
	BARRIER,\
	PSYCHIC_M,\
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	SKY_ATTACK,\
	LIGHT_SCREEN,\
	PSYWAVE,\ ; MINDWIPE
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	FLASH
	; end


	db BANK(ArticunoPicFront)
	db BANK(ArticunoPicFrontAlt)
	db BANK(ArticunoPicBack)
	db BANK(ArticunoPicBackSW)

	dw ArticunoPicFrontAlt, ArticunoPicBack

