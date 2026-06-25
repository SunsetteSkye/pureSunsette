	db DEX_SNORLAX ; pokedex id

	db 160, 110,  65,  30,  65
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 25 ; catch rate
	db 154 ; base exp

	INCBIN "gfx/pokemon/front/snorlax.pic", 0, 1 ; sprite dimensions
	dw SnorlaxPicFront, SnorlaxPicBackSW

	db BELLOW, CALM_MIND, REST, HEADBUTT  ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	LEAP_ATTACK,\
	ROCK_ON,\
	FROST_FIST,\
	MUD_BOMB,\
	BLAZE_HAMMER,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	CALM_MIND,\
	FINISHER,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	SOLARBEAM,\
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
	RIPTIDE,\
	PSYCHIC_M,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	FIRE_BLAST,\
	DEMOLISH,\
	VOID_MIND,\
	SKITTERMIND,\
	ROCK_SLIDE,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	STRENGTH
	; end


	db BANK(SnorlaxPicFront)
	db 0
	db BANK(SnorlaxPicBack)
	db BANK(SnorlaxPicBackSW)

	dw 0, SnorlaxPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_LAZY NATURE_GLUTTON
;@ pal_battle   PAL_GAMEFREAK
;@ pal_altbattle PAL_BROWNMON2
;@ pal_icon     PAL_ICON_75
;@ pal_alticon  PAL_ICON_10
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       35, BODY_SLAM
;@ learn       41, EMETIC_PURGE
;@ learn       46, ROCK_SLIDE
;@ learn       51, DOUBLE_EDGE
;@ learn       55, PISTON_KICK
;@ learn       59, EXPLOSION
;@ tutor       EXPLOSION
;@ tutor       PAY_DAY
;@ tutor       CLOBBERCLOCK
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
;@ tutor       SCREECH
