	db DEX_PINSIR ; pokedex id

	db  65, 125, 100,  85,  55
	;   hp  atk  def  spd  spc

	db BUG, GROUND ; type
	db 65 ; catch rate
	db 200 ; base exp

	INCBIN "gfx/pokemon/front/pinsir.pic", 0, 1 ; sprite dimensions
	dw PinsirPicFront, PinsirPicBackSW

	db SEISMIC_TOSS, FURY_SWIPES, NO_MOVE, NO_MOVE ; level 1 learnset (MUD CLAW)
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	ICE_PUNCH,\
	PIN_MISSILE,\
	FIRE_PUNCH,\
	TOXIC,\
	HORN_DRILL,\ ; WICKED DRILL
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	LOW_KICK,\
	THUNDERPUNCH,\
	ROLLING_KICK,\ ; METEOR SWEEP
	BARRIER,\
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
	SURF,\
	STRENGTH
	; end


	db BANK(PinsirPicFront)
	db BANK(PinsirPicFrontAlt)
	db BANK(PinsirPicBack)
	db BANK(PinsirPicBackSW)

	dw PinsirPicFrontAlt, PinsirPicBack

