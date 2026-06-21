	db DEX_KADABRA ; pokedex id

	db  40,  35,  30, 105, 120
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 100 ; catch rate
	db 145 ; base exp

	INCBIN "gfx/pokemon/front/kadabra.pic", 0, 1 ; sprite dimensions
	dw KadabraPicFront, KadabraPicBackSW

	db TELEPORT, SEISMIC_TOSS, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	FROST_FIST,\
	BLAZE_HAMMER,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	CALM_MIND,\
	LOW_KICK,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	DIG,\
	PSYCHIC_M,\
	MIRAGE,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	DEMOLISH,\
	VOID_MIND,\
	LIGHT_SCREEN,\
	SKITTERMIND,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	FLASH
	; end

	db BANK(KadabraPicFront)
	db BANK(KadabraPicFrontAlt)
	db BANK(KadabraPicBack)
	db BANK(KadabraPicBackSW)

	dw KadabraPicFrontAlt, KadabraPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CALCULATING NATURE_WISE
;@ pal_battle   PAL_AMBERMON
;@ pal_altbattle PAL_BRICKMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo         EVOLVE_TRADE, 1, ALAKAZAM
;@ evo         EVOLVE_LEVEL, 37, ALAKAZAM
;@ evo_move    NO_MOVE
;@ evo_react   "Its spoon bends" "as the air hums."
;@ evo_react   "Its spoon twists" "with a soft hum."
;@ evo_react   "The air ripples" "around its head."
;@ evo_react   "It taps its brow," "thoughts surging."
;@ learn       16, CONFUSION
;@ learn       20, DISABLE
;@ learn       27, PSYBEAM
;@ learn       31, RECOVER
;@ learn       38, PSYCHIC_M
;@ learn       42, REFLECT
;@ learn       54, VOID_MIND
