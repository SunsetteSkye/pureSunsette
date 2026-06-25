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
	HONE_EDGE,\
	DISABLE,\
	SWORDS_DANCE,\
	SHADOW_GAME,\
	TOXIC,\
	SLUDGE_BOMB,\
	DOUBLE_EDGE,\
	SEISMIC_TOSS,\
	MEGA_DRAIN,\
	SOLARBEAM,\
	MUD_BOMB,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	ILL_WIND,\
	SHADOW_BALL,\
	BARRIER,\
	SKITTERMIND,\
	SUBSTITUTE,\
	AQUA_RING,\
	RAZOR_LEAF,\
	ADAPTATION,\
	CALM_MIND,\
	VOID_MIND,\
	PSYCHO_SHIFT,\
	PIN_MISSILE,\
	LEECH_LIFE,\
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
;@ evo_move    MEGA_DRAIN
;@ evo_react   NONE
;@ learn       8, POISONPOWDER
;@ learn       12, ACID
;@ learn       16, RAZOR_LEAF
;@ learn       20, STUN_SPORE
;@ learn       26, POISON_FANG
;@ learn       31, SLAM
;@ learn       37, SLEEP_POWDER
;@ learn       44, SOLARBEAM
;@ learn       52, SLUDGE_BOMB
;@ tutor       EXPLOSION
;@ tutor       EGG_BOMB
