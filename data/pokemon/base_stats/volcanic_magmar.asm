	db DEX_MAGMAR ; pokedex id

	db  85,  95,  57,  93,  95
	;   hp  atk  def  spd  spc

	db FIRE, MAGMA ; type
	db 85 ; catch rate
	db 167 ; base exp

	INCBIN "gfx/pokemon/front_alt/volcanic_magmar.pic", 0, 1 ; sprite dimensions
	dw VolcanicMagmarPicFront, VolcanicMagmarPicBackSW

	db EMBER, FIRE_SPIN, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ICE_PUNCH,\
	FIRE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	AMNESIA,\ ; CALM MIND
	LOW_KICK,\
	THUNDERPUNCH,\
	ROLLING_KICK,\ ; METEOR SWEEP
	BARRIER,\
	SOLARBEAM,\ ; SOLAR CANNON
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


	db BANK(VolcanicMagmarPicFront)
	db 0
	db BANK(VolcanicMagmarPicBack)
	db BANK(VolcanicMagmarPicBackSW)

	dw 0, VolcanicMagmarPicBack

