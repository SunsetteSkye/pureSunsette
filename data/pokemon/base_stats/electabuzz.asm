	db DEX_ELECTABUZZ ; pokedex id

	db  75,  93,  57, 105,  95
	;   hp  atk  def  spd  spc

	db ELECTRIC, FIGHTING ; type
	db 75 ; catch rate
	db 156 ; base exp

	INCBIN "gfx/pokemon/front/electabuzz.pic", 0, 1 ; sprite dimensions
	dw ElectabuzzPicFront, ElectabuzzPicBackSW

	db BLITZ_STRIKE, LEER, THUNDERSHOCK, SCREECH ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	FROST_FIST,\
	MUD_BOMB,\
	PIN_MISSILE,\
	BLAZE_HAMMER,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	HYPER_BEAM,\
	CALM_MIND,\
	LOW_KICK,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	DIG,\
	MIRAGE,\
	SWORDS_DANCE,\
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
	CLAY_ARMOR,\
	CUT,\
	STRENGTH,\
	FLASH
	; end


	db BANK(ElectabuzzPicFront)
	db BANK(ElectabuzzPicFrontAlt)
	db BANK(ElectabuzzPicBack)
	db BANK(ElectabuzzPicBackSW)

	dw ElectabuzzPicFrontAlt, ElectabuzzPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_HYPER NATURE_SCRAPPY
;@ pal_battle   PAL_GOLDMON
;@ pal_altbattle PAL_THUNDERMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       26, MACH_PUNCH
;@ learn       28, LIGHT_SCREEN
;@ learn       30, ZAPPERCUT
;@ learn       33, SHADOW_BOX
;@ learn       37, SEISMIC_TOSS
;@ learn       42, DIZZY_PUNCH
;@ learn       47, THUNDER
;@ learn       54, HYPER_BEAM
