	db DEX_DUGTRIO ; pokedex id

	db  50,  90,  55, 120,  70
	;   hp  atk  def  spd  spc

	db GROUND, GROUND ; type
	db 50 ; catch rate
	db 153 ; base exp

	INCBIN "gfx/pokemon/front/dugtrio.pic", 0, 1 ; sprite dimensions
	dw DugtrioPicFront, DugtrioPicBackSW

	db SCRATCH, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	LOW_KICK,\
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	EARTHQUAKE,\
	DIG,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	SLAM,\ ; WASTEMAKER
	KARATE_CHOP,\
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH
	; end

	db BANK(DugtrioPicFront)
	db 0
	db BANK(DugtrioPicBack)
	db BANK(DugtrioPicBackSW)

	dw 0, DugtrioPicBack

