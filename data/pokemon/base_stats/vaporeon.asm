	db DEX_VAPOREON ; pokedex id

	db 130,  65,  60,  65, 110
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 65 ; catch rate
	db 196 ; base exp

	INCBIN "gfx/pokemon/front/vaporeon.pic", 0, 1 ; sprite dimensions
	dw VaporeonPicFront, VaporeonPicBackSW

	db TACKLE, SAND_ATTACK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

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
	HYPER_BEAM,\
	CALM_MIND,\
	LOW_KICK,\
	METEOR_SWEEP,\
	BARRIER,\
	RIPTIDE,\
	DIG,\
	MEGA_DRAIN,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	TWISTER,\
	DEMOLISH,\
	LIGHT_SCREEN,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	STRENGTH,\
	FLASH
	; end

	db BANK(VaporeonPicFront)
	db 0
	db BANK(VaporeonPicBack)
	db BANK(VaporeonPicBackSW)

	dw 0, VaporeonPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_GENTLE NATURE_PLAYFUL
;@ pal_battle   PAL_CERULEAN
;@ pal_altbattle PAL_KELPMON
;@ pal_icon     PAL_ICON_71
;@ pal_alticon  PAL_ICON_72
;@ evo_move    SUPER_SOAK
;@ evo_react   "It shimmers, half" "melting away."
;@ evo_react   "It dissolves into" "a splash, reforms!"
;@ evo_react   "Its fins ripple" "like cool water."
;@ evo_react   "It dips low and" "ripples away!"
;@ learn       6, HONE_EDGE
;@ learn       10, BITE
;@ learn       14, BELLOW
;@ learn       18, SWIFT
;@ learn       21, WATER_PULSE
;@ learn       25, BARRIER
;@ learn       28, RIPTIDE
;@ learn       32, TRI_ATTACK
;@ learn       35, SLUDGE_BOMB
;@ learn       44, AURORA_MIST
;@ learn       49, HYDRO_PUMP
