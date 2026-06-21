	db DEX_CHARMANDER ; pokedex id

	db  39,  52,  43,  65,  50
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 65 ; base exp

	INCBIN "gfx/pokemon/front/charmander.pic", 0, 1 ; sprite dimensions
	dw CharmanderPicFront, CharmanderPicBackSW

	db SCRATCH, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	tmhm \
	BLAZE_HAMMER,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	CALM_MIND,\
	LOW_KICK,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	BARRIER,\
	SOLARBEAM,\ 
	WYRM_WRATH,\
	DIG,\
	MIRAGE,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	SUPERNOVA,\
	FIRE_BLAST,\
	DEMOLISH,\
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	ROCK_ON,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH,\
	FLASH
	; end

	db BANK(CharmanderPicFront)
	db 0
	db BANK(CharmanderPicBack)
	db BANK(CharmanderPicBackSW)

	dw 0, CharmanderPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_SCRAPPY NATURE_CAUTIOUS
;@ pal_battle   PAL_FLAREMON
;@ pal_altbattle PAL_EMBERMON
;@ pal_icon     PAL_ICON_03
;@ pal_alticon  PAL_ICON_04
;@ evo         EVOLVE_LEVEL, 6, CHARMELEON
;@ evo         EVOLVE_LEVEL, 16, CHARMELEON
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       6, SMOKESCREEN
;@ learn       9, EMBER
;@ learn       12, SEISMIC_TOSS
;@ learn       15, BELLOW
;@ learn       18, HEAT_RUSH
;@ learn       23, HONE_EDGE
;@ learn       26, SLASH
;@ learn       30, SHORYUKEN
;@ learn       38, FLAMETHROWER
;@ learn       46, HYPER_BEAM
;@ learn       54, WYRM_WRATH
;@ learn       60, FIRE_BLAST
