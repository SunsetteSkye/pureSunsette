	db DEX_VULPIX ; pokedex id

	db  38,  41,  40,  65,  65
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 190 ; catch rate
	db 63 ; base exp

	INCBIN "gfx/pokemon/front/vulpix.pic", 0, 1 ; sprite dimensions
	dw VulpixPicFront, VulpixPicBackSW

	db EMBER, TAIL_WHIP, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	DISABLE,\
	AURORA_MIST,\
	SHADOW_GAME,\
	TOXIC,\
	BODY_SLAM,\
	QUICK_ATTACK,\
	DOUBLE_EDGE,\
	SOLARBEAM,\
	THUNDERBOLT,\
	THUNDER,\
	MUD_BOMB,\
	DIG,\
	PSYCHIC_M,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	HEAT_RUSH,\
	SUPERNOVA,\
	FLAMETHROWER,\
	FIRE_BLAST,\
	ILL_WIND,\
	SHADOW_BALL,\
	BARRIER,\
	ENERGY_FLUX,\
	METEOR_SWEEP,\
	SUBSTITUTE,\
	RAZOR_LEAF,\
	ADAPTATION,\
	CALM_MIND,\
	PSYCHO_SHIFT,\
	LEAP_ATTACK,\
	CUT,\
	FLASH
	; end


	db BANK(VulpixPicFront)
	db 0
	db BANK(VulpixPicBack)
	db BANK(VulpixPicBackSW)

	dw 0, VulpixPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_PLAYFUL NATURE_GENTLE
;@ pal_battle   PAL_EMBERMON
;@ pal_altbattle PAL_GRAYVELVET
;@ pal_icon     PAL_ICON_04
;@ pal_alticon  PAL_ICON_13
;@ evo         EVOLVE_ITEM, FIRE_STONE, 1, NINETALES
;@ evo_move    PHANTASM
;@ evo_react   NONE
;@ learn       6, QUICK_ATTACK
;@ learn       10, CONFUSE_RAY
;@ learn       13, BITE
;@ learn       17, DISABLE
;@ learn       22, MIRAGE
;@ learn       27, HYPNOSIS
;@ learn       32, REFLECT
;@ learn       38, FLAMETHROWER
;@ learn       44, LIGHT_SCREEN
;@ learn       50, PSYCHIC_M
;@ learn       56, FIRE_SPIN
;@ tutor       TRI_ATTACK
;@ tutor       TELEPORT
;@ tutor       SWIFT
