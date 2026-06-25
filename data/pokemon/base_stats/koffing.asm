	db DEX_KOFFING ; pokedex id

	db  40,  65,  95,  35,  60
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 190 ; catch rate
	db 114 ; base exp

	INCBIN "gfx/pokemon/front/koffing.pic", 0, 1 ; sprite dimensions
	dw KoffingPicFront, KoffingPicBackSW

	db TACKLE, SMOG, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ADAPTATION,\
	MUD_BOMB,\
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	CALM_MIND,\
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	FIRE_BLAST,\
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	FLASH
	; end


	db BANK(KoffingPicFront)
	db BANK(KoffingPicFrontAlt)
	db BANK(KoffingPicBack)
	db BANK(KoffingPicBackSW)

	dw KoffingPicFrontAlt, KoffingPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_LAZY NATURE_PLAYFUL
;@ pal_battle   PAL_SMOGMON
;@ pal_altbattle PAL_OLIVEMON_REV
;@ pal_icon     PAL_ICON_53
;@ pal_alticon  PAL_ICON_54
;@ evo         EVOLVE_LEVEL, 27, WEEZING
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       10, HEADBUTT
;@ learn       14, SMOKESCREEN
;@ learn       18, ACID
;@ learn       21, DISABLE
;@ learn       25, BODY_SLAM
;@ learn       29, EMETIC_PURGE
;@ learn       33, TOXIC
;@ learn       38, EGG_BOMB
;@ learn       43, ADAPTATION
;@ learn       47, SLUDGE_BOMB
;@ learn       52, EXPLOSION
;@ tutor       EXPLOSION
;@ tutor       HURRICANE
;@ tutor       METEOR_DRIVE
;@ tutor       EGG_BOMB
;@ tutor       SCREECH
