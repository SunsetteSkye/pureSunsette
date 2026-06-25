	db DEX_PORYGON ; pokedex id

	db  65,  80,  70,  40, 120
	;   hp  atk  def  spd  spc

	db NORMAL, GHOST ; type
	db 45 ; catch rate
	db 130 ; base exp

	INCBIN "gfx/pokemon/front/porygon.pic", 0, 1 ; sprite dimensions
	dw PorygonPicFront, PorygonPicBackSW

	db TACKLE, HONE_EDGE, MIRAGE, MOCKINGBIRD ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ROCK_ON,\
	ADAPTATION,\
	PIN_MISSILE,\
	TOXIC,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	BARRIER,\
	SOLARBEAM,\
	THUNDERBOLT,\
	THUNDER,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	REFLECT,\
	ILL_WIND,\
	SHADOW_BALL,\
	FIRE_BLAST,\
	VOID_MIND,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	SKITTERMIND,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	FLASH
	; end


	db BANK(PorygonPicFront)
	db 0
	db BANK(PorygonPicBack)
	db BANK(PorygonPicBackSW)

	dw 0, PorygonPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_STOLID NATURE_DITZ
;@ pal_battle   PAL_FUCHSIA
;@ pal_altbattle PAL_CINNABAR
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       23, ILL_WIND
;@ learn       25, CONVERSION
;@ learn       28, RECOVER
;@ learn       35, TRI_ATTACK
;@ learn       42, PHANTASM
;@ learn       49, AGILITY
;@ learn       56, HYPER_BEAM
;@ tutor       EXPLOSION
;@ tutor       TRI_ATTACK
;@ tutor       TELEPORT
;@ tutor       METEOR_DRIVE
;@ tutor       SWIFT
;@ tutor       SCREECH
