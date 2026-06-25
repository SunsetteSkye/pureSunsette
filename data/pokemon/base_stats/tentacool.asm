	db DEX_TENTACOOL ; pokedex id

	db  40,  40,  35,  70, 100
	;   hp  atk  def  spd  spc

	db WATER, POISON ; type
	db 190 ; catch rate
	db 105 ; base exp

	INCBIN "gfx/pokemon/front/tentacool.pic", 0, 1 ; sprite dimensions
	dw TentacoolPicFront, TentacoolPicBackSW

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
;@ evo_move    VENOM_LASH
;@ evo_react   NONE
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
