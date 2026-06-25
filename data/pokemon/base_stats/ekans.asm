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
	HONE_EDGE,\
	DISABLE,\
	SWORDS_DANCE,\
	AURORA_MIST,\
	SHADOW_GAME,\
	TOXIC,\
	SLUDGE_BOMB,\
	BODY_SLAM,\
	QUICK_ATTACK,\
	DOUBLE_EDGE,\
	WATER_PULSE,\
	SUPER_SOAK,\
	GIGA_DRAIN,\
	MEGA_DRAIN,\
	SOLARBEAM,\
	EARTHQUAKE,\
	MUD_BOMB,\
	DIG,\
	FINISHER,\
	DEMOLISH,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	HEAT_RUSH,\
	FLAMETHROWER,\
	FIRE_BLAST,\
	ILL_WIND,\
	SHADOW_BALL,\
	SHADOW_BOX,\
	BARRIER,\
	THUNDER_WAVE,\
	SKITTERMIND,\
	ROCK_SLIDE,\
	SUBSTITUTE,\
	AQUA_RING,\
	RAZOR_LEAF,\
	ADAPTATION,\
	CALM_MIND,\
	VOID_MIND,\
	PSYCHO_SHIFT,\
	LOVELY_KISS,\
	LEAP_ATTACK,\
	PIN_MISSILE,\
	LEECH_LIFE,\
	TEMPEST,\
	CLAY_ARMOR,\
	ROCK_ON,\
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
;@ evo_move    HYPNOSIS
;@ evo_react   NONE
;@ learn       7, ABSORB
;@ learn       12, BITE
;@ learn       16, ACID
;@ learn       24, LEECH_LIFE
;@ learn       29, FOCUS_ENERGY
;@ learn       35, BLITZ_STRIKE
;@ learn       40, POISON_FANG
;@ learn       45, VENOM_LASH
;@ learn       50, POWER_BIND
;@ learn       55, SOULSTEALER
;@ tutor       METEOR_DRIVE
;@ tutor       EGG_BOMB
;@ tutor       SCREECH
