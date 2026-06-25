	db DEX_GYARADOS ; pokedex id

	db  95, 125,  79,  81, 100
	;   hp  atk  def  spd  spc

	db WATER, FLYING ; type
	db 45 ; catch rate
	db 214 ; base exp

	INCBIN "gfx/pokemon/front/gyarados.pic", 0, 1 ; sprite dimensions
	dw GyaradosPicFront, GyaradosPicBackSW

	db SPLASH, BITE, LEER, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	LEAP_ATTACK,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AQUA_RING,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	WYRM_WRATH,\
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
	RIPTIDE,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	FIRE_BLAST,\
	TEMPEST,\
	SUBSTITUTE,\
	SURF,\
	STRENGTH,\
	FLASH
	; end


	db BANK(GyaradosPicFront)
	db 0
	db BANK(GyaradosPicBack)
	db BANK(GyaradosPicBackSW)

	dw 0, GyaradosPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_RAGE NATURE_CRUEL
;@ pal_battle   PAL_CERULEAN
;@ pal_altbattle PAL_EMBERMON
;@ pal_icon     PAL_ICON_68
;@ pal_alticon  PAL_ICON_04
;@ evo_move    NO_MOVE
;@ evo_react   "Its eyes glint" "wildly at yours."
;@ evo_react   "It rears up with" "a deafening roar!"
;@ evo_react   "It coils high," "jaws snapping!"
;@ evo_react   "It thrashes, waves" "crashing wild!"
;@ learn       EVOLVE_LEVEL, 30, GYARADOS
;@ learn       15, TACKLE
;@ learn       20, BITE
;@ learn       25, LEER
;@ learn       30, BELLOW
;@ learn       35, BLOOD_RUSH
;@ learn       40, RIPTIDE
;@ learn       45, LEAP_ATTACK
;@ learn       50, INDIGNATION
;@ learn       55, DOUBLE_EDGE
;@ learn       60, HYDRO_PUMP
;@ learn       65, HYPER_BEAM
;@ tutor       HURRICANE
;@ tutor       METEOR_DRIVE
;@ tutor       EGG_BOMB
