	db DEX_DIGLETT ; pokedex id

	db  10,  55,  25,  95,  45
	;   hp  atk  def  spd  spc

	db GROUND, GROUND ; type
	db 255 ; catch rate
	db 81 ; base exp

	INCBIN "gfx/pokemon/front/diglett.pic", 0, 1 ; sprite dimensions
	dw DiglettPicFront, DiglettPicBackSW

	db SCRATCH, SAND_ATTACK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ADAPTATION,\
	MUD_BOMB,\
	PIN_MISSILE,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	LOW_KICK,\
	EARTHQUAKE,\
	DIG,\
	BULK_UP,\
	SHADOW_BALL,\
	DEMOLISH,\
	SHADOW_GAME,\
	ROCK_SLIDE,\
	ROCK_ON,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
	CUT,\
	STRENGTH
	; end


	db BANK(DiglettPicFront)
	db 0
	db BANK(DiglettPicBack)
	db BANK(DiglettPicBackSW)

	dw 0, DiglettPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_PLAYFUL NATURE_CALCULATING
;@ pal_battle   PAL_SOILMON
;@ pal_altbattle PAL_BRICKMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo         EVOLVE_LEVEL, 26, DUGTRIO
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       13, MUD_CLAW
;@ learn       15, GROWL
;@ learn       19, DIG
;@ learn       24, ROCK_THROW
;@ learn       30, MUD_BOMB
;@ learn       35, SLASH
;@ learn       39, DISABLE
;@ learn       43, EARTHQUAKE
;@ learn       49, ROCK_SLIDE
;@ learn       54, AGILITY
;@ learn       59, CLAY_ARMOR
