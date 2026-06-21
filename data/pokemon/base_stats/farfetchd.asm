	db DEX_FARFETCHD ; pokedex id

	db  90,  80,  55,  85,  80
	;   hp  atk  def  spd  spc

	db GRASS, FLYING ; type
	db 85 ; catch rate
	db 130 ; base exp

	INCBIN "gfx/pokemon/front/farfetchd.pic", 0, 1 ; sprite dimensions
	dw FarfetchdPicFront, FarfetchdPicBackSW

	db GUST, BUBBLE, LEER, NO_MOVE
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ROOST,\
	MUD_BOMB,\
	PIN_MISSILE,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AQUA_RING,\
	HYPER_BEAM,\
	LOW_KICK,\
	METEOR_SWEEP,\
	BARRIER,\
	ADAPTATION,\
	RIPTIDE,\
	DIG,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	TWISTER,\
	DEMOLISH,\
	VOID_MIND,\
	BRAVE_BIRD,\
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	SURF,\
	STRENGTH,\
	FLASH
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
;@ learn       15, WING_ATTACK
;@ learn       17, AGILITY
;@ learn       19, SOFTBOILED
;@ learn       22, RAZOR_LEAF
;@ learn       24, FLY
;@ learn       27, SWIFT
;@ learn       31, SWORDS_DANCE
;@ learn       35, SENBONZAKURA
;@ learn       40, BRAVE_BIRD
;@ learn       45, MOCKINGBIRD
