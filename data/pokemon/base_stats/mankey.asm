	db DEX_MANKEY ; pokedex id

	db  40,  80,  35,  70,  70
	;   hp  atk  def  spd  spc

<<<<<<< HEAD
	db NORMAL, FIGHTING ; type
=======
	db FIGHTING, NORMAL ; type
>>>>>>> 82098c034b04430d35be9a20daa414478faaf44f
	db 190 ; catch rate
	db 74 ; base exp

	INCBIN "gfx/pokemon/front/mankey.pic", 0, 1 ; sprite dimensions
	dw MankeyPicFront, MankeyPicBackSW

	db SCRATCH, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ICE_PUNCH,\
	FIRE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	HI_JUMP_KICK,\
	THUNDERPUNCH,\
	ROLLING_KICK,\
	DRAGON_RAGE,\
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
	CRABHAMMER,\
	DIG,\
	SWORDS_DANCE,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	SLAM,\ ; FILTHY SLAM
	KARATE_CHOP,\
	MEDITATE,\
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH
	; end


	db BANK(MankeyPicFront)
	db BANK(MankeyPicFrontAlt)
	db BANK(MankeyPicBack)
	db BANK(MankeyPicBackSW)

	dw MankeyPicFrontAlt, MankeyPicBack

