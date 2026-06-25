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
	HONE_EDGE,\
	DISABLE,\
	SHADOW_GAME,\
	TOXIC,\
	SLUDGE_BOMB,\
	BODY_SLAM,\
	QUICK_ATTACK,\
	DOUBLE_EDGE,\
	EARTHQUAKE,\
	MUD_BOMB,\
	DIG,\
	FINISHER,\
	DEMOLISH,\
	BULK_UP,\
	HEAT_RUSH,\
	BARRIER,\
	ROCK_SLIDE,\
	OROCLASM,\
	SUBSTITUTE,\
	ADAPTATION,\
	PIN_MISSILE,\
	CLAY_ARMOR,\
	ROCK_ON,\
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
;@ evo_move    TRI_ATTACK
;@ evo_react   NONE
;@ learn       6, MUD_CLAW
;@ learn       10, GROWL
;@ learn       14, ROCK_THROW
;@ learn       19, DIG
;@ learn       23, DISABLE
;@ learn       28, SLASH
;@ learn       33, AGILITY
;@ learn       40, ROCK_SLIDE
;@ learn       48, EARTHQUAKE
;@ tutor       METEOR_DRIVE
;@ tutor       SCREECH
