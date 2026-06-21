	db DEX_FEAROW ; pokedex id

	db  95, 100,  65,  80,  81
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
	ROOST,\
	PIN_MISSILE,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	HYPER_BEAM,\
	LOW_KICK,\
	BARRIER,\
	DIG,\
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
;@ learn       22, ILL_WIND
;@ learn       26, MOCKINGBIRD
;@ learn       30, BLOOD_RUSH
;@ learn       33, AIR_DRILL
;@ learn       37, PHANTASM
;@ learn       42, AGILITY
;@ learn       48, DOUBLE_EDGE
;@ learn       55, SPIKE_CANNON
