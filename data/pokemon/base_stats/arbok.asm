	db DEX_ARBOK ; pokedex id

	db  85,  95,  69,  96,  70
	;   hp  atk  def  spd  spc

	db POISON, NORMAL ; type
	db 90 ; catch rate
	db 147 ; base exp

	INCBIN "gfx/pokemon/front/arbok.pic", 0, 1 ; sprite dimensions
	dw ArbokPicFront, ArbokPicBackSW

	db WRAP, LEER, POISON_STING, ABSORB ; level 1 learnset
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
	BARRIER,\
	WYRM_WRATH,\
	EARTHQUAKE,\
	RIPTIDE,\
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
	SURF,\
	STRENGTH
	; end

	db BANK(ArbokPicFront)
	db 0
	db BANK(ArbokPicBack)
	db BANK(ArbokPicBackSW)

	dw 0, ArbokPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CALCULATING NATURE_CRUEL
;@ pal_battle   PAL_ORCHIDMON
;@ pal_altbattle PAL_OLIVEMON
;@ pal_icon     PAL_ICON_15
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   "Its hood snaps" "wide with a hiss!"
;@ evo_react   "It coils tight," "then lunges out!"
;@ evo_react   "Fangs bared," "it tastes the air!"
;@ evo_react   "Its pattern glows" "with menace!"
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
