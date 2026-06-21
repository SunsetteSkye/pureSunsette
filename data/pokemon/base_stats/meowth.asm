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
	ADAPTATION,\
	MUD_BOMB,\
	PIN_MISSILE,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	LOW_KICK,\
	METEOR_SWEEP,\
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	DIG,\
	SWORDS_DANCE,\
	BULK_UP,\
	SHADOW_BALL,\
	DEMOLISH,\
	VOID_MIND,\
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	ROCK_ON,\
	SUBSTITUTE,\
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
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       8, LICK
;@ learn       10, MUD_CLAW
;@ learn       12, BITE
;@ learn       15, DOUBLE_KICK
;@ learn       17, SCREECH
;@ learn       21, SWIFT
;@ learn       25, LEAP_ATTACK
;@ learn       33, AGILITY
;@ learn       45, METEOR_DRIVE
;@ learn       53, SLASH
