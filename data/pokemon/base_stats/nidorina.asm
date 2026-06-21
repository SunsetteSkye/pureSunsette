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
	ADAPTATION,\
	MUD_BOMB,\
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	ICE_BEAM,\
	BLIZZARD,\
	METEOR_SWEEP,\
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	DIG,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	DEMOLISH,\
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	ROCK_SLIDE,\
	ROCK_ON,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
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
;@ evo_move    NO_MOVE
;@ evo_react   "It looks around," "wary, then smiles."
;@ evo_react   "It nuzzles in," "calm and sure."
;@ evo_react   "Its ears perk up," "alert and keen."
;@ evo_react   "It pads softly," "poised to spring."
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
