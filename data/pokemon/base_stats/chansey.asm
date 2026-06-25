	db DEX_CHANSEY ; pokedex id

	db 250,   5,   5,  50, 105
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 255 ; base exp

	INCBIN "gfx/pokemon/front/chansey.pic", 0, 1 ; sprite dimensions
	dw ChanseyPicFront, ChanseyPicBackSW

	db TACKLE, DOUBLESLAP, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	LEAP_ATTACK,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	SOLARBEAM,\
	THUNDERBOLT,\
	THUNDER,\
	PSYCHIC_M,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	FIRE_BLAST,\
	LIGHT_SCREEN,\
	SKITTERMIND,\
	SUBSTITUTE,\
	STRENGTH,\
	FLASH
	; end


	db BANK(ChanseyPicFront)
	db 0
	db BANK(ChanseyPicBack)
	db BANK(ChanseyPicBackSW)

	dw 0, ChanseyPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_GENTLE NATURE_CONSIDERATE
;@ pal_battle   PAL_JIGGMON
;@ pal_altbattle PAL_GREENBAR
;@ pal_icon     PAL_ICON_23
;@ pal_alticon  PAL_ICON_56
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       18, SEISMIC_TOSS
;@ learn       23, SING
;@ learn       28, MINIMIZE
;@ learn       34, SHADOW_BALL
;@ learn       41, SOFTBOILED
;@ learn       47, EGG_BOMB
;@ learn       54, DOUBLE_EDGE
;@ tutor       TELEPORT
;@ tutor       SOFTBOILED
;@ tutor       CLOBBERCLOCK
;@ tutor       EGG_BOMB
