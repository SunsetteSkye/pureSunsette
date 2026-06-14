	db DEX_KOFFING ; pokedex id

	db  40,  65,  95,  35,  60
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 190 ; catch rate
	db 114 ; base exp

	INCBIN "gfx/pokemon/front/koffing.pic", 0, 1 ; sprite dimensions
	dw KoffingPicFront, KoffingPicBackSW

	db TACKLE, SMOG, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	FURY_ATTACK,\ ; MUD BOMB
	DISABLE,\
	SONICBOOM,\ ; ILL WIND
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	AMNESIA,\ ; CALM MIND
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	KINESIS,\ ; MIRAGE
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\ ; WASTEMAKER
	LIGHT_SCREEN,\
	SLUDGE,\ ; SLUDGE BOMB
	SUBSTITUTE,\
	FLASH
	; end


	db BANK(KoffingPicFront)
	db BANK(KoffingPicFrontAlt)
	db BANK(KoffingPicBack)
	db BANK(KoffingPicBackSW)

	dw KoffingPicFrontAlt, KoffingPicBack

