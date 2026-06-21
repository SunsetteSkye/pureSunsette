	db DEX_TENTACOOL ; pokedex id

	db  40,  40,  35,  70, 100
	;   hp  atk  def  spd  spc

	db WATER, POISON ; type
	db 190 ; catch rate
	db 105 ; base exp

	INCBIN "gfx/pokemon/front/tentacool.pic", 0, 1 ; sprite dimensions
	dw TentacoolPicFront, TentacoolPicBackSW

	db ACID, BUBBLE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	ADAPTATION,\
	PIN_MISSILE,\
	TOXIC,\
	HONE_EDGE,\
	DISABLE,\
	DOUBLE_EDGE,\
	AQUA_RING,\
	ICE_BEAM,\
	BLIZZARD,\
	CALM_MIND,\
	LOW_KICK,\
	BARRIER,\
	RIPTIDE,\
	DIG,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	TWISTER,\
	LIGHT_SCREEN,\
	SKITTERMIND,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	SURF,\
	FLASH
	; end


	db BANK(TentacoolPicFront)
	db 0
	db BANK(TentacoolPicBack)
	db BANK(TentacoolPicBackSW)

	dw 0, TentacoolPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_DITZ NATURE_CAUTIOUS
;@ pal_battle   PAL_CORALMON
;@ pal_altbattle PAL_KELPMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo         EVOLVE_LEVEL, 30, TENTACRUEL
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       7, POISON_STING
;@ learn       13, SUPER_SOAK
;@ learn       17, SUPERSONIC
;@ learn       23, ACID
;@ learn       29, POWER_BIND
;@ learn       33, WATER_PULSE
;@ learn       39, CONFUSE_RAY
;@ learn       43, VENOM_LASH
;@ learn       49, BARRIER
;@ learn       53, SOULSTEALER
;@ learn       59, HYDRO_PUMP
