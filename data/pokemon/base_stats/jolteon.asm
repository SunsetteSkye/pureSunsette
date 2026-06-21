	db DEX_JOLTEON ; pokedex id

	db  65,  65,  60, 130, 110
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 65 ; catch rate
	db 197 ; base exp

	INCBIN "gfx/pokemon/front/jolteon.pic", 0, 1 ; sprite dimensions
	dw JolteonPicFront, JolteonPicBackSW

	db TACKLE, SAND_ATTACK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	MUD_BOMB,\
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	HYPER_BEAM,\
	CALM_MIND,\
	LOW_KICK,\
	METEOR_SWEEP,\
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	DIG,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	DEMOLISH,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH,\
	FLASH
	; end

	db BANK(JolteonPicFront)
	db 0
	db BANK(JolteonPicBack)
	db BANK(JolteonPicBackSW)

	dw 0, JolteonPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_HYPER NATURE_CAUTIOUS
;@ pal_battle   PAL_SAFFRON
;@ pal_altbattle PAL_GRANITEMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_move    THUNDERSHOCK
;@ evo_react   "Its fur stands up," "crackling wildly!"
;@ evo_react   "It darts off in" "a flash of sparks!"
;@ evo_react   "Spikes bristle," "snapping loud!"
;@ evo_react   "It bolts past you," "a streak of light!"
;@ learn       6, HONE_EDGE
;@ learn       10, BITE
;@ learn       14, BELLOW
;@ learn       18, SWIFT
;@ learn       21, THUNDER_WAVE
;@ learn       25, AGILITY
;@ learn       28, THUNDERBOLT
;@ learn       32, TRI_ATTACK
;@ learn       38, PIN_MISSILE
;@ learn       44, PHANTASM
;@ learn       49, THUNDER
