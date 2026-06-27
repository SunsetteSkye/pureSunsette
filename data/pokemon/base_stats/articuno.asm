	db DEX_ARTICUNO ; pokedex id

	db  90,  85, 100,  85, 125
	;   hp  atk  def  spd  spc

	db ICE, FLYING ; type
	db 25 ; catch rate
	db 215 ; base exp

	INCBIN "gfx/pokemon/front/articuno.pic", 0, 1 ; sprite dimensions
	dw ArticunoPicFront, ArticunoPicBackSW

	db WING_ATTACK, ICE_BEAM, AURORA_MIST, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	LEAP_ATTACK,\
	ROOST,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	CALM_MIND,\
	BARRIER,\
	PSYCHIC_M,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	TEMPEST,\
	BRAVE_BIRD,\
	LIGHT_SCREEN,\
	SKITTERMIND,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	FLASH
	; end


	db BANK(ArticunoPicFront)
	db BANK(ArticunoPicFrontAlt)
	db BANK(ArticunoPicBack)
	db BANK(ArticunoPicBackSW)

	dw ArticunoPicFrontAlt, ArticunoPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_STOLID NATURE_CRUEL
;@ pal_battle   PAL_CYANMON
;@ pal_altbattle PAL_BLUEMON
;@ pal_icon     PAL_ICON_18
;@ pal_alticon  PAL_ICON_76
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       51, HURRICANE
;@ learn       55, SHELL_GAME
;@ learn       60, BLIZZARD
;@ learn       65, AGILITY
;@ learn       70, WINTER_GALE
;@ tutor       TRI_ATTACK
;@ tutor       TELEPORT
;@ tutor       HURRICANE
;@ tutor       SWIFT
;@ tutor       EGG_BOMB
