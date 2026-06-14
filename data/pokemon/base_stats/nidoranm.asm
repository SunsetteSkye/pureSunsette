	db DEX_NIDORAN_M ; pokedex id

	db  46,  57,  40,  50,  40
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 235 ; catch rate
	db 60 ; base exp

	INCBIN "gfx/pokemon/front/nidoranm.pic", 0, 1 ; sprite dimensions
	dw NidoranMPicFront, NidoranMPicBackSW

	db TACKLE, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	FURY_ATTACK,\ ; MUD BOMB
	SONICBOOM,\ ; ILL WIND
	PIN_MISSILE,\
	TOXIC,\
	HORN_DRILL,\ ; VENOM DRILL
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	ICE_BEAM,\
	BLIZZARD,\
	ROLLING_KICK,\ ; METEOR SWEEP
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	DIG,\
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	SLAM,\ ; WASTEMAKER
	KARATE_CHOP,\
	LIGHT_SCREEN,\
	SLUDGE,\ ; SLUDGE BOMB
	GLARE,\
	SUBSTITUTE,\
	CUT
	; end


	db BANK(NidoranMPicFront)
	db 0
	db BANK(NidoranMPicBack)
	db BANK(NidoranMPicBackSW)

	dw 0, NidoranMPicBack

