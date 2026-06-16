	db DEX_ONIX ; pokedex id

	db  55,  65, 180,  80,  30
	;   hp  atk  def  spd  spc

	db ROCK, GROUND ; type
	db 45 ; catch rate
	db 108 ; base exp

	INCBIN "gfx/pokemon/front/onix.pic", 0, 1 ; sprite dimensions
	dw OnixPicFront, OnixPicBackSW

	db TACKLE, SCREECH, HARDEN, BIND ; level 1 learnset (POWER BIND)
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	BARRIER,\
	DRAGON_RAGE,\ ; WYRM WRATH
	EARTHQUAKE,\
	CRABHAMMER,\
	DIG,\
	KINESIS,\ ; MIRAGE
	SWORDS_DANCE,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\ ; WASTEMAKER
	LIGHT_SCREEN,\
	SLUDGE,\ ; SLUDGE BOMB
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH
	; end

	db BANK(OnixPicFront)
	db BANK(OnixPicFrontAlt)
	db BANK(OnixPicBack)
	db BANK(OnixPicBackSW)

	dw OnixPicFrontAlt, OnixPicBack

