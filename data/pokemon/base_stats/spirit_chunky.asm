; Sunsette POKEMON TOWER B1F SPIRIT: Spirit (Chunky). Borrows RAICHU's dex slot for its base data (db DEX_RAICHU). See base_stats/raichu.asm.
	db DEX_RAICHU ; pokedex id

	db  225,  85,  65, 25, 100
	;   hp  atk  def  spd  spc

	db ELECTRIC, FLOATING ; type
	db 95 ; catch rate
	db 122 ; base exp

	INCBIN "gfx/battle/spirit_chunky.pic", 0, 1 ; sprite dimensions
	dw ChunkyPicFront, RaichuPicBackSW

	db SOFTBOILED, REST, BODY_SLAM, SHELL_GAME ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	FROST_FIST,\
	BLAZE_HAMMER,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	HYPER_BEAM,\
	CALM_MIND,\
	LOW_KICK,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	RIPTIDE,\
	DIG,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	DEMOLISH,\
	VOID_MIND,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	STRENGTH,\
	FLASH
	; end

	db BANK(ChunkyPicFront)
	db 0
	db BANK(RaichuPicBack)
	db BANK(RaichuPicBackSW)

	dw 0, RaichuPicBack

