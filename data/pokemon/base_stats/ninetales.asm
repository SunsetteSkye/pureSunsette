	db DEX_NINETALES ; pokedex id

	db  73,  76,  75, 100, 100
	;   hp  atk  def  spd  spc

	db FIRE, GHOST ; type
	db 75 ; catch rate
	db 178 ; base exp

	INCBIN "gfx/pokemon/front/ninetales.pic", 0, 1 ; sprite dimensions
	dw NinetalesPicFront, NinetalesPicBackSW

	db EMBER, TAIL_WHIP, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	FURY_ATTACK,\ ; MUD BOMB
	SONICBOOM,\ ; ILL WIND
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	HYPER_BEAM,\
	AMNESIA,\ ; CALM MIND
	ROLLING_KICK,\ ; METEOR SWEEP
	BARRIER,\
	SOLARBEAM,\ ; SOLARBEAM
	DRAGON_RAGE,\ ; WYRM WRATH
	DIG,\
	PSYCHIC_M,\
	KINESIS,\ ; MIRAGE
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	FIRE_BLAST,\
	FLAMETHROWER,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	PSYWAVE,\ ; SKITTERMIND
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLASH
	; end

	db BANK(NinetalesPicFront)
	db 0
	db BANK(NinetalesPicBack)
	db BANK(NinetalesPicBackSW)

	dw 0, NinetalesPicBack

