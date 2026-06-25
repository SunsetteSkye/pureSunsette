	db DEX_FLAREON ; pokedex id

	db  65, 130,  60,  65, 110
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 65 ; catch rate
	db 198 ; base exp

	INCBIN "gfx/pokemon/front/flareon.pic", 0, 1 ; sprite dimensions
	dw FlareonPicFront, FlareonPicBackSW

	db TACKLE, SAND_ATTACK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	LEAP_ATTACK,\
	MUD_BOMB,\
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	CALM_MIND,\
	FINISHER,\
	METEOR_SWEEP,\
	BARRIER,\
	SOLARBEAM,\
	DIG,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	SUPERNOVA,\
	FIRE_BLAST,\
	DEMOLISH,\
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH,\
	FLASH
	; end

	db BANK(FlareonPicFront)
	db 0
	db BANK(FlareonPicBack)
	db BANK(FlareonPicBackSW)

	dw 0, FlareonPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_GENTLE NATURE_SCRAPPY
;@ pal_battle   PAL_REALLY_REDMON
;@ pal_altbattle PAL_REDMON
;@ pal_icon     PAL_ICON_04
;@ pal_alticon  PAL_ICON_03
;@ evo_move    EMBER
;@ evo_react   "A wave of heat" "rolls off its fur."
;@ evo_react   "It shakes out a" "shower of embers!"
;@ evo_react   "Its tail flares" "bright and warm!"
;@ evo_react   "It huffs, a puff" "of smoke puffs up!"
;@ learn       6, HONE_EDGE
;@ learn       10, BITE
;@ learn       14, BELLOW
;@ learn       18, SWIFT
;@ learn       21, BLOOD_RUSH
;@ learn       25, AGILITY
;@ learn       28, FLAMETHROWER
;@ learn       32, TRI_ATTACK
;@ learn       38, PISTON_KICK
;@ learn       44, BLITZ_STRIKE
;@ learn       49, FIRE_BLAST
;@ tutor       PAY_DAY
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
;@ tutor       SWIFT
