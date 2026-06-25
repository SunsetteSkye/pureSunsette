	db DEX_ARCANINE ; pokedex id

	db  90, 110,  80,  95,  80
	;   hp  atk  def  spd  spc

	db FIRE, NORMAL ; type
	db 75 ; catch rate
	db 213 ; base exp

	INCBIN "gfx/pokemon/front/arcanine.pic", 0, 1 ; sprite dimensions
	dw ArcaninePicFront, ArcaninePicBackSW

	db TACKLE, GROWL, EMBER, BITE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	HONE_EDGE,\
	DISABLE,\
	TOXIC,\
	BODY_SLAM,\
	QUICK_ATTACK,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	SOLARBEAM,\
	WYRM_WRATH,\
	MUD_BOMB,\
	DIG,\
	DEMOLISH,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	HEAT_RUSH,\
	SUPERNOVA,\
	FLAMETHROWER,\
	FIRE_BLAST,\
	ILL_WIND,\
	BARRIER,\
	ENERGY_FLUX,\
	METEOR_SWEEP,\
	SUBSTITUTE,\
	RAZOR_LEAF,\
	ADAPTATION,\
	LEAP_ATTACK,\
	TEMPEST,\
	ROCK_ON,\
	CUT,\
	FLY,\
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
;@ learn       35, AGILITY
;@ learn       40, DOUBLE_EDGE
;@ learn       46, FLAMETHROWER
;@ learn       52, LEAP_ATTACK
;@ learn       58, INDIGNATION
;@ tutor       TELEPORT
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
