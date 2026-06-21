	db DEX_PSYDUCK ; pokedex id

	db  50,  52,  48,  55,  70
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 190 ; catch rate
	db 80 ; base exp

	INCBIN "gfx/pokemon/front/psyduck.pic", 0, 1 ; sprite dimensions
	dw PsyduckPicFront, PsyduckPicBackSW

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
	CALM_MIND,\
	LOW_KICK,\
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


	db BANK(PsyduckPicFront)
	db 0
	db BANK(PsyduckPicBack)
	db BANK(PsyduckPicBackSW)

	dw 0, PsyduckPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_DITZ NATURE_CALCULATING
;@ pal_battle   PAL_SAFFRON
;@ pal_altbattle PAL_THUNDERMON
;@ pal_icon     $FF
;@ pal_alticon  PAL_ICON_30
;@ evo         EVOLVE_LEVEL, 25, GOLDUCK
;@ evo_move    NO_MOVE
;@ evo_react   NONE
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
