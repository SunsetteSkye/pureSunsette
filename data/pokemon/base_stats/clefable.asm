	db DEX_CLEFABLE ; pokedex id

	db  95,  70,  83,  60,  95
	;   hp  atk  def  spd  spc

	db NORMAL, PSYCHIC_TYPE ; type
	db 65 ; catch rate
	db 129 ; base exp

	INCBIN "gfx/pokemon/front/clefable.pic", 0, 1 ; sprite dimensions
	dw ClefablePicFront, ClefablePicBackSW

	db TACKLE, METRONOME, SING, DOUBLESLAP ; level 1 learnset
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
	HYPER_BEAM,\
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

	db BANK(ClefablePicFront)
	db 0
	db BANK(ClefablePicBack)
	db BANK(ClefablePicBackSW)

	dw 0, ClefablePicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_PLAYFUL NATURE_GENTLE
;@ pal_battle   PAL_CLEFMON
;@ pal_altbattle PAL_GAMEFREAK
;@ pal_icon     PAL_ICON_23
;@ pal_alticon  PAL_ICON_24
;@ evo_move    NO_MOVE
;@ evo_react   "A finger wiggle," "and up it floats!"
;@ evo_react   "It bounces up" "on springy feet!"
;@ evo_react   "Its wings flick," "sparkling softly!"
;@ evo_react   "It twirls once," "light as a puff!"
;@ learn       33, EGG_BOMB
;@ learn       40, PSYCHIC_M
;@ learn       47, LOVELY_KISS
;@ learn       54, MINIMIZE
;@ learn       60, TRI_ATTACK
;@ tutor       TRI_ATTACK
;@ tutor       SOULSTEALER
;@ tutor       PAY_DAY
;@ tutor       TELEPORT
;@ tutor       SOFTBOILED
;@ tutor       CLOBBERCLOCK
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
;@ tutor       SWIFT
;@ tutor       EGG_BOMB
