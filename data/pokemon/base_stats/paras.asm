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
	HYPER_BEAM,\
	GIGA_DRAIN,\
	MEGA_DRAIN,\
	EARTHQUAKE,\
	MUD_BOMB,\
	DIG,\
	PSYCHIC_M,\
	DEMOLISH,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	ILL_WIND,\
	SHADOW_BALL,\
	BARRIER,\
	SKITTERMIND,\
	ROCK_SLIDE,\
	OROCLASM,\
	SUBSTITUTE,\
	AQUA_RING,\
	ADAPTATION,\
	CALM_MIND,\
	VOID_MIND,\
	PSYCHO_SHIFT,\
	PIN_MISSILE,\
	LEECH_LIFE,\
	CLAY_ARMOR,\
	ROCK_ON,\
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
;@ evo_move    PHANTASM
;@ evo_react   NONE
;@ learn       7, STUN_SPORE
;@ learn       11, LEECH_LIFE
;@ learn       15, MEGA_DRAIN
;@ learn       20, SLASH
;@ learn       26, SPORE
;@ learn       31, UNDERBUG
;@ learn       37, HONE_EDGE
;@ learn       43, SOULSTEALER
;@ learn       49, CRABHAMMER
;@ learn       56, EXTERMINATE
;@ tutor       SOULSTEALER
;@ tutor       METEOR_DRIVE
;@ tutor       EGG_BOMB
;@ tutor       SCREECH
