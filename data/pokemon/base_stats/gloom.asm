	db DEX_GLOOM ; pokedex id

	db  60,  65,  70,  40,  85
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 120 ; catch rate
	db 132 ; base exp

	INCBIN "gfx/pokemon/front/gloom.pic", 0, 1 ; sprite dimensions
	dw GloomPicFront, GloomPicBackSW

	db ABSORB, TACKLE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	MUD_BOMB,\
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
	PSYCHIC_M,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	DEMOLISH,\
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	CUT,\
	FLASH
	; end

	db BANK(GloomPicFront)
	db 0
	db BANK(GloomPicBack)
	db BANK(GloomPicBackSW)

	dw 0, GloomPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_MOROSE NATURE_LAZY
;@ pal_battle   PAL_REDMON
;@ pal_altbattle PAL_0F
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo         EVOLVE_ITEM, LEAF_STONE, 1, VILEPLUME
;@ evo_move    NO_MOVE
;@ evo_react   "Oh no! The smell" "is everywhere!"
;@ evo_react   "You gag on the" "sudden stench!"
;@ evo_react   "Ugh, that reek" "hits you hard!"
;@ evo_react   "The stink makes" "your eyes water!"
;@ learn       7, POISONPOWDER
;@ learn       11, ACID
;@ learn       15, ADAPTATION
;@ learn       17, STUN_SPORE
;@ learn       19, MEGA_DRAIN
;@ learn       23, PHANTASM
;@ learn       28, SLEEP_POWDER
;@ learn       36, SLUDGE_BOMB
;@ learn       45, TOXIC
;@ learn       50, SENBONZAKURA
;@ learn       57, EMETIC_PURGE
