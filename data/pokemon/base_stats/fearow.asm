	db DEX_FEAROW ; pokedex id

	db  65,  90,  65, 100,  81
	;   hp  atk  def  spd  spc

	db GHOST, FLYING ; type
	db 90 ; catch rate
	db 162 ; base exp

	INCBIN "gfx/pokemon/front/fearow.pic", 0, 1 ; sprite dimensions
	dw FearowPicFront, FearowPicBackSW

	db PECK, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
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
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	SEISMIC_TOSS,\
	MUD_BOMB,\
	FINISHER,\
	BULK_UP,\
	REFLECT,\
	ILL_WIND,\
	SHADOW_BALL,\
	SHADOW_BOX,\
	BARRIER,\
	BRAVE_BIRD,\
	SUBSTITUTE,\
	RAZOR_LEAF,\
	ADAPTATION,\
	CALM_MIND,\
	VOID_MIND,\
	ROOST,\
	LEAP_ATTACK,\
	PIN_MISSILE,\
	TEMPEST,\
	CUT,\
	FLY,\
	STRENGTH
	; end


	db BANK(FearowPicFront)
	db 0
	db BANK(FearowPicBack)
	db BANK(FearowPicBackSW)

	dw 0, FearowPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_MOROSE NATURE_RAGE
;@ pal_battle   PAL_STEELMON
;@ pal_altbattle PAL_TANMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   "It stretches tall" "and screeches!"
;@ evo_react   "It snaps its beak" "with a loud clack!"
;@ evo_react   "Broad wings sweep" "a sudden gust!"
;@ evo_react   "It wheels up," "scanning below!"
;@ learn       9, LEER
;@ learn       13, MUD_CLAW
;@ learn       18, WING_ATTACK
;@ learn       23, MOCKINGBIRD
;@ learn       27, PHANTASM
;@ learn       33, AIR_DRILL
;@ learn       38, BLOOD_RUSH
;@ learn       44, CONFUSE_RAY
;@ learn       50, SOULSTEALER
;@ learn       56, BRAVE_BIRD
;@ tutor       HURRICANE
;@ tutor       METEOR_DRIVE
;@ tutor       EGG_BOMB
;@ tutor       SCREECH
