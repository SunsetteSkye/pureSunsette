	db DEX_BUTTERFREE ; pokedex id

	db  70,  55,  50,  80, 120
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
	ROOST,\
	TOXIC,\
	HONE_EDGE,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	HYPER_BEAM,\
	CALM_MIND,\
	BARRIER,\
	ADAPTATION,\
	SOLARBEAM,\ 
	RIPTIDE,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	VOID_MIND,\
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	SKITTERMIND,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
	CUT,\
	FLY,\
	SURF,\
	FLASH
	;end

	db BANK(ButterfreePicFront)
	db BANK(ButterfreePicFrontAlt)
	db BANK(ButterfreePicBack)
	db BANK(ButterfreePicBackSW)

	dw ButterfreePicFrontAlt, ButterfreePicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_GENTLE NATURE_CONSIDERATE
;@ pal_battle   PAL_SOFTVIOSCAR
;@ pal_altbattle PAL_PINKMON
;@ pal_icon     PAL_ICON_07
;@ pal_alticon  PAL_ICON_09
;@ evo_move    NO_MOVE
;@ evo_react   "Wet wings gleam" "in the light!"
;@ evo_react   "It flutters up," "light as air!"
;@ evo_react   "Scales scatter" "in a shimmer!"
;@ evo_react   "It loops once" "and darts away!"
;@ learn       10, CONFUSION
;@ learn       12, GUST
;@ learn       15, POISONPOWDER
;@ learn       16, DISABLE
;@ learn       17, PSYBEAM
;@ learn       20, CONFUSE_RAY
;@ learn       24, STUN_SPORE
;@ learn       27, HURRICANE
;@ learn       33, PSYCHIC_M
;@ learn       35, EMETIC_PURGE
;@ learn       45, SOULSTEALER
;@ learn       45, SLEEP_POWDER
;@ learn       50, CRYSTALLIZE
