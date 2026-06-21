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
	ROCK_ON,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
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
