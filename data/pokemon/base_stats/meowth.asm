	db DEX_MEOWTH ; pokedex id

	db  40,  45,  35,  90,  40
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 255 ; catch rate
	db 69 ; base exp

	INCBIN "gfx/pokemon/front/meowth.pic", 0, 1 ; sprite dimensions
	dw MeowthPicFront, MeowthPicBackSW

	db SCRATCH, GROWL, PAY_DAY, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	HONE_EDGE,\
	DISABLE,\
	SWORDS_DANCE,\
	AURORA_MIST,\
	SHADOW_GAME,\
	TOXIC,\
	SLUDGE_BOMB,\
	BODY_SLAM,\
	QUICK_ATTACK,\
	DOUBLE_EDGE,\
	SEISMIC_TOSS,\
	THUNDERBOLT,\
	THUNDER,\
	MUD_BOMB,\
	DIG,\
	FINISHER,\
	DEMOLISH,\
	BULK_UP,\
	LIGHT_SCREEN,\
	SHADOW_BALL,\
	SHADOW_BOX,\
	BARRIER,\
	ENERGY_FLUX,\
	METEOR_SWEEP,\
	SUBSTITUTE,\
	ADAPTATION,\
	CALM_MIND,\
	VOID_MIND,\
	PSYCHO_SHIFT,\
	LOVELY_KISS,\
	LEAP_ATTACK,\
	PIN_MISSILE,\
	ROCK_ON,\
	CUT,\
	STRENGTH,\
	FLASH
	; end


	db BANK(MeowthPicFront)
	db 0
	db BANK(MeowthPicBack)
	db BANK(MeowthPicBackSW)

	dw 0, MeowthPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_GLUTTON NATURE_ARROGANT
;@ pal_battle   PAL_YELLOWMON
;@ pal_altbattle PAL_MOCHAMON
;@ pal_icon     PAL_ICON_28
;@ pal_alticon  PAL_ICON_29
;@ evo         EVOLVE_LEVEL, 22, PERSIAN
;@ evo_move    SLASH
;@ evo_react   NONE
;@ learn       6, BITE
;@ learn       10, SCREECH
;@ learn       14, SWIFT
;@ learn       18, MUD_CLAW
;@ learn       23, DISABLE
;@ learn       28, DOUBLE_KICK
;@ learn       33, AGILITY
;@ learn       39, LEAP_ATTACK
;@ learn       44, COMBOBREAKER
;@ learn       55, SOULSTEALER
;@ tutor       PAY_DAY
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
;@ tutor       SWIFT
;@ tutor       SCREECH
