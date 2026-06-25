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
	HYPER_BEAM,\
	ZAPPERCUT,\
	FROST_FIST,\
	BLAZE_HAMMER,\
	MUD_BOMB,\
	DIG,\
	FINISHER,\
	DEMOLISH,\
	BULK_UP,\
	BARRIER,\
	METEOR_SWEEP,\
	ROCK_SLIDE,\
	SUBSTITUTE,\
	RIPTIDE,\
	AQUA_RING,\
	ADAPTATION,\
	CALM_MIND,\
	VOID_MIND,\
	PSYCHO_SHIFT,\
	LEAP_ATTACK,\
	LEECH_LIFE,\
	CLAY_ARMOR,\
	ROCK_ON,\
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
;@ learn       12, MUD_CLAW
;@ learn       17, DISABLE
;@ learn       21, HYPER_FANG
;@ learn       27, FOCUS_ENERGY
;@ learn       33, LEAP_ATTACK
;@ learn       39, ADAPTATION
;@ learn       45, BLITZ_STRIKE
;@ learn       52, SUPER_FANG
;@ tutor       PAY_DAY
;@ tutor       CLOBBERCLOCK
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
;@ tutor       SWIFT
;@ tutor       SCREECH
;@ tutor       SOFTBOILED
