	db DEX_DUGTRIO ; pokedex id

	db  50,  90,  55, 120,  70
	;   hp  atk  def  spd  spc

	db GROUND, GROUND ; type
	db 50 ; catch rate
	db 153 ; base exp

	INCBIN "gfx/pokemon/front/dugtrio.pic", 0, 1 ; sprite dimensions
	dw DugtrioPicFront, DugtrioPicBackSW

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
	HYPER_BEAM,\
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

	db BANK(DugtrioPicFront)
	db 0
	db BANK(DugtrioPicBack)
	db BANK(DugtrioPicBackSW)

	dw 0, DugtrioPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_PLAYFUL NATURE_CALCULATING
;@ pal_battle   PAL_SOILMON
;@ pal_altbattle PAL_BRICKMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   "Wait, are those" "extra heads<...>?"
;@ evo_react   "Three heads pop up" "all at once!"
;@ evo_react   "They burrow fast," "dirt flying high!"
;@ evo_react   "They peek out," "then dive away!"
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
