	db DEX_ABRA ; pokedex id

	db  25,  20,  15,  90, 105
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 200 ; catch rate
	db 73 ; base exp

	INCBIN "gfx/pokemon/front/abra.pic", 0, 1 ; sprite dimensions
	dw AbraPicFront, AbraPicBackSW

	db TELEPORT, SEISMIC_TOSS, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	LOW_KICK,\
	SONICBOOM,\ ; ILL WIND
	DISABLE,\
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	AMNESIA,\ ; CALM MIND
	ROLLING_KICK,\ ; METEOR SWEEP
	DIG,\
	PSYCHIC_M,\
	KINESIS,\ ; MIRAGE
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	KARATE_CHOP,\
	MEDITATE,\ ; VOID MIND
	LIGHT_SCREEN,\
	PSYWAVE,\ ; SKITTERMIND
	GLARE,\
	SUBSTITUTE,\
	FLASH
	; end

	; PureRGBnote: ADDED: in pokemon base stat headers, these point to which bank the various sprites are stored in.
	db BANK(AbraPicFront)
	db BANK(AbraPicFrontAlt)
	db BANK(AbraPicBack) 
	db BANK(AbraPicBackSW)

	dw AbraPicFrontAlt, AbraPicBack ; PureRGBnote: ADDED: the first byte is a pointer to alt front sprite if the pokemon has one, the second is a pointer to the original back sprite.
