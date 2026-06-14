	db DEX_PARASECT ; pokedex id

	db  140, 95, 80,  30,  80
	;   hp  atk  def  spd  spc

	db BUG, GHOST ; type
	db 75 ; catch rate
	db 128 ; base exp

	INCBIN "gfx/pokemon/front/parasect.pic", 0, 1 ; sprite dimensions
	dw ParasectPicFront, ParasectPicBackSW

	db SCRATCH, ABSORB, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	SONICBOOM,\ ; ILL WIND
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	AMNESIA,\ ; CALM MIND
	BARRIER,\
	RAZOR_LEAF,\
	SOLARBEAM,\ ; SOLAR CANNON
	EARTHQUAKE,\
	CRABHAMMER,\
	DIG,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	SLAM,\ ; WASTEMAKER
	KARATE_CHOP,\
	LIGHT_SCREEN,\
	SLUDGE,\ ; SLUDGE BOMB
	ROCK_SLIDE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH,\
	FLASH
	; end

	db BANK(ParasectPicFront)
	db 0
	db BANK(ParasectPicBack)
	db BANK(ParasectPicBackSW)

	dw 0, ParasectPicBack

