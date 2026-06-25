	db DEX_CHARMELEON ; pokedex id

	db  58,  74,  58,  80,  75
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 142 ; base exp

	INCBIN "gfx/pokemon/front/charmeleon.pic", 0, 1 ; sprite dimensions
	dw CharmeleonPicFront, CharmeleonPicBackSW

	db SCRATCH, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	tmhm \
	HONE_EDGE,\
	DISABLE,\
	SWORDS_DANCE,\
	SHADOW_GAME,\
	TOXIC,\
	SLUDGE_BOMB,\
	BODY_SLAM,\
	QUICK_ATTACK,\
	DOUBLE_EDGE,\
	ZAPPERCUT,\
	BLAZE_HAMMER,\
	SEISMIC_TOSS,\
	SOLARBEAM,\
	WYRM_WRATH,\
	MUD_BOMB,\
	DIG,\
	FINISHER,\
	DEMOLISH,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	HEAT_RUSH,\
	SUPERNOVA,\
	FLAMETHROWER,\
	FIRE_BLAST,\
	SHADOW_BOX,\
	BARRIER,\
	METEOR_SWEEP,\
	ROCK_SLIDE,\
	OROCLASM,\
	SUBSTITUTE,\
	LEAP_ATTACK,\
	TEMPEST,\
	ROCK_ON,\
	CUT,\
	STRENGTH,\
	FLASH
	; end

	db BANK(CharmeleonPicFront)
	db 0
	db BANK(CharmeleonPicBack)
	db BANK(CharmeleonPicBackSW)

	dw 0, CharmeleonPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_RAGE NATURE_CRUEL
;@ pal_battle   PAL_EMBERMON
;@ pal_altbattle PAL_CHARMELEONALT
;@ pal_icon     PAL_ICON_04
;@ pal_alticon  PAL_CHARMELEONALTICON
;@ evo         EVOLVE_LEVEL, 36, CHARIZARD
;@ evo_move    WYRM_WRATH
;@ evo_react   "It flips into" "a fiery charge!"
;@ evo_react   "Its claws flash," "ready to slash!"
;@ evo_react   "Smoke curls up" "from its nostrils!"
;@ evo_react   "It bares fangs" "with a snarl!"
;@ learn       6, SMOKESCREEN
;@ learn       9, EMBER
;@ learn       12, SEISMIC_TOSS
;@ learn       15, BELLOW
;@ learn       18, HEAT_RUSH
;@ learn       26, SLASH
;@ learn       30, SHORYUKEN
;@ learn       38, FLAMETHROWER
;@ learn       46, HYPER_BEAM
;@ learn       54, INDIGNATION
;@ learn       60, FIRE_BLAST
;@ tutor       CLOBBERCLOCK
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
;@ tutor       EGG_BOMB
