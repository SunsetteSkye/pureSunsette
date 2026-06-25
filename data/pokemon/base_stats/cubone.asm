	db DEX_CUBONE ; pokedex id

	db  50,  50,  95,  35,  40
	;   hp  atk  def  spd  spc

	db GROUND, GROUND ; type
	db 190 ; catch rate
	db 87 ; base exp

	INCBIN "gfx/pokemon/front/cubone.pic", 0, 1 ; sprite dimensions
	dw CubonePicFront, CubonePicBackSW

	db TACKLE, BONE_CLUB, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ADAPTATION,\
	FROST_FIST,\
	MUD_BOMB,\
	PIN_MISSILE,\
	BLAZE_HAMMER,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	ICE_BEAM,\
	BLIZZARD,\
	FINISHER,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	EARTHQUAKE,\
	DIG,\
	SWORDS_DANCE,\
	BULK_UP,\
	SHADOW_BALL,\
	FIRE_BLAST,\
	DEMOLISH,\
	VOID_MIND,\
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	ROCK_SLIDE,\
	ROCK_ON,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
	CUT,\
	STRENGTH
	; end


	db BANK(CubonePicFront)
	db 0
	db BANK(CubonePicBack)
	db BANK(CubonePicBackSW)

	dw 0, CubonePicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_MOROSE NATURE_RAGE
;@ pal_battle   PAL_CLAYMON
;@ pal_altbattle PAL_GHOSTMON
;@ pal_icon     PAL_ICON_49
;@ pal_alticon  PAL_ICON_50
;@ evo         EVOLVE_LEVEL, 28, MAROWAK
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       14, FOCUS_ENERGY
;@ learn       18, SCREECH
;@ learn       22, LIGHT_SCREEN
;@ learn       25, PHANTASM
;@ learn       27, HEADBUTT
;@ learn       30, DIG
;@ learn       33, MACH_PUNCH
;@ learn       36, SHADOW_BOX
;@ learn       40, BONEMERANG
;@ learn       45, METEOR_DRIVE
;@ learn       50, COMBOBREAKER
;@ tutor       TELEPORT
;@ tutor       CLOBBERCLOCK
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
;@ tutor       SCREECH
