	db DEX_EXEGGUTOR ; pokedex id

	db  95,  95,  85,  55, 125
	;   hp  atk  def  spd  spc

	db GRASS, PSYCHIC_TYPE ; type
	db 65 ; catch rate
	db 212 ; base exp

	INCBIN "gfx/pokemon/front/exeggutor.pic", 0, 1 ; sprite dimensions
	dw ExeggutorPicFront, ExeggutorPicBackSW

	db ABSORB, HYPNOSIS, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	FURY_ATTACK,\ ; MUD BOMB
	LOW_KICK,\
	DISABLE,\
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	AMNESIA,\ ; CALM MIND
	ROLLING_KICK,\ ; METEOR SWEEP
	BARRIER,\
	RAZOR_LEAF,\
	SOLARBEAM,\ ; SOLAR CANNON
	EARTHQUAKE,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	KINESIS,\ ; MIRAGE
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	SLAM,\ ; WASTEMAKER
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	PSYWAVE,\ ; SKITTERMIND
	SUBSTITUTE,\
	SURF,\
	STRENGTH,\
	FLASH
	; end

	db BANK(ExeggutorPicFront)
	db BANK(ExeggutorPicFrontAlt)
	db BANK(ExeggutorPicBack)
	db BANK(ExeggutorPicBackSW)

	dw ExeggutorPicFrontAlt, ExeggutorPicBack

