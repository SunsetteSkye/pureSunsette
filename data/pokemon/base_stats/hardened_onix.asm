; Sunsette VARIANT FORM: Hardened Onix, an alternate form of ONIX. Its base data reuses ONIX's dex slot (db DEX_ONIX). See base_stats/onix.asm.
; PureRGBnote: ADDED: powered up version of onix with better stats and less weaknesses.
	db DEX_ONIX ; pokedex id

	db  80,  80, 180,  80,  60
	;   hp  atk  def  spd  spc

	db CRYSTAL, GROUND ; type
	db 45 ; catch rate
	db 108 ; base exp

	INCBIN "gfx/pokemon/front/onix.pic", 0, 1 ; sprite dimensions
	dw OnixPicFront, OnixPicBackSW

	db TACKLE, SCREECH, HARDEN, ROCK_THROW ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ADAPTATION,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	BARRIER,\
	WYRM_WRATH,\
	EARTHQUAKE,\
	DIG,\
	MIRAGE,\
	SWORDS_DANCE,\
	BULK_UP,\
	SHADOW_BALL,\
	FIRE_BLAST,\
	LIGHT_SCREEN,\
	ROCK_SLIDE,\
	ROCK_ON,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
	CUT,\
	SURF,\
	STRENGTH
	; end

	db BANK(OnixPicFront)
	db BANK(OnixPicFrontAlt)
	db BANK(OnixPicBack)
	db BANK(OnixPicBackSW)

	dw OnixPicFrontAlt, OnixPicBack

