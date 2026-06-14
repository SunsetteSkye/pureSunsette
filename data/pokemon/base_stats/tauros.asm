	db DEX_TAUROS ; pokedex id

	db  105, 120,  95,  90,  40
	;    hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 211 ; base exp

	INCBIN "gfx/pokemon/front/tauros.pic", 0, 1 ; sprite dimensions
	dw TaurosPicFront, TaurosPicBackSW

	db TACKLE, HORN_ATTACK, NO_MOVE, NO_MOVE ; level 1 learnset (METEOR HORN)
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	FURY_ATTACK,\ ; MUD BOMB
	DISABLE,\
	PIN_MISSILE,\
	TOXIC,\
	HORN_DRILL,\ ; VENOM DRILL
	BODY_SLAM,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
	SWORDS_DANCE,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\ ; WASTEMAKER
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	STRENGTH
	; end

	db BANK(TaurosPicFront)
	db 0
	db BANK(TaurosPicBack)
	db BANK(TaurosPicBackSW)

	dw 0, TaurosPicBack

