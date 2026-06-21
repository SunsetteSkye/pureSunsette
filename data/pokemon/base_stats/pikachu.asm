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
	ADAPTATION,\
	FROST_FIST,\
	MUD_BOMB,\
	BLAZE_HAMMER,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	CALM_MIND,\
	LOW_KICK,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	RIPTIDE,\
	DIG,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	DEMOLISH,\
	VOID_MIND,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	SHADOW_GAME,\
	ROCK_ON,\
	SUBSTITUTE,\
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
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       6, TACKLE
;@ learn       9, THUNDER_WAVE
;@ learn       12, SPARK
;@ learn       16, AGILITY
;@ learn       22, SWIFT
;@ learn       26, THUNDERBOLT
;@ learn       31, FOCUS_ENERGY
;@ learn       36, BLITZ_STRIKE
;@ learn       45, THUNDER
;@ learn       52, HYPER_BEAM
