	db DEX_ALAKAZAM ; pokedex id

	db  55,  50,  45, 120, 135
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 50 ; catch rate
	db 186 ; base exp

	INCBIN "gfx/pokemon/front/alakazam.pic", 0, 1 ; sprite dimensions
	dw AlakazamPicFront, AlakazamPicBackSW

	db TELEPORT, SEISMIC_TOSS, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	LOW_KICK,\
	SONICBOOM,\ ; ILL WIND
	ICE_PUNCH,\
	DISABLE,\
	FIRE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	HYPER_BEAM,\
	AMNESIA,\
	THUNDERPUNCH,\
	ROLLING_KICK,\ ; METEOR SWEEP
	DIG,\
	PSYCHIC_M,\
	KINESIS,\ ; MIRAGE
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	KARATE_CHOP,\
	MEDITATE,\
	LIGHT_SCREEN,\
	PSYWAVE,\ ; MINDWIPE
	GLARE,\
	SUBSTITUTE,\
	FLASH
	; end

	db BANK(AlakazamPicFront)
	db 0 ; no alt front sprite
	db BANK(AlakazamPicBack)
	db BANK(AlakazamPicBackSW)

	dw 0, AlakazamPicBack
