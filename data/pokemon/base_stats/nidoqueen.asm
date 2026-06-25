	db DEX_NIDOQUEEN ; pokedex id

	db  90,  82,  87,  76,  95
	;   hp  atk  def  spd  spc

	db POISON, GROUND ; type
	db 45 ; catch rate
	db 194 ; base exp

	INCBIN "gfx/pokemon/front/nidoqueen.pic", 0, 1 ; sprite dimensions
	dw NidoqueenPicFront, NidoqueenPicBackSW

	db TACKLE, GROWL, BULLDOZE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	DISABLE,\
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
	AQUA_RING,\
	RAZOR_LEAF,\
	ADAPTATION,\
	CALM_MIND,\
	VOID_MIND,\
	PSYCHO_SHIFT,\
	LEAP_ATTACK,\
	PIN_MISSILE,\
	CLAY_ARMOR,\
	ROCK_ON,\
	CUT,\
	SURF,\
	STRENGTH
	; end

	db BANK(NidoqueenPicFront)
	db 0
	db BANK(NidoqueenPicBack)
	db BANK(NidoqueenPicBackSW)

	dw 0, NidoqueenPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CONSIDERATE NATURE_STOLID
;@ pal_battle   PAL_MUDDYWATER
;@ pal_altbattle PAL_SOFTVIOSCAR
;@ pal_icon     PAL_ICON_08
;@ pal_alticon  PAL_ICON_20
;@ evo_move    NO_MOVE
;@ evo_react   "It stomps down," "broad and proud!"
;@ evo_react   "It rears up tall," "scales flaring!"
;@ evo_react   "It lashes its tail" "like a club!"
;@ evo_react   "It bellows out," "fierce and grand!"
;@ learn       30, BODY_SLAM
;@ learn       36, REST
;@ learn       42, VENOM_LASH
;@ learn       48, EARTHQUAKE
;@ learn       55, INDIGNATION
;@ tutor       PAY_DAY
;@ tutor       CLOBBERCLOCK
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
