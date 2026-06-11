	db DEX_CLEFABLE ; pokedex id

	db  95,  70,  73,  60, 105
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 65 ; catch rate
	db 129 ; base exp

	INCBIN "gfx/pokemon/front/clefable.pic", 0, 1 ; sprite dimensions
	dw ClefablePicFront, ClefablePicBackSW

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	LOW_KICK,\
	DISABLE,\
	ICE_PUNCH,\
	LEECH_SEED,\
	FIRE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	ICE_BEAM,\
	BLIZZARD,\ ; SLEET STORM
	HYPER_BEAM,\
	AMNESIA,\
	THUNDERPUNCH,\
	ROLLING_KICK,\ ; METEOR SWEEP
	BARRIER,\
	SOLARBEAM,\
	DRAGON_RAGE,\ ; WYRM WRATH
	THUNDERBOLT,\
	THUNDER,\
	DIG,\
	PSYCHIC_M,\
	KINESIS,\ ; MIRAGE
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	FIRE_BLAST,\
	FLAMETHROWER,\
	KARATE_CHOP,\
	MEDITATE,\
	LOVELY_KISS,\
	SKY_ATTACK,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	PSYWAVE,\ ; MINDWIPE
	SUBSTITUTE,\
	CUT,\
	STRENGTH,\
	FLASH
	; end

	db BANK(ClefablePicFront)
	db 0
	db BANK(ClefablePicBack)
	db BANK(ClefablePicBackSW)

	dw 0, ClefablePicBack

