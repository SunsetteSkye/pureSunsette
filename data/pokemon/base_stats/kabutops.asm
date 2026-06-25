	db DEX_KABUTOPS ; pokedex id

	db  60, 115, 125,  80,  70
	;   hp  atk  def  spd  spc

	db ROCK, BUG ; type
	db 45 ; catch rate
	db 201 ; base exp

	INCBIN "gfx/pokemon/front/kabutops.pic", 0, 1 ; sprite dimensions
	dw KabutopsPicFront, KabutopsPicBackSW

	db ROCK_THROW, HARDEN, ILL_WIND, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ADAPTATION,\
	MUD_BOMB,\
	PIN_MISSILE,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	FINISHER,\
	METEOR_SWEEP,\
	BARRIER,\
	EARTHQUAKE,\
	DIG,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	DEMOLISH,\
	SHADOW_GAME,\
	ROCK_SLIDE,\
	ROCK_ON,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
	CUT,\
	SURF,\
	STRENGTH,\
	FLASH
	; end

	db BANK(KabutopsPicFront)
	db 0
	db BANK(KabutopsPicBack)
	db BANK(KabutopsPicBackSW)

	dw 0, KabutopsPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_STOLID NATURE_CRUEL
;@ pal_battle   PAL_BROWNMON2
;@ pal_altbattle PAL_LEEKMON
;@ pal_icon     PAL_ICON_64
;@ pal_alticon  PAL_ICON_52
;@ evo_move    NO_MOVE
;@ evo_react   "Woah! Scythes" "nearly cut you!"
;@ evo_react   "It slashes the air" "in a blinding arc!"
;@ evo_react   "It crouches low," "blades poised!"
;@ evo_react   "It skitters fast," "scythes raised!"
;@ learn       24, LEECH_LIFE
;@ learn       28, POWER_BIND
;@ learn       33, HONE_EDGE
;@ learn       35, MUD_BOMB
;@ learn       39, METEOR_DRIVE
;@ learn       44, EXTERMINATE
;@ learn       49, EARTHQUAKE
;@ learn       53, OROCLASM
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
;@ tutor       SCREECH
