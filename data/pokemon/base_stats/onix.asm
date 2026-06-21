; Sunsette: has a variant form -> base_stats/hardened_onix.asm (Hardened Onix).
	db DEX_ONIX ; pokedex id

	db  55,  65, 180,  80,  30
	;   hp  atk  def  spd  spc

	db ROCK, GROUND ; type
	db 45 ; catch rate
	db 108 ; base exp

	INCBIN "gfx/pokemon/front/onix.pic", 0, 1 ; sprite dimensions
	dw OnixPicFront, OnixPicBackSW

	db TACKLE, SCREECH, HARDEN, ROCK_THROW ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ADAPTATION,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	BARRIER,\
	WYRM_WRATH,\
	EARTHQUAKE,\
	DIG,\
	MIRAGE,\
	SWORDS_DANCE,\
	BULK_UP,\
	SHADOW_BALL,\
	FIRE_BLAST,\
	LIGHT_SCREEN,\
	ROCK_SLIDE,\
	ROCK_ON,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
	CUT,\
	STRENGTH
	; end

	db BANK(OnixPicFront)
	db BANK(OnixPicFrontAlt)
	db BANK(OnixPicBack)
	db BANK(OnixPicBackSW)

	dw OnixPicFrontAlt, OnixPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_STOLID NATURE_RAGE
;@ pal_battle   PAL_GRANITEMON
;@ pal_altbattle PAL_SANDSTONEMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       14, WRAP
;@ learn       18, SCREECH
;@ learn       23, METEOR_HORN
;@ learn       27, DIG
;@ learn       31, BLOOD_RUSH
;@ learn       36, CRYSTALLIZE
;@ learn       40, ROCK_SLIDE
;@ learn       45, EARTHQUAKE
;@ learn       49, POWER_BIND
;@ learn       54, AGILITY
;@ learn       59, SPIKE_CANNON
