	db DEX_DODRIO ; pokedex id

	db  70, 115,  70, 105,  60
	;   hp  atk  def  spd  spc

	db FIGHTING, FLYING ; type
	db 45 ; catch rate
	db 158 ; base exp

	INCBIN "gfx/pokemon/front/dodrio.pic", 0, 1 ; sprite dimensions
	dw DodrioPicFront, DodrioPicBackSW

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
	HYPER_BEAM,\
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

	db BANK(DodrioPicFront)
	db 0
	db BANK(DodrioPicBack)
	db BANK(DodrioPicBackSW)

	dw 0, DodrioPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_SCRAPPY NATURE_HYPER
;@ pal_battle   PAL_BROWNMON2
;@ pal_altbattle PAL_PINKMON
;@ pal_icon     PAL_ICON_10
;@ pal_alticon  PAL_ICON_44
;@ evo_move    NO_MOVE
;@ evo_react   "Is it arguing" "with itself now?!"
;@ evo_react   "The left head" "squawks at others!"
;@ evo_react   "Three heads, one" "loud quarrel!"
;@ evo_react   "Its heads peck" "and bicker away!"
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
