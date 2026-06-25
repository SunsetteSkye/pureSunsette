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
	HONE_EDGE,\
	DISABLE,\
	AURORA_MIST,\
	SHADOW_GAME,\
	TOXIC,\
	SLUDGE_BOMB,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	WATER_PULSE,\
	SUPER_SOAK,\
	ICE_BEAM,\
	BLIZZARD,\
	MUD_BOMB,\
	DIG,\
	PSYCHIC_M,\
	FINISHER,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	BARRIER,\
	ENERGY_FLUX,\
	SKITTERMIND,\
	SUBSTITUTE,\
	RIPTIDE,\
	AQUA_RING,\
	ADAPTATION,\
	CALM_MIND,\
	VOID_MIND,\
	PSYCHO_SHIFT,\
	LEAP_ATTACK,\
	TEMPEST,\
	CUT,\
	SURF
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
;@ evo_move    BODY_SLAM
;@ evo_react   NONE
;@ learn       7, SUPER_SOAK
;@ learn       11, HYPNOSIS
;@ learn       15, CONFUSION
;@ learn       20, WATER_PULSE
;@ learn       25, SLAM
;@ learn       30, DISABLE
;@ learn       35, RIPTIDE
;@ learn       41, CALM_MIND
;@ learn       48, MUDSLIDE
;@ learn       57, HYDRO_PUMP
;@ tutor       SOULSTEALER
;@ tutor       PAY_DAY
;@ tutor       TELEPORT
;@ tutor       METEOR_DRIVE
;@ tutor       EGG_BOMB
