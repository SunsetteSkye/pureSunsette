	db DEX_NIDORAN_F ; pokedex id

	db  55,  47,  52,  41,  40
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 235 ; catch rate
	db 59 ; base exp

	INCBIN "gfx/pokemon/front/nidoranf.pic", 0, 1 ; sprite dimensions
	dw NidoranFPicFront, NidoranFPicBackSW

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
	METEOR_SWEEP,\
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
	CUT
	; end


	db BANK(NidoranFPicFront)
	db 0
	db BANK(NidoranFPicBack)
	db BANK(NidoranFPicBackSW)

	dw 0, NidoranFPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CAUTIOUS NATURE_GENTLE
;@ pal_battle   PAL_CYANMON
;@ pal_altbattle PAL_REDMON
;@ pal_icon     PAL_ICON_18
;@ pal_alticon  PAL_ICON_19
;@ evo         EVOLVE_LEVEL, 16, NIDORINA
;@ evo_move    NO_MOVE
;@ evo_react   NONE
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
