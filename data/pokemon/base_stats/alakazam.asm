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
	FROST_FIST,\
	BLAZE_HAMMER,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	HYPER_BEAM,\
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
;@ learn       16, CONFUSION
;@ learn       20, DISABLE
;@ learn       27, PSYBEAM
;@ learn       31, RECOVER
;@ learn       38, PSYCHIC_M
;@ learn       42, REFLECT
;@ learn       54, VOID_MIND
