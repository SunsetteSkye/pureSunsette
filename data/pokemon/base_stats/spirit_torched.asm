; Sunsette POKEMON TOWER B1F SPIRIT: Spirit (Torched). Borrows EXEGGUTOR's dex slot for its base data (db DEX_EXEGGUTOR). See base_stats/exeggutor.asm.
	db DEX_EXEGGUTOR ; pokedex id

	db  95,  95,  85,  55, 125
	;   hp  atk  def  spd  spc

	db GRASS, FIRE ; type
	db 65 ; catch rate
	db 212 ; base exp

	INCBIN "gfx/battle/spirit_torched.pic", 0, 1 ; sprite dimensions
	dw TorchedPicFront, ExeggutorPicBackSW

	db BARRIER, FLAMETHROWER, SUPERNOVA, MEGA_DRAIN ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	LEAP_ATTACK,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AQUA_RING,\
	HYPER_BEAM,\
	CALM_MIND,\
	FINISHER,\
	METEOR_SWEEP,\
	BARRIER,\
	ADAPTATION,\
	SOLARBEAM,\
	EARTHQUAKE,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	SUPERNOVA,\
	LIGHT_SCREEN,\
	SKITTERMIND,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	STRENGTH,\
	FLASH
	; end

	db BANK(TorchedPicFront)
	db 0
	db BANK(ExeggutorPicBack)
	db BANK(ExeggutorPicBackSW)

	dw ExeggutorPicFrontAlt, ExeggutorPicBack

