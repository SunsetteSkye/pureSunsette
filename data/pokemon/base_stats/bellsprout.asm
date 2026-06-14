	db DEX_BELLSPROUT ; pokedex id

	db  50,  75,  35,  40,  70
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 255 ; catch rate
	db 84 ; base exp

	INCBIN "gfx/pokemon/front/bellsprout.pic", 0, 1 ; sprite dimensions
	dw BellsproutPicFront, BellsproutPicBackSW

	db VINE_WHIP, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	FURY_ATTACK,\ ; MUD BOMB
	SONICBOOM,\ ; ILL WIND
	PIN_MISSILE,\
	TOXIC,\
	DISABLE,\
	DOUBLE_EDGE,\
	AMNESIA,\ ; CALM MIND
	BARRIER,\
	RAZOR_LEAF,\
	SOLARBEAM,\ ; SOLAR CANNON
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	SLAM,\ ; WASTEMAKER
	LIGHT_SCREEN,\
	SLUDGE,\ ; SLUDGE BOMB
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLASH
	; end


	db BANK(BellsproutPicFront)
	db 0
	db BANK(BellsproutPicBack)
	db BANK(BellsproutPicBackSW)

	dw 0, BellsproutPicBack

