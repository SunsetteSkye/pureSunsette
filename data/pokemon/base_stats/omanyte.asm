	db DEX_OMANYTE ; pokedex id

	db  35,  40, 125,  45,  115
	;   hp  atk  def  spd  spc

	db ROCK, WATER ; type
	db 45 ; catch rate
	db 120 ; base exp

	INCBIN "gfx/pokemon/front/omanyte.pic", 0, 1 ; sprite dimensions
	dw OmanytePicFront, OmanytePicBackSW

	db SUPER_SOAK, METEOR_HORN, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ADAPTATION,\
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AQUA_RING,\
	ICE_BEAM,\
	BLIZZARD,\
	CALM_MIND,\
	BARRIER,\
	EARTHQUAKE,\
	DIG,\
	MEGA_DRAIN,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	TWISTER,\
	SHADOW_GAME,\
	ROCK_SLIDE,\
	ROCK_ON,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	FLASH
	; end

	db BANK(OmanytePicFront)
	db BANK(OmanytePicFrontAlt)
	db BANK(OmanytePicBack)
	db BANK(OmanytePicBackSW)

	dw OmanytePicFrontAlt, OmanytePicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CAUTIOUS NATURE_CRUEL
;@ pal_battle   PAL_KELPMON
;@ pal_altbattle PAL_AQUAMON
;@ pal_icon     PAL_ICON_73
;@ pal_alticon  PAL_ICON_74
;@ evo         EVOLVE_LEVEL, 33, OMASTAR
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       24, MEGA_DRAIN
;@ learn       28, SHELL_GAME
;@ learn       30, CLAMP
;@ learn       35, SPIKE_CANNON
;@ learn       39, BODY_SLAM
;@ learn       43, ROCK_ON
;@ learn       48, HYDRO_PUMP
