; Sunsette: a Pokemon Tower B1F spirit borrows this dex slot -> base_stats/spirit_the_maw.asm (Spirit (The Maw)).
	db DEX_GOLBAT ; pokedex id

	db  75,  95,  75,  79, 75
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
	SEISMIC_TOSS,\
	MEGA_DRAIN,\
	MUD_BOMB,\
	FINISHER,\
	DEMOLISH,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	ILL_WIND,\
	SHADOW_BALL,\
	BARRIER,\
	BRAVE_BIRD,\
	SKITTERMIND,\
	SUBSTITUTE,\
	RAZOR_LEAF,\
	ADAPTATION,\
	CALM_MIND,\
	PSYCHO_SHIFT,\
	LOVELY_KISS,\
	ROOST,\
	LEAP_ATTACK,\
	LEECH_LIFE,\
	TEMPEST,\
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
;@ learn       6, LEECH_LIFE
;@ learn       10, SUPERSONIC
;@ learn       15, WING_ATTACK
;@ learn       20, ROOST
;@ learn       25, POISON_FANG
;@ learn       31, CONFUSE_RAY
;@ learn       38, AIR_DRILL
;@ learn       45, MAXIMIZE
;@ learn       52, HYPER_FANG
;@ learn       60, VENOM_DRILL
;@ tutor       SOULSTEALER
;@ tutor       HURRICANE
;@ tutor       METEOR_DRIVE
;@ tutor       SCREECH
