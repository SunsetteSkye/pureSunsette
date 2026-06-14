	db DEX_DODRIO ; pokedex id

	db  70, 115,  70, 105,  60
	;   hp  atk  def  spd  spc

	db FIGHTING, FLYING ; type
	db 45 ; catch rate
	db 158 ; base exp

	INCBIN "gfx/pokemon/front/dodrio.pic", 0, 1 ; sprite dimensions
	dw DodrioPicFront, DodrioPicBackSW

	db PECK, FURY_SWIPES, NO_MOVE, NO_MOVE ; level 1 learnset (MUD CLAW)
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	FURY_ATTACK,\ ; MUD BOMB
	SONICBOOM,\ ; ILL WIND
	RAZOR_WIND,\ ; ROOST
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
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
	SKY_ATTACK,\ ; BRAVE BIRD
	THUNDER_WAVE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	STRENGTH
	; end

	db BANK(DodrioPicFront)
	db 0
	db BANK(DodrioPicBack)
	db BANK(DodrioPicBackSW)

	dw 0, DodrioPicBack

