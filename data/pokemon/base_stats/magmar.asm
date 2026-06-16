	db DEX_MAGMAR ; pokedex id

	db  85,  95,  57,  93,  95
	;   hp  atk  def  spd  spc

	db FIRE, POISON ; type
	db 85 ; catch rate
	db 167 ; base exp

	INCBIN "gfx/pokemon/front/magmar.pic", 0, 1 ; sprite dimensions
	dw MagmarPicFront, MagmarPicBackSW

	db EMBER, FIRE_SPIN, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ICE_PUNCH,\ ; FROST FIST
	FIRE_PUNCH,\ ; BLAZE HAMMER
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	AMNESIA,\ ; CALM MIND
	LOW_KICK,\
	THUNDERPUNCH,\ ; ZAPPERCUT
	ROLLING_KICK,\ ; METEOR SWEEP
	BARRIER,\
	SOLARBEAM,\ ; SOLARBEAM
	DRAGON_RAGE,\ ; WYRM WRATH
	EARTHQUAKE,\
	DIG,\
	PSYCHIC_M,\
	KINESIS,\ ; MIRAGE
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	FIRE_BLAST,\
	FLAMETHROWER,\
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


	db BANK(MagmarPicFront)
	db 0
	db BANK(MagmarPicBack)
	db BANK(MagmarPicBackSW)

	dw 0, MagmarPicBack

