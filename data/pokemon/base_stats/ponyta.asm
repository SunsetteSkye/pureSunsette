	db DEX_PONYTA ; pokedex id

	db  50,  85,  55,  90,  65
	;   hp  atk  def  spd  spc

<<<<<<< HEAD
	db FIRE, FIGHTING ; type
=======
	db FIRE, PSYCHIC_TYPE ; type
>>>>>>> 82098c034b04430d35be9a20daa414478faaf44f
	db 190 ; catch rate
	db 152 ; base exp

	INCBIN "gfx/pokemon/front/ponyta.pic", 0, 1 ; sprite dimensions
	dw PonytaPicFront, PonytaPicBackSW

	db EMBER, LOW_KICK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	HORN_DRILL,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	HYPER_BEAM,\
	HI_JUMP_KICK,\
	ROLLING_KICK,\ 
	BARRIER,\
	SOLARBEAM,\
	DRAGON_RAGE,\
<<<<<<< HEAD
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
=======
>>>>>>> 82098c034b04430d35be9a20daa414478faaf44f
	PSYCHIC_M,\
	KINESIS,\ ; FIREWALL
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\ ; FILTHY SLAM
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	PSYBEAM,\
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	STRENGTH,\
	FLASH
	; end


	db BANK(PonytaPicFront)
	db 0
	db BANK(PonytaPicBack)
	db BANK(PonytaPicBackSW)

	dw 0, PonytaPicBack

