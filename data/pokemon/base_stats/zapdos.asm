	db DEX_ZAPDOS ; pokedex id

	db  90,  90,  85, 100, 125
	;   hp  atk  def  spd  spc

	db ELECTRIC, FLYING ; type
	db 25 ; catch rate
	db 216 ; base exp

	INCBIN "gfx/pokemon/front/zapdos.pic", 0, 1 ; sprite dimensions
	dw ZapdosPicFront, ZapdosPicBackSW

	db THUNDERBOLT, FLY, LIGHT_SCREEN, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	LEAP_ATTACK,\
	ROOST,\
	PIN_MISSILE,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	HYPER_BEAM,\
	CALM_MIND,\
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	TEMPEST,\
	BRAVE_BIRD,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	SKITTERMIND,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	FLASH
	; end


	db BANK(ZapdosPicFront)
	db BANK(ZapdosPicFrontAlt)
	db BANK(ZapdosPicBack)
	db BANK(ZapdosPicBackSW)

	dw ZapdosPicFrontAlt, ZapdosPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_SCRAPPY NATURE_ARROGANT
;@ pal_battle   PAL_GAMEFREAK
;@ pal_altbattle PAL_THUNDERMON
;@ pal_icon     PAL_ICON_77
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       51, AIR_DRILL
;@ learn       55, BLOOD_RUSH
;@ learn       60, THUNDER
;@ learn       65, AGILITY
;@ learn       70, STORM_DRILL
;@ tutor       TRI_ATTACK
;@ tutor       TELEPORT
;@ tutor       HURRICANE
;@ tutor       SWIFT
;@ tutor       EGG_BOMB
