	db DEX_KAKUNA ; pokedex id

	db  45,  25,  50,  35,  25
	;   hp  atk  def  spd  spc

	db BUG, POISON ; type
	db 120 ; catch rate
	db 85 ; base exp

	INCBIN "gfx/pokemon/front/kakuna.pic", 0, 1 ; sprite dimensions
	dw KakunaPicFront, KakunaPicBackSW

	db POISON_STING, STRING_SHOT, HARDEN, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	HONE_EDGE,\
	DISABLE,\
	SWORDS_DANCE,\
	SHADOW_GAME,\
	TOXIC,\
	DOUBLE_EDGE,\
	MUD_BOMB,\
	BULK_UP,\
	REFLECT,\
	ILL_WIND,\
	BARRIER,\
	SUBSTITUTE,\
	ADAPTATION,\
	PIN_MISSILE,\
	CLAY_ARMOR,\
	ROCK_ON,\
	CUT
	; end

	db BANK(KakunaPicFront)
	db 0
	db BANK(KakunaPicBack)
	db BANK(KakunaPicBackSW)

	dw 0, KakunaPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_STOLID NATURE_NONE
;@ pal_battle   PAL_SAFFRON
;@ pal_altbattle PAL_BROWNMON2
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo         EVOLVE_LEVEL, 10, BEEDRILL
;@ evo_move    PIN_MISSILE
;@ evo_react   "It clamps shut" "with a dry rattle."
;@ evo_react   "Its shell stiffens" "into armor."
;@ evo_react   "It hangs still," "biding its time."
;@ evo_react   "A faint glow" "seals it tight."
;@ learn       7, HARDEN
;@ learn       7, ACID
;@ learn       15, CRYSTALLIZE
