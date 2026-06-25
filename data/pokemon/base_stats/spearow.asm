	db DEX_SPEAROW ; pokedex id

	db  40,  60,  30,  70,  31
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 255 ; catch rate
	db 58 ; base exp

	INCBIN "gfx/pokemon/front/spearow.pic", 0, 1 ; sprite dimensions
	dw SpearowPicFront, SpearowPicBackSW

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
	FLY
	; end


	db BANK(SpearowPicFront)
	db BANK(SpearowPicFrontAlt)
	db BANK(SpearowPicBack)
	db BANK(SpearowPicBackSW)

	dw SpearowPicFrontAlt, SpearowPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_RAGE NATURE_SCRAPPY
;@ pal_battle   PAL_STEELMON
;@ pal_altbattle PAL_TANMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo         EVOLVE_LEVEL, 20, FEAROW
;@ evo_move    ILL_WIND
;@ evo_react   NONE
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
