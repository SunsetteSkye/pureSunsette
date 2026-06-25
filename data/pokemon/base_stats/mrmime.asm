	db DEX_MR_MIME ; pokedex id

	db  80,  45,  65,  90, 100
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, GHOST ; type
	db 95 ; catch rate
	db 136 ; base exp

	INCBIN "gfx/pokemon/front/mr.mime.pic", 0, 1 ; sprite dimensions
	dw MrMimePicFront, MrMimePicBackSW

	db CONFUSION, BARRIER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

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
	FINISHER,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	BARRIER,\
	SOLARBEAM,\
	THUNDERBOLT,\
	THUNDER,\
	RIPTIDE,\
	PSYCHIC_M,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	DEMOLISH,\
	VOID_MIND,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	SKITTERMIND,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	STRENGTH,\
	FLASH
	; end


	db BANK(MrMimePicFront)
	db 0
	db BANK(MrMimePicBack)
	db BANK(MrMimePicBackSW)

	dw 0, MrMimePicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CALCULATING NATURE_RAGE
;@ pal_battle   PAL_ROSEMON
;@ pal_altbattle PAL_WHITEMON
;@ pal_icon     PAL_ICON_62
;@ pal_alticon  PAL_ICON_27
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       17, DOUBLESLAP
;@ learn       19, LIGHT_SCREEN
;@ learn       23, PSYBEAM
;@ learn       25, TELEPORT
;@ learn       28, MOCKINGBIRD
;@ learn       31, SEISMIC_TOSS
;@ learn       35, VOID_MIND
;@ learn       39, PSYCHIC_M
;@ learn       44, ILL_WIND
;@ learn       48, SUBSTITUTE
;@ learn       53, MIMIC
;@ tutor       TRI_ATTACK
;@ tutor       SOULSTEALER
;@ tutor       TELEPORT
;@ tutor       CLOBBERCLOCK
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
;@ tutor       SWIFT
