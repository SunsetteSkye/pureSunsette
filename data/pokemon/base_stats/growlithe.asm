	db DEX_GROWLITHE ; pokedex id

	db  55,  70,  45,  60,  50
	;   hp  atk  def  spd  spc

	db FIRE, NORMAL ; type
	db 190 ; catch rate
	db 90 ; base exp

	INCBIN "gfx/pokemon/front/growlithe.pic", 0, 1 ; sprite dimensions
	dw GrowlithePicFront, GrowlithePicBackSW

	db TACKLE, GROWL, LICK, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	HONE_EDGE,\
	DISABLE,\
	TOXIC,\
	BODY_SLAM,\
	QUICK_ATTACK,\
	DOUBLE_EDGE,\
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
	STRENGTH,\
	FLASH
	; end


	db BANK(GrowlithePicFront)
	db 0
	db BANK(GrowlithePicBack)
	db BANK(GrowlithePicBackSW)

	dw 0, GrowlithePicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CONSIDERATE NATURE_ARROGANT
;@ pal_battle   PAL_GOLDMON
;@ pal_altbattle PAL_REDBAR
;@ pal_icon     PAL_ICON_32
;@ pal_alticon  PAL_ICON_33
;@ evo         EVOLVE_ITEM, FIRE_STONE, 1, ARCANINE
;@ evo_move    BLITZ_STRIKE
;@ evo_react   NONE
;@ learn       7, EMBER
;@ learn       12, BITE
;@ learn       16, BELLOW
;@ learn       22, HEAT_RUSH
;@ learn       27, MUD_BOMB
;@ learn       33, HYPER_FANG
;@ learn       39, FLAMETHROWER
;@ learn       45, DISABLE
;@ learn       52, BONEMERANG
;@ learn       60, FIRE_BLAST
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
