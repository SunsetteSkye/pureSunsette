	db DEX_HYPNO ; pokedex id

	db  90,  73,  70,  72, 115
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, POISON ; type
	db 75 ; catch rate
	db 165 ; base exp

	INCBIN "gfx/pokemon/front/hypno.pic", 0, 1 ; sprite dimensions
	dw HypnoPicFront, HypnoPicBackSW

	db TACKLE, HYPNOSIS, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ADAPTATION,\
	FROST_FIST,\
	MUD_BOMB,\
	BLAZE_HAMMER,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	HYPER_BEAM,\
	CALM_MIND,\
	FINISHER,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	BARRIER,\
	PSYCHIC_M,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	DEMOLISH,\
	VOID_MIND,\
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	SKITTERMIND,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
	CUT,\
	STRENGTH,\
	FLASH
	; end

	db BANK(HypnoPicFront)
	db 0
	db BANK(HypnoPicBack)
	db BANK(HypnoPicBackSW)

	dw 0, HypnoPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CALCULATING NATURE_GLUTTON
;@ pal_battle   PAL_LEMONMON
;@ pal_altbattle PAL_LEAFMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   "Its pendulum" "sways. Eyes lock."
;@ evo_react   "It twirls its" "pendulum slowly."
;@ evo_react   "Its eyes flash," "air goes still."
;@ evo_react   "It taps its head" "and yawns at you."
;@ learn       12, DISABLE
;@ learn       17, CONFUSION
;@ learn       24, HEADBUTT
;@ learn       29, SMOG
;@ learn       33, PHANTASM
;@ learn       37, PSYCHIC_M
;@ learn       43, TOXIC
;@ learn       48, EMETIC_PURGE
;@ learn       54, SOULSTEALER
;@ tutor       TRI_ATTACK
;@ tutor       SOULSTEALER
;@ tutor       TELEPORT
;@ tutor       CLOBBERCLOCK
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
;@ tutor       SWIFT
