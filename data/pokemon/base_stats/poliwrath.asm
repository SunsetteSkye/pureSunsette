	db DEX_POLIWRATH ; pokedex id

	db  80, 100,  85,  90,  80
	;   hp  atk  def  spd  spc

	db WATER, FIGHTING ; type
	db 65 ; catch rate
	db 185 ; base exp

	INCBIN "gfx/pokemon/front/poliwrath.pic", 0, 1 ; sprite dimensions
	dw PoliwrathPicFront, PoliwrathPicBackSW

	db BUBBLE, SPLASH, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	FROST_FIST,\
	MUD_BOMB,\
	BLAZE_HAMMER,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AQUA_RING,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	CALM_MIND,\
	LOW_KICK,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	BARRIER,\
	RIPTIDE,\
	DIG,\
	PSYCHIC_M,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	TWISTER,\
	DEMOLISH,\
	VOID_MIND,\
	LIGHT_SCREEN,\
	SKITTERMIND,\
	ROCK_SLIDE,\
	ROCK_ON,\
	SUBSTITUTE,\
	SURF,\
	STRENGTH,\
	FLASH
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
;@ learn       12, SUPER_SOAK
;@ learn       15, HYPNOSIS
;@ learn       19, CONFUSION
;@ learn       22, WATER_PULSE
;@ learn       27, BODY_SLAM
;@ learn       30, RIPTIDE
;@ learn       36, DIZZY_PUNCH
;@ learn       41, CALM_MIND
;@ learn       45, HYDRO_PUMP
;@ learn       52, SHADOW_BOX
