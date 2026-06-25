	db DEX_STARYU ; pokedex id

	db  30,  45,  55,  85,  70
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 225 ; catch rate
	db 106 ; base exp

	INCBIN "gfx/pokemon/front/staryu.pic", 0, 1 ; sprite dimensions
	dw StaryuPicFront, StaryuPicBackSW

	db TACKLE, SUPER_SOAK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	LEAP_ATTACK,\
	TOXIC,\
	DISABLE,\
	DOUBLE_EDGE,\
	AQUA_RING,\
	ICE_BEAM,\
	BLIZZARD,\
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	RIPTIDE,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	TEMPEST,\
	VOID_MIND,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	SKITTERMIND,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	FLASH
	; end


	db BANK(StaryuPicFront)
	db 0
	db BANK(StaryuPicBack)
	db BANK(StaryuPicBackSW)

	dw 0, StaryuPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_WISE NATURE_STOLID
;@ pal_battle   PAL_SAFFRON
;@ pal_altbattle PAL_VIOLETMON
;@ pal_icon     $FF
;@ pal_alticon  PAL_ICON_61
;@ evo         EVOLVE_ITEM, WATER_STONE, 1, STARMIE
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       14, HARDEN
;@ learn       18, SWIFT
;@ learn       21, WATER_PULSE
;@ learn       27, MEGA_DRAIN
;@ learn       31, RECOVER
;@ learn       34, DISABLE
;@ learn       39, BARRIER
;@ learn       43, PSYCHIC_M
;@ learn       48, HYDRO_PUMP
;@ tutor       EXPLOSION
;@ tutor       TELEPORT
;@ tutor       SWIFT
