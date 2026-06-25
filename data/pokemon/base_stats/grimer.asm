	db DEX_GRIMER ; pokedex id

	db  80,  80,  50,  25,  40
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 190 ; catch rate
	db 90 ; base exp

	INCBIN "gfx/pokemon/front/grimer.pic", 0, 1 ; sprite dimensions
	dw GrimerPicFront, GrimerPicBackSW

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


	db BANK(GrimerPicFront)
	db 0
	db BANK(GrimerPicBack)
	db BANK(GrimerPicBackSW)

	dw 0, GrimerPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_GLUTTON NATURE_CRUEL
;@ pal_battle   PAL_GRAYMON
;@ pal_altbattle PAL_SAFARIBALL
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo         EVOLVE_LEVEL, 30, MUK
;@ evo_move    NO_MOVE
;@ evo_react   NONE
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
