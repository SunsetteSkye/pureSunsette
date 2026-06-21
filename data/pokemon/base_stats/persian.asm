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
	ADAPTATION,\
	MUD_BOMB,\
	PIN_MISSILE,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	HYPER_BEAM,\
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
