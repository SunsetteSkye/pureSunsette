	db DEX_NIDORAN_M ; pokedex id

	db  46,  57,  40,  50,  40
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 235 ; catch rate
	db 60 ; base exp

	INCBIN "gfx/pokemon/front/nidoranm.pic", 0, 1 ; sprite dimensions
	dw NidoranMPicFront, NidoranMPicBackSW

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
	SUBSTITUTE,\
	ADAPTATION,\
	LEAP_ATTACK,\
	PIN_MISSILE,\
	CLAY_ARMOR,\
	ROCK_ON,\
	CUT
	; end


	db BANK(NidoranMPicFront)
	db 0
	db BANK(NidoranMPicBack)
	db BANK(NidoranMPicBackSW)

	dw 0, NidoranMPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_SCRAPPY NATURE_RAGE
;@ pal_battle   PAL_NIDOMASC
;@ pal_altbattle PAL_GREENBAR
;@ pal_icon     PAL_ICON_21
;@ pal_alticon  PAL_ICON_22
;@ evo         EVOLVE_LEVEL, 16, NIDORINO
;@ evo_move    NO_MOVE
;@ evo_react   NONE
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
