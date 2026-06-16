	db DEX_MR_MIME ; pokedex id

	db  80,  45,  65,  90, 100
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, GHOST ; type
	db 95 ; catch rate
	db 136 ; base exp

	INCBIN "gfx/pokemon/front/mr.mime.pic", 0, 1 ; sprite dimensions
	dw MrMimePicFront, MrMimePicBackSW

	db CONFUSION, BARRIER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

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
	HYPER_BEAM,\
	AMNESIA,\ ; CALM MIND
	LOW_KICK,\
	THUNDERPUNCH,\ ; ZAPPERCUT
	ROLLING_KICK,\ ; METEOR SWEEP
	BARRIER,\
	SOLARBEAM,\ ; SOLARBEAM
	THUNDERBOLT,\
	THUNDER,\
	CRABHAMMER,\
	PSYCHIC_M,\
	KINESIS,\ ; MIRAGE
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	SLAM,\ ; WASTEMAKER
	KARATE_CHOP,\
	MEDITATE,\ ; VOID MIND
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	PSYWAVE,\ ; SKITTERMIND
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	STRENGTH,\
	FLASH
	; end


	db BANK(MrMimePicFront)
	db 0
	db BANK(MrMimePicBack)
	db BANK(MrMimePicBackSW)

	dw 0, MrMimePicBack

