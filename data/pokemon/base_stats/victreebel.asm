	db DEX_VICTREEBEL ; pokedex id

	db  80, 105,  85,  50, 100
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 191 ; base exp

	INCBIN "gfx/pokemon/front/victreebel.pic", 0, 1 ; sprite dimensions
	dw VictreebelPicFront, VictreebelPicBackSW

	db VINE_WHIP, POISONPOWDER, ACID, RAZOR_LEAF ; level 1 learnset
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
	SEISMIC_TOSS,\
	GIGA_DRAIN,\
	MEGA_DRAIN,\
	SOLARBEAM,\
	WYRM_WRATH,\
	MUD_BOMB,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	ILL_WIND,\
	SHADOW_BALL,\
	BARRIER,\
	SKITTERMIND,\
	SUBSTITUTE,\
	AQUA_RING,\
	RAZOR_LEAF,\
	ADAPTATION,\
	CALM_MIND,\
	VOID_MIND,\
	PSYCHO_SHIFT,\
	PIN_MISSILE,\
	LEECH_LIFE,\
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
;@ learn       40, POWER_BIND
;@ learn       46, CLAMP
;@ learn       52, VENOM_LASH
;@ learn       58, GIGA_DRAIN
;@ tutor       EXPLOSION
;@ tutor       EGG_BOMB
