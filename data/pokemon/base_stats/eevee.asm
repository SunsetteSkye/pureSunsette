	db DEX_EEVEE ; pokedex id

	db  55,  55,  50,  55,  65
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 150 ; catch rate
	db 92 ; base exp

	INCBIN "gfx/pokemon/front/eevee.pic", 0, 1 ; sprite dimensions
	dw EeveePicFront, EeveePicBackSW

	db TACKLE, SAND_ATTACK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	LEAP_ATTACK,\
	ADAPTATION,\
	MUD_BOMB,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	FINISHER,\
	METEOR_SWEEP,\
	DIG,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	DEMOLISH,\
	LIGHT_SCREEN,\
	ROCK_ON,\
	SUBSTITUTE,\
	CUT,\
	FLASH
	; end


	db BANK(EeveePicFront)
	db 0
	db BANK(EeveePicBack)
	db BANK(EeveePicBackSW)

	dw 0, EeveePicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_PLAYFUL NATURE_CAUTIOUS
;@ pal_battle   PAL_BROWNMON2
;@ pal_altbattle PAL_MOCHAMON
;@ pal_icon     PAL_ICON_10
;@ pal_alticon  PAL_ICON_70
;@ evo         EVOLVE_ITEM, FIRE_STONE, 1, FLAREON
;@ evo         EVOLVE_ITEM, THUNDER_STONE, 1, JOLTEON
;@ evo         EVOLVE_ITEM, WATER_STONE, 1, VAPOREON
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       6, HONE_EDGE
;@ learn       10, BITE
;@ learn       14, BELLOW
;@ learn       18, SWIFT
;@ learn       25, HEADBUTT
;@ learn       30, TRI_ATTACK
;@ tutor       TRI_ATTACK
;@ tutor       PAY_DAY
;@ tutor       METEOR_DRIVE
;@ tutor       SWIFT
