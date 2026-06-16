	db DEX_MEWTWO ; pokedex id

	db 106, 110,  90, 130, 154
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 25 ; catch rate
	db 220 ; base exp

	INCBIN "gfx/pokemon/front/mewtwo.pic", 0, 1 ; sprite dimensions
	dw MewtwoPicFront, MewtwoPicBackSW

	db CONFUSION, DISABLE, SWIFT, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	SONICBOOM,\ ; ILL WIND
	ICE_PUNCH,\ ; FROST FIST
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
	AMNESIA,\ ; CALM MIND
	LOW_KICK,\
	THUNDERPUNCH,\ ; ZAPPERCUT
	ROLLING_KICK,\ ; METEOR SWEEP
	BARRIER,\
	SOLARBEAM,\ ; SOLARBEAM
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
	CRABHAMMER,\
	PSYCHIC_M,\
	KINESIS,\ ; MIRAGE
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	FIRE_BLAST,\
	FLAMETHROWER,\
	KARATE_CHOP,\
	MEDITATE,\ ; VOID MIND
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	PSYWAVE,\ ; SKITTERMIND
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH,\
	FLASH
	; end


	db BANK(MewtwoPicFront)
	db BANK(MewtwoPicFrontAlt)
	db BANK(MewtwoPicBack)
	db BANK(MewtwoPicBackSW)

	dw MewtwoPicFrontAlt, MewtwoPicBack

