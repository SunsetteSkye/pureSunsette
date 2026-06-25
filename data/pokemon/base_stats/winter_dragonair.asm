; Sunsette VARIANT FORM: Winter Dragonair, an alternate form of DRAGONAIR. Its base data reuses DRAGONAIR's dex slot (db DEX_DRAGONAIR). See base_stats/dragonair.asm.
	db DEX_DRAGONAIR ; pokedex id

	db  91,  84,  95,  80,  110
	;   hp  atk  def  spd  spc

	db DRAGON, ICE ; type
	db 45 ; catch rate
	db 218 ; base exp

	INCBIN "gfx/pokemon/front_alt/dragonair.pic", 0, 1 ; sprite dimensions
	dw WinterDragonairPicFront, WinterDragonairPicBackSW

	db WRAP, LEER, BELLOW, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	LEAP_ATTACK,\
	ADAPTATION,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	SOLARBEAM,\
	WYRM_WRATH,\
	THUNDERBOLT,\
	THUNDER,\
	RIPTIDE,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	FIRE_BLAST,\
	TEMPEST,\
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	SKITTERMIND,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	FLASH
	; end

	db BANK(WinterDragonairPicFront)
	db 0
	db BANK(WinterDragonairPicBack)
	db BANK(WinterDragonairPicBackSW)

	dw 0, WinterDragonairPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ learn 20, THUNDER_WAVE
;@ learn 25, RIPTIDE
;@ learn 29, AURORA_MIST
;@ learn 33, TEMPEST
;@ learn 38, BLITZ_STRIKE
;@ learn 46, AGILITY
;@ learn 52, HYPER_BEAM
;@ learn 60, INDIGNATION
