	db DEX_HITMONCHAN ; pokedex id

	db  50, 115,  79,  76,  90
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db 95 ; catch rate
	db 140 ; base exp

	INCBIN "gfx/pokemon/front/hitmonchan.pic", 0, 1 ; sprite dimensions
	dw HitmonchanPicFront, HitmonchanPicBackSW

	db SEISMIC_TOSS, AGILITY, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	FURY_ATTACK,\ ; MUD BOMB
	ICE_PUNCH,\ ; FROST FIST
	FIRE_PUNCH,\ ; BLAZE HAMMER
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	LOW_KICK,\
	THUNDERPUNCH,\ ; ZAPPERCUT
	BARRIER,\
	SWORDS_DANCE,\
	BIDE,\ ; BULK UP
	SLAM,\ ; WASTEMAKER
	KARATE_CHOP,\
	MEDITATE,\ ; VOID MIND
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH,\
	FLASH
	; end

	db BANK(HitmonchanPicFront)
	db 0
	db BANK(HitmonchanPicBack)
	db BANK(HitmonchanPicBackSW)

	dw 0, HitmonchanPicBack

