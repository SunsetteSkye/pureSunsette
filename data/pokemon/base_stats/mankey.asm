	db DEX_MANKEY ; pokedex id

	db  40,  80,  35,  70,  50
	;   hp  atk  def  spd  spc

	db NORMAL, FIGHTING ; type
	db 190 ; catch rate
	db 74 ; base exp

	INCBIN "gfx/pokemon/front/mankey.pic", 0, 1 ; sprite dimensions
	dw MankeyPicFront, MankeyPicBackSW

	db SCRATCH, LEER, POUND, NO_MOVE ; level 1 learnset (JOLT BOLT)
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	SONICBOOM,\ ; ILL WIND
	ICE_PUNCH,\
	FIRE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	LOW_KICK,\
	THUNDERPUNCH,\
	ROLLING_KICK,\ ; METEOR SWEEP
	DRAGON_RAGE,\ ; WYRM WRATH
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
	CRABHAMMER,\
	DIG,\
	SWORDS_DANCE,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	SLAM,\ ; WASTEMAKER
	KARATE_CHOP,\
	MEDITATE,\
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH
	; end


	db BANK(MankeyPicFront)
	db BANK(MankeyPicFrontAlt)
	db BANK(MankeyPicBack)
	db BANK(MankeyPicBackSW)

	dw MankeyPicFrontAlt, MankeyPicBack

