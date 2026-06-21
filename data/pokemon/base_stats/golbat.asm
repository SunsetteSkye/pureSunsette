; Sunsette: a Pokemon Tower B1F spirit borrows this dex slot -> base_stats/spirit_the_maw.asm (Spirit (The Maw)).
	db DEX_GOLBAT ; pokedex id

	db  75,  95,  75,  79, 97
	;   hp  atk  def  spd  spc

	db POISON, FLYING ; type
	db 90 ; catch rate
	db 171 ; base exp

	INCBIN "gfx/pokemon/front/golbat.pic", 0, 1 ; sprite dimensions
	dw GolbatPicFront, GolbatPicBackSW

	db GUST, ABSORB, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ADAPTATION,\
	ROOST,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	HYPER_BEAM,\
	BARRIER,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	TWISTER,\
	LOVELY_KISS,\
	BRAVE_BIRD,\
	SKITTERMIND,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	CUT,\
	FLY
	; end

	db BANK(GolbatPicFront)
	db BANK(GolbatPicFrontAlt)
	db BANK(GolbatPicBack)
	db BANK(GolbatPicBackSW)

	dw GolbatPicFrontAlt, GolbatPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_HYPER NATURE_GLUTTON
;@ pal_battle   PAL_TWILIGHTMON
;@ pal_altbattle PAL_PINKMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   "It flaps up," "fangs bared wide!"
;@ evo_react   "It swoops in low," "wings whistling!"
;@ evo_react   "It bares fangs," "craving a bite!"
;@ evo_react   "It screeches once," "echoing loud!"
;@ learn       10, SUPERSONIC
;@ learn       15, LEECH_LIFE
;@ learn       18, BITE
;@ learn       21, WING_ATTACK
;@ learn       25, CONFUSE_RAY
;@ learn       28, ILL_WIND
;@ learn       30, HYPER_FANG
;@ learn       37, AIR_DRILL
;@ learn       44, SOULSTEALER
;@ learn       50, MAXIMIZE
;@ learn       55, VENOM_DRILL
