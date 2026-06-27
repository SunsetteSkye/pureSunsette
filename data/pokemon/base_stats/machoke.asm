	db DEX_MACHOKE ; pokedex id

	db  80, 100,  70,  45,  50
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db 90 ; catch rate
	db 146 ; base exp

	INCBIN "gfx/pokemon/front/machoke.pic", 0, 1 ; sprite dimensions
	dw MachokePicFront, MachokePicBackSW

	db DEMOLISH, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	HONE_EDGE,\
	DISABLE,\
	SWORDS_DANCE,\
	SHADOW_GAME,\
	TOXIC,\
	BODY_SLAM,\
	QUICK_ATTACK,\
	DOUBLE_EDGE,\
	SUPER_SOAK,\
	ZAPPERCUT,\
	FROST_FIST,\
	BLAZE_HAMMER,\
	SEISMIC_TOSS,\
	EARTHQUAKE,\
	MUD_BOMB,\
	FINISHER,\
	DEMOLISH,\
	BULK_UP,\
	SUPERNOVA,\
	FLAMETHROWER,\
	FIRE_BLAST,\
	SHADOW_BOX,\
	METEOR_SWEEP,\
	ROCK_SLIDE,\
	SUBSTITUTE,\
	ADAPTATION,\
	VOID_MIND,\
	LEAP_ATTACK,\
	CLAY_ARMOR,\
	ROCK_ON,\
	CUT,\
	STRENGTH
	; end

	db BANK(MachokePicFront)
	db 0
	db BANK(MachokePicBack)
	db BANK(MachokePicBackSW)

	dw 0, MachokePicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_STOLID NATURE_CONSIDERATE
;@ pal_battle   PAL_SLATEMON
;@ pal_altbattle PAL_CREAMPINKMON
;@ pal_icon     PAL_ICON_36
;@ pal_alticon  PAL_ICON_37
;@ evo         EVOLVE_TRADE, 1, MACHAMP
;@ evo         EVOLVE_LEVEL, 37, MACHAMP
;@ evo_move    NO_MOVE
;@ evo_react   "It flexes, veins" "bulging, eager!"
;@ evo_react   "It strikes a pose," "muscles rippling!"
;@ evo_react   "It hoists unseen" "weight with ease!"
;@ evo_react   "Cracks its neck," "ready to lift!"
;@ learn       7, SEISMIC_TOSS
;@ learn       12, BULK_UP
;@ learn       17, CLOBBERCLOCK
;@ learn       22, COMBOBREAKER
;@ learn       27, FOCUS_ENERGY
;@ learn       32, STRENGTH
;@ learn       37, SHADOW_BOX
;@ learn       42, SHORYUKEN
;@ learn       47, POWER_BIND
;@ learn       52, LEAP_ATTACK
;@ learn       58, SUBMISSION
;@ tutor       CLOBBERCLOCK
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
