	db DEX_NIDOQUEEN ; pokedex id

	db  90,  82,  87,  76,  95
	;   hp  atk  def  spd  spc

	db POISON, GROUND ; type
	db 45 ; catch rate
	db 194 ; base exp

	INCBIN "gfx/pokemon/front/nidoqueen.pic", 0, 1 ; sprite dimensions
	dw NidoqueenPicFront, NidoqueenPicBackSW

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	ADAPTATION,\
	FROST_FIST,\
	MUD_BOMB,\
	PIN_MISSILE,\
	BLAZE_HAMMER,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	LOW_KICK,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	BARRIER,\
	WYRM_WRATH,\
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
	DIG,\
	MIRAGE,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	FIRE_BLAST,\
	DEMOLISH,\
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	ROCK_SLIDE,\
	ROCK_ON,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
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
;@ learn       8, POISON_STING
;@ learn       12, MUD_BOMB
;@ learn       16, SAND_ATTACK
;@ learn       20, BULK_UP
;@ learn       25, BLOOD_RUSH
;@ learn       30, BODY_SLAM
;@ learn       35, BARRIER
;@ learn       40, EARTHQUAKE
;@ learn       46, REST
;@ learn       52, SLUDGE_BOMB
;@ learn       58, METEOR_DRIVE
