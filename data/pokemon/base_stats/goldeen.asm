	db DEX_GOLDEEN ; pokedex id

	db  45,  67,  60,  63,  50
	;   hp  atk  def  spd  spc

	db WATER, NORMAL ; type
	db 225 ; catch rate
	db 111 ; base exp

	INCBIN "gfx/pokemon/front/goldeen.pic", 0, 1 ; sprite dimensions
	dw GoldeenPicFront, GoldeenPicBackSW

	db SPLASH, SUPER_SOAK, SUPERSONIC, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	LEAP_ATTACK,\
	ROCK_ON,\
	ADAPTATION,\
	MUD_BOMB,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AQUA_RING,\
	ICE_BEAM,\
	BLIZZARD,\
	BARRIER,\
	RIPTIDE,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	TEMPEST,\
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	SURF,\
	FLASH
	; end


	db BANK(GoldeenPicFront)
	db 0
	db BANK(GoldeenPicBack)
	db BANK(GoldeenPicBackSW)

	dw 0, GoldeenPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_ARROGANT NATURE_CONSIDERATE
;@ pal_battle   PAL_GOLDEENMON
;@ pal_altbattle PAL_PEWTER
;@ pal_icon     PAL_ICON_19
;@ pal_alticon  PAL_ICON_59
;@ evo         EVOLVE_LEVEL, 25, SEAKING
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       15, SUPERSONIC
;@ learn       18, WATER_PULSE
;@ learn       21, HEADBUTT
;@ learn       24, MUD_BOMB
;@ learn       27, AIR_DRILL
;@ learn       31, RIPTIDE
;@ learn       35, AGILITY
;@ learn       38, METEOR_DRIVE
;@ learn       43, DOUBLE_EDGE
;@ learn       45, HYDRO_PUMP
;@ tutor       METEOR_DRIVE
;@ tutor       SWIFT
