	db DEX_RATTATA ; pokedex id

	db  30,  56,  35,  72,  35
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 255 ; catch rate
	db 57 ; base exp

	INCBIN "gfx/pokemon/front/rattata.pic", 0, 1 ; sprite dimensions
	dw RattataPicFront, RattataPicBackSW

	db SCRATCH, TAIL_WHIP, NO_MOVE, NO_MOVE ; level 1 learnset
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
	WATER_PULSE,\
	SUPER_SOAK,\
	ICE_BEAM,\
	BLIZZARD,\
	MUD_BOMB,\
	DIG,\
	FINISHER,\
	BULK_UP,\
	BARRIER,\
	METEOR_SWEEP,\
	ROCK_SLIDE,\
	SUBSTITUTE,\
	AQUA_RING,\
	ADAPTATION,\
	CALM_MIND,\
	PSYCHO_SHIFT,\
	LEAP_ATTACK,\
	LEECH_LIFE,\
	CLAY_ARMOR,\
	ROCK_ON,\
	CUT
	; end


	db BANK(RattataPicFront)
	db 0
	db BANK(RattataPicBack)
	db BANK(RattataPicBackSW)

	dw 0, RattataPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CAUTIOUS NATURE_SCRAPPY
;@ pal_battle   PAL_PURPLEMON
;@ pal_altbattle PAL_MAUVEMON
;@ pal_icon     PAL_ICON_12
;@ pal_alticon  PAL_ICON_13
;@ evo         EVOLVE_LEVEL, 20, RATICATE
;@ evo_move    SOFTBOILED
;@ evo_react   NONE
;@ learn       7, BITE
;@ learn       12, MUD_CLAW
;@ learn       17, DISABLE
;@ learn       21, HYPER_FANG
;@ learn       27, FOCUS_ENERGY
;@ learn       33, LEAP_ATTACK
;@ learn       39, ADAPTATION
;@ learn       45, BLITZ_STRIKE
;@ learn       52, SUPER_FANG
;@ tutor       PAY_DAY
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
;@ tutor       SWIFT
;@ tutor       SCREECH
;@ tutor       SOFTBOILED
