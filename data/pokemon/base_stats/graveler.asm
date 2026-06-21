	db DEX_GRAVELER ; pokedex id

	db  55,  95, 115,  35,  45
	;   hp  atk  def  spd  spc

	db ROCK, FIGHTING ; type
	db 120 ; catch rate
	db 134 ; base exp

	INCBIN "gfx/pokemon/front/graveler.pic", 0, 1 ; sprite dimensions
	dw GravelerPicFront, GravelerPicBackSW

	db TACKLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

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
	LOW_KICK,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	EARTHQUAKE,\
	DIG,\
	BULK_UP,\
	SHADOW_BALL,\
	FIRE_BLAST,\
	DEMOLISH,\
	VOID_MIND,\
	ROCK_SLIDE,\
	ROCK_ON,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
	CUT,\
	STRENGTH
	; end

	db BANK(GravelerPicFront)
	db BANK(GravelerPicFrontAlt)
	db BANK(GravelerPicBack)
	db BANK(GravelerPicBackSW)

	dw GravelerPicFrontAlt, GravelerPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_STOLID NATURE_SCRAPPY
;@ pal_battle   PAL_GRANITEMON
;@ pal_altbattle PAL_SANDSTONEMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo         EVOLVE_TRADE, 1, GOLEM
;@ evo         EVOLVE_LEVEL, 37, GOLEM
;@ evo_move    NO_MOVE
;@ evo_react   "It rolls up with" "a grinding rumble!"
;@ evo_react   "It tucks in tight" "and rolls away!"
;@ evo_react   "Boulders grind" "as it lurches up!"
;@ evo_react   "It cracks knuckles" "of solid stone!"
;@ learn       11, HARDEN
;@ learn       13, SEISMIC_TOSS
;@ learn       16, ROCK_THROW
;@ learn       19, BULK_UP
;@ learn       21, BLAZE_HAMMER
;@ learn       28, ROCK_SLIDE
;@ learn       31, DIZZY_PUNCH
;@ learn       34, EXPLOSION
;@ learn       39, EARTHQUAKE
;@ learn       46, METAMORPHIC
;@ learn       52, PISTON_KICK
;@ learn       60, COMBOBREAKER
