	db DEX_ARCANINE ; pokedex id

	db  90, 110,  80,  95,  80
	;   hp  atk  def  spd  spc

	db FIRE, NORMAL ; type
	db 75 ; catch rate
	db 213 ; base exp

	INCBIN "gfx/pokemon/front/arcanine.pic", 0, 1 ; sprite dimensions
	dw ArcaninePicFront, ArcaninePicBackSW

	db BITE, BELLOW, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	ADAPTATION,\
	MUD_BOMB,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	METEOR_SWEEP,\
	SOLARBEAM,\ 
	WYRM_WRATH,\
	DIG,\
	MIRAGE,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	SUPERNOVA,\
	FIRE_BLAST,\
	TWISTER,\
	LIGHT_SCREEN,\
	ROCK_ON,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	STRENGTH,\
	FLASH
	; end

	db BANK(ArcaninePicFront)
	db BANK(ArcaninePicFrontAlt)
	db BANK(ArcaninePicBack)
	db BANK(ArcaninePicBackSW)

	dw ArcaninePicFrontAlt, ArcaninePicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CONSIDERATE NATURE_ARROGANT
;@ pal_battle   PAL_GOLDMON
;@ pal_altbattle PAL_REDBAR
;@ pal_icon     PAL_ICON_32
;@ pal_alticon  PAL_ICON_33
;@ evo_move    NO_MOVE
;@ evo_react   "It bounds about," "raring to run!"
;@ evo_react   "It tears off fast," "a blur of fire!"
;@ evo_react   "It throws back its" "head and howls!"
;@ evo_react   "It paws the dirt," "itching to bolt!"
;@ learn       7, BITE
;@ learn       10, LICK
;@ learn       15, EMBER
;@ learn       19, BELLOW
;@ learn       23, BLITZ_STRIKE
;@ learn       28, HEAT_RUSH
;@ learn       31, AGILITY
;@ learn       36, FLAMETHROWER
;@ learn       45, DOUBLE_EDGE
;@ learn       52, BONEMERANG
;@ learn       59, FIRE_BLAST
