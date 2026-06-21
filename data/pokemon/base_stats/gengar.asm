	db DEX_GENGAR ; pokedex id

	db  60,  65,  60, 110, 130
	;   hp  atk  def  spd  spc

	db GHOST, FLOATING ; type
	db 45 ; catch rate
	db 190 ; base exp

	INCBIN "gfx/pokemon/front/gengar.pic", 0, 1 ; sprite dimensions
	dw GengarPicFront, GengarPicBackSW

	db LICK, TOXIC, GUST, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	FROST_FIST,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	HYPER_BEAM,\
	LOW_KICK,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	THUNDERBOLT,\
	THUNDER,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	MIRAGE,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	DEMOLISH,\
	LOVELY_KISS,\
	SKITTERMIND,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH,\
	FLASH
	; end

	db BANK(GengarPicFront)
	db BANK(GengarPicFrontAlt)
	db BANK(GengarPicBack)
	db BANK(GengarPicBackSW)

	dw GengarPicFrontAlt, GengarPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CRUEL NATURE_PLAYFUL
;@ pal_battle   PAL_REDPURPLEMON
;@ pal_altbattle PAL_0F
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   "Your own shadow" "looks like it now<...>"
;@ evo_react   "It grins wide," "fangs flashing!"
;@ evo_react   "It sinks into the" "floor, cackling!"
;@ evo_react   "It darts around" "you in a blur!"
;@ learn       21, PHANTASM
;@ learn       24, HYPNOSIS
;@ learn       29, EMETIC_PURGE
;@ learn       33, CONFUSE_RAY
;@ learn       41, SHADOW_BOX
;@ learn       46, DOUBLE_TEAM
;@ learn       51, MAXIMIZE
;@ learn       57, SOULSTEALER
