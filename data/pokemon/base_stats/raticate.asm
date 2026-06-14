	db DEX_RATICATE ; pokedex id

	db  65,  91,  60,  97,  75
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 125 ; catch rate
	db 116 ; base exp

	INCBIN "gfx/pokemon/front/raticate.pic", 0, 1 ; sprite dimensions
	dw RaticatePicFront, RaticatePicBackSW

	db SCRATCH, TAIL_WHIP, QUICK_ATTACK, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	FURY_ATTACK,\ ; MUD BOMB
	DISABLE,\
	ICE_PUNCH,\ ; FROST FIST
	FIRE_PUNCH,\ ; BLAZE HAMMER
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	AMNESIA,\ ; CALM MIND
	LOW_KICK,\
	THUNDERPUNCH,\ ; ZAPPERCUT
	ROLLING_KICK,\ ; METEOR SWEEP
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	DIG,\
	KINESIS,\ ; MIRAGE
	SWORDS_DANCE,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	SLAM,\ ; WASTEMAKER
	KARATE_CHOP,\
	MEDITATE,\ ; VOID MIND
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	STRENGTH
	; end


	db BANK(RaticatePicFront)
	db BANK(RaticatePicFrontAlt)
	db BANK(RaticatePicBack)
	db BANK(RaticatePicBackSW)

	dw RaticatePicFrontAlt, RaticatePicBack

