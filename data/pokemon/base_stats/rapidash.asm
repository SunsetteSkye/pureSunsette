	db DEX_RAPIDASH ; pokedex id

	db  65, 100,  70, 105,  90
	;   hp  atk  def  spd  spc

	db FIRE, PSYCHIC_TYPE ; type
	db 60 ; catch rate
	db 192 ; base exp

	INCBIN "gfx/pokemon/front/rapidash.pic", 0, 1 ; sprite dimensions
	dw RapidashPicFront, RapidashPicBackSW

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
	CLAY_ARMOR,\
	STRENGTH,\
	FLASH
	; end

	db BANK(RapidashPicFront)
	db 0
	db BANK(RapidashPicBack)
	db BANK(RapidashPicBackSW)

	dw 0, RapidashPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_HYPER NATURE_ARROGANT
;@ pal_battle   PAL_REDBAR
;@ pal_altbattle PAL_0F
;@ pal_icon     PAL_ICON_32
;@ pal_alticon  PAL_ICON_39
;@ evo_move    NO_MOVE
;@ evo_react   "Its mane erupts" "into roaring fire!"
;@ evo_react   "Its hooves blaze" "a fiery trail!"
;@ evo_react   "It rears up," "mane ablaze!"
;@ evo_react   "It bolts ahead," "sparks flying!"
;@ learn       9, CONFUSION
;@ learn       18, HEAT_RUSH
;@ learn       21, DOUBLE_KICK
;@ learn       25, FOCUS_ENERGY
;@ learn       28, PSYBEAM
;@ learn       33, FIRE_SPIN
;@ learn       36, PISTON_KICK
;@ learn       39, PSYCHIC_M
;@ learn       40, AIR_DRILL
;@ learn       45, DOUBLE_EDGE
;@ learn       49, FIRE_BLAST
;@ learn       54, METEOR_DRIVE
