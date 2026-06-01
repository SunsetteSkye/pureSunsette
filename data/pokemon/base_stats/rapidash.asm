	db DEX_RAPIDASH ; pokedex id

	db  65, 100,  70, 105,  90
	;   hp  atk  def  spd  spc

	db FIRE, FIGHTING ; type
	db 60 ; catch rate
	db 192 ; base exp

	INCBIN "gfx/pokemon/front/rapidash.pic", 0, 1 ; sprite dimensions
	dw RapidashPicFront, RapidashPicBackSW

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
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
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

	db BANK(RapidashPicFront)
	db 0
	db BANK(RapidashPicBack)
	db BANK(RapidashPicBackSW)

	dw 0, RapidashPicBack

