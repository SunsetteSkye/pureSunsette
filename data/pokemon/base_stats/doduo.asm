	db DEX_DODUO ; pokedex id

	db  35,  85,  45,  75,  35
	;   hp  atk  def  spd  spc

	db FIGHTING, FLYING ; type
	db 190 ; catch rate
	db 96 ; base exp

	INCBIN "gfx/pokemon/front/doduo.pic", 0, 1 ; sprite dimensions
	dw DoduoPicFront, DoduoPicBackSW

	db PECK, FURY_SWIPES, NO_MOVE, NO_MOVE ; level 1 learnset (MUD CLAW)
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	SONICBOOM,\ ; ILL WIND
	RAZOR_WIND,\ ; ROOST
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	LOW_KICK,\
	ROLLING_KICK,\ ; METEOR SWEEP
	BARRIER,\
	EARTHQUAKE,\
	DIG,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	SLAM,\ ; WASTEMAKER
	SKY_ATTACK,\
	THUNDER_WAVE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	STRENGTH
	; end


	db BANK(DoduoPicFront)
	db 0
	db BANK(DoduoPicBack)
	db BANK(DoduoPicBackSW)

	dw 0, DoduoPicBack

