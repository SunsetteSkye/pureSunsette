	db DEX_TENTACRUEL ; pokedex id

	db  80,  70,  65, 100, 120
	;   hp  atk  def  spd  spc

	db WATER, POISON ; type
	db 60 ; catch rate
	db 205 ; base exp

	INCBIN "gfx/pokemon/front/tentacruel.pic", 0, 1 ; sprite dimensions
	dw TentacruelPicFront, TentacruelPicBackSW

	db ACID, BUBBLE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	ADAPTATION,\
	PIN_MISSILE,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AQUA_RING,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
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

	db BANK(TentacruelPicFront)
	db BANK(TentacruelPicFrontAlt)
	db BANK(TentacruelPicBack)
	db BANK(TentacruelPicBackSW)

	dw TentacruelPicFrontAlt, TentacruelPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CRUEL NATURE_CAUTIOUS
;@ pal_battle   PAL_CORALMON
;@ pal_altbattle PAL_KELPMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   "Its tendrils flare" "out all at once!"
;@ evo_react   "Its crests glow" "an eerie red!"
;@ evo_react   "Tendrils lash out" "in every way!"
;@ evo_react   "It pulses bright," "jellied and vast!"
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
