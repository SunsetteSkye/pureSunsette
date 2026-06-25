	db DEX_GRAVELER ; pokedex id

	db  55,  95, 115,  35,  45
	;   hp  atk  def  spd  spc

	db ROCK, FIGHTING ; type
	db 120 ; catch rate
	db 134 ; base exp

	INCBIN "gfx/pokemon/front/graveler.pic", 0, 1 ; sprite dimensions
	dw GravelerPicFront, GravelerPicBackSW

	db TACKLE, HARDEN, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	DISABLE,\
	TOXIC,\
	SLUDGE_BOMB,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	ZAPPERCUT,\
	BLAZE_HAMMER,\
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
	MUD_BOMB,\
	DIG,\
	FINISHER,\
	DEMOLISH,\
	BULK_UP,\
	LIGHT_SCREEN,\
	HEAT_RUSH,\
	SUPERNOVA,\
	FLAMETHROWER,\
	FIRE_BLAST,\
	ENERGY_FLUX,\
	THUNDER_WAVE,\
	METEOR_SWEEP,\
	ROCK_SLIDE,\
	OROCLASM,\
	SUBSTITUTE,\
	ADAPTATION,\
	VOID_MIND,\
	LEAP_ATTACK,\
	CLAY_ARMOR,\
	ROCK_ON,\
	CUT,\
	STRENGTH,\
	FLASH
	; end

	db BANK(GravelerPicFront)
	db BANK(GravelerPicFrontAlt)
	db BANK(GravelerPicBack)
	db BANK(GravelerPicBackSW)

	dw GravelerPicFrontAlt, GravelerPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_STOLID NATURE_SCRAPPY
;@ pal_battle   PAL_GRANITEMON
;@ pal_altbattle PAL_SANDSTONEMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo         EVOLVE_TRADE, 1, GOLEM
;@ evo         EVOLVE_LEVEL, 37, GOLEM
;@ evo_move    EXPLOSION
;@ evo_react   "It rolls up with" "a grinding rumble!"
;@ evo_react   "It tucks in tight" "and rolls away!"
;@ evo_react   "Boulders grind" "as it lurches up!"
;@ evo_react   "It cracks knuckles" "of solid stone!"
;@ learn       8, ROCK_THROW
;@ learn       13, ROCK_SMASH
;@ learn       18, BULK_UP
;@ learn       23, ZAPPERCUT
;@ learn       29, ROCK_SLIDE
;@ learn       34, CLOBBERCLOCK
;@ learn       39, ENERGY_FLUX
;@ learn       44, EARTHQUAKE
;@ learn       50, OROCLASM
;@ learn       57, SUPERPOWER
;@ tutor       EXPLOSION
;@ tutor       CLOBBERCLOCK
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
