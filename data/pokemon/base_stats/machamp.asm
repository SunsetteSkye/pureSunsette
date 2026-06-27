	db DEX_MACHAMP ; pokedex id

	db  120, 130,  80,  55,  65
	;   hp   atk   def  spd  spc

	db FIGHTING, FIGHTING ; type
	db 75 ; catch rate
	db 193 ; base exp

	INCBIN "gfx/pokemon/front/machamp.pic", 0, 1 ; sprite dimensions
	dw MachampPicFront, MachampPicBackSW

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
	HYPER_BEAM,\
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

	db BANK(MachampPicFront)
	db 0
	db BANK(MachampPicBack)
	db BANK(MachampPicBackSW)

	dw 0, MachampPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_STOLID NATURE_SCRAPPY
;@ pal_battle   PAL_SLATEMON
;@ pal_altbattle PAL_CREAMPINKMON
;@ pal_icon     PAL_ICON_36
;@ pal_alticon  PAL_ICON_37
;@ evo_move    NO_MOVE
;@ evo_react   "All four arms" "flex at once!"
;@ evo_react   "It claps all four" "hands at once!"
;@ evo_react   "Each arm flexes" "in perfect sync!"
;@ evo_react   "It pounds a fist" "into a palm!"
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
