	db DEX_RHYDON ; pokedex id

	db 105, 130, 120,  40, 105
	;   hp  atk  def  spd  spc

	db GROUND, ROCK ; type
	db 60 ; catch rate
	db 255 ; base exp

	INCBIN "gfx/pokemon/front/rhydon.pic", 0, 1 ; sprite dimensions
	dw RhydonPicFront, RhydonPicBackSW

	db FURY_SWIPES, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset (MUD CLAW)
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	FURY_ATTACK,\ ; MUD BOMB
	LOW_KICK,\
	DISABLE,\
	ICE_PUNCH,\ ; FROST FIST
	PIN_MISSILE,\
	FIRE_PUNCH,\ ; BLAZE HAMMER
	TOXIC,\
	HORN_DRILL,\ ; VENOM DRILL
	BODY_SLAM,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	THUNDERPUNCH,\ ; ZAPPERCUT
	ROLLING_KICK,\ ; METEOR SWEEP
	BARRIER,\
	DRAGON_RAGE,\ ; WYRM WRATH
	THUNDERBOLT,\
	THUNDER,\
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
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	STRENGTH
	; end

	db BANK(RhydonPicFront)
	db 0
	db BANK(RhydonPicBack)
	db BANK(RhydonPicBackSW)

	dw 0, RhydonPicBack

