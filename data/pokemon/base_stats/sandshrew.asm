	db DEX_SANDSHREW ; pokedex id

	db  50,  75,  85,  40,  30
	;   hp  atk  def  spd  spc

	db GROUND, NORMAL ; type
	db 255 ; catch rate
	db 93 ; base exp

	INCBIN "gfx/pokemon/front/sandshrew.pic", 0, 1 ; sprite dimensions
	dw SandshrewPicFront, SandshrewPicBackSW

	db POISON_STING, SCRATCH, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ADAPTATION,\
	FROST_FIST,\
	MUD_BOMB,\
	PIN_MISSILE,\
	BLAZE_HAMMER,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	LOW_KICK,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	BARRIER,\
	EARTHQUAKE,\
	DIG,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	BULK_UP,\
	SHADOW_BALL,\
	DEMOLISH,\
	VOID_MIND,\
	SHADOW_GAME,\
	ROCK_SLIDE,\
	ROCK_ON,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
	CUT,\
	STRENGTH
	; end


	db BANK(SandshrewPicFront)
	db 0
	db BANK(SandshrewPicBack)
	db BANK(SandshrewPicBackSW)

	dw 0, SandshrewPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CAUTIOUS NATURE_STOLID
;@ pal_battle   PAL_YELLOWMON
;@ pal_altbattle PAL_SANDMON
;@ pal_icon     PAL_ICON_16
;@ pal_alticon  PAL_ICON_17
;@ evo         EVOLVE_LEVEL, 23, SANDSLASH
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       10, MUD_CLAW
;@ learn       12, SAND_ATTACK
;@ learn       14, PIN_MISSILE
;@ learn       17, ROCK_ON
;@ learn       20, DIG
;@ learn       24, SWIFT
;@ learn       29, TWINEEDLE
;@ learn       35, AGILITY
;@ learn       43, EARTHQUAKE
;@ learn       51, SLASH
