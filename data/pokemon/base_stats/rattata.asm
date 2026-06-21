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
	ADAPTATION,\
	MUD_BOMB,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	ICE_BEAM,\
	BLIZZARD,\
	CALM_MIND,\
	LOW_KICK,\
	METEOR_SWEEP,\
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	DIG,\
	MIRAGE,\
	SWORDS_DANCE,\
	BULK_UP,\
	SHADOW_BALL,\
	SHADOW_GAME,\
	ROCK_ON,\
	SUBSTITUTE,\
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
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       7, BITE
;@ learn       12, DISABLE
;@ learn       14, MUD_BOMB
;@ learn       17, BLITZ_STRIKE
;@ learn       20, SCREECH
;@ learn       23, DIG
;@ learn       26, LEAP_ATTACK
;@ learn       31, HYPER_FANG
;@ learn       34, FOCUS_ENERGY
;@ learn       40, ADAPTATION
;@ learn       45, SUPER_FANG
