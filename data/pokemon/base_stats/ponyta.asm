	db DEX_PONYTA ; pokedex id

	db  50,  85,  55,  90,  65
	;   hp  atk  def  spd  spc

	db FIRE, FIGHTING ; type
	db 190 ; catch rate
	db 152 ; base exp

	INCBIN "gfx/pokemon/front/ponyta.pic", 0, 1 ; sprite dimensions
	dw PonytaPicFront, PonytaPicBackSW

	db EMBER, LOW_KICK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	DISABLE,\
	TOXIC,\
	HORN_DRILL,\ ; WICKED DRILL
	BODY_SLAM,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	HYPER_BEAM,\
	ROLLING_KICK,\ ; METEOR SWEEP
	BARRIER,\
	SOLARBEAM,\
	DRAGON_RAGE,\ ; WYRM WRATH
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
	PSYCHIC_M,\
	KINESIS,\ ; MIRAGE
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\ ; WASTEMAKER
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	PSYWAVE,\ ; MINDWIPE
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	STRENGTH,\
	FLASH
	; end


	db BANK(PonytaPicFront)
	db 0
	db BANK(PonytaPicBack)
	db BANK(PonytaPicBackSW)

	dw 0, PonytaPicBack

