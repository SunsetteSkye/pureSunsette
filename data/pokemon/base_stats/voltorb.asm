	db DEX_VOLTORB ; pokedex id

	db  40,  30,  50, 100,  55
	;   hp  atk  def  spd  spc

	db ELECTRIC, FIRE ; type
	db 190 ; catch rate
	db 103 ; base exp

	INCBIN "gfx/pokemon/front/voltorb.pic", 0, 1 ; sprite dimensions
	dw VoltorbPicFront, VoltorbPicBackSW

	db TACKLE, THUNDERSHOCK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	LEAP_ATTACK,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	CALM_MIND,\
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	FLASH
	; end


	db BANK(VoltorbPicFront)
	db BANK(VoltorbPicFrontAlt)
	db BANK(VoltorbPicBack)
	db BANK(VoltorbPicBackSW)

	dw VoltorbPicFrontAlt, VoltorbPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_RAGE NATURE_HYPER
;@ pal_battle   PAL_VOLTORBMON
;@ pal_altbattle PAL_GREENBAR
;@ pal_icon     PAL_ICON_04
;@ pal_alticon  PAL_ICON_48
;@ evo         EVOLVE_LEVEL, 27, ELECTRODE
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       15, THUNDER_WAVE
;@ learn       18, SPARK
;@ learn       22, SWIFT
;@ learn       24, HEAT_RUSH
;@ learn       28, SCREECH
;@ learn       31, THUNDERBOLT
;@ learn       35, EGG_BOMB
;@ learn       39, SUPERNOVA
;@ learn       42, EXPLOSION
;@ learn       48, THUNDER
;@ tutor       EXPLOSION
;@ tutor       TELEPORT
;@ tutor       METEOR_DRIVE
;@ tutor       SWIFT
;@ tutor       EGG_BOMB
;@ tutor       SCREECH
