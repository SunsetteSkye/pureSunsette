	db DEX_KABUTO ; pokedex id

	db  30,  80,  125,  55,  70
	;   hp  atk  def  spd  spc

	db ROCK, BUG ; type
	db 45 ; catch rate
	db 119 ; base exp

	INCBIN "gfx/pokemon/front/kabuto.pic", 0, 1 ; sprite dimensions
	dw KabutoPicFront, KabutoPicBackSW

	db ROCK_THROW, HARDEN, ILL_WIND, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ADAPTATION,\
	MUD_BOMB,\
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	ICE_BEAM,\
	BLIZZARD,\
	BARRIER,\
	EARTHQUAKE,\
	DIG,\
	MEGA_DRAIN,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	SHADOW_GAME,\
	ROCK_SLIDE,\
	ROCK_ON,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
	CUT,\
	SURF,\
	FLASH
	; end


	db BANK(KabutoPicFront)
	db 0
	db BANK(KabutoPicBack)
	db BANK(KabutoPicBackSW)

	dw 0, KabutoPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_STOLID NATURE_CRUEL
;@ pal_battle   PAL_BROWNMON2
;@ pal_altbattle PAL_LEEKMON
;@ pal_icon     PAL_ICON_64
;@ pal_alticon  PAL_ICON_52
;@ evo         EVOLVE_LEVEL, 33, KABUTOPS
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       24, LEECH_LIFE
;@ learn       28, POWER_BIND
;@ learn       35, MUD_BOMB
;@ learn       39, METEOR_DRIVE
;@ learn       44, EXTERMINATE
;@ learn       49, EARTHQUAKE
;@ learn       53, METAMORPHIC
