	db DEX_MACHAMP ; pokedex id

	db  120, 130,  80,  55,  65
	;   hp   atk   def  spd  spc

	db FIGHTING, FIGHTING ; type
	db 75 ; catch rate
	db 193 ; base exp

	INCBIN "gfx/pokemon/front/machamp.pic", 0, 1 ; sprite dimensions
	dw MachampPicFront, MachampPicBackSW

	db KARATE_CHOP, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	DISABLE,\
	ICE_PUNCH,\
	FIRE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	LOW_KICK,\
	THUNDERPUNCH,\
	ROLLING_KICK,\ ; METEOR SWEEP
	EARTHQUAKE,\
	CRABHAMMER,\
	DIG,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\ ; WASTEMAKER
	KARATE_CHOP,\
	MEDITATE,\
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH
	; end

	db BANK(MachampPicFront)
	db 0
	db BANK(MachampPicBack)
	db BANK(MachampPicBackSW)

	dw 0, MachampPicBack

