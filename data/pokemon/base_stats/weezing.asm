; Sunsette: has a variant form -> base_stats/floating_weezing.asm (Floating Weezing).
	db DEX_WEEZING ; pokedex id

	db  85,  90, 120,  60,  85
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 70 ; catch rate
	db 173 ; base exp

	INCBIN "gfx/pokemon/front/weezing.pic", 0, 1 ; sprite dimensions
	dw WeezingPicFront, WeezingPicBackSW

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
	HYPER_BEAM,\
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

	db BANK(WeezingPicFront)
	db 0
	db BANK(WeezingPicBack)
	db BANK(WeezingPicBackSW)

	dw 0, WeezingPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_LAZY NATURE_PLAYFUL
;@ pal_battle   PAL_SMOGMON
;@ pal_altbattle PAL_OLIVEMON_REV
;@ pal_icon     PAL_ICON_53
;@ pal_alticon  PAL_ICON_54
;@ evo_move    NO_MOVE
;@ evo_react   "Smells of melting" "plastic. Ugh!"
;@ evo_react   "It puffs out a" "cloud of gas!"
;@ evo_react   "Both heads belch" "at the same time!"
;@ evo_react   "It floats up," "leaking fumes!"
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
