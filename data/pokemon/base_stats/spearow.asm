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
	ADAPTATION,\
	ROOST,\
	PIN_MISSILE,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	LOW_KICK,\
	BARRIER,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	TWISTER,\
	BRAVE_BIRD,\
	SHADOW_GAME,\
	SUBSTITUTE,\
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
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       9, LEER
;@ learn       13, MUD_CLAW
;@ learn       18, WING_ATTACK
;@ learn       22, ILL_WIND
;@ learn       26, MOCKINGBIRD
;@ learn       30, BLOOD_RUSH
;@ learn       33, AIR_DRILL
;@ learn       37, PHANTASM
;@ learn       42, AGILITY
;@ learn       48, DOUBLE_EDGE
;@ learn       55, SPIKE_CANNON
