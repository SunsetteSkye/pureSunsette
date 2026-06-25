	db DEX_NIDORINO ; pokedex id

	db  61,  72,  57,  65,  55
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 120 ; catch rate
	db 118 ; base exp

	INCBIN "gfx/pokemon/front/nidorino.pic", 0, 1 ; sprite dimensions
	dw NidorinoPicFront, NidorinoPicBackSW

	db TACKLE, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
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
	THUNDERBOLT,\
	THUNDER,\
	MUD_BOMB,\
	DIG,\
	DEMOLISH,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	HEAT_RUSH,\
	ILL_WIND,\
	BARRIER,\
	METEOR_SWEEP,\
	ROCK_SLIDE,\
	SUBSTITUTE,\
	ADAPTATION,\
	LEAP_ATTACK,\
	PIN_MISSILE,\
	CLAY_ARMOR,\
	ROCK_ON,\
	CUT,\
	STRENGTH
	; end

	db BANK(NidorinoPicFront)
	db BANK(NidorinoPicFrontAlt)
	db BANK(NidorinoPicBack)
	db BANK(NidorinoPicBackSW)

	dw NidorinoPicFrontAlt, NidorinoPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_RAGE NATURE_SCRAPPY
;@ pal_battle   PAL_NIDOMASC
;@ pal_altbattle PAL_GREENBAR
;@ pal_icon     PAL_ICON_21
;@ pal_alticon  PAL_ICON_22
;@ evo         EVOLVE_ITEM, MOON_STONE, 1, NIDOKING
;@ evo_move    BULLDOZE
;@ evo_react   "It paws and jabs" "its harder horn!"
;@ evo_react   "It scuffs dirt," "horn lowered!"
;@ evo_react   "It snorts hard," "ready to charge!"
;@ evo_react   "Its barbs bristle" "all over!"
;@ learn       6, SAND_ATTACK
;@ learn       9, POISON_STING
;@ learn       12, DOUBLE_KICK
;@ learn       15, METEOR_HORN
;@ learn       19, MUD_BOMB
;@ learn       24, BLOOD_RUSH
;@ learn       30, SLUDGE_BOMB
;@ learn       36, FOCUS_ENERGY
;@ learn       42, MUDSLIDE
;@ learn       52, PISTON_KICK
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
