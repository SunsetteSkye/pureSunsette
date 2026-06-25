	db DEX_CLEFAIRY ; pokedex id

	db  70,  45,  48,  35,  60
	;   hp  atk  def  spd  spc

	db NORMAL, PSYCHIC_TYPE ; type
	db 150 ; catch rate
	db 68 ; base exp

	INCBIN "gfx/pokemon/front/clefairy.pic", 0, 1 ; sprite dimensions
	dw ClefairyPicFront, ClefairyPicBackSW

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	DISABLE,\
	AURORA_MIST,\
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	WATER_PULSE,\
	SUPER_SOAK,\
	ICE_BEAM,\
	BLIZZARD,\
	ZAPPERCUT,\
	FROST_FIST,\
	BLAZE_HAMMER,\
	SEISMIC_TOSS,\
	SOLARBEAM,\
	THUNDERBOLT,\
	THUNDER,\
	MUD_BOMB,\
	DIG,\
	PSYCHIC_M,\
	FINISHER,\
	DEMOLISH,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	SUPERNOVA,\
	FLAMETHROWER,\
	FIRE_BLAST,\
	ILL_WIND,\
	SHADOW_BALL,\
	BARRIER,\
	ENERGY_FLUX,\
	THUNDER_WAVE,\
	SKITTERMIND,\
	METEOR_SWEEP,\
	SUBSTITUTE,\
	AQUA_RING,\
	ADAPTATION,\
	CALM_MIND,\
	VOID_MIND,\
	PSYCHO_SHIFT,\
	LOVELY_KISS,\
	LEAP_ATTACK,\
	ROCK_ON,\
	FLY,\
	STRENGTH,\
	FLASH
	; end


	db BANK(ClefairyPicFront)
	db 0
	db BANK(ClefairyPicBack)
	db BANK(ClefairyPicBackSW)

	dw 0, ClefairyPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_PLAYFUL NATURE_GENTLE
;@ pal_battle   PAL_CLEFMON
;@ pal_altbattle PAL_GAMEFREAK
;@ pal_icon     PAL_ICON_23
;@ pal_alticon  PAL_ICON_24
;@ evo         EVOLVE_ITEM, MOON_STONE, 1, CLEFABLE
;@ evo_move    SOFTBOILED
;@ evo_react   NONE
;@ learn       5, DOUBLESLAP
;@ learn       8, SING
;@ learn       11, METRONOME
;@ learn       14, PSYBEAM
;@ learn       18, LIGHT_SCREEN
;@ learn       22, LOVELY_KISS
;@ learn       26, MIMIC
;@ learn       30, EGG_BOMB
;@ learn       35, REFLECT
;@ learn       40, PSYCHO_SHIFT
;@ learn       45, PSYCHIC_M
;@ learn       50, MINIMIZE
;@ learn       56, SENBONZAKURA
;@ learn       62, TRI_ATTACK
;@ tutor       TRI_ATTACK
;@ tutor       SOULSTEALER
;@ tutor       PAY_DAY
;@ tutor       TELEPORT
;@ tutor       CLOBBERCLOCK
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
;@ tutor       SWIFT
;@ tutor       EGG_BOMB
