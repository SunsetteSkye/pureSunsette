	db DEX_EXEGGCUTE ; pokedex id

	db  60,  40,  80,  40,  60
	;   hp  atk  def  spd  spc

	db GRASS, PSYCHIC_TYPE ; type
	db 90 ; catch rate
	db 98 ; base exp

	INCBIN "gfx/pokemon/front/exeggcute.pic", 0, 1 ; sprite dimensions
	dw ExeggcutePicFront, ExeggcutePicBackSW

	db ABSORB, HYPNOSIS, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	FURY_ATTACK,\ ; MUD BOMB
	DISABLE,\
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	AMNESIA,\ ; CALM MIND
	ROLLING_KICK,\ ; METEOR SWEEP
	BARRIER,\
	RAZOR_LEAF,\
	SOLARBEAM,\ ; SOLARBEAM
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
	FLASH
	; end


	db BANK(ExeggcutePicFront)
	db BANK(ExeggcutePicFrontAlt)
	db BANK(ExeggcutePicBack)
	db BANK(ExeggcutePicBackSW)

	dw ExeggcutePicFrontAlt, ExeggcutePicBack

