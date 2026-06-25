	db DEX_TAUROS ; pokedex id

	db  105, 120,  95,  90,  40
	;    hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 211 ; base exp

	INCBIN "gfx/pokemon/front/tauros.pic", 0, 1 ; sprite dimensions
	dw TaurosPicFront, TaurosPicBackSW

	db TACKLE, METEOR_HORN, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	LEAP_ATTACK,\
	MUD_BOMB,\
	PIN_MISSILE,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
	RIPTIDE,\
	SWORDS_DANCE,\
	BULK_UP,\
	SHADOW_BALL,\
	FIRE_BLAST,\
	ROCK_SLIDE,\
	ROCK_ON,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
	CUT,\
	SURF,\
	STRENGTH
	; end

	db BANK(TaurosPicFront)
	db 0
	db BANK(TaurosPicBack)
	db BANK(TaurosPicBackSW)

	dw 0, TaurosPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_RAGE NATURE_STOLID
;@ pal_battle   PAL_BROWNMON2
;@ pal_altbattle PAL_MOCHAMON
;@ pal_icon     PAL_ICON_64
;@ pal_alticon  PAL_ICON_66
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       19, STOMP
;@ learn       24, BLOOD_RUSH
;@ learn       29, MUD_BOMB
;@ learn       33, BODY_SLAM
;@ learn       37, SWORDS_DANCE
;@ learn       42, METEOR_DRIVE
;@ learn       48, PISTON_KICK
;@ learn       53, HYPER_BEAM
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
