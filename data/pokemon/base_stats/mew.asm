	db DEX_MEW ; pokedex id

	db 100, 100, 100, 100, 100
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, NORMAL ; type
	db 25 ; catch rate
	db 64 ; base exp

	INCBIN "gfx/pokemon/front/mew.pic", 0, 1 ; sprite dimensions
	dw MewPicFront, MewPicBackSW

	db TACKLE, PSYCHIC_M, MIMIC, RECOVER ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

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

	db BANK(MewPicFront)
	db 0
	db BANK(MewPicBack)
	db BANK(MewPicBackSW)

	dw 0, MewPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_PLAYFUL NATURE_WISE
;@ pal_battle   PAL_BLUSHMON
;@ pal_altbattle PAL_MEWMON
;@ pal_icon     PAL_ICON_26
;@ pal_alticon  PAL_ICON_78
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       10, CONFUSION
;@ learn       20, MIMIC
;@ learn       30, HEADBUTT
;@ learn       40, PSYCHIC_M
;@ learn       50, PHANTASM
;@ learn       51, TRANSFORM
;@ learn       55, DIZZY_PUNCH
;@ learn       59, METRONOME
;@ learn       63, SUBSTITUTE
