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
	HONE_EDGE,\
	DISABLE,\
	SWORDS_DANCE,\
	SHADOW_GAME,\
	TOXIC,\
	SLUDGE_BOMB,\
	DOUBLE_EDGE,\
	WATER_PULSE,\
	SUPER_SOAK,\
	MEGA_DRAIN,\
	SOLARBEAM,\
	MUD_BOMB,\
	PSYCHIC_M,\
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


	db BANK(OddishPicFront)
	db 0
	db BANK(OddishPicBack)
	db BANK(OddishPicBackSW)

	dw 0, OddishPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CAUTIOUS NATURE_MOROSE
;@ pal_battle   PAL_GREENMON
;@ pal_altbattle PAL_GRAYMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo         EVOLVE_LEVEL, 21, GLOOM
;@ evo_move    LICK
;@ evo_react   NONE
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
