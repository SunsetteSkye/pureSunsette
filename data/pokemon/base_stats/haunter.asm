; Sunsette: has a variant form -> base_stats/powered_haunter.asm (Powered Haunter).
	db DEX_HAUNTER ; pokedex id

	db  45,  50,  45,  95, 115
	;   hp  atk  def  spd  spc

	db GHOST, FLOATING ; type
	db 90 ; catch rate
	db 126 ; base exp

	INCBIN "gfx/pokemon/front/haunter.pic", 0, 1 ; sprite dimensions
	dw HaunterPicFront, HaunterPicBackSW

	db LICK, TOXIC, GUST, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	FROST_FIST,\
	TOXIC,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	ZAPPERCUT,\
	THUNDERBOLT,\
	THUNDER,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	DEMOLISH,\
	LOVELY_KISS,\
	SKITTERMIND,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	CUT,\
	FLASH
	; end

	db BANK(HaunterPicFront)
	db 0
	db BANK(HaunterPicBack)
	db BANK(HaunterPicBackSW)

	dw 0, HaunterPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CRUEL NATURE_PLAYFUL
;@ pal_battle   PAL_REDPURPLEMON
;@ pal_altbattle PAL_0F
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo         EVOLVE_TRADE, 1, GENGAR
;@ evo         EVOLVE_LEVEL, 37, GENGAR
;@ evo_move    NO_MOVE
;@ evo_react   "A creepy giggle" "beckons you near."
;@ evo_react   "It pops behind you" "and snickers!"
;@ evo_react   "Its hands float" "off, waving sly!"
;@ evo_react   "It melts into air" "with a wink!"
;@ learn       21, PHANTASM
;@ learn       24, HYPNOSIS
;@ learn       29, EMETIC_PURGE
;@ learn       33, CONFUSE_RAY
;@ learn       41, SHADOW_BOX
;@ learn       46, DOUBLE_TEAM
;@ learn       51, MAXIMIZE
;@ learn       57, SOULSTEALER
;@ tutor       EXPLOSION
;@ tutor       SOULSTEALER
;@ tutor       TELEPORT
;@ tutor       CLOBBERCLOCK
;@ tutor       EGG_BOMB
;@ tutor       SCREECH
