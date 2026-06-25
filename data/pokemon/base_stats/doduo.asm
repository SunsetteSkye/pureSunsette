	db DEX_DODUO ; pokedex id

	db  50,  85,  50,  75,  35
	;   hp  atk  def  spd  spc

	db FIGHTING, FLYING ; type
	db 190 ; catch rate
	db 96 ; base exp

	INCBIN "gfx/pokemon/front/doduo.pic", 0, 1 ; sprite dimensions
	dw DoduoPicFront, DoduoPicBackSW

	db PECK, MUD_CLAW, NO_MOVE, NO_MOVE ; level 1 learnset
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
	MUD_BOMB,\
	DIG,\
	FINISHER,\
	DEMOLISH,\
	BULK_UP,\
	REFLECT,\
	ILL_WIND,\
	BARRIER,\
	BRAVE_BIRD,\
	THUNDER_WAVE,\
	METEOR_SWEEP,\
	SUBSTITUTE,\
	VOID_MIND,\
	ROOST,\
	LEAP_ATTACK,\
	PIN_MISSILE,\
	TEMPEST,\
	ROCK_ON,\
	CUT,\
	FLY,\
	STRENGTH
	; end


	db BANK(DoduoPicFront)
	db 0
	db BANK(DoduoPicBack)
	db BANK(DoduoPicBackSW)

	dw 0, DoduoPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_SCRAPPY NATURE_HYPER
;@ pal_battle   PAL_BROWNMON2
;@ pal_altbattle PAL_PINKMON
;@ pal_icon     PAL_ICON_10
;@ pal_alticon  PAL_ICON_44
;@ evo         EVOLVE_LEVEL, 31, DODRIO
;@ evo_move    TRI_ATTACK
;@ evo_react   NONE
;@ learn       10, STOMP
;@ learn       14, DOUBLE_KICK
;@ learn       18, MUD_BOMB
;@ learn       22, FOCUS_ENERGY
;@ learn       26, BLOOD_RUSH
;@ learn       30, PISTON_KICK
;@ learn       35, FLUTTER_KICK
;@ learn       40, MUDSLIDE
;@ learn       45, SLASH
;@ learn       50, HI_JUMP_KICK
;@ learn       55, AIR_DRILL
;@ learn       60, MOCKINGBIRD
;@ tutor       TRI_ATTACK
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
;@ tutor       SWIFT
