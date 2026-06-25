	db DEX_SANDSHREW ; pokedex id

	db  50,  75,  85,  40,  30
	;   hp  atk  def  spd  spc

	db GROUND, NORMAL ; type
	db 255 ; catch rate
	db 93 ; base exp

	INCBIN "gfx/pokemon/front/sandshrew.pic", 0, 1 ; sprite dimensions
	dw SandshrewPicFront, SandshrewPicBackSW

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


	db BANK(SandshrewPicFront)
	db 0
	db BANK(SandshrewPicBack)
	db BANK(SandshrewPicBackSW)

	dw 0, SandshrewPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CAUTIOUS NATURE_STOLID
;@ pal_battle   PAL_YELLOWMON
;@ pal_altbattle PAL_SANDMON
;@ pal_icon     PAL_ICON_16
;@ pal_alticon  PAL_ICON_17
;@ evo         EVOLVE_LEVEL, 23, SANDSLASH
;@ evo_move    PIN_MISSILE
;@ evo_react   NONE
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
