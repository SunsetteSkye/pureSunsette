	db DEX_BULBASAUR ; pokedex id

	db  45,  49,  49,  45,  65
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 64 ; base exp

	INCBIN "gfx/pokemon/front/bulbasaur.pic", 0, 1 ; sprite dimensions
	dw BulbasaurPicFront, BulbasaurPicBackSW

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	DISABLE,\
	SWORDS_DANCE,\
	SHADOW_GAME,\
	TOXIC,\
	SLUDGE_BOMB,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	WATER_PULSE,\
	SUPER_SOAK,\
	GIGA_DRAIN,\
	MEGA_DRAIN,\
	SOLARBEAM,\
	MUD_BOMB,\
	DIG,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	ILL_WIND,\
	SHADOW_BALL,\
	BARRIER,\
	METEOR_SWEEP,\
	SUBSTITUTE,\
	AQUA_RING,\
	ADAPTATION,\
	CALM_MIND,\
	VOID_MIND,\
	PSYCHO_SHIFT,\
	LEAP_ATTACK,\
	PIN_MISSILE,\
	LEECH_LIFE,\
	TEMPEST,\
	ROCK_ON,\
	CUT,\
	FLASH
	; end

	db BANK(BulbasaurPicFront)
	db BANK(BulbasaurPicFrontAlt)
	db BANK(BulbasaurPicBack)
	db BANK(BulbasaurPicBackSW)

	dw BulbasaurPicFrontAlt, BulbasaurPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_GENTLE NATURE_CAUTIOUS
;@ pal_battle   PAL_VERDANTMON
;@ pal_altbattle PAL_BULBAALT
;@ pal_icon     PAL_ICON_01
;@ pal_alticon  $FF
;@ evo         EVOLVE_LEVEL, 16, IVYSAUR
;@ evo_move    MEGA_DRAIN
;@ evo_react   NONE
;@ learn       6, LEECH_SEED
;@ learn       8, VINE_WHIP
;@ learn       11, POISONPOWDER
;@ learn       14, ADAPTATION
;@ learn       18, STUN_SPORE
;@ learn       21, RAZOR_LEAF
;@ learn       25, EMETIC_PURGE
;@ learn       35, SLEEP_POWDER
;@ learn       40, VENOM_LASH
;@ learn       47, TOXIC
;@ learn       56, SOLARBEAM
;@ tutor       PISTON_KICK
;@ tutor       HURRICANE
;@ tutor       METEOR_DRIVE
;@ tutor       EGG_BOMB
