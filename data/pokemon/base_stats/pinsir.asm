	db DEX_PINSIR ; pokedex id

	db  65, 125, 100,  85,  55
	;   hp  atk  def  spd  spc

	db BUG, GROUND ; type
	db 65 ; catch rate
	db 200 ; base exp

	INCBIN "gfx/pokemon/front/pinsir.pic", 0, 1 ; sprite dimensions
	dw PinsirPicFront, PinsirPicBackSW

	db SEISMIC_TOSS, MUD_CLAW, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	ADAPTATION,\
	FROST_FIST,\
	MUD_BOMB,\
	PIN_MISSILE,\
	BLAZE_HAMMER,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	LOW_KICK,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	BARRIER,\
	EARTHQUAKE,\
	DIG,\
	SWORDS_DANCE,\
	BULK_UP,\
	SHADOW_BALL,\
	DEMOLISH,\
	VOID_MIND,\
	SHADOW_GAME,\
	ROCK_SLIDE,\
	ROCK_ON,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
	CUT,\
	SURF,\
	STRENGTH
	; end


	db BANK(PinsirPicFront)
	db BANK(PinsirPicFrontAlt)
	db BANK(PinsirPicBack)
	db BANK(PinsirPicBackSW)

	dw PinsirPicFrontAlt, PinsirPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CRUEL NATURE_SCRAPPY
;@ pal_battle   PAL_BROWNMON2
;@ pal_altbattle PAL_BLACK
;@ pal_icon     PAL_ICON_64
;@ pal_alticon  PAL_ICON_65
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       19, HARDEN
;@ learn       21, POWER_BIND
;@ learn       24, MUD_BOMB
;@ learn       27, FOCUS_ENERGY
;@ learn       30, UNDERBUG
;@ learn       33, SPIKE_CANNON
;@ learn       38, EARTHQUAKE
;@ learn       45, COMBOBREAKER
;@ learn       49, EXTERMINATE
;@ learn       54, STRENGTH
