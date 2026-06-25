	db DEX_DRAGONITE ; pokedex id

	db  91, 134,  95,  80, 100
	;   hp  atk  def  spd  spc

	db DRAGON, FLYING ; type
	db 45 ; catch rate
	db 218 ; base exp

	INCBIN "gfx/pokemon/front/dragonite.pic", 0, 1 ; sprite dimensions
	dw DragonitePicFront, DragonitePicBackSW

	db WRAP, LEER, BELLOW, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	LEAP_ATTACK,\
	ADAPTATION,\
	ROOST,\
	BLAZE_HAMMER,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	SOLARBEAM,\
	WYRM_WRATH,\
	THUNDERBOLT,\
	THUNDER,\
	RIPTIDE,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	FIRE_BLAST,\
	TEMPEST,\
	DEMOLISH,\
	BRAVE_BIRD,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	SURF,\
	STRENGTH,\
	FLASH
	; end

	db BANK(DragonitePicFront)
	db 0
	db BANK(DragonitePicBack)
	db BANK(DragonitePicBackSW)

	dw 0, DragonitePicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CONSIDERATE NATURE_WISE
;@ pal_battle   PAL_SAFFRON
;@ pal_altbattle PAL_LEAFMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   "It spreads broad" "wings, eyes warm."
;@ evo_react   "It soars up, then" "circles back soft."
;@ evo_react   "It nods to you" "with a kind hum."
;@ evo_react   "It beats its wings" "and rises high!"
;@ learn       25, RIPTIDE
;@ learn       29, AURORA_MIST
;@ learn       33, TEMPEST
;@ learn       38, BLITZ_STRIKE
;@ learn       46, AGILITY
;@ learn       47, HURRICANE
;@ learn       52, HYPER_BEAM
;@ learn       60, INDIGNATION
;@ tutor       CLOBBERCLOCK
;@ tutor       PISTON_KICK
;@ tutor       HURRICANE
;@ tutor       METEOR_DRIVE
