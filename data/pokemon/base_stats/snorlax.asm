	db DEX_SNORLAX ; pokedex id

	db 160, 110,  65,  30,  65
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 25 ; catch rate
	db 154 ; base exp

	INCBIN "gfx/pokemon/front/snorlax.pic", 0, 1 ; sprite dimensions
	dw SnorlaxPicFront, SnorlaxPicBackSW

	db ROAR, AMNESIA, REST, HEADBUTT  ; level 1 learnset (BELLOW)
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	LOW_KICK,\
	DISABLE,\
	ICE_PUNCH,\
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
	SOLARBEAM,\
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
	PSYCHIC_M,\
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\ ; WASTEMAKER
	KARATE_CHOP,\
	MEDITATE,\
	PSYWAVE,\ ; MINDWIPE
	ROCK_SLIDE,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	STRENGTH
	; end


	db BANK(SnorlaxPicFront)
	db 0
	db BANK(SnorlaxPicBack)
	db BANK(SnorlaxPicBackSW)

	dw 0, SnorlaxPicBack

