	db DEX_GOLDUCK ; pokedex id

	db  80,  92,  78,  85,  95
	;   hp  atk  def  spd  spc

	db WATER, PSYCHIC_TYPE ; type
	db 75 ; catch rate
	db 174 ; base exp

	INCBIN "gfx/pokemon/front/golduck.pic", 0, 1 ; sprite dimensions
	dw GolduckPicFront, GolduckPicBackSW

	db SCRATCH, BUBBLE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	HONE_EDGE,\
	DISABLE,\
	SWORDS_DANCE,\
	AURORA_MIST,\
	SHADOW_GAME,\
	TOXIC,\
	SLUDGE_BOMB,\
	BODY_SLAM,\
	QUICK_ATTACK,\
	DOUBLE_EDGE,\
	WATER_PULSE,\
	SUPER_SOAK,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	FROST_FIST,\
	SEISMIC_TOSS,\
	GIGA_DRAIN,\
	MEGA_DRAIN,\
	MUD_BOMB,\
	DIG,\
	PSYCHIC_M,\
	FINISHER,\
	DEMOLISH,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	SHADOW_BALL,\
	SHADOW_BOX,\
	BARRIER,\
	BRAVE_BIRD,\
	ENERGY_FLUX,\
	THUNDER_WAVE,\
	SKITTERMIND,\
	METEOR_SWEEP,\
	SUBSTITUTE,\
	RIPTIDE,\
	AQUA_RING,\
	RAZOR_LEAF,\
	CALM_MIND,\
	VOID_MIND,\
	PSYCHO_SHIFT,\
	LOVELY_KISS,\
	LEAP_ATTACK,\
	PIN_MISSILE,\
	LEECH_LIFE,\
	TEMPEST,\
	CUT,\
	SURF,\
	STRENGTH,\
	FLASH
	; end

	db BANK(GolduckPicFront)
	db BANK(GolduckPicFrontAlt)
	db BANK(GolduckPicBack)
	db BANK(GolduckPicBackSW)

	dw GolduckPicFrontAlt, GolduckPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_PLAYFUL NATURE_CALCULATING
;@ pal_battle   PAL_CERULEAN
;@ pal_altbattle PAL_KELPMON
;@ pal_icon     PAL_ICON_30
;@ pal_alticon  PAL_ICON_31
;@ evo_move    NO_MOVE
;@ evo_react   "It shakes its head" "clear and dives!"
;@ evo_react   "It slices water" "with a clean dive!"
;@ evo_react   "Eyes flare red," "mind sharpening!"
;@ evo_react   "It glides ahead," "webbed feet kick!"
;@ learn       6, CONFUSION
;@ learn       10, SUPER_SOAK
;@ learn       13, METRONOME
;@ learn       17, DOUBLESLAP
;@ learn       22, PSYBEAM
;@ learn       26, WATER_PULSE
;@ learn       31, DISABLE
;@ learn       36, MUDSLIDE
;@ learn       41, PSYCHOCRISIS
;@ learn       47, RIPTIDE
;@ learn       52, ENERGY_FLUX
;@ learn       58, MOCKINGBIRD
;@ learn       64, PSYCHIC_M
;@ tutor       PAY_DAY
;@ tutor       TELEPORT
;@ tutor       CLOBBERCLOCK
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
;@ tutor       SWIFT
;@ tutor       EGG_BOMB
;@ tutor       SCREECH
