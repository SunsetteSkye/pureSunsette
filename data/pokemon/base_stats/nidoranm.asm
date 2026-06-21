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
	SUBSTITUTE,\
	CLAY_ARMOR,\
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
