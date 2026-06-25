	db DEX_PERSIAN ; pokedex id

	db  75,  80,  70, 115, 80
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 90 ; catch rate
	db 148 ; base exp

	INCBIN "gfx/pokemon/front/persian.pic", 0, 1 ; sprite dimensions
	dw PersianPicFront, PersianPicBackSW

	db SCRATCH, GROWL, BITE, SCREECH ; level 1 learnset
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
	HYPER_BEAM,\
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


	db BANK(PersianPicFront)
	db 0
	db BANK(PersianPicBack)
	db BANK(PersianPicBackSW)

	dw 0, PersianPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_ARROGANT NATURE_LAZY
;@ pal_battle   PAL_REDBAR
;@ pal_altbattle PAL_MOCHAMON
;@ pal_icon     PAL_ICON_28
;@ pal_alticon  PAL_ICON_29
;@ evo_move    NO_MOVE
;@ evo_react   "It struts past," "coat gleaming."
;@ evo_react   "It licks a paw," "calm and proud."
;@ evo_react   "Its gem flashes" "with a sly gleam."
;@ evo_react   "Its back arches," "fur bristling."
;@ learn       6, BITE
;@ learn       10, SCREECH
;@ learn       14, SWIFT
;@ learn       18, MUD_CLAW
;@ learn       23, DISABLE
;@ learn       28, DOUBLE_KICK
;@ learn       33, AGILITY
;@ learn       33, SLASH
;@ learn       39, LEAP_ATTACK
;@ learn       44, COMBOBREAKER
;@ learn       55, SOULSTEALER
;@ tutor       PAY_DAY
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
;@ tutor       SWIFT
;@ tutor       SCREECH
