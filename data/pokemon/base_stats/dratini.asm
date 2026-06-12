	db DEX_DRATINI ; pokedex id

	db  41,  64,  45,  50,  50
	;   hp  atk  def  spd  spc

	db DRAGON, DRAGON ; type
	db 45 ; catch rate
	db 67 ; base exp

	INCBIN "gfx/pokemon/front/dratini.pic", 0, 1 ; sprite dimensions
	dw DratiniPicFront, DratiniPicBackSW

	db WRAP, LEER, ROAR, NO_MOVE ; level 1 learnset (BELLOW)
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	DISABLE,\
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	ICE_BEAM,\
	BLIZZARD,\
	SOLARBEAM,\ ; SOLAR CANNON
	DRAGON_RAGE,\ ; WYRM WRATH
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
	THUNDER_WAVE,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	FLASH
	; end


	db BANK(DratiniPicFront)
	db 0
	db BANK(DratiniPicBack)
	db BANK(DratiniPicBackSW)

	dw 0, DratiniPicBack

