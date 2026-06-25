	db DEX_PONYTA ; pokedex id

	db  50,  85,  55,  90,  65
	;   hp  atk  def  spd  spc

	db FIRE, PSYCHIC_TYPE ; type
	db 190 ; catch rate
	db 152 ; base exp

	INCBIN "gfx/pokemon/front/ponyta.pic", 0, 1 ; sprite dimensions
	dw PonytaPicFront, PonytaPicBackSW

	db EMBER, FLASH, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	HONE_EDGE,\
	DISABLE,\
	SWORDS_DANCE,\
	AURORA_MIST,\
	SHADOW_GAME,\
	TOXIC,\
	BODY_SLAM,\
	QUICK_ATTACK,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	SOLARBEAM,\
	WYRM_WRATH,\
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
	MUD_BOMB,\
	PSYCHIC_M,\
	FINISHER,\
	DEMOLISH,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	HEAT_RUSH,\
	SUPERNOVA,\
	FLAMETHROWER,\
	FIRE_BLAST,\
	SHADOW_BALL,\
	BARRIER,\
	BRAVE_BIRD,\
	ENERGY_FLUX,\
	SKITTERMIND,\
	METEOR_SWEEP,\
	ROCK_SLIDE,\
	SUBSTITUTE,\
	CALM_MIND,\
	VOID_MIND,\
	PSYCHO_SHIFT,\
	LOVELY_KISS,\
	LEAP_ATTACK,\
	ROCK_ON,\
	STRENGTH,\
	FLASH
	; end


	db BANK(PonytaPicFront)
	db 0
	db BANK(PonytaPicBack)
	db BANK(PonytaPicBackSW)

	dw 0, PonytaPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CAUTIOUS NATURE_HYPER
;@ pal_battle   PAL_REDBAR
;@ pal_altbattle PAL_0F
;@ pal_icon     PAL_ICON_32
;@ pal_alticon  PAL_ICON_39
;@ evo         EVOLVE_LEVEL, 30, RAPIDASH
;@ evo_move    AIR_DRILL
;@ evo_react   NONE
;@ learn       8, CONFUSION
;@ learn       13, HEAT_RUSH
;@ learn       18, DOUBLE_KICK
;@ learn       23, FOCUS_ENERGY
;@ learn       28, PSYBEAM
;@ learn       33, FIRE_SPIN
;@ learn       38, PISTON_KICK
;@ learn       43, BLITZ_STRIKE
;@ learn       49, PSYCHIC_M
;@ learn       56, FIRE_BLAST
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
;@ tutor       SWIFT
