	db DEX_MISSINGNO ; pokedex id

	db  255, 150, 150,  5,  5
	;   hp  atk  def  spd  spc

	db GHOST, NORMAL ; type
	db 3 ; catch rate
	db 255 ; base exp

	INCBIN "gfx/pokemon/front/missingno.pic", 0, 1 ; sprite dimensions
	dw MissingnoPicFront, MissingnoPicBackSW

	db BRAVE_BIRD, SUPER_SOAK, SUPER_SOAK, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	FROST_FIST,\
	ROOST,\
	MUD_BOMB,\
	PIN_MISSILE,\
	BLAZE_HAMMER,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AQUA_RING,\
	AURORA_MIST,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	CALM_MIND,\
	LOW_KICK,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	BARRIER,\
	ADAPTATION,\
	SOLARBEAM,\ 
	WYRM_WRATH,\
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
	RIPTIDE,\
	DIG,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	MIRAGE,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	FIRE_BLAST,\
	TWISTER,\
	DEMOLISH,\
	VOID_MIND,\
	LOVELY_KISS,\
	BRAVE_BIRD,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	SKITTERMIND,\
	SHADOW_GAME,\
	ROCK_SLIDE,\
	ROCK_ON,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
	CUT,\
	FLY,\
	SURF,\
	STRENGTH,\
	FLASH
	; end


	db BANK(MissingnoPicFront)
	db 0
	db BANK(MissingnoPicBack)
	db BANK(MissingnoPicBackSW)

	dw 0, MissingnoPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_DITZ NATURE_NONE
;@ pal_battle   PAL_MEWMON
;@ pal_altbattle PAL_MEWMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
