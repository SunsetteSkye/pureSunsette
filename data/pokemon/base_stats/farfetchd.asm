	db DEX_FARFETCHD ; pokedex id

	db  90,  80,  55,  85,  80
	;   hp  atk  def  spd  spc

	db GRASS, FLYING ; type
	db 85 ; catch rate
	db 130 ; base exp

	INCBIN "gfx/pokemon/front/farfetchd.pic", 0, 1 ; sprite dimensions
	dw FarfetchdPicFront, FarfetchdPicBackSW

	db GUST, LEER, NO_MOVE, NO_MOVE
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	HONE_EDGE,\
	DISABLE,\
	SWORDS_DANCE,\
	AURORA_MIST,\
	SHADOW_GAME,\
	TOXIC,\
	BODY_SLAM,\
	QUICK_ATTACK,\
	DOUBLE_EDGE,\
	WATER_PULSE,\
	SUPER_SOAK,\
	HYPER_BEAM,\
	GIGA_DRAIN,\
	MEGA_DRAIN,\
	MUD_BOMB,\
	DIG,\
	FINISHER,\
	DEMOLISH,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	ILL_WIND,\
	BARRIER,\
	BRAVE_BIRD,\
	SKITTERMIND,\
	METEOR_SWEEP,\
	SUBSTITUTE,\
	RIPTIDE,\
	AQUA_RING,\
	RAZOR_LEAF,\
	ADAPTATION,\
	VOID_MIND,\
	ROOST,\
	LEAP_ATTACK,\
	PIN_MISSILE,\
	LEECH_LIFE,\
	TEMPEST,\
	ROCK_ON,\
	CUT,\
	FLY,\
	SURF
	; end


	db BANK(FarfetchdPicFront)
	db BANK(FarfetchdPicFrontAlt)
	db BANK(FarfetchdPicBack)
	db BANK(FarfetchdPicBackSW)

	dw FarfetchdPicFrontAlt, FarfetchdPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_ARROGANT NATURE_CAUTIOUS
;@ pal_battle   PAL_LEEKMON
;@ pal_altbattle PAL_BROWNMON2
;@ pal_icon     $FF
;@ pal_alticon  PAL_ICON_10
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       13, WING_ATTACK
;@ learn       16, AGILITY
;@ learn       19, RAZOR_LEAF
;@ learn       22, SOFTBOILED
;@ learn       26, AIR_DRILL
;@ learn       30, SWIFT
;@ learn       34, FOCUS_ENERGY
;@ learn       38, SENBONZAKURA
;@ learn       42, MOCKINGBIRD
;@ learn       47, SLASH
;@ tutor       PAY_DAY
;@ tutor       CLOBBERCLOCK
;@ tutor       PISTON_KICK
;@ tutor       HURRICANE
;@ tutor       METEOR_DRIVE
;@ tutor       SWIFT
