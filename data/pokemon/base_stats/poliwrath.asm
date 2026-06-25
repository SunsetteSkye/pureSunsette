	db DEX_POLIWRATH ; pokedex id

	db  80, 100,  85,  90,  80
	;   hp  atk  def  spd  spc

	db WATER, FIGHTING ; type
	db 65 ; catch rate
	db 185 ; base exp

	INCBIN "gfx/pokemon/front/poliwrath.pic", 0, 1 ; sprite dimensions
	dw PoliwrathPicFront, PoliwrathPicBackSW

	db BUBBLE, SPLASH, SUPER_SOAK, HYPNOSIS ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	HONE_EDGE,\
	DISABLE,\
	AURORA_MIST,\
	SHADOW_GAME,\
	TOXIC,\
	SLUDGE_BOMB,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	WATER_PULSE,\
	SUPER_SOAK,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	FROST_FIST,\
	SEISMIC_TOSS,\
	MUD_BOMB,\
	DIG,\
	PSYCHIC_M,\
	FINISHER,\
	DEMOLISH,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	SHADOW_BOX,\
	BARRIER,\
	ENERGY_FLUX,\
	SKITTERMIND,\
	METEOR_SWEEP,\
	ROCK_SLIDE,\
	OROCLASM,\
	SUBSTITUTE,\
	RIPTIDE,\
	AQUA_RING,\
	ADAPTATION,\
	CALM_MIND,\
	VOID_MIND,\
	PSYCHO_SHIFT,\
	LEAP_ATTACK,\
	TEMPEST,\
	ROCK_ON,\
	CUT,\
	SURF,\
	STRENGTH
	; end

	db BANK(PoliwrathPicFront)
	db 0
	db BANK(PoliwrathPicBack)
	db BANK(PoliwrathPicBackSW)

	dw 0, PoliwrathPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_SCRAPPY NATURE_STOLID
;@ pal_battle   PAL_PEWTER
;@ pal_altbattle PAL_GREENBAR
;@ pal_icon     PAL_ICON_34
;@ pal_alticon  PAL_ICON_35
;@ evo_move    NO_MOVE
;@ evo_react   "It flexes huge" "arms with a grunt!"
;@ evo_react   "It throws a jab" "splitting the air!"
;@ evo_react   "It sets its feet," "muscles taut!"
;@ evo_react   "Pounds its chest" "with a roar!"
;@ learn       40, CLOBBERCLOCK
;@ learn       47, HYDRO_PUMP
;@ learn       54, SHADOW_BOX
;@ learn       60, SUPERPOWER
;@ tutor       SOULSTEALER
;@ tutor       PAY_DAY
;@ tutor       TELEPORT
;@ tutor       CLOBBERCLOCK
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
;@ tutor       EGG_BOMB
