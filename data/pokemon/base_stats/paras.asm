	db DEX_PARAS ; pokedex id

	db  35,  70,  55,  25,  55
	;   hp  atk  def  spd  spc

	db BUG, GRASS ; type
	db 190 ; catch rate
	db 70 ; base exp

	INCBIN "gfx/pokemon/front/paras.pic", 0, 1 ; sprite dimensions
	dw ParasPicFront, ParasPicBackSW

	db SCRATCH, ABSORB, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ROCK_ON,\
	PIN_MISSILE,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	CALM_MIND,\
	BARRIER,\
	ADAPTATION,\
	SOLARBEAM,\ 
	EARTHQUAKE,\
	DIG,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	DEMOLISH,\
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	ROCK_SLIDE,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
	CUT,\
	STRENGTH,\
	FLASH
	; end


	db BANK(ParasPicFront)
	db 0
	db BANK(ParasPicBack)
	db BANK(ParasPicBackSW)

	dw 0, ParasPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_STOLID NATURE_MOROSE
;@ pal_battle   PAL_SANDVIOLET
;@ pal_altbattle PAL_REDMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo         EVOLVE_LEVEL, 24, PARASECT
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       13, STUN_SPORE
;@ learn       15, MEGA_DRAIN
;@ learn       18, UNDERBUG
;@ learn       21, SLASH
;@ learn       25, PHANTASM
;@ learn       28, SPORE
;@ learn       33, LEECH_LIFE
;@ learn       39, CRABHAMMER
;@ learn       44, SOULSTEALER
;@ learn       49, EXTERMINATE
