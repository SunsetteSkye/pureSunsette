	db DEX_PIDGEY ; pokedex id

	db  40,  45,  40,  66,  49
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 255 ; catch rate
	db 55 ; base exp

	INCBIN "gfx/pokemon/front/pidgey.pic", 0, 1 ; sprite dimensions
	dw PidgeyPicFront, PidgeyPicBackSW

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	HONE_EDGE,\
	DISABLE,\
	SWORDS_DANCE,\
	AURORA_MIST,\
	SHADOW_GAME,\
	TOXIC,\
	QUICK_ATTACK,\
	DOUBLE_EDGE,\
	BLIZZARD,\
	SEISMIC_TOSS,\
	THUNDERBOLT,\
	THUNDER,\
	MUD_BOMB,\
	FINISHER,\
	REFLECT,\
	LIGHT_SCREEN,\
	HEAT_RUSH,\
	ILL_WIND,\
	BARRIER,\
	BRAVE_BIRD,\
	SUBSTITUTE,\
	RAZOR_LEAF,\
	ADAPTATION,\
	VOID_MIND,\
	PSYCHO_SHIFT,\
	ROOST,\
	LEAP_ATTACK,\
	PIN_MISSILE,\
	TEMPEST,\
	CUT,\
	FLY,\
	FLASH
	; end


	db BANK(PidgeyPicFront)
	db 0
	db BANK(PidgeyPicBack)
	db BANK(PidgeyPicBackSW)

	dw 0, PidgeyPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CAUTIOUS NATURE_GENTLE
;@ pal_battle   PAL_BROWNMON2
;@ pal_altbattle PAL_BROWNGOLDMON
;@ pal_icon     PAL_ICON_10
;@ pal_alticon  PAL_ICON_11
;@ evo         EVOLVE_LEVEL, 24, PIDGEOTTO
;@ evo_move    HONE_EDGE
;@ evo_react   NONE
;@ learn       5, GUST
;@ learn       8, SAND_ATTACK
;@ learn       12, QUICK_ATTACK
;@ learn       16, AGILITY
;@ learn       20, WING_ATTACK
;@ learn       28, SWIFT
;@ learn       32, RAZOR_LEAF
;@ learn       37, MOCKINGBIRD
;@ learn       42, HURRICANE
;@ learn       52, SENBONZAKURA
;@ learn       56, TRI_ATTACK
;@ learn       60, FOCUS_ENERGY
;@ tutor       HURRICANE
;@ tutor       METEOR_DRIVE
;@ tutor       EGG_BOMB
