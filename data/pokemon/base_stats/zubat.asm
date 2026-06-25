	db DEX_ZUBAT ; pokedex id

	db  40,  45,  35,  65,  40
	;   hp  atk  def  spd  spc

	db POISON, FLYING ; type
	db 255 ; catch rate
	db 54 ; base exp

	INCBIN "gfx/pokemon/front/zubat.pic", 0, 1 ; sprite dimensions
	dw ZubatPicFront, ZubatPicBackSW

	db GUST, ABSORB, NO_MOVE, NO_MOVE ; level 1 learnset
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
	QUICK_ATTACK,\
	DOUBLE_EDGE,\
	SEISMIC_TOSS,\
	MEGA_DRAIN,\
	MUD_BOMB,\
	FINISHER,\
	DEMOLISH,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	ILL_WIND,\
	SHADOW_BALL,\
	BARRIER,\
	BRAVE_BIRD,\
	SKITTERMIND,\
	SUBSTITUTE,\
	RAZOR_LEAF,\
	ADAPTATION,\
	CALM_MIND,\
	PSYCHO_SHIFT,\
	LOVELY_KISS,\
	ROOST,\
	LEAP_ATTACK,\
	LEECH_LIFE,\
	TEMPEST,\
	CUT,\
	FLY
	; end


	db BANK(ZubatPicFront)
	db 0
	db BANK(ZubatPicBack)
	db BANK(ZubatPicBackSW)

	dw 0, ZubatPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_HYPER NATURE_GLUTTON
;@ pal_battle   PAL_TWILIGHTMON
;@ pal_altbattle PAL_PINKMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo         EVOLVE_LEVEL, 22, GOLBAT
;@ evo_move    SCREECH
;@ evo_react   NONE
;@ learn       6, LEECH_LIFE
;@ learn       10, SUPERSONIC
;@ learn       15, WING_ATTACK
;@ learn       20, ROOST
;@ learn       25, POISON_FANG
;@ learn       31, CONFUSE_RAY
;@ learn       38, AIR_DRILL
;@ learn       45, MAXIMIZE
;@ learn       52, HYPER_FANG
;@ learn       60, VENOM_DRILL
;@ tutor       SOULSTEALER
;@ tutor       HURRICANE
;@ tutor       METEOR_DRIVE
;@ tutor       SCREECH
