; Sunsette: has a variant form -> base_stats/winter_dragonair.asm (Winter Dragonair).
	db DEX_DRAGONAIR ; pokedex id

	db  61,  84,  65,  70,  70
	;   hp  atk  def  spd  spc

	db DRAGON, DRAGON ; type
	db 45 ; catch rate
	db 144 ; base exp

	INCBIN "gfx/pokemon/front/dragonair.pic", 0, 1 ; sprite dimensions
	dw DragonairPicFront, DragonairPicBackSW

	db WRAP, LEER, BELLOW, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	LEAP_ATTACK,\
	ADAPTATION,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	ICE_BEAM,\
	BLIZZARD,\
	SOLARBEAM,\
	WYRM_WRATH,\
	THUNDERBOLT,\
	THUNDER,\
	RIPTIDE,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	FIRE_BLAST,\
	TEMPEST,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	FLASH
	; end

	db BANK(DragonairPicFront)
	db 0
	db BANK(DragonairPicBack)
	db BANK(DragonairPicBackSW)

	dw 0, DragonairPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_WISE NATURE_GENTLE
;@ pal_battle   PAL_CYANMON
;@ pal_altbattle PAL_BLUSHMON
;@ pal_icon     PAL_ICON_18
;@ pal_alticon  PAL_ICON_79
;@ evo         EVOLVE_LEVEL, 46, DRAGONITE
;@ evo_move    NO_MOVE
;@ evo_react   "The air shimmers" "as it coils up."
;@ evo_react   "It glides up in a" "graceful loop!"
;@ evo_react   "Its orbs glow" "with soft light."
;@ evo_react   "It twirls aloft," "mist trailing!"
;@ tutor       METEOR_DRIVE
