	db DEX_OMANYTE ; pokedex id

	db  35,  40, 125,  45,  115
	;   hp  atk  def  spd  spc

	db ROCK, WATER ; type
	db 45 ; catch rate
	db 120 ; base exp

	INCBIN "gfx/pokemon/front/omanyte.pic", 0, 1 ; sprite dimensions
	dw OmanytePicFront, OmanytePicBackSW

	db WATER_GUN, HORN_ATTACK, NO_MOVE, NO_MOVE ; level 1 learnset (METEOR HORN)
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	LEECH_SEED,\
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	ICE_BEAM,\
	BLIZZARD,\ ; SLEET STORM
	AMNESIA,\
	BARRIER,\
	EARTHQUAKE,\
	CRABHAMMER,\
	DIG,\
	MEGA_DRAIN,\
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	SLAM,\ ; WASTEMAKER
	SLUDGE,\ ; SLUDGE BOMB
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	FLASH
	; end

	db BANK(OmanytePicFront)
	db BANK(OmanytePicFrontAlt)
	db BANK(OmanytePicBack)
	db BANK(OmanytePicBackSW)

	dw OmanytePicFrontAlt, OmanytePicBack

