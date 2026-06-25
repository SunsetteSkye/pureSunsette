	db DEX_MAROWAK ; pokedex id

	db  80,  95, 110,  45,  90
	;   hp  atk  def  spd  spc

	db GROUND, GHOST ; type
	db 75 ; catch rate
	db 124 ; base exp

	INCBIN "gfx/pokemon/front/marowak.pic", 0, 1 ; sprite dimensions
	dw MarowakPicFront, MarowakPicBackSW

	db BONE_CLUB, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ADAPTATION,\
	FROST_FIST,\
	MUD_BOMB,\
	PIN_MISSILE,\
	BLAZE_HAMMER,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	FINISHER,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	EARTHQUAKE,\
	DIG,\
	SWORDS_DANCE,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	FIRE_BLAST,\
	DEMOLISH,\
	VOID_MIND,\
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	ROCK_SLIDE,\
	ROCK_ON,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
	CUT,\
	STRENGTH
	; end

	db BANK(MarowakPicFront)
	db 0
	db BANK(MarowakPicBack)
	db BANK(MarowakPicBackSW)

	dw 0, MarowakPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_RAGE NATURE_MOROSE
;@ pal_battle   PAL_CLAYMON
;@ pal_altbattle PAL_GHOSTMON
;@ pal_icon     PAL_ICON_49
;@ pal_alticon  PAL_ICON_50
;@ evo_move    NO_MOVE
;@ evo_react   "It raises its bone" "with a low wail."
;@ evo_react   "It twirls its bone" "then strikes down!"
;@ evo_react   "It taps its skull" "helm with a clack!"
;@ evo_react   "It hurls the bone" "and snatches it!"
;@ learn       14, FOCUS_ENERGY
;@ learn       18, SCREECH
;@ learn       22, LIGHT_SCREEN
;@ learn       25, PHANTASM
;@ learn       27, HEADBUTT
;@ learn       30, DIG
;@ learn       33, MACH_PUNCH
;@ learn       36, SHADOW_BOX
;@ learn       40, BONEMERANG
;@ learn       45, METEOR_DRIVE
;@ learn       50, COMBOBREAKER
;@ tutor       TELEPORT
;@ tutor       CLOBBERCLOCK
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
;@ tutor       SCREECH
