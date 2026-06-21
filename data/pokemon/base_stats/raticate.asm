	db DEX_RATICATE ; pokedex id

	db  65,  91,  60,  97,  75
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 125 ; catch rate
	db 116 ; base exp

	INCBIN "gfx/pokemon/front/raticate.pic", 0, 1 ; sprite dimensions
	dw RaticatePicFront, RaticatePicBackSW

	db SCRATCH, TAIL_WHIP, BLITZ_STRIKE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ADAPTATION,\
	FROST_FIST,\
	MUD_BOMB,\
	BLAZE_HAMMER,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	CALM_MIND,\
	LOW_KICK,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	RIPTIDE,\
	DIG,\
	MIRAGE,\
	SWORDS_DANCE,\
	BULK_UP,\
	SHADOW_BALL,\
	DEMOLISH,\
	VOID_MIND,\
	SHADOW_GAME,\
	ROCK_ON,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	STRENGTH
	; end


	db BANK(RaticatePicFront)
	db BANK(RaticatePicFrontAlt)
	db BANK(RaticatePicBack)
	db BANK(RaticatePicBackSW)

	dw RaticatePicFrontAlt, RaticatePicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_SCRAPPY NATURE_GLUTTON
;@ pal_battle   PAL_BROWNMON2
;@ pal_altbattle PAL_MAUVEMON
;@ pal_icon     PAL_ICON_14
;@ pal_alticon  PAL_ICON_13
;@ evo_move    NO_MOVE
;@ evo_react   "It gnashes its" "huge new fangs!"
;@ evo_react   "It scrabbles up," "whiskers twitch!"
;@ evo_react   "It gnaws the air" "with new vigor!"
;@ evo_react   "Its tail lashes" "quick and sharp!"
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
