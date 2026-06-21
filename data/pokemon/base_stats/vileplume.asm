	db DEX_VILEPLUME ; pokedex id

	db  105, 80,  85,  50, 115
	;   hp  atk  def  spd  spc

	db GHOST, POISON ; type
	db 45 ; catch rate
	db 184 ; base exp

	INCBIN "gfx/pokemon/front/vileplume.pic", 0, 1 ; sprite dimensions
	dw VileplumePicFront, VileplumePicBackSW

	db ABSORB, TACKLE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	MUD_BOMB,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	CALM_MIND,\
	BARRIER,\
	ADAPTATION,\
	SOLARBEAM,\ 
	PSYCHIC_M,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	DEMOLISH,\
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
	CUT,\
	FLASH
	; end

	db BANK(VileplumePicFront)
	db 0
	db BANK(VileplumePicBack)
	db BANK(VileplumePicBackSW)

	dw 0, VileplumePicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CRUEL NATURE_ARROGANT
;@ pal_battle   PAL_REDPURPLEMON
;@ pal_altbattle PAL_0F
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   "The smell's worse" "now! How?!"
;@ evo_react   "The funk knocks" "you back a step!"
;@ evo_react   "You cover your" "nose. Too late!"
;@ evo_react   "That stench could" "drop a SNORLAX!"
;@ learn       7, POISONPOWDER
;@ learn       11, ACID
;@ learn       15, ADAPTATION
;@ learn       17, STUN_SPORE
;@ learn       19, MEGA_DRAIN
;@ learn       23, PHANTASM
;@ learn       28, SLEEP_POWDER
;@ learn       36, SLUDGE_BOMB
;@ learn       45, TOXIC
;@ learn       50, SENBONZAKURA
;@ learn       57, EMETIC_PURGE
