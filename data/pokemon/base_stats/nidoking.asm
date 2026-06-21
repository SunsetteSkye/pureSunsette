	db DEX_NIDOKING ; pokedex id

	db  91, 102,  77,  85,  75
	;   hp  atk  def  spd  spc

	db POISON, GROUND ; type
	db 65 ; catch rate
	db 195 ; base exp

	INCBIN "gfx/pokemon/front/nidoking.pic", 0, 1 ; sprite dimensions
	dw NidokingPicFront, NidokingPicBackSW

	db TACKLE, LEER, OUTRAGE, NO_MOVE ; level 1 learnset
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
