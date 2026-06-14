	db DEX_BEEDRILL ; pokedex id

	db  70,  92,  75,  95,  50
	;   hp  atk  def  spd  spc

	db BUG, POISON ; type
	db 105 ; catch rate
	db 159 ; base exp

	INCBIN "gfx/pokemon/front/beedrill.pic", 0, 1 ; sprite dimensions
	dw BeedrillPicFront, BeedrillPicBackSW

	db POISON_STING, STRING_SHOT, HARDEN, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	tmhm \
	FURY_ATTACK,\ ; MUD BOMB
	SONICBOOM,\ ; ILL WIND
	RAZOR_WIND,\ ; ROOST
	PIN_MISSILE,\
	TOXIC,\
	HORN_DRILL,\ ; VENOM DRILL
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	AMNESIA,\ ; CALM MIND
	BARRIER,\
	SOLARBEAM,\ ; SOLAR CANNON
	CRABHAMMER,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	SLAM,\ ; WASTEMAKER
	KARATE_CHOP,\
	SKY_ATTACK,\ ; BRAVE BIRD
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	SLUDGE,\ ; SLUDGE BOMB
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLY
	; end


	db BANK(BeedrillPicFront)
	db 0
	db BANK(BeedrillPicBack)
	db BANK(BeedrillPicBackSW)

	dw 0, BeedrillPicBack
