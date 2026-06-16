	db DEX_HYPNO ; pokedex id

	db  90,  73,  70,  72, 115
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, POISON ; type
	db 75 ; catch rate
	db 165 ; base exp

	INCBIN "gfx/pokemon/front/hypno.pic", 0, 1 ; sprite dimensions
	dw HypnoPicFront, HypnoPicBackSW

	db TACKLE, HYPNOSIS, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	FURY_ATTACK,\ ; MUD BOMB
	LOW_KICK,\
	ICE_PUNCH,\ ; FROST FIST
	FIRE_PUNCH,\ ; BLAZE HAMMER
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	HYPER_BEAM,\
	AMNESIA,\ ; CALM MIND
	THUNDERPUNCH,\ ; ZAPPERCUT
	ROLLING_KICK,\ ; METEOR SWEEP
	BARRIER,\
	PSYCHIC_M,\
	KINESIS,\ ; MIRAGE
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	SLAM,\ ; WASTEMAKER
	KARATE_CHOP,\
	MEDITATE,\ ; VOID MIND
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	PSYWAVE,\ ; SKITTERMIND
	SLUDGE,\ ; SLUDGE BOMB
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH,\
	FLASH
	; end

	db BANK(HypnoPicFront)
	db 0
	db BANK(HypnoPicBack)
	db BANK(HypnoPicBackSW)

	dw 0, HypnoPicBack

