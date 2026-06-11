	db DEX_POLIWHIRL ; pokedex id

	db  65,  65,  65,  90,  50
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 120 ; catch rate
	db 131 ; base exp

	INCBIN "gfx/pokemon/front/poliwhirl.pic", 0, 1 ; sprite dimensions
	dw PoliwhirlPicFront, PoliwhirlPicBackSW

	db BUBBLE, POUND, NO_MOVE, NO_MOVE ; level 1 learnset (JOLT BOLT)
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
	AMNESIA,\
	THUNDERPUNCH,\
	ROLLING_KICK,\ ; METEOR SWEEP
	BARRIER,\
	DIG,\
	PSYCHIC_M,\
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	KARATE_CHOP,\
	MEDITATE,\
	LIGHT_SCREEN,\
	PSYWAVE,\ ; MINDWIPE
	GLARE,\
	SUBSTITUTE,\
	SURF,\
	STRENGTH,\
	FLASH
	; end

	db BANK(PoliwhirlPicFront)
	db 0
	db BANK(PoliwhirlPicBack)
	db BANK(PoliwhirlPicBackSW)

	dw 0, PoliwhirlPicBack

