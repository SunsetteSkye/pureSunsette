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
	HONE_EDGE,\
	DISABLE,\
	SWORDS_DANCE,\
	AURORA_MIST,\
	SHADOW_GAME,\
	TOXIC,\
	SLUDGE_BOMB,\
	DOUBLE_EDGE,\
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
	LEAP_ATTACK,\
	PIN_MISSILE,\
	LEECH_LIFE,\
	TEMPEST,\
	ROCK_ON,\
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
;@ evo_move    WING_ATTACK
;@ evo_react   NONE
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
;@ tutor       SOULSTEALER
;@ tutor       TELEPORT
;@ tutor       SWIFT
;@ tutor       EGG_BOMB
