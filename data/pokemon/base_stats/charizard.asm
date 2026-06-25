	db DEX_CHARIZARD ; pokedex id

	db  78,  94,  83, 100,  90
	;   hp  atk  def  spd  spc

	db FIRE, DRAGON ; type
	db 45 ; catch rate
	db 209 ; base exp

	INCBIN "gfx/pokemon/front/charizard.pic", 0, 1 ; sprite dimensions
	dw CharizardPicFront, CharizardPicBackSW

	db SCRATCH, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
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
	QUICK_ATTACK,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	ZAPPERCUT,\
	BLAZE_HAMMER,\
	SEISMIC_TOSS,\
	SOLARBEAM,\
	WYRM_WRATH,\
	EARTHQUAKE,\
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
	BRAVE_BIRD,\
	METEOR_SWEEP,\
	ROCK_SLIDE,\
	OROCLASM,\
	SUBSTITUTE,\
	ADAPTATION,\
	ROOST,\
	LEAP_ATTACK,\
	TEMPEST,\
	ROCK_ON,\
	CUT,\
	FLY,\
	STRENGTH,\
	FLASH
	; end

	db BANK(CharizardPicFront)
	db 0
	db BANK(CharizardPicBack)
	db BANK(CharizardPicBackSW)

	dw 0, CharizardPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_ARROGANT NATURE_RAGE
;@ pal_battle   PAL_CHARIZARDMON
;@ pal_altbattle PAL_CHARIZARDALT
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   "It spreads its" "wings with a roar!"
;@ evo_react   "It rockets up," "trailing flame!"
;@ evo_react   "Its tail flame" "blazes higher!"
;@ evo_react   "It rears back," "spitting fire!"
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
