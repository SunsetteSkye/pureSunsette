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
	DISABLE,\
	AURORA_MIST,\
	SHADOW_GAME,\
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	ZAPPERCUT,\
	FROST_FIST,\
	BLAZE_HAMMER,\
	SEISMIC_TOSS,\
	DIG,\
	PSYCHIC_M,\
	FINISHER,\
	DEMOLISH,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	ILL_WIND,\
	SHADOW_BALL,\
	SHADOW_BOX,\
	BARRIER,\
	ENERGY_FLUX,\
	SKITTERMIND,\
	METEOR_SWEEP,\
	SUBSTITUTE,\
	CALM_MIND,\
	VOID_MIND,\
	PSYCHO_SHIFT,\
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
;@ evo_move    PSYCHO_SHIFT
;@ evo_react   "Its spoon bends" "as the air hums."
;@ evo_react   "Its spoon twists" "with a soft hum."
;@ evo_react   "The air ripples" "around its head."
;@ evo_react   "It taps its brow," "thoughts surging."
;@ learn       18, DISABLE
;@ learn       22, METRONOME
;@ learn       27, PSYBEAM
;@ learn       32, REFLECT
;@ learn       38, RECOVER
;@ learn       43, CALM_MIND
;@ learn       48, PSYCHIC_M
;@ learn       53, BARRIER
;@ learn       57, VOID_MIND
;@ learn       63, PSYSHOCK
;@ tutor       TELEPORT
;@ tutor       CLOBBERCLOCK
;@ tutor       PISTON_KICK
