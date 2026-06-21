	db DEX_DROWZEE ; pokedex id

	db  60,  48,  45,  42,  90
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, POISON ; type
	db 190 ; catch rate
	db 102 ; base exp

	INCBIN "gfx/pokemon/front/drowzee.pic", 0, 1 ; sprite dimensions
	dw DrowzeePicFront, DrowzeePicBackSW

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
	CALM_MIND,\
	LOW_KICK,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	BARRIER,\
	PSYCHIC_M,\
	MIRAGE,\
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

	db BANK(DrowzeePicFront)
	db 0
	db BANK(DrowzeePicBack)
	db BANK(DrowzeePicBackSW)

	dw 0, DrowzeePicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CALCULATING NATURE_LAZY
;@ pal_battle   PAL_YELLOWMON
;@ pal_altbattle PAL_0F
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo         EVOLVE_LEVEL, 26, HYPNO
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       12, DISABLE
;@ learn       17, CONFUSION
;@ learn       24, HEADBUTT
;@ learn       29, SMOG
;@ learn       33, PHANTASM
;@ learn       37, PSYCHIC_M
;@ learn       43, TOXIC
;@ learn       48, EMETIC_PURGE
;@ learn       54, SOULSTEALER
