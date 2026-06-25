	db DEX_OMASTAR ; pokedex id

	db  75,  60, 125,  55, 115
	;   hp  atk  def  spd  spc

	db ROCK, WATER ; type
	db 45 ; catch rate
	db 199 ; base exp

	INCBIN "gfx/pokemon/front/omastar.pic", 0, 1 ; sprite dimensions
	dw OmastarPicFront, OmastarPicBackSW

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
	HYPER_BEAM,\
	CALM_MIND,\
	BARRIER,\
	EARTHQUAKE,\
	DIG,\
	MEGA_DRAIN,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	TEMPEST,\
	ROCK_SLIDE,\
	ROCK_ON,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	FLASH
	; end

	db BANK(OmastarPicFront)
	db 0
	db BANK(OmastarPicBack)
	db BANK(OmastarPicBackSW)

	dw 0, OmastarPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CAUTIOUS NATURE_CRUEL
;@ pal_battle   PAL_KELPMON
;@ pal_altbattle PAL_AQUAMON
;@ pal_icon     PAL_ICON_73
;@ pal_alticon  PAL_ICON_74
;@ evo_move    NO_MOVE
;@ evo_react   "What a huge shell!" "Can it even move?"
;@ evo_react   "Its tentacles" "coil and grasp!"
;@ evo_react   "It snaps its beak" "with a hard click!"
;@ evo_react   "It rolls forward," "shell scraping!"
;@ learn       24, MEGA_DRAIN
;@ learn       28, SHELL_GAME
;@ learn       30, CLAMP
;@ learn       35, SPIKE_CANNON
;@ learn       39, BODY_SLAM
;@ learn       43, ROCK_ON
;@ learn       48, HYDRO_PUMP
;@ tutor       EXPLOSION
;@ tutor       METEOR_DRIVE
;@ tutor       SWIFT
;@ tutor       EGG_BOMB
;@ tutor       SCREECH
