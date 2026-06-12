	db DEX_KANGASKHAN ; pokedex id

	db 125,  95,  80,  80,  70
	;   hp  atk  def  spd  spc

	db NORMAL, FIGHTING ; type
	db 65 ; catch rate
	db 175 ; base exp

	INCBIN "gfx/pokemon/front/kangaskhan.pic", 0, 1 ; sprite dimensions
	dw KangaskhanPicFront, KangaskhanPicBackSW

	db POUND, RAGE, NO_MOVE, NO_MOVE ; level 1 learnset (JOLT BOLT)
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	DISABLE,\
	ICE_PUNCH,\
	FIRE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	LOW_KICK,\
	THUNDERPUNCH,\
	ROLLING_KICK,\ ; METEOR SWEEP
	SOLARBEAM,\ ; SOLAR CANNON
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
	DIG,\
	SWORDS_DANCE,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\ ; WASTEMAKER
	KARATE_CHOP,\
	MEDITATE,\ ; VOID MIND
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	STRENGTH
	; end


	db BANK(KangaskhanPicFront)
	db 0
	db BANK(KangaskhanPicBack)
	db BANK(KangaskhanPicBackSW)

	dw 0, KangaskhanPicBack

