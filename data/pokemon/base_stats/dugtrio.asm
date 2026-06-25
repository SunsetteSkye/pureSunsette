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
	HONE_EDGE,\
	DISABLE,\
	SHADOW_GAME,\
	TOXIC,\
	SLUDGE_BOMB,\
	BODY_SLAM,\
	QUICK_ATTACK,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
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
;@ learn       6, MUD_CLAW
;@ learn       10, GROWL
;@ learn       14, ROCK_THROW
;@ learn       19, DIG
;@ learn       23, DISABLE
;@ learn       28, SLASH
;@ learn       33, AGILITY
;@ learn       40, ROCK_SLIDE
;@ learn       48, EARTHQUAKE
;@ tutor       TRI_ATTACK
;@ tutor       METEOR_DRIVE
;@ tutor       SCREECH
