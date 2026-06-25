	db DEX_NIDORINA ; pokedex id

	db  70,  62,  67,  56,  55
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 120 ; catch rate
	db 117 ; base exp

	INCBIN "gfx/pokemon/front/nidorina.pic", 0, 1 ; sprite dimensions
	dw NidorinaPicFront, NidorinaPicBackSW

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

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
	STRENGTH
	; end

	db BANK(NidorinaPicFront)
	db 0
	db BANK(NidorinaPicBack)
	db BANK(NidorinaPicBackSW)

	dw 0, NidorinaPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CONSIDERATE NATURE_GENTLE
;@ pal_battle   PAL_CYANMON
;@ pal_altbattle PAL_REDMON
;@ pal_icon     PAL_ICON_18
;@ pal_alticon  PAL_ICON_19
;@ evo         EVOLVE_ITEM, MOON_STONE, 1, NIDOQUEEN
;@ evo_move    BULLDOZE
;@ evo_react   "It looks around," "wary, then smiles."
;@ evo_react   "It nuzzles in," "calm and sure."
;@ evo_react   "Its ears perk up," "alert and keen."
;@ evo_react   "It pads softly," "poised to spring."
;@ learn       6, SAND_ATTACK
;@ learn       9, POISON_STING
;@ learn       12, MUD_BOMB
;@ learn       15, POISON_FANG
;@ learn       19, HEADBUTT
;@ learn       24, BULK_UP
;@ learn       30, MUDSLIDE
;@ learn       36, SLUDGE_BOMB
;@ learn       44, DOUBLE_EDGE
;@ learn       52, PISTON_KICK
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
