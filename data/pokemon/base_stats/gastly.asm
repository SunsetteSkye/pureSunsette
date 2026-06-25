	db DEX_GASTLY ; pokedex id

	db  30,  35,  30,  80, 100
	;   hp  atk  def  spd  spc

	db GHOST, FLOATING ; type
	db 190 ; catch rate
	db 95 ; base exp

	INCBIN "gfx/pokemon/front/gastly.pic", 0, 1 ; sprite dimensions
	dw GastlyPicFront, GastlyPicBackSW

	db LICK, TOXIC, GUST, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	THUNDERBOLT,\
	THUNDER,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	LOVELY_KISS,\
	SKITTERMIND,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	FLASH
	; end


	db BANK(GastlyPicFront)
	db 0
	db BANK(GastlyPicBack)
	db BANK(GastlyPicBackSW)

	dw 0, GastlyPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CRUEL NATURE_PLAYFUL
;@ pal_battle   PAL_PURPLEMON
;@ pal_altbattle PAL_0F
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo         EVOLVE_LEVEL, 25, HAUNTER
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       21, PHANTASM
;@ learn       24, HYPNOSIS
;@ learn       29, EMETIC_PURGE
;@ learn       33, CONFUSE_RAY
;@ learn       41, MEGA_DRAIN
;@ learn       46, DOUBLE_TEAM
;@ learn       51, MAXIMIZE
;@ learn       57, SOULSTEALER
;@ tutor       EXPLOSION
;@ tutor       SOULSTEALER
;@ tutor       TELEPORT
;@ tutor       EGG_BOMB
;@ tutor       SCREECH
