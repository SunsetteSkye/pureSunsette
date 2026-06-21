	db DEX_WEEPINBELL ; pokedex id

	db  65,  90,  50,  55,  85
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 120 ; catch rate
	db 151 ; base exp

	INCBIN "gfx/pokemon/front/weepinbell.pic", 0, 1 ; sprite dimensions
	dw WeepinbellPicFront, WeepinbellPicBackSW

	db VINE_WHIP, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
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
;@ evo_move    NO_MOVE
;@ evo_react   "It gapes wide," "drooling, hungry!"
;@ evo_react   "It drips sweet sap" "from its jaws!"
;@ evo_react   "It sways and snaps" "at the air!"
;@ evo_react   "Its hook curls," "poised to strike!"
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
