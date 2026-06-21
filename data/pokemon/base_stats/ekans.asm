	db DEX_EKANS ; pokedex id

	db  35,  60,  44,  55,  40
	;   hp  atk  def  spd  spc

	db POISON, NORMAL ; type
	db 255 ; catch rate
	db 90 ; base exp

	INCBIN "gfx/pokemon/front/ekans.pic", 0, 1 ; sprite dimensions
	dw EkansPicFront, EkansPicBackSW

	db WRAP, LEER, POISON_STING, NO_MOVE ; level 1 learnset
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
	BARRIER,\
	EARTHQUAKE,\
	DIG,\
	MEGA_DRAIN,\
	MIRAGE,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	DEMOLISH,\
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	ROCK_SLIDE,\
	ROCK_ON,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
	CUT,\
	STRENGTH
	; end


	db BANK(EkansPicFront)
	db 0
	db BANK(EkansPicBack)
	db BANK(EkansPicBackSW)

	dw 0, EkansPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CALCULATING NATURE_CRUEL
;@ pal_battle   PAL_ORCHIDMON
;@ pal_altbattle PAL_OLIVEMON
;@ pal_icon     PAL_ICON_15
;@ pal_alticon  $FF
;@ evo         EVOLVE_LEVEL, 22, ARBOK
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       7, ABSORB
;@ learn       13, BITE
;@ learn       19, ACID
;@ learn       23, HYPNOSIS
;@ learn       29, LEECH_LIFE
;@ learn       35, BLITZ_STRIKE
;@ learn       39, FOCUS_ENERGY
;@ learn       45, SOULSTEALER
;@ learn       51, VENOM_LASH
;@ learn       55, POWER_BIND
