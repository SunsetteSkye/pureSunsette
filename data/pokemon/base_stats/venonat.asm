	db DEX_VENONAT ; pokedex id

	db  60,  55,  50,  45,  40
	;   hp  atk  def  spd  spc

	db BUG, POISON ; type
	db 190 ; catch rate
	db 75 ; base exp

	INCBIN "gfx/pokemon/front/venonat.pic", 0, 1 ; sprite dimensions
	dw VenonatPicFront, VenonatPicBackSW

	db TACKLE, DISABLE, POISON_STING, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ROCK_ON,\
	ADAPTATION,\
	PIN_MISSILE,\
	TOXIC,\
	HONE_EDGE,\
	DISABLE,\
	DOUBLE_EDGE,\
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
	FLASH
	; end


	db BANK(VenonatPicFront)
	db 0
	db BANK(VenonatPicBack)
	db BANK(VenonatPicBackSW)

	dw 0, VenonatPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_DITZ NATURE_HYPER
;@ pal_battle   PAL_SOFTVIOSCAR
;@ pal_altbattle PAL_0F
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo         EVOLVE_LEVEL, 23, VENOMOTH
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       7, ABSORB
;@ learn       10, POISONPOWDER
;@ learn       13, PIN_MISSILE
;@ learn       15, STUN_SPORE
;@ learn       16, SLEEP_POWDER
;@ learn       18, LEECH_LIFE
;@ learn       22, PSYBEAM
;@ learn       30, AGILITY
;@ learn       33, SLUDGE_BOMB
;@ learn       37, SOULSTEALER
;@ learn       37, SLEEP_POWDER
;@ learn       42, PSYCHIC_M
