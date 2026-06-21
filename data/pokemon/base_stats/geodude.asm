	db DEX_GEODUDE ; pokedex id

	db  40,  80, 100,  20,  30
	;   hp  atk  def  spd  spc

	db ROCK, FIGHTING ; type
	db 255 ; catch rate
	db 86 ; base exp

	INCBIN "gfx/pokemon/front/geodude.pic", 0, 1 ; sprite dimensions
	dw GeodudePicFront, GeodudePicBackSW

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


	db BANK(GeodudePicFront)
	db 0
	db BANK(GeodudePicBack)
	db BANK(GeodudePicBackSW)

	dw 0, GeodudePicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_STOLID NATURE_SCRAPPY
;@ pal_battle   PAL_GRANITEMON
;@ pal_altbattle PAL_SANDSTONEMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo         EVOLVE_LEVEL, 24, GRAVELER
;@ evo_move    NO_MOVE
;@ evo_react   NONE
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
