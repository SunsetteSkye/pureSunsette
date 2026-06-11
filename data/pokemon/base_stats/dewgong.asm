	db DEX_DEWGONG ; pokedex id

	db  90,  70,  80,  90,  95
	;   hp  atk  def  spd  spc

	db WATER, ICE ; type
	db 75 ; catch rate
	db 176 ; base exp

	INCBIN "gfx/pokemon/front/dewgong.pic", 0, 1 ; sprite dimensions
	dw DewgongPicFront, DewgongPicBackSW

	db TACKLE, WATER_GUN, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	DISABLE,\
	TOXIC,\
	HORN_DRILL,\ ; WICKED DRILL
	BODY_SLAM,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	ICE_BEAM,\
	BLIZZARD,\ ; SLEET STORM
	HYPER_BEAM,\
	AMNESIA,\
	BARRIER,\
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	SLAM,\ ; WASTEMAKER
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	GLARE,\
	SUBSTITUTE,\
	SURF,\
	STRENGTH,\
	FLASH

	db BANK(DewgongPicFront)
	db 0
	db BANK(DewgongPicBack)
	db BANK(DewgongPicBackSW)

	dw 0, DewgongPicBack

