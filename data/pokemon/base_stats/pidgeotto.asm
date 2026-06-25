	db DEX_PIDGEOTTO ; pokedex id

	db  63,  70,  55, 86,  80
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 120 ; catch rate
	db 113 ; base exp

	INCBIN "gfx/pokemon/front/pidgeotto.pic", 0, 1 ; sprite dimensions
	dw PidgeottoPicFront, PidgeottoPicBackSW

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

	db BANK(PidgeottoPicFront)
	db BANK(PidgeottoPicFrontAlt)
	db BANK(PidgeottoPicBack)
	db BANK(PidgeottoPicBackSW)

	dw PidgeottoPicFrontAlt, PidgeottoPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_SCRAPPY NATURE_ARROGANT
;@ pal_battle   PAL_BROWNMON2
;@ pal_altbattle PAL_BROWNGOLDMON
;@ pal_icon     PAL_ICON_10
;@ pal_alticon  PAL_ICON_11
;@ evo         EVOLVE_LEVEL, 48, PIDGEOT
;@ evo_move    TEMPEST
;@ evo_react   "It flares its" "wings and shrieks!"
;@ evo_react   "It beats its wings" "into a gale!"
;@ evo_react   "It tilts its head," "eyes razor sharp!"
;@ evo_react   "It springs aloft" "with a cry!"
;@ learn_like  PIDGEY
;@ tutor       HURRICANE
;@ tutor       METEOR_DRIVE
;@ tutor       EGG_BOMB
