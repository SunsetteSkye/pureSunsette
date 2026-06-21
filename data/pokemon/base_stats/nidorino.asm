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
	ADAPTATION,\
	MUD_BOMB,\
	PIN_MISSILE,\
	TOXIC,\
	HONE_EDGE,\
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
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	ROCK_SLIDE,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
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
;@ evo_move    NO_MOVE
;@ evo_react   "It paws and jabs" "its harder horn!"
;@ evo_react   "It scuffs dirt," "horn lowered!"
;@ evo_react   "It snorts hard," "ready to charge!"
;@ evo_react   "Its barbs bristle" "all over!"
;@ learn       8, POISON_STING
;@ learn       12, DOUBLE_KICK
;@ learn       16, SAND_ATTACK
;@ learn       20, MUD_BOMB
;@ learn       25, METEOR_HORN
;@ learn       30, STOMP
;@ learn       35, FOCUS_ENERGY
;@ learn       40, EARTHQUAKE
;@ learn       46, REST
;@ learn       52, VENOM_DRILL
;@ learn       58, PISTON_KICK
