; Sunsette: a Pokemon Tower B1F spirit borrows this dex slot -> base_stats/spirit_painless.asm (Spirit (Painless)).
	db DEX_WIGGLYTUFF ; pokedex id

	db 140,  70,  45,  55,  70
	;   hp  atk  def  spd  spc

	db NORMAL, FLOATING ; type
	db 50 ; catch rate
	db 109 ; base exp

	INCBIN "gfx/pokemon/front/wigglytuff.pic", 0, 1 ; sprite dimensions
	dw WigglytuffPicFront, WigglytuffPicBackSW

	db TACKLE, SING, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ROCK_ON,\
	ADAPTATION,\
	FROST_FIST,\
	BLAZE_HAMMER,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	CALM_MIND,\
	LOW_KICK,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	BARRIER,\
	SOLARBEAM,\ 
	THUNDERBOLT,\
	THUNDER,\
	DIG,\
	PSYCHIC_M,\
	MIRAGE,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	FIRE_BLAST,\
	DEMOLISH,\
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	SKITTERMIND,\
	SUBSTITUTE,\
	FLY,\
	STRENGTH,\
	FLASH
	; end

	db BANK(WigglytuffPicFront)
	db 0
	db BANK(WigglytuffPicBack)
	db BANK(WigglytuffPicBackSW)

	dw 0, WigglytuffPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_PLAYFUL NATURE_CONSIDERATE
;@ pal_battle   PAL_JIGGMON
;@ pal_altbattle PAL_GRAYVELVET
;@ pal_icon     PAL_ICON_26
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   "It puffs up big," "then squeaks!"
;@ evo_react   "It bounces high" "on a big breath!"
;@ evo_react   "Its fur fluffs out" "soft and round!"
;@ evo_react   "It claps its hands" "with a happy hop!"
;@ learn       9, DISABLE
;@ learn       13, ROCK_ON
;@ learn       16, DOUBLESLAP
;@ learn       24, BODY_SLAM
;@ learn       32, MINIMIZE
;@ learn       37, DIZZY_PUNCH
;@ learn       42, DOUBLE_EDGE
;@ learn       50, MAXIMIZE
;@ learn       55, SOULSTEALER
;@ learn       60, EXPLOSION
