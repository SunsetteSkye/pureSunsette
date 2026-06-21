	db DEX_ELECTRODE ; pokedex id

	db  65,  50,  70, 135,  90
	;   hp  atk  def  spd  spc

	db ELECTRIC, FIRE ; type
	db 60 ; catch rate
	db 150 ; base exp

	INCBIN "gfx/pokemon/front/electrode.pic", 0, 1 ; sprite dimensions
	dw ElectrodePicFront, ElectrodePicBackSW

	db TACKLE, THUNDERSHOCK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	HYPER_BEAM,\
	CALM_MIND,\
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	MEGA_DRAIN,\
	MIRAGE,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	FLASH
	; end

	db BANK(ElectrodePicFront)
	db 0
	db BANK(ElectrodePicBack)
	db BANK(ElectrodePicBackSW)

	dw 0, ElectrodePicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_HYPER NATURE_RAGE
;@ pal_battle   PAL_VOLTORBMON
;@ pal_altbattle PAL_GREENBAR
;@ pal_icon     PAL_ICON_04
;@ pal_alticon  PAL_ICON_48
;@ evo_move    NO_MOVE
;@ evo_react   "It buzzes, set" "to blow, grinning!"
;@ evo_react   "It rolls in fast," "sparks flying!"
;@ evo_react   "It hums louder" "and louder still!"
;@ evo_react   "It bounces once," "ready to pop!"
;@ learn       15, THUNDER_WAVE
;@ learn       18, SPARK
;@ learn       22, SWIFT
;@ learn       24, HEAT_RUSH
;@ learn       28, SCREECH
;@ learn       31, THUNDERBOLT
;@ learn       35, EGG_BOMB
;@ learn       39, SUPERNOVA
;@ learn       42, EXPLOSION
;@ learn       48, THUNDER
