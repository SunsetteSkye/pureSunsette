	db DEX_STARMIE ; pokedex id

	db  60,  75,  85, 115, 100
	;   hp  atk  def  spd  spc

	db WATER, PSYCHIC_TYPE ; type
	db 60 ; catch rate
	db 207 ; base exp

	INCBIN "gfx/pokemon/front/starmie.pic", 0, 1 ; sprite dimensions
	dw StarmiePicFront, StarmiePicBackSW

	db TACKLE, SUPER_SOAK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	DISABLE,\
	DOUBLE_EDGE,\
	AQUA_RING,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	RIPTIDE,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	TWISTER,\
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

	db BANK(StarmiePicFront)
	db BANK(StarmiePicFrontAlt)
	db BANK(StarmiePicBack)
	db BANK(StarmiePicBackSW)

	dw StarmiePicFrontAlt, StarmiePicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_WISE NATURE_STOLID
;@ pal_battle   PAL_VIOLETMON
;@ pal_altbattle PAL_SAFFRON
;@ pal_icon     PAL_ICON_61
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   "Its core flares" "with odd light!"
;@ evo_react   "It spins fast," "core blazing!"
;@ evo_react   "It beams strange" "light at you!"
;@ evo_react   "Its gem pulses" "in rainbow hues!"
;@ learn       14, HARDEN
;@ learn       18, SWIFT
;@ learn       21, WATER_PULSE
;@ learn       27, MEGA_DRAIN
;@ learn       31, RECOVER
;@ learn       34, DISABLE
;@ learn       39, BARRIER
;@ learn       43, PSYCHIC_M
;@ learn       48, HYDRO_PUMP
