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
	HONE_EDGE,\
	DISABLE,\
	SWORDS_DANCE,\
	AURORA_MIST,\
	SHADOW_GAME,\
	TOXIC,\
	SLUDGE_BOMB,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	SEISMIC_TOSS,\
	GIGA_DRAIN,\
	MEGA_DRAIN,\
	SOLARBEAM,\
	PSYCHIC_M,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	ILL_WIND,\
	SHADOW_BALL,\
	BARRIER,\
	ENERGY_FLUX,\
	SKITTERMIND,\
	SUBSTITUTE,\
	RAZOR_LEAF,\
	ADAPTATION,\
	CALM_MIND,\
	VOID_MIND,\
	PSYCHO_SHIFT,\
	ROOST,\
	LEAP_ATTACK,\
	PIN_MISSILE,\
	LEECH_LIFE,\
	TEMPEST,\
	ROCK_ON,\
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
;@ learn       7, POISONPOWDER
;@ learn       10, POISON_FANG
;@ learn       14, STUN_SPORE
;@ learn       18, PSYBEAM
;@ learn       22, LEECH_LIFE
;@ learn       26, SLEEP_POWDER
;@ learn       31, AGILITY
;@ learn       36, SLUDGE_BOMB
;@ learn       42, BUG_OFF
;@ learn       48, PSYCHIC_M
;@ learn       54, HURRICANE
;@ tutor       SOULSTEALER
;@ tutor       TELEPORT
;@ tutor       HURRICANE
;@ tutor       SWIFT
;@ tutor       EGG_BOMB
