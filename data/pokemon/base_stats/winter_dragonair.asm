	db DEX_DRAGONAIR ; pokedex id

	db  91,  84,  95,  80,  110
	;   hp  atk  def  spd  spc

	db DRAGON, ICE ; type
	db 45 ; catch rate
	db 218 ; base exp

	INCBIN "gfx/pokemon/front_alt/dragonair.pic", 0, 1 ; sprite dimensions
	dw WinterDragonairPicFront, WinterDragonairPicBackSW

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
	HYPER_BEAM,\
	SOLARBEAM,\ ; SOLARBEAM
	DRAGON_RAGE,\ ; WYRM WRATH
	MEGA_DRAIN,\
	THUNDERBOLT,\
	THUNDER,\
	PSYCHIC_M,\
	KINESIS,\ ; MIRAGE
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\ ; WASTEMAKER
	LIGHT_SCREEN,\
	LOVELY_KISS,\
	THUNDER_WAVE,\
	PSYWAVE,\ ; SKITTERMIND
	SUBSTITUTE,\
	CUT,\
	SURF,\
	FLASH
	; end

	db BANK(WinterDragonairPicFront)
	db 0
	db BANK(WinterDragonairPicBack)
	db BANK(WinterDragonairPicBackSW)

	dw 0, WinterDragonairPicBack

