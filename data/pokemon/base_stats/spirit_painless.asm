; Sunsette POKEMON TOWER B1F SPIRIT: Spirit (Painless). Borrows WIGGLYTUFF's dex slot for its base data (db DEX_WIGGLYTUFF). See base_stats/wigglytuff.asm.
	db DEX_WIGGLYTUFF ; pokedex id

	db 140,  80,  45,  55,  80
	;   hp  atk  def  spd  spc

	db NORMAL, GHOST ; type
	db 50 ; catch rate
	db 109 ; base exp

	INCBIN "gfx/battle/spirit_painless.pic", 0, 1 ; sprite dimensions
	dw PainlessPicFront, WigglytuffPicBackSW

	db METAMORPHIC, SUPERNOVA, HI_JUMP_KICK, DOUBLE_EDGE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ROCK_ON,\
	ADAPTATION,\
	FROST_FIST,\
	BLAZE_HAMMER,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	CALM_MIND,\
	LOW_KICK,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	BARRIER,\
	SOLARBEAM,\ 
	THUNDERBOLT,\
	THUNDER,\
	DIG,\
	PSYCHIC_M,\
	MIRAGE,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	SUPERNOVA,\
	FIRE_BLAST,\
	DEMOLISH,\
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	SKITTERMIND,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH,\
	FLASH
	; end

	db BANK(PainlessPicFront)
	db 0
	db BANK(WigglytuffPicBack)
	db BANK(WigglytuffPicBackSW)

	dw 0, WigglytuffPicBack

