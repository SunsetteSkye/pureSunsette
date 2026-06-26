	db DEX_DEWGONG ; pokedex id

	db  90,  70,  80,  70,  95
	;   hp  atk  def  spd  spc

	db ICE, WATER ; type
	db 75 ; catch rate
	db 176 ; base exp

	INCBIN "gfx/pokemon/front/dewgong.pic", 0, 1 ; sprite dimensions
	dw DewgongPicFront, DewgongPicBackSW

	db TACKLE, SUPER_SOAK, SING, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	HONE_EDGE,\
	DISABLE,\
	SWORDS_DANCE,\
	AURORA_MIST,\
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	WATER_PULSE,\
	SUPER_SOAK,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
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

	db BANK(DewgongPicFront)
	db 0
	db BANK(DewgongPicBack)
	db BANK(DewgongPicBackSW)

	dw 0, DewgongPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_PLAYFUL NATURE_GENTLE
;@ pal_battle   PAL_FROSTMON
;@ pal_altbattle PAL_CYANMON
;@ pal_icon     PAL_ICON_47
;@ pal_alticon  PAL_ICON_18
;@ evo_move    NO_MOVE
;@ evo_react   "A pleasant chill" "swirls through."
;@ evo_react   "It dives, leaving" "a frosty trail!"
;@ evo_react   "It barks, breath" "fogging cold!"
;@ evo_react   "It glides on ice" "with a happy spin!"
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
