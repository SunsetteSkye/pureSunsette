	db DEX_ODDISH ; pokedex id

	db  45,  50,  55,  30,  75
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 255 ; catch rate
	db 78 ; base exp

	INCBIN "gfx/pokemon/front/oddish.pic", 0, 1 ; sprite dimensions
	dw OddishPicFront, OddishPicBackSW

	db ABSORB, TACKLE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	MUD_BOMB,\
	TOXIC,\
	HONE_EDGE,\
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
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	CUT,\
	FLASH
	; end


	db BANK(OddishPicFront)
	db 0
	db BANK(OddishPicBack)
	db BANK(OddishPicBackSW)

	dw 0, OddishPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CAUTIOUS NATURE_MOROSE
;@ pal_battle   PAL_GREENMON
;@ pal_altbattle PAL_0F
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo         EVOLVE_LEVEL, 21, GLOOM
;@ evo_move    NO_MOVE
;@ evo_react   NONE
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
