	db DEX_TENTACRUEL ; pokedex id

	db  80,  70,  65, 100, 120
	;   hp  atk  def  spd  spc

	db WATER, POISON ; type
	db 60 ; catch rate
	db 205 ; base exp

	INCBIN "gfx/pokemon/front/tentacruel.pic", 0, 1 ; sprite dimensions
	dw TentacruelPicFront, TentacruelPicBackSW

	db POISON_STING, BUBBLE, NO_MOVE, NO_MOVE ; level 1 learnset
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
	HYPER_BEAM,\
	WATER_PULSE,\
	SUPER_SOAK,\
	ZAPPERCUT,\
	SEISMIC_TOSS,\
	GIGA_DRAIN,\
	MEGA_DRAIN,\
	SOLARBEAM,\
	THUNDERBOLT,\
	PSYCHIC_M,\
	REFLECT,\
	LIGHT_SCREEN,\
	ILL_WIND,\
	SHADOW_BALL,\
	BARRIER,\
	ENERGY_FLUX,\
	THUNDER_WAVE,\
	SKITTERMIND,\
	SUBSTITUTE,\
	RIPTIDE,\
	AQUA_RING,\
	ADAPTATION,\
	CALM_MIND,\
	PSYCHO_SHIFT,\
	PIN_MISSILE,\
	LEECH_LIFE,\
	TEMPEST,\
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
;@ learn       7, SUPER_SOAK
;@ learn       11, SUPERSONIC
;@ learn       15, ACID
;@ learn       20, POWER_BIND
;@ learn       26, WATER_PULSE
;@ learn       32, STUN_SPORE
;@ learn       38, POISON_FANG
;@ learn       44, SURF
;@ learn       50, BARRIER
;@ learn       57, HYDRO_PUMP
;@ tutor       TELEPORT
;@ tutor       EGG_BOMB
;@ tutor       SCREECH
