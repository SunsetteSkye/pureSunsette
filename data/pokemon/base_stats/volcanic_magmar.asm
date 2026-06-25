; Sunsette VARIANT FORM: Volcanic Magmar, an alternate form of MAGMAR. Its base data reuses MAGMAR's dex slot (db DEX_MAGMAR). See base_stats/magmar.asm.
	db DEX_MAGMAR ; pokedex id

	db  85,  95,  57,  93,  95
	;   hp  atk  def  spd  spc

	db FIRE, MAGMA ; type
	db 85 ; catch rate
	db 167 ; base exp

	INCBIN "gfx/pokemon/front_alt/volcanic_magmar.pic", 0, 1 ; sprite dimensions
	dw VolcanicMagmarPicFront, VolcanicMagmarPicBackSW

	db EMBER, FIRE_SPIN, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	LEAP_ATTACK,\
	FROST_FIST,\
	BLAZE_HAMMER,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	CALM_MIND,\
	FINISHER,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	BARRIER,\
	SOLARBEAM,\
	WYRM_WRATH,\
	EARTHQUAKE,\
	DIG,\
	PSYCHIC_M,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	SUPERNOVA,\
	FIRE_BLAST,\
	DEMOLISH,\
	VOID_MIND,\
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	SKITTERMIND,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH,\
	FLASH
	; end


	db BANK(VolcanicMagmarPicFront)
	db 0
	db BANK(VolcanicMagmarPicBack)
	db BANK(VolcanicMagmarPicBackSW)

	dw 0, VolcanicMagmarPicBack

