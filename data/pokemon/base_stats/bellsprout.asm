	db DEX_BELLSPROUT ; pokedex id

	db  50,  75,  35,  40,  70
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 255 ; catch rate
	db 84 ; base exp

	INCBIN "gfx/pokemon/front/bellsprout.pic", 0, 1 ; sprite dimensions
	dw BellsproutPicFront, BellsproutPicBackSW

	db VINE_WHIP, WRAP, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	MUD_BOMB,\
	PIN_MISSILE,\
	TOXIC,\
	HONE_EDGE,\
	DISABLE,\
	DOUBLE_EDGE,\
	AQUA_RING,\
	CALM_MIND,\
	BARRIER,\
	ADAPTATION,\
	SOLARBEAM,\ 
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	CUT,\
	FLASH
	; end


	db BANK(BellsproutPicFront)
	db 0
	db BANK(BellsproutPicBack)
	db BANK(BellsproutPicBackSW)

	dw 0, BellsproutPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CAUTIOUS NATURE_DITZ
;@ pal_battle   PAL_GREENBAR
;@ pal_altbattle PAL_AMBERMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo         EVOLVE_LEVEL, 21, WEEPINBELL
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       13, POISONPOWDER
;@ learn       16, ACID
;@ learn       19, MEGA_DRAIN
;@ learn       22, STUN_SPORE
;@ learn       25, POWER_BIND
;@ learn       28, RAZOR_LEAF
;@ learn       34, SLEEP_POWDER
;@ learn       42, VENOM_LASH
;@ learn       48, EGG_BOMB
;@ learn       54, LEECH_SEED
;@ learn       58, ADAPTATION
