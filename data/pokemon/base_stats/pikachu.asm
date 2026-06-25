	db DEX_PIKACHU ; pokedex id

	db  35,  65,  30,  90,  60
	;   hp  atk  def  spd  spc

	db ELECTRIC, NORMAL ; type
	db 190 ; catch rate
	db 82 ; base exp

	INCBIN "gfx/pokemon/front/pikachu.pic", 0, 1 ; sprite dimensions
	dw PikachuPicFront, PikachuPicBackSW

	db THUNDERSHOCK, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	DISABLE,\
	AURORA_MIST,\
	SHADOW_GAME,\
	TOXIC,\
	BODY_SLAM,\
	QUICK_ATTACK,\
	DOUBLE_EDGE,\
	ZAPPERCUT,\
	BLAZE_HAMMER,\
	SEISMIC_TOSS,\
	THUNDERBOLT,\
	THUNDER,\
	MUD_BOMB,\
	DIG,\
	FINISHER,\
	DEMOLISH,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	HEAT_RUSH,\
	ILL_WIND,\
	SHADOW_BOX,\
	BARRIER,\
	ENERGY_FLUX,\
	THUNDER_WAVE,\
	METEOR_SWEEP,\
	SUBSTITUTE,\
	RIPTIDE,\
	RAZOR_LEAF,\
	ADAPTATION,\
	CALM_MIND,\
	VOID_MIND,\
	PSYCHO_SHIFT,\
	LEAP_ATTACK,\
	ROCK_ON,\
	CUT,\
	SURF,\
	FLASH
	; end


	db BANK(PikachuPicFront)
	db 0
	db BANK(PikachuPicBack)
	db BANK(PikachuPicBackSW)

	dw 0, PikachuPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_PLAYFUL NATURE_HYPER
;@ pal_battle   PAL_REDBAR
;@ pal_altbattle PAL_THUNDERMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo         EVOLVE_ITEM, THUNDER_STONE, 1, RAICHU
;@ evo_move    ZAPPERCUT
;@ evo_react   NONE
;@ learn       5, QUICK_ATTACK
;@ learn       9, THUNDER_WAVE
;@ learn       13, SPARK
;@ learn       18, AGILITY
;@ learn       23, SWIFT
;@ learn       28, THUNDERBOLT
;@ learn       33, FOCUS_ENERGY
;@ learn       38, ENERGY_FLUX
;@ learn       44, BLITZ_STRIKE
;@ learn       50, THUNDER
;@ learn       56, HYPER_BEAM
;@ tutor       PAY_DAY
;@ tutor       TELEPORT
;@ tutor       CLOBBERCLOCK
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
;@ tutor       SWIFT
