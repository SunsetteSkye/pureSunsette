	db DEX_WEEPINBELL ; pokedex id

	db  65,  90,  50,  55,  85
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 120 ; catch rate
	db 151 ; base exp

	INCBIN "gfx/pokemon/front/weepinbell.pic", 0, 1 ; sprite dimensions
	dw WeepinbellPicFront, WeepinbellPicBackSW

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
	BODY_SLAM,\
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
	
	db BANK(WeepinbellPicFront)
	db 0
	db BANK(WeepinbellPicBack)
	db BANK(WeepinbellPicBackSW)

	dw 0, WeepinbellPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CRUEL NATURE_CALCULATING
;@ pal_battle   PAL_GREENBAR
;@ pal_altbattle PAL_AMBERMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo         EVOLVE_ITEM, LEAF_STONE, 1, VICTREEBEL
;@ evo_move    LEECH_SEED
;@ evo_react   "It gapes wide," "drooling, hungry!"
;@ evo_react   "It drips sweet sap" "from its jaws!"
;@ evo_react   "It sways and snaps" "at the air!"
;@ evo_react   "Its hook curls," "poised to strike!"
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
