	db DEX_KANGASKHAN ; pokedex id

	db 125,  95,  80,  80,  70
	;   hp  atk  def  spd  spc

	db NORMAL, FIGHTING ; type
	db 65 ; catch rate
	db 175 ; base exp

	INCBIN "gfx/pokemon/front/kangaskhan.pic", 0, 1 ; sprite dimensions
	dw KangaskhanPicFront, KangaskhanPicBackSW

	db SCRATCH, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	LEAP_ATTACK,\
	ADAPTATION,\
	FROST_FIST,\
	MUD_BOMB,\
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
	SOLARBEAM,\
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
	RIPTIDE,\
	DIG,\
	SWORDS_DANCE,\
	BULK_UP,\
	SHADOW_BALL,\
	FIRE_BLAST,\
	DEMOLISH,\
	VOID_MIND,\
	ROCK_SLIDE,\
	ROCK_ON,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
	CUT,\
	SURF,\
	STRENGTH
	; end


	db BANK(KangaskhanPicFront)
	db 0
	db BANK(KangaskhanPicBack)
	db BANK(KangaskhanPicBackSW)

	dw 0, KangaskhanPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CONSIDERATE NATURE_RAGE
;@ pal_battle   PAL_BROWNMON2
;@ pal_altbattle PAL_GRANITEMON
;@ pal_icon     PAL_ICON_10
;@ pal_alticon  PAL_ICON_57
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       18, BITE
;@ learn       23, STOMP
;@ learn       27, DOUBLE_KICK
;@ learn       30, MACH_PUNCH
;@ learn       36, REST
;@ learn       39, DOUBLE_EDGE
;@ learn       41, FOCUS_ENERGY
;@ learn       44, CLOBBERCLOCK
;@ learn       52, SHORYUKEN
;@ learn       56, COMBOBREAKER
;@ tutor       CLOBBERCLOCK
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
