	db DEX_DODUO ; pokedex id

	db  35,  85,  45,  75,  35
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
	ROOST,\
	MUD_BOMB,\
	PIN_MISSILE,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	LOW_KICK,\
	METEOR_SWEEP,\
	BARRIER,\
	EARTHQUAKE,\
	DIG,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	TWISTER,\
	BRAVE_BIRD,\
	THUNDER_WAVE,\
	SHADOW_GAME,\
	SUBSTITUTE,\
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
;@ evo         EVOLVE_LEVEL, 25, DODRIO
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       10, DOUBLE_KICK
;@ learn       14, STOMP
;@ learn       17, WING_ATTACK
;@ learn       20, MUD_BOMB
;@ learn       23, BLOOD_RUSH
;@ learn       26, AGILITY
;@ learn       30, AIR_DRILL
;@ learn       35, MOCKINGBIRD
;@ learn       41, PISTON_KICK
;@ learn       49, TWINEEDLE
