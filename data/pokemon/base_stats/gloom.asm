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
	HONE_EDGE,\
	DISABLE,\
	SWORDS_DANCE,\
	SHADOW_GAME,\
	TOXIC,\
	SLUDGE_BOMB,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	WATER_PULSE,\
	SUPER_SOAK,\
	MEGA_DRAIN,\
	SOLARBEAM,\
	MUD_BOMB,\
	PSYCHIC_M,\
	DEMOLISH,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	ILL_WIND,\
	SHADOW_BALL,\
	SHADOW_BOX,\
	BARRIER,\
	SUBSTITUTE,\
	AQUA_RING,\
	ADAPTATION,\
	CALM_MIND,\
	VOID_MIND,\
	PSYCHO_SHIFT,\
	LEECH_LIFE,\
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
;@ evo         EVOLVE_ITEM, MOON_STONE, 1, VILEPLUME
;@ evo_move    PHANTASM
;@ evo_react   "Oh no! The smell" "is everywhere!"
;@ evo_react   "You gag on the" "sudden stench!"
;@ evo_react   "Ugh, that reek" "hits you hard!"
;@ evo_react   "The stink makes" "your eyes water!"
;@ learn       7, POISONPOWDER
;@ learn       11, ACID
;@ learn       15, STUN_SPORE
;@ learn       19, MEGA_DRAIN
;@ learn       23, ADAPTATION
;@ learn       28, SLEEP_POWDER
;@ learn       34, SLUDGE_BOMB
;@ learn       40, TOXIC
;@ learn       47, SOLARBEAM
;@ learn       54, EMETIC_PURGE
;@ tutor       SOULSTEALER
;@ tutor       TELEPORT
;@ tutor       SWIFT
