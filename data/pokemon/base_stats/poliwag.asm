	db DEX_POLIWAG ; pokedex id

	db  40,  50,  40,  90,  40
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 255 ; catch rate
	db 77 ; base exp

	INCBIN "gfx/pokemon/front/poliwag.pic", 0, 1 ; sprite dimensions
	dw PoliwagPicFront, PoliwagPicBackSW

	db BUBBLE, SPLASH, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	MUD_BOMB,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AQUA_RING,\
	ICE_BEAM,\
	BLIZZARD,\
	CALM_MIND,\
	LOW_KICK,\
	BARRIER,\
	RIPTIDE,\
	DIG,\
	PSYCHIC_M,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	TWISTER,\
	VOID_MIND,\
	LIGHT_SCREEN,\
	SKITTERMIND,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	SURF,\
	FLASH
	; end


	db BANK(PoliwagPicFront)
	db 0
	db BANK(PoliwagPicBack)
	db BANK(PoliwagPicBackSW)

	dw 0, PoliwagPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_PLAYFUL NATURE_DITZ
;@ pal_battle   PAL_PEWTER
;@ pal_altbattle PAL_GREENBAR
;@ pal_icon     PAL_ICON_34
;@ pal_alticon  PAL_ICON_35
;@ evo         EVOLVE_LEVEL, 23, POLIWHIRL
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       12, SUPER_SOAK
;@ learn       15, HYPNOSIS
;@ learn       19, CONFUSION
;@ learn       22, WATER_PULSE
;@ learn       27, BODY_SLAM
;@ learn       30, RIPTIDE
;@ learn       36, DIZZY_PUNCH
;@ learn       41, CALM_MIND
;@ learn       45, HYDRO_PUMP
;@ learn       52, SHADOW_BOX
