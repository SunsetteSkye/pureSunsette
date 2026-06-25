	db DEX_SEEL ; pokedex id

	db  65,  45,  55,  45,  70
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 190 ; catch rate
	db 100 ; base exp

	INCBIN "gfx/pokemon/front/seel.pic", 0, 1 ; sprite dimensions
	dw SeelPicFront, SeelPicBackSW

	db TACKLE, SUPER_SOAK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	DISABLE,\
	AURORA_MIST,\
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	WATER_PULSE,\
	SUPER_SOAK,\
	ICE_BEAM,\
	BLIZZARD,\
	SOLARBEAM,\
	MUD_BOMB,\
	DEMOLISH,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	BARRIER,\
	SUBSTITUTE,\
	RIPTIDE,\
	AQUA_RING,\
	ADAPTATION,\
	CALM_MIND,\
	LOVELY_KISS,\
	LEAP_ATTACK,\
	PIN_MISSILE,\
	TEMPEST,\
	ROCK_ON,\
	SURF,\
	STRENGTH,\
	FLASH
	; end


	db BANK(SeelPicFront)
	db 0
	db BANK(SeelPicBack)
	db BANK(SeelPicBackSW)

	dw 0, SeelPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_PLAYFUL NATURE_LAZY
;@ pal_battle   PAL_PEARLMON
;@ pal_altbattle PAL_AQUAMON
;@ pal_icon     PAL_ICON_45
;@ pal_alticon  PAL_ICON_46
;@ evo         EVOLVE_LEVEL, 27, DEWGONG
;@ evo_move    SING
;@ evo_react   NONE
;@ learn       8, HEADBUTT
;@ learn       12, WATER_PULSE
;@ learn       16, SAPPING_COLD
;@ learn       20, AURORA_BEAM
;@ learn       24, SLAM
;@ learn       28, RIPTIDE
;@ learn       32, REST
;@ learn       36, ICE_BEAM
;@ learn       40, AURORA_MIST
;@ learn       44, HYDRO_PUMP
;@ learn       48, CALM_MIND
;@ learn       54, BLIZZARD
;@ learn       60, HYDROBATH
;@ tutor       PAY_DAY
;@ tutor       METEOR_DRIVE
;@ tutor       SWIFT
