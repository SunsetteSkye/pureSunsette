	db DEX_PIDGEY ; pokedex id

<<<<<<< HEAD
	db  40,  45,  40,  66,  49
=======
	db  40,  55,  40,  66,  69
>>>>>>> 82098c034b04430d35be9a20daa414478faaf44f
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 255 ; catch rate
	db 55 ; base exp

	INCBIN "gfx/pokemon/front/pidgey.pic", 0, 1 ; sprite dimensions
	dw PidgeyPicFront, PidgeyPicBackSW

<<<<<<< HEAD
	db SCRATCH, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate
=======
	db TACKLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate
>>>>>>> 82098c034b04430d35be9a20daa414478faaf44f

	; tm/hm learnset
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
	STRENGTH
	; end


	db BANK(PidgeyPicFront)
	db 0
	db BANK(PidgeyPicBack)
	db BANK(PidgeyPicBackSW)

	dw 0, PidgeyPicBack

