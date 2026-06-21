	db DEX_GOLEM ; pokedex id

	db  80, 110, 130,  45,  75
	;   hp  atk  def  spd  spc

	db ROCK, FIGHTING ; type
	db 65 ; catch rate
	db 177 ; base exp

	INCBIN "gfx/pokemon/front/golem.pic", 0, 1 ; sprite dimensions
	dw GolemPicFront, GolemPicBackSW

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
	HYPER_BEAM,\
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

	db BANK(GolemPicFront)
	db 0
	db BANK(GolemPicBack)
	db BANK(GolemPicBackSW)

	dw 0, GolemPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_STOLID NATURE_SCRAPPY
;@ pal_battle   PAL_BOULDERMON
;@ pal_altbattle PAL_MAGMAMON
;@ pal_icon     $FF
;@ pal_alticon  PAL_ICON_38
;@ evo_move    NO_MOVE
;@ evo_react   "It slams down," "ground trembles!"
;@ evo_react   "It curls into" "a perfect boulder!"
;@ evo_react   "Its shell hardens" "with a deep crack!"
;@ evo_react   "It rolls forward," "crushing all!"
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
