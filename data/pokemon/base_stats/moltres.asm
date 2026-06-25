	db DEX_MOLTRES ; pokedex id

	db  90, 100,  90,  90, 125
	;   hp  atk  def  spd  spc

	db FIRE, FLYING ; type
	db 25 ; catch rate
	db 217 ; base exp

	INCBIN "gfx/pokemon/front/moltres.pic", 0, 1 ; sprite dimensions
	dw MoltresPicFront, MoltresPicBackSW

	db WING_ATTACK, FIRE_SPIN, MIRAGE, NO_MOVE ; level 1 learnset
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
	HYPER_BEAM,\
	CALM_MIND,\
	BARRIER,\
	SOLARBEAM,\
	WYRM_WRATH,\
	THUNDERBOLT,\
	THUNDER,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	SUPERNOVA,\
	FIRE_BLAST,\
	TEMPEST,\
	BRAVE_BIRD,\
	LIGHT_SCREEN,\
	SKITTERMIND,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	FLASH
	; end


	db BANK(MoltresPicFront)
	db 0
	db BANK(MoltresPicBack)
	db BANK(MoltresPicBackSW)

	dw 0, MoltresPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_WISE NATURE_ARROGANT
;@ pal_battle   PAL_REDBAR
;@ pal_altbattle PAL_REDPURPLEMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       51, BRAVE_BIRD
;@ learn       55, SOFTBOILED
;@ learn       60, FIRE_BLAST
;@ learn       65, AGILITY
;@ learn       70, PHOENIX_DIVE
;@ tutor       TRI_ATTACK
;@ tutor       TELEPORT
;@ tutor       SOFTBOILED
;@ tutor       HURRICANE
;@ tutor       SWIFT
;@ tutor       EGG_BOMB
