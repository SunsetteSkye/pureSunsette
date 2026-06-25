	db DEX_JIGGLYPUFF ; pokedex id

	db 115,  45,  20,  20,  25
	;   hp  atk  def  spd  spc

	db NORMAL, FLOATING ; type
	db 170 ; catch rate
	db 76 ; base exp

	INCBIN "gfx/pokemon/front/jigglypuff.pic", 0, 1 ; sprite dimensions
	dw JigglypuffPicFront, JigglypuffPicBackSW

	db TACKLE, SING, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	HONE_EDGE,\
	DISABLE,\
	SWORDS_DANCE,\
	AURORA_MIST,\
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	WATER_PULSE,\
	SUPER_SOAK,\
	ICE_BEAM,\
	BLIZZARD,\
	ZAPPERCUT,\
	FROST_FIST,\
	BLAZE_HAMMER,\
	SEISMIC_TOSS,\
	SOLARBEAM,\
	THUNDERBOLT,\
	THUNDER,\
	MUD_BOMB,\
	DIG,\
	PSYCHIC_M,\
	FINISHER,\
	DEMOLISH,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	SUPERNOVA,\
	FLAMETHROWER,\
	FIRE_BLAST,\
	ILL_WIND,\
	SHADOW_BALL,\
	SHADOW_BOX,\
	BARRIER,\
	ENERGY_FLUX,\
	THUNDER_WAVE,\
	SKITTERMIND,\
	METEOR_SWEEP,\
	SUBSTITUTE,\
	AQUA_RING,\
	RAZOR_LEAF,\
	ADAPTATION,\
	CALM_MIND,\
	VOID_MIND,\
	PSYCHO_SHIFT,\
	LOVELY_KISS,\
	ROOST,\
	LEAP_ATTACK,\
	TEMPEST,\
	ROCK_ON,\
	FLY,\
	STRENGTH,\
	FLASH
	; end


	db BANK(JigglypuffPicFront)
	db 0
	db BANK(JigglypuffPicBack)
	db BANK(JigglypuffPicBackSW)

	dw 0, JigglypuffPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_PLAYFUL NATURE_CONSIDERATE
;@ pal_battle   PAL_JIGGMON
;@ pal_altbattle PAL_IVORYMON
;@ pal_icon     PAL_ICON_26
;@ pal_alticon  PAL_ICON_27
;@ evo         EVOLVE_ITEM, MOON_STONE, 1, WIGGLYTUFF
;@ evo_move    MAXIMIZE
;@ evo_react   NONE
;@ learn       6, DOUBLESLAP
;@ learn       9, GUST
;@ learn       13, ROCK_ON
;@ learn       17, SLAM
;@ learn       22, FLUTTER_KICK
;@ learn       26, CLOBBERCLOCK
;@ learn       31, DISABLE
;@ learn       36, MINIMIZE
;@ learn       41, AIR_DRILL
;@ learn       46, DOUBLE_EDGE
;@ learn       52, EXPLOSION
;@ tutor       EXPLOSION
;@ tutor       TRI_ATTACK
;@ tutor       SOULSTEALER
;@ tutor       PAY_DAY
;@ tutor       TELEPORT
;@ tutor       CLOBBERCLOCK
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
;@ tutor       SWIFT
;@ tutor       EGG_BOMB
;@ tutor       SCREECH
