	db DEX_VICTREEBEL ; pokedex id

	db  80, 105,  85,  50, 100
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 191 ; base exp

	INCBIN "gfx/pokemon/front/victreebel.pic", 0, 1 ; sprite dimensions
	dw VictreebelPicFront, VictreebelPicBackSW

	db VINE_WHIP, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	MUD_BOMB,\
	PIN_MISSILE,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AQUA_RING,\
	HYPER_BEAM,\
	CALM_MIND,\
	BARRIER,\
	ADAPTATION,\
	SOLARBEAM,\ 
	WYRM_WRATH,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	CUT,\
	FLASH
	; end

	db BANK(VictreebelPicFront)
	db 0
	db BANK(VictreebelPicBack)
	db BANK(VictreebelPicBackSW)

	dw 0, VictreebelPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CRUEL NATURE_GLUTTON
;@ pal_battle   PAL_GREENBAR
;@ pal_altbattle PAL_AMBERMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   "A sweet, heavy" "scent oozes out."
;@ evo_react   "It yawns wide," "luring with scent!"
;@ evo_react   "Sweet nectar pools" "at its lip!"
;@ evo_react   "Its vine coils," "ready to snatch!"
;@ learn       13, POISONPOWDER
;@ learn       16, ACID
;@ learn       19, MEGA_DRAIN
;@ learn       22, STUN_SPORE
;@ learn       25, POWER_BIND
;@ learn       28, RAZOR_LEAF
;@ learn       34, SLEEP_POWDER
;@ learn       42, VENOM_LASH
;@ learn       48, EGG_BOMB
;@ learn       54, LEECH_SEED
;@ learn       58, ADAPTATION
