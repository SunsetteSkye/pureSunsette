	db DEX_CHARIZARD ; pokedex id

	db  78,  94,  83, 100,  90
	;   hp  atk  def  spd  spc

	db FIRE, DRAGON ; type
	db 45 ; catch rate
	db 209 ; base exp

	INCBIN "gfx/pokemon/front/charizard.pic", 0, 1 ; sprite dimensions
	dw CharizardPicFront, CharizardPicBackSW

	db SCRATCH, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	LOW_KICK,\
	RAZOR_WIND,\ ; ROOST
	FIRE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	AMNESIA,\
	THUNDERPUNCH,\
	ROLLING_KICK,\ ; METEOR SWEEP
	BARRIER,\
	SOLARBEAM,\
	DRAGON_RAGE,\ ; WYRM WRATH
	EARTHQUAKE,\
	DIG,\
	KINESIS,\ ; MIRAGE
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\ ; WASTEMAKER
	KARATE_CHOP,\
	SKY_ATTACK,\
	LIGHT_SCREEN,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	STRENGTH,\
	FLASH
	; end

	db BANK(CharizardPicFront)
	db 0
	db BANK(CharizardPicBack)
	db BANK(CharizardPicBackSW)

	dw 0, CharizardPicBack

