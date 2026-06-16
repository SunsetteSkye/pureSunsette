	db DEX_SLOWPOKE ; pokedex id

	db  90,  65,  65,  15,  40
	;   hp  atk  def  spd  spc

	db WATER, PSYCHIC_TYPE ; type
	db 190 ; catch rate
	db 99 ; base exp

	INCBIN "gfx/pokemon/front/slowpoke.pic", 0, 1 ; sprite dimensions
	dw SlowpokePicFront, SlowpokePicBackSW

	db CONFUSION, WATER_GUN, NO_MOVE, NO_MOVE ; level 1 learnset (SUPER SOAK)
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	FURY_ATTACK,\ ; MUD BOMB
	LOW_KICK,\
	DISABLE,\
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	ICE_BEAM,\
	BLIZZARD,\
	AMNESIA,\ ; CALM MIND
	ROLLING_KICK,\ ; METEOR SWEEP
	EARTHQUAKE,\
	DIG,\
	PSYCHIC_M,\
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\ ; WASTEMAKER
	MEDITATE,\ ; VOID MIND
	LIGHT_SCREEN,\
	PSYWAVE,\ ; SKITTERMIND
	SUBSTITUTE,\
	CUT,\
	SURF,\
	STRENGTH,\
	FLASH
	; end


	db BANK(SlowpokePicFront)
	db 0
	db BANK(SlowpokePicBack)
	db BANK(SlowpokePicBackSW)

	dw 0, SlowpokePicBack

