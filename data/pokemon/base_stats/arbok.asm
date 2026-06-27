	db DEX_ARBOK ; pokedex id

	db  70,  90,  69,  91,  65
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
	HYPER_BEAM,\
	GIGA_DRAIN,\
	MEGA_DRAIN,\
	SOLARBEAM,\
	WYRM_WRATH,\
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
	OROCLASM,\
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
	RIPTIDE,\
	CLAY_ARMOR,\
	ROCK_ON,\
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
;@ pal_battle   PAL_ARBOKMON
;@ pal_altbattle PAL_EMBERMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   "Its hood snaps" "wide with a hiss!"
;@ evo_react   "It coils tight," "then lunges out!"
;@ evo_react   "Fangs bared," "it tastes the air!"
;@ evo_react   "Its pattern glows" "with menace!"
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
;@ tutor       SOFTBOILED
;@ tutor       METEOR_DRIVE
;@ tutor       EGG_BOMB
;@ tutor       SCREECH
