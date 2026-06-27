	db DEX_BUTTERFREE ; pokedex id

	db  70,  55,  50,  70, 120
	;   hp  atk  def  spd  spc

	db BUG, PSYCHIC_TYPE ; type
	db 105 ; catch rate
	db 160 ; base exp

	INCBIN "gfx/pokemon/front/butterfree.pic", 0, 1 ; sprite dimensions
	dw ButterfreePicFront, ButterfreePicBackSW

	db HARDEN, TACKLE, STRING_SHOT, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	DISABLE,\
	AURORA_MIST,\
	SHADOW_GAME,\
	TOXIC,\
	SLUDGE_BOMB,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	SEISMIC_TOSS,\
	GIGA_DRAIN,\
	MEGA_DRAIN,\
	SOLARBEAM,\
	MUD_BOMB,\
	PSYCHIC_M,\
	REFLECT,\
	LIGHT_SCREEN,\
	ILL_WIND,\
	SHADOW_BALL,\
	BARRIER,\
	ENERGY_FLUX,\
	THUNDER_WAVE,\
	SKITTERMIND,\
	SUBSTITUTE,\
	AQUA_RING,\
	RAZOR_LEAF,\
	ADAPTATION,\
	CALM_MIND,\
	VOID_MIND,\
	PSYCHO_SHIFT,\
	LOVELY_KISS,\
	ROOST,\
	LEAP_ATTACK,\
	PIN_MISSILE,\
	LEECH_LIFE,\
	TEMPEST,\
	ROCK_ON,\
	CUT,\
	FLY,\
	SURF,\
	FLASH
	; end

	db BANK(ButterfreePicFront)
	db BANK(ButterfreePicFrontAlt)
	db BANK(ButterfreePicBack)
	db BANK(ButterfreePicBackSW)

	dw ButterfreePicFrontAlt, ButterfreePicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_GENTLE NATURE_CONSIDERATE
;@ pal_battle   PAL_BUTTERFREEMON
;@ pal_altbattle PAL_BUTTERFREEALT
;@ pal_icon     PAL_ICON_07
;@ pal_alticon  PAL_ICON_09
;@ evo_move    NO_MOVE
;@ evo_react   "Wet wings gleam" "in the light!"
;@ evo_react   "It flutters up," "light as air!"
;@ evo_react   "Scales scatter" "in a shimmer!"
;@ evo_react   "It loops once" "and darts away!"
;@ learn       12, GUST
;@ learn       15, PSYBEAM
;@ learn       18, POISONPOWDER
;@ learn       23, CONFUSE_RAY
;@ learn       28, STUN_SPORE
;@ learn       31, DISABLE
;@ learn       34, PSYCHIC_M
;@ learn       38, EMETIC_PURGE
;@ learn       42, BUG_OFF
;@ learn       46, SOULSTEALER
;@ learn       49, HURRICANE
;@ learn       52, SPORE
;@ learn       55, CRYSTALLIZE
;@ learn       58, TEMPEST
;@ tutor       SOULSTEALER
;@ tutor       TELEPORT
;@ tutor       HURRICANE
;@ tutor       SWIFT
;@ tutor       EGG_BOMB
