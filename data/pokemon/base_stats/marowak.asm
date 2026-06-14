	db DEX_MAROWAK ; pokedex id

	db  80,  95, 110,  45,  90
	;   hp  atk  def  spd  spc

	db GROUND, GHOST ; type
	db 75 ; catch rate
	db 124 ; base exp

	INCBIN "gfx/pokemon/front/marowak.pic", 0, 1 ; sprite dimensions
	dw MarowakPicFront, MarowakPicBackSW

	db BONE_CLUB, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	FURY_ATTACK,\ ; MUD BOMB
	SONICBOOM,\ ; ILL WIND
	ICE_PUNCH,\ ; FROST FIST
	PIN_MISSILE,\
	FIRE_PUNCH,\ ; BLAZE HAMMER
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	LOW_KICK,\
	THUNDERPUNCH,\ ; ZAPPERCUT
	ROLLING_KICK,\ ; METEOR SWEEP
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
	KARATE_CHOP,\
	MEDITATE,\ ; VOID MIND
	LIGHT_SCREEN,\
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH
	; end

	db BANK(MarowakPicFront)
	db 0
	db BANK(MarowakPicBack)
	db BANK(MarowakPicBackSW)

	dw 0, MarowakPicBack

