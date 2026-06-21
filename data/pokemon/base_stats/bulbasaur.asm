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
	MUD_BOMB,\
	PIN_MISSILE,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AQUA_RING,\
	CALM_MIND,\
	LOW_KICK,\
	METEOR_SWEEP,\
	BARRIER,\
	ADAPTATION,\
	SOLARBEAM,\ 
	DIG,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	TWISTER,\
	VOID_MIND,\
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	ROCK_ON,\
	SUBSTITUTE,\
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
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       6, LEECH_SEED
;@ learn       8, VINE_WHIP
;@ learn       11, POISONPOWDER
;@ learn       14, ADAPTATION
;@ learn       18, STUN_SPORE
;@ learn       21, RAZOR_LEAF
;@ learn       25, EMETIC_PURGE
;@ learn       33, SLEEP_POWDER
;@ learn       38, VENOM_LASH
;@ learn       45, SENBONZAKURA
;@ learn       52, TOXIC
