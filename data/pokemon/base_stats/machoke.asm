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
	SHADOW_GAME,\
	ROCK_SLIDE,\
	ROCK_ON,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
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
;@ pal_altbattle PAL_OLIVEMON
;@ pal_icon     PAL_ICON_36
;@ pal_alticon  PAL_ICON_37
;@ evo         EVOLVE_TRADE, 1, MACHAMP
;@ evo         EVOLVE_LEVEL, 37, MACHAMP
;@ evo_move    NO_MOVE
;@ evo_react   "It flexes, veins" "bulging, eager!"
;@ evo_react   "It strikes a pose," "muscles rippling!"
;@ evo_react   "It hoists unseen" "weight with ease!"
;@ evo_react   "Cracks its neck," "ready to lift!"
;@ learn       15, LOW_KICK
;@ learn       18, SEISMIC_TOSS
;@ learn       20, BULK_UP
;@ learn       23, COMBOBREAKER
;@ learn       26, FOCUS_ENERGY
;@ learn       30, POWER_BIND
;@ learn       35, MACH_PUNCH
;@ learn       41, SHADOW_BOX
;@ learn       44, LEAP_ATTACK
;@ learn       47, SHORYUKEN
;@ learn       52, DIZZY_PUNCH
;@ learn       56, METEOR_DRIVE
