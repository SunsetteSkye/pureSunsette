	db DEX_VENOMOTH ; pokedex id

	db  70,  85,  70,  90,  90
	;   hp  atk  def  spd  spc

	db BUG, POISON ; type
	db 75 ; catch rate
	db 138 ; base exp

	INCBIN "gfx/pokemon/front/venomoth.pic", 0, 1 ; sprite dimensions
	dw VenomothPicFront, VenomothPicBackSW

	db TACKLE, DISABLE, POISON_STING, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ROCK_ON,\
	ADAPTATION,\
	ROOST,\
	PIN_MISSILE,\
	TOXIC,\
	HONE_EDGE,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	CALM_MIND,\
	BARRIER,\
	SOLARBEAM,\ 
	PSYCHIC_M,\
	MEGA_DRAIN,\
	MIRAGE,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	LIGHT_SCREEN,\
	SKITTERMIND,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
	CUT,\
	FLY,\
	FLASH
	; end

	db BANK(VenomothPicFront)
	db 0
	db BANK(VenomothPicBack)
	db BANK(VenomothPicBackSW)

	dw 0, VenomothPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_DITZ NATURE_CRUEL
;@ pal_battle   PAL_GRAYMON
;@ pal_altbattle PAL_SOFTVIOSCAR
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   "It beats its wings" "scattering dust!"
;@ evo_react   "It flutters up" "in a dusty cloud!"
;@ evo_react   "Its wings shimmer" "with toxic powder!"
;@ evo_react   "It circles once," "scales drift down!"
;@ learn       7, ABSORB
;@ learn       10, POISONPOWDER
;@ learn       13, PIN_MISSILE
;@ learn       15, STUN_SPORE
;@ learn       16, SLEEP_POWDER
;@ learn       18, LEECH_LIFE
;@ learn       22, PSYBEAM
;@ learn       27, WING_ATTACK
;@ learn       30, AGILITY
;@ learn       33, SLUDGE_BOMB
;@ learn       37, SOULSTEALER
;@ learn       37, SLEEP_POWDER
;@ learn       42, PSYCHIC_M
;@ learn       53, HURRICANE
