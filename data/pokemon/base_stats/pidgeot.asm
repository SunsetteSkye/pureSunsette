	db DEX_PIDGEOT ; pokedex id

<<<<<<< HEAD
	db  90,  90,  75, 121, 124
=======
	db  90, 104,  75, 121, 110
>>>>>>> 82098c034b04430d35be9a20daa414478faaf44f
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 65 ; catch rate
	db 172 ; base exp

	INCBIN "gfx/pokemon/front/pidgeot.pic", 0, 1 ; sprite dimensions
	dw PidgeotPicFront, PidgeotPicBackSW

<<<<<<< HEAD
	db SCRATCH, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate
=======
	db TACKLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate
>>>>>>> 82098c034b04430d35be9a20daa414478faaf44f

	tmhm \
	RAZOR_WIND,\ ; ROOST
	LEECH_SEED,\ 
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	BARRIER,\
	RAZOR_LEAF,\
<<<<<<< HEAD
	SOLARBEAM,\
=======
>>>>>>> 82098c034b04430d35be9a20daa414478faaf44f
	DRAGON_RAGE,\
	THUNDERBOLT,\
	THUNDER,\
	KINESIS,\ ; FIREWALL
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	SLAM,\ ; FILTHY SLAM
	KARATE_CHOP,\
	MEDITATE,\
	SKY_ATTACK,\
	LIGHT_SCREEN,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	SURF,\
	STRENGTH
	; end


	db BANK(PidgeotPicFront)
	db BANK(PidgeotPicFrontAlt)
	db BANK(PidgeotPicBack)
	db BANK(PidgeotPicBackSW)

	dw PidgeotPicFrontAlt, PidgeotPicBack

