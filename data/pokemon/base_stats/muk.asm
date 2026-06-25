	db DEX_MUK ; pokedex id

	db 135, 105,  75,  50,  75
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 75 ; catch rate
	db 157 ; base exp

	INCBIN "gfx/pokemon/front/muk.pic", 0, 1 ; sprite dimensions
	dw MukPicFront, MukPicBackSW

	db TACKLE, DISABLE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ADAPTATION,\
	FROST_FIST,\
	MUD_BOMB,\
	BLAZE_HAMMER,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	CALM_MIND,\
	ZAPPERCUT,\
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	RIPTIDE,\
	DIG,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	FIRE_BLAST,\
	DEMOLISH,\
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	ROCK_SLIDE,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
	SURF,\
	STRENGTH,\
	FLASH
	; end

	db BANK(MukPicFront)
	db 0
	db BANK(MukPicBack)
	db BANK(MukPicBackSW)

	dw 0, MukPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_GLUTTON NATURE_CRUEL
;@ pal_battle   PAL_GRAYMON
;@ pal_altbattle PAL_SAFARIBALL
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   "It gloops off." "What an odor!"
;@ evo_react   "It oozes wide," "across the floor!"
;@ evo_react   "A glob plops off" "and crawls back!"
;@ evo_react   "It bubbles up" "with a vile reek!"
;@ learn       14, ACID
;@ learn       23, HARDEN
;@ learn       26, MUD_BOMB
;@ learn       29, MINIMIZE
;@ learn       33, BODY_SLAM
;@ learn       37, SLUDGE_BOMB
;@ learn       41, RECOVER
;@ learn       46, MAXIMIZE
;@ learn       50, DOUBLE_EDGE
;@ learn       55, VENOM_LASH
;@ tutor       EXPLOSION
;@ tutor       CLOBBERCLOCK
;@ tutor       EGG_BOMB
;@ tutor       SCREECH
