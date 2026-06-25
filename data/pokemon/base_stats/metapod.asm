	db DEX_METAPOD ; pokedex id

	db  50,  20,  55,  30,  25
	;   hp  atk  def  spd  spc

	db BUG, BUG ; type
	db 120 ; catch rate
	db 85 ; base exp

	INCBIN "gfx/pokemon/front/metapod.pic", 0, 1 ; sprite dimensions
	dw MetapodPicFront, MetapodPicBackSW

	db HARDEN, TACKLE, STRING_SHOT, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	DISABLE,\
	SHADOW_GAME,\
	TOXIC,\
	DOUBLE_EDGE,\
	GIGA_DRAIN,\
	MEGA_DRAIN,\
	REFLECT,\
	LIGHT_SCREEN,\
	BARRIER,\
	SUBSTITUTE,\
	ADAPTATION,\
	CUT,\
	FLASH
	; end

	db BANK(MetapodPicFront)
	db 0
	db BANK(MetapodPicBack)
	db BANK(MetapodPicBackSW)

	dw 0, MetapodPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_STOLID NATURE_NONE
;@ pal_battle   PAL_LEAFMON
;@ pal_altbattle PAL_IVORYMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo         EVOLVE_LEVEL, 10, BUTTERFREE
;@ evo_move    CONFUSION
;@ evo_react   "It stiffens, then" "locks up tight!"
;@ evo_react   "Its shell hardens" "with a slow creak."
;@ evo_react   "It rocks once," "then goes still."
;@ evo_react   "A green sheen" "crawls over it."
;@ learn       7, HARDEN
;@ learn       7, CALM_MIND
;@ learn       15, CRYSTALLIZE
