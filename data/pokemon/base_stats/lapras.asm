	db DEX_LAPRAS ; pokedex id

	db 130,  85,  80,  60,  95
	;   hp  atk  def  spd  spc

	db WATER, ICE ; type
	db 45 ; catch rate
	db 219 ; base exp

	INCBIN "gfx/pokemon/front/lapras.pic", 0, 1 ; sprite dimensions
	dw LaprasPicFront, LaprasPicBackSW

	db SING, AURORA_BEAM, WATER_PULSE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	LEAP_ATTACK,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AQUA_RING,\
	AURORA_MIST,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	CALM_MIND,\
	BARRIER,\
	SOLARBEAM,\
	WYRM_WRATH,\
	THUNDERBOLT,\
	THUNDER,\
	RIPTIDE,\
	PSYCHIC_M,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	TEMPEST,\
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	SKITTERMIND,\
	SUBSTITUTE,\
	SURF,\
	STRENGTH,\
	FLASH
	; end


	db BANK(LaprasPicFront)
	db 0
	db BANK(LaprasPicBack)
	db BANK(LaprasPicBackSW)

	dw 0, LaprasPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_GENTLE NATURE_WISE
;@ pal_battle   PAL_LAPRASMON
;@ pal_altbattle PAL_CREAMPINKMON
;@ pal_icon     PAL_ICON_68
;@ pal_alticon  PAL_ICON_79
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       30, BODY_SLAM
;@ learn       33, CONFUSE_RAY
;@ learn       36, AURORA_MIST
;@ learn       38, ICE_BEAM
;@ learn       46, HYDRO_PUMP
;@ learn       53, BLIZZARD
;@ tutor       SOULSTEALER
;@ tutor       METEOR_DRIVE
;@ tutor       EGG_BOMB
