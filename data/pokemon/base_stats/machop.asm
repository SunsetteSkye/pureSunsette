	db DEX_MACHOP ; pokedex id

	db  70,  80,  50,  35,  35
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db 180 ; catch rate
	db 88 ; base exp

	INCBIN "gfx/pokemon/front/machop.pic", 0, 1 ; sprite dimensions
	dw MachopPicFront, MachopPicBackSW

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


	db BANK(MachopPicFront)
	db BANK(MachopPicFrontAlt)
	db BANK(MachopPicBack)
	db BANK(MachopPicBackSW)

	dw MachopPicFrontAlt, MachopPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_SCRAPPY NATURE_CONSIDERATE
;@ pal_battle   PAL_SLATEMON
;@ pal_altbattle PAL_OLIVEMON
;@ pal_icon     PAL_ICON_36
;@ pal_alticon  PAL_ICON_37
;@ evo         EVOLVE_LEVEL, 28, MACHOKE
;@ evo_move    NO_MOVE
;@ evo_react   NONE
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
