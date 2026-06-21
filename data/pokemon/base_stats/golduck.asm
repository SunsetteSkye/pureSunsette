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
	FROST_FIST,\
	MUD_BOMB,\
	BLAZE_HAMMER,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AQUA_RING,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	CALM_MIND,\
	LOW_KICK,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	BARRIER,\
	RIPTIDE,\
	DIG,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	TWISTER,\
	DEMOLISH,\
	VOID_MIND,\
	LOVELY_KISS,\
	BRAVE_BIRD,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	SKITTERMIND,\
	SHADOW_GAME,\
	SUBSTITUTE,\
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
;@ learn       10, CONFUSION
;@ learn       13, SUPER_SOAK
;@ learn       17, DISABLE
;@ learn       20, DOUBLESLAP
;@ learn       23, LOW_KICK
;@ learn       27, RIPTIDE
;@ learn       32, METRONOME
;@ learn       34, SWIFT
;@ learn       38, CALM_MIND
;@ learn       44, PSYCHIC_M
;@ learn       50, TELEPORT
;@ learn       56, MOCKINGBIRD
;@ learn       60, HYDRO_PUMP
