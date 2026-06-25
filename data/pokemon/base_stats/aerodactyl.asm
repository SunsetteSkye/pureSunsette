	db DEX_AERODACTYL ; pokedex id

	db  80, 105,  95, 110,  60
	;   hp  atk  def  spd  spc

	db ROCK, FLYING ; type
	db 45 ; catch rate
	db 202 ; base exp

	INCBIN "gfx/pokemon/front/aerodactyl.pic", 0, 1 ; sprite dimensions
	dw AerodactylPicFront, AerodactylPicBackSW

	db WING_ATTACK, AGILITY, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	LEAP_ATTACK,\
	ADAPTATION,\
	ROOST,\
	PIN_MISSILE,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	HYPER_BEAM,\
	WYRM_WRATH,\
	EARTHQUAKE,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	FIRE_BLAST,\
	TEMPEST,\
	BRAVE_BIRD,\
	SHADOW_GAME,\
	ROCK_SLIDE,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	STRENGTH
	; end


	db BANK(AerodactylPicFront)
	db 0 ; no alt sprite
	db BANK(AerodactylPicBack)
	db BANK(AerodactylPicBackSW)

	dw 0, AerodactylPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_ARROGANT NATURE_CRUEL
;@ pal_battle   PAL_GRAYMON
;@ pal_altbattle PAL_SANDSTONEMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       26, ROCK_THROW
;@ learn       32, SWORDS_DANCE
;@ learn       38, METEOR_DRIVE
;@ learn       44, EARTHQUAKE
;@ learn       49, HURRICANE
;@ tutor       HURRICANE
;@ tutor       METEOR_DRIVE
