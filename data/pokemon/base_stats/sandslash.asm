	db DEX_SANDSLASH ; pokedex id

	db  75, 100, 110,  65,  55
	;   hp  atk  def  spd  spc

	db GROUND, NORMAL ; type
	db 90 ; catch rate
	db 163 ; base exp

	INCBIN "gfx/pokemon/front/sandslash.pic", 0, 1 ; sprite dimensions
	dw SandslashPicFront, SandslashPicBackSW

	db POISON_STING, SCRATCH, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	HONE_EDGE,\
	DISABLE,\
	SWORDS_DANCE,\
	SHADOW_GAME,\
	TOXIC,\
	SLUDGE_BOMB,\
	BODY_SLAM,\
	QUICK_ATTACK,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	ZAPPERCUT,\
	FROST_FIST,\
	BLAZE_HAMMER,\
	SEISMIC_TOSS,\
	EARTHQUAKE,\
	MUD_BOMB,\
	DIG,\
	FINISHER,\
	DEMOLISH,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	HEAT_RUSH,\
	BARRIER,\
	METEOR_SWEEP,\
	ROCK_SLIDE,\
	OROCLASM,\
	SUBSTITUTE,\
	ADAPTATION,\
	LEAP_ATTACK,\
	PIN_MISSILE,\
	CLAY_ARMOR,\
	ROCK_ON,\
	CUT,\
	STRENGTH
	; end

	db BANK(SandslashPicFront)
	db 0
	db BANK(SandslashPicBack)
	db BANK(SandslashPicBackSW)

	dw 0, SandslashPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CAUTIOUS NATURE_STOLID
;@ pal_battle   PAL_YELLOWMON
;@ pal_altbattle PAL_SANDMON
;@ pal_icon     PAL_ICON_16
;@ pal_alticon  PAL_ICON_17
;@ evo_move    NO_MOVE
;@ evo_react   "It stares coolly" "at its new claws."
;@ evo_react   "It curls up tight," "spikes bristling!"
;@ evo_react   "It rakes the dirt," "claws gleaming!"
;@ evo_react   "Spines snap up" "along its back!"
;@ learn       8, SAND_ATTACK
;@ learn       13, BULLDOZE
;@ learn       17, ROCK_ON
;@ learn       22, SWIFT
;@ learn       27, AGILITY
;@ learn       32, DIG
;@ learn       37, TWINEEDLE
;@ learn       43, SLASH
;@ learn       47, FOCUS_ENERGY
;@ learn       52, EARTHQUAKE
;@ learn       58, SPIKE_CANNON
;@ tutor       PAY_DAY
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
