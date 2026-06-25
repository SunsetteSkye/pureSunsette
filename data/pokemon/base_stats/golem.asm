	db DEX_GOLEM ; pokedex id

	db  80, 110, 130,  45,  75
	;   hp  atk  def  spd  spc

	db ROCK, FIGHTING ; type
	db 65 ; catch rate
	db 177 ; base exp

	INCBIN "gfx/pokemon/front/golem.pic", 0, 1 ; sprite dimensions
	dw GolemPicFront, GolemPicBackSW

	db TACKLE, HARDEN, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	DISABLE,\
	TOXIC,\
	SLUDGE_BOMB,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
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

	db BANK(GolemPicFront)
	db 0
	db BANK(GolemPicBack)
	db BANK(GolemPicBackSW)

	dw 0, GolemPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_STOLID NATURE_SCRAPPY
;@ pal_battle   PAL_BOULDERMON
;@ pal_altbattle PAL_MAGMAMON
;@ pal_icon     $FF
;@ pal_alticon  PAL_ICON_38
;@ evo_move    NO_MOVE
;@ evo_react   "It slams down," "ground trembles!"
;@ evo_react   "It curls into" "a perfect boulder!"
;@ evo_react   "Its shell hardens" "with a deep crack!"
;@ evo_react   "It rolls forward," "crushing all!"
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
