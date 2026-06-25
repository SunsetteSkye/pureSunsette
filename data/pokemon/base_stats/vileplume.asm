	db DEX_VILEPLUME ; pokedex id

	db  75,  80,  85,  50, 100
	;   hp  atk  def  spd  spc

	db GHOST, POISON ; type
	db 45 ; catch rate
	db 184 ; base exp

	INCBIN "gfx/pokemon/front/vileplume.pic", 0, 1 ; sprite dimensions
	dw VileplumePicFront, VileplumePicBackSW

	db ABSORB, TACKLE, POISONPOWDER, SLEEP_POWDER ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	HONE_EDGE,\
	DISABLE,\
	SWORDS_DANCE,\
	SHADOW_GAME,\
	TOXIC,\
	SLUDGE_BOMB,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	WATER_PULSE,\
	SUPER_SOAK,\
	HYPER_BEAM,\
	MEGA_DRAIN,\
	SOLARBEAM,\
	MUD_BOMB,\
	PSYCHIC_M,\
	DEMOLISH,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	ILL_WIND,\
	SHADOW_BALL,\
	SHADOW_BOX,\
	BARRIER,\
	SUBSTITUTE,\
	AQUA_RING,\
	ADAPTATION,\
	CALM_MIND,\
	VOID_MIND,\
	PSYCHO_SHIFT,\
	LEECH_LIFE,\
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
;@ learn       38, SLUDGE_BOMB
;@ learn       46, SHADOW_BALL
;@ learn       54, TOXIC
;@ learn       60, SENBONZAKURA
;@ tutor       SOULSTEALER
;@ tutor       TELEPORT
;@ tutor       SWIFT
