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
	MUD_BOMB,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	HYPER_BEAM,\
	METEOR_SWEEP,\
	BARRIER,\
	SOLARBEAM,\ 
	WYRM_WRATH,\
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
	PSYCHIC_M,\
	MIRAGE,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	SUPERNOVA,\
	FIRE_BLAST,\
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	SKITTERMIND,\
	SHADOW_GAME,\
	ROCK_SLIDE,\
	SUBSTITUTE,\
	STRENGTH,\
	FLASH
	; end


	db BANK(PonytaPicFront)
	db 0
	db BANK(PonytaPicBack)
	db BANK(PonytaPicBackSW)

	dw 0, PonytaPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_HYPER NATURE_ARROGANT
;@ pal_battle   PAL_REDBAR
;@ pal_altbattle PAL_0F
;@ pal_icon     PAL_ICON_32
;@ pal_alticon  PAL_ICON_39
;@ evo         EVOLVE_LEVEL, 30, RAPIDASH
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       9, CONFUSION
;@ learn       18, HEAT_RUSH
;@ learn       21, DOUBLE_KICK
;@ learn       25, FOCUS_ENERGY
;@ learn       28, PSYBEAM
;@ learn       33, FIRE_SPIN
;@ learn       36, PISTON_KICK
;@ learn       39, PSYCHIC_M
;@ learn       45, DOUBLE_EDGE
;@ learn       49, FIRE_BLAST
;@ learn       54, METEOR_DRIVE
