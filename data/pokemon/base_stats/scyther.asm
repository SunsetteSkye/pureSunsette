	db DEX_SCYTHER ; pokedex id

	db  70, 110,  80, 105,  55
	;   hp  atk  def  spd  spc

	db BUG, FLYING ; type
	db 75 ; catch rate
	db 187 ; base exp

	INCBIN "gfx/pokemon/front/scyther.pic", 0, 1 ; sprite dimensions
	dw ScytherPicFront, ScytherPicBackSW

	db BLITZ_STRIKE, HONE_EDGE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ADAPTATION,\
	ROOST,\
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
	DIG,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	TWISTER,\
	DEMOLISH,\
	BRAVE_BIRD,\
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	STRENGTH
	; end


	db BANK(ScytherPicFront)
	db BANK(ScytherPicFrontAlt)
	db BANK(ScytherPicBack)
	db BANK(ScytherPicBackSW)

	dw ScytherPicFrontAlt, ScytherPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CALCULATING NATURE_SCRAPPY
;@ pal_battle   PAL_LEAFMON
;@ pal_altbattle PAL_LEEKMON
;@ pal_icon     PAL_ICON_54
;@ pal_alticon  PAL_ICON_63
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       17, WING_ATTACK
;@ learn       19, FOCUS_ENERGY
;@ learn       23, PIN_MISSILE
;@ learn       25, DOUBLE_TEAM
;@ learn       27, LEAP_ATTACK
;@ learn       32, SWORDS_DANCE
;@ learn       38, EXTERMINATE
;@ learn       41, SLASH
;@ learn       48, AIR_DRILL
;@ learn       55, AGILITY
