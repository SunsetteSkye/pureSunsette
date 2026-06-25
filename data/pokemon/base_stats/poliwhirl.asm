	db DEX_POLIWHIRL ; pokedex id

	db  65,  65,  65,  90,  50
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 120 ; catch rate
	db 131 ; base exp

	INCBIN "gfx/pokemon/front/poliwhirl.pic", 0, 1 ; sprite dimensions
	dw PoliwhirlPicFront, PoliwhirlPicBackSW

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
	FROST_FIST,\
	SEISMIC_TOSS,\
	MUD_BOMB,\
	DIG,\
	PSYCHIC_M,\
	FINISHER,\
	DEMOLISH,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	BARRIER,\
	ENERGY_FLUX,\
	SKITTERMIND,\
	METEOR_SWEEP,\
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
	SURF,\
	STRENGTH
	; end

	db BANK(PoliwhirlPicFront)
	db 0
	db BANK(PoliwhirlPicBack)
	db BANK(PoliwhirlPicBackSW)

	dw 0, PoliwhirlPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_PLAYFUL NATURE_LAZY
;@ pal_battle   PAL_PEWTER
;@ pal_altbattle PAL_GREENBAR
;@ pal_icon     PAL_ICON_34
;@ pal_alticon  PAL_ICON_35
;@ evo         EVOLVE_ITEM, WATER_STONE, 1, POLIWRATH
;@ evo_move    SUBMISSION
;@ evo_react   "Its belly spiral" "starts to whirl!"
;@ evo_react   "Its spiral spins" "faster and faster!"
;@ evo_react   "It dives in," "leaving ripples!"
;@ evo_react   "Its slick skin" "glistens wet!"
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
;@ tutor       CLOBBERCLOCK
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
;@ tutor       EGG_BOMB
