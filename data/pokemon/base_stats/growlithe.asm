	db DEX_GROWLITHE ; pokedex id

	db  55,  70,  45,  60,  50
	;   hp  atk  def  spd  spc

	db FIRE, NORMAL ; type
	db 190 ; catch rate
	db 90 ; base exp

	INCBIN "gfx/pokemon/front/growlithe.pic", 0, 1 ; sprite dimensions
	dw GrowlithePicFront, GrowlithePicBackSW

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
;@ evo_move    NO_MOVE
;@ evo_react   NONE
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
