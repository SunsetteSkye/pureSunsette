	db DEX_HORSEA ; pokedex id

	db  30,  40,  70,  60,  70
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 225 ; catch rate
	db 83 ; base exp

	INCBIN "gfx/pokemon/front/horsea.pic", 0, 1 ; sprite dimensions
	dw HorseaPicFront, HorseaPicBackSW

	db BUBBLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	DISABLE,\
	TOXIC,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	ICE_BEAM,\
	BLIZZARD,\ ; SLEET STORM
	AMNESIA,\
	BARRIER,\
	DRAGON_RAGE,\ ; WYRM WRATH
	MEGA_DRAIN,\
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	SLUDGE,\ ; SLUDGE BOMB
	SUBSTITUTE,\
	SURF,\
	FLASH
	; end


	db BANK(HorseaPicFront)
	db 0
	db BANK(HorseaPicBack)
	db BANK(HorseaPicBackSW)

	dw 0, HorseaPicBack

