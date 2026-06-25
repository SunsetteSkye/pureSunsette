	db DEX_MISSINGNO ; pokedex id

	db  255, 150, 150,  5,  5
	;   hp  atk  def  spd  spc

	db GHOST, NORMAL ; type
	db 3 ; catch rate
	db 255 ; base exp

	INCBIN "gfx/pokemon/front/missingno.pic", 0, 1 ; sprite dimensions
	dw MissingnoPicFront, MissingnoPicBackSW

	db BRAVE_BIRD, SUPER_SOAK, SUPER_SOAK, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	; Sunsette: MISSINGNO learns EVERY TM (all 65) + all 5 HMs, listed in TM number order.
	tmhm \
	HONE_EDGE,\
	DISABLE,\
	SWORDS_DANCE,\
	AURORA_MIST,\
	SHADOW_GAME,\
	TOXIC,\
	SLUDGE_BOMB,\
	BODY_SLAM,\
	QUICK_ATTACK,\
	DOUBLE_EDGE,\
	WATER_PULSE,\
	SUPER_SOAK,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	ZAPPERCUT,\
	FROST_FIST,\
	BLAZE_HAMMER,\
	SEISMIC_TOSS,\
	GIGA_DRAIN,\
	MEGA_DRAIN,\
	SOLARBEAM,\
	WYRM_WRATH,\
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
	MUD_BOMB,\
	DIG,\
	PSYCHIC_M,\
	FINISHER,\
	DEMOLISH,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	HEAT_RUSH,\
	SUPERNOVA,\
	FLAMETHROWER,\
	FIRE_BLAST,\
	ILL_WIND,\
	SHADOW_BALL,\
	SHADOW_BOX,\
	BARRIER,\
	BRAVE_BIRD,\
	ENERGY_FLUX,\
	THUNDER_WAVE,\
	SKITTERMIND,\
	METEOR_SWEEP,\
	ROCK_SLIDE,\
	OROCLASM,\
	SUBSTITUTE,\
	RIPTIDE,\
	AQUA_RING,\
	RAZOR_LEAF,\
	ADAPTATION,\
	CALM_MIND,\
	VOID_MIND,\
	PSYCHO_SHIFT,\
	LOVELY_KISS,\
	ROOST,\
	LEAP_ATTACK,\
	PIN_MISSILE,\
	LEECH_LIFE,\
	TEMPEST,\
	CLAY_ARMOR,\
	ROCK_ON,\
	CUT,\
	FLY,\
	SURF,\
	STRENGTH,\
	FLASH
	; end


	db BANK(MissingnoPicFront)
	db 0
	db BANK(MissingnoPicBack)
	db BANK(MissingnoPicBackSW)

	dw 0, MissingnoPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_DITZ NATURE_NONE
;@ pal_battle   PAL_MEWMON
;@ pal_altbattle PAL_MEWMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ tutor       EXPLOSION
;@ tutor       TRI_ATTACK
;@ tutor       SOULSTEALER
;@ tutor       PAY_DAY
;@ tutor       TELEPORT
;@ tutor       SOFTBOILED
;@ tutor       CLOBBERCLOCK
;@ tutor       PISTON_KICK
;@ tutor       HURRICANE
;@ tutor       METEOR_DRIVE
;@ tutor       SWIFT
;@ tutor       EGG_BOMB
;@ tutor       SCREECH
