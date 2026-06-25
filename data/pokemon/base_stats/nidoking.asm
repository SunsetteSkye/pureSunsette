	db DEX_NIDOKING ; pokedex id

	db  91, 102,  77,  85,  75
	;   hp  atk  def  spd  spc

	db POISON, GROUND ; type
	db 65 ; catch rate
	db 195 ; base exp

	INCBIN "gfx/pokemon/front/nidoking.pic", 0, 1 ; sprite dimensions
	dw NidokingPicFront, NidokingPicBackSW

	db TACKLE, LEER, INDIGNATION, BULLDOZE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	HONE_EDGE,\
	DISABLE,\
	SWORDS_DANCE,\
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
	ZAPPERCUT,\
	FROST_FIST,\
	BLAZE_HAMMER,\
	SEISMIC_TOSS,\
	WYRM_WRATH,\
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
	MUD_BOMB,\
	DIG,\
	FINISHER,\
	DEMOLISH,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	HEAT_RUSH,\
	FLAMETHROWER,\
	FIRE_BLAST,\
	ILL_WIND,\
	SHADOW_BOX,\
	BARRIER,\
	METEOR_SWEEP,\
	ROCK_SLIDE,\
	OROCLASM,\
	SUBSTITUTE,\
	ADAPTATION,\
	LEAP_ATTACK,\
	PIN_MISSILE,\
	CLAY_ARMOR,\
	ROCK_ON,\
	CUT,\
	SURF,\
	STRENGTH
	; end

	db BANK(NidokingPicFront)
	db 0
	db BANK(NidokingPicBack)
	db BANK(NidokingPicBackSW)

	dw 0, NidokingPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_RAGE NATURE_ARROGANT
;@ pal_battle   PAL_NIDOMASC
;@ pal_altbattle PAL_GREENBAR
;@ pal_icon     PAL_ICON_21
;@ pal_alticon  PAL_ICON_22
;@ evo_move    NO_MOVE
;@ evo_react   "It beats its chest" "and bellows!"
;@ evo_react   "Its tail swings," "ground quaking!"
;@ evo_react   "It throws its head" "back with a roar!"
;@ evo_react   "It pounds earth," "fists clenched!"
;@ learn       30, CLOBBERCLOCK
;@ learn       36, REST
;@ learn       42, VENOM_DRILL
;@ learn       48, EARTHQUAKE
;@ learn       55, SPIKE_CANNON
;@ tutor       PAY_DAY
;@ tutor       CLOBBERCLOCK
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
