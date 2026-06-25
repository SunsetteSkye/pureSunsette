; Sunsette POKEMON TOWER B1F SPIRIT: Spirit (The Maw). Borrows GOLBAT's dex slot for its base data (db DEX_GOLBAT). See base_stats/golbat.asm.
	db DEX_GOLBAT ; pokedex id

	db  75, 250,  75, 250,  75
	;   hp  atk  def  spd  spc

	db GHOST, FLYING ; type
	db 90 ; catch rate
	db 171 ; base exp

	INCBIN "gfx/battle/spirit_the_maw.pic", 0, 1 ; sprite dimensions
	dw TheMawPicFront, GolbatPicBackSW

	db LEECH_LIFE, HYPER_BEAM, MEGA_DRAIN, EMETIC_PURGE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	LEAP_ATTACK,\
	ROOST,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	HYPER_BEAM,\
	FINISHER,\
	BARRIER,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	TEMPEST,\
	LOVELY_KISS,\
	BRAVE_BIRD,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	FLASH
	; end

	db BANK(TheMawPicFront)
	db BANK(GolbatPicFrontAlt)
	db BANK(GolbatPicBack)
	db BANK(GolbatPicBackSW)

	dw GolbatPicFrontAlt, GolbatPicBack

