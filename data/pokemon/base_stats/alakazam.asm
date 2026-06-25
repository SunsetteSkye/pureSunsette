	db DEX_ALAKAZAM ; pokedex id

	db  55,  50,  45, 120, 135
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 50 ; catch rate
	db 186 ; base exp

	INCBIN "gfx/pokemon/front/alakazam.pic", 0, 1 ; sprite dimensions
	dw AlakazamPicFront, AlakazamPicBackSW

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
	HYPER_BEAM,\
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

	db BANK(AlakazamPicFront)
	db 0 ; no alt front sprite
	db BANK(AlakazamPicBack)
	db BANK(AlakazamPicBackSW)

	dw 0, AlakazamPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_WISE NATURE_CALCULATING
;@ pal_battle   PAL_AMBERMON
;@ pal_altbattle PAL_BRICKMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   "Two spoons rise" "as its eyes glow."
;@ evo_react   "Its spoons orbit" "in slow circles."
;@ evo_react   "The air crackles" "with raw thought!"
;@ evo_react   "Whiskers twitch," "mind expanding."
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
