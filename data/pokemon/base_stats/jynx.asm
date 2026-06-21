	db DEX_JYNX ; pokedex id

	db  80,  50,  75,  95, 105
	;   hp  atk  def  spd  spc

	db ICE, GHOST ; type
	db 75 ; catch rate
	db 137 ; base exp

	INCBIN "gfx/pokemon/front/jynx.pic", 0, 1 ; sprite dimensions
	dw JynxPicFront, JynxPicBackSW

	db TACKLE, LOVELY_KISS, LICK, DOUBLESLAP ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	FROST_FIST,\
	BLAZE_HAMMER,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	CALM_MIND,\
	LOW_KICK,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	BARRIER,\
	RIPTIDE,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	DEMOLISH,\
	VOID_MIND,\
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	SKITTERMIND,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	SURF,\
	FLASH
	; end


	db BANK(JynxPicFront)
	db BANK(JynxPicFrontAlt)
	db BANK(JynxPicBack)
	db BANK(JynxPicBackSW)

	dw JynxPicFrontAlt, JynxPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_ARROGANT NATURE_PLAYFUL
;@ pal_battle   PAL_SAFFRON
;@ pal_altbattle PAL_GHOSTMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       21, AURORA_BEAM
;@ learn       23, LICK
;@ learn       27, BODY_SLAM
;@ learn       30, FROST_FIST
;@ learn       34, PSYBEAM
;@ learn       39, CALM_MIND
;@ learn       42, SOULSTEALER
;@ learn       42, LOVELY_KISS
;@ learn       47, BLIZZARD
;@ learn       54, EGG_BOMB
