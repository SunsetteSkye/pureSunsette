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
	MUD_BOMB,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	CALM_MIND,\
	METEOR_SWEEP,\
	BARRIER,\
	SOLARBEAM,\ 
	DIG,\
	MIRAGE,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	SUPERNOVA,\
	FIRE_BLAST,\
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	SUBSTITUTE,\
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
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       9, LICK
;@ learn       12, DISABLE
;@ learn       16, BITE
;@ learn       21, MIRAGE
;@ learn       23, CONFUSE_RAY
;@ learn       28, PHANTASM
;@ learn       35, FLAMETHROWER
;@ learn       44, HYPNOSIS
;@ learn       50, PSYCHIC_M
;@ learn       56, SOULSTEALER
;@ learn       60, FIRE_SPIN
