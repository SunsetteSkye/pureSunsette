	db DEX_KRABBY ; pokedex id

	db  30, 105,  90,  50,  25
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 225 ; catch rate
	db 115 ; base exp

	INCBIN "gfx/pokemon/front/krabby.pic", 0, 1 ; sprite dimensions
	dw KrabbyPicFront, KrabbyPicBackSW

	db SCRATCH, BUBBLE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	MUD_BOMB,\
	PIN_MISSILE,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AQUA_RING,\
	ICE_BEAM,\
	BLIZZARD,\
	LOW_KICK,\
	METEOR_SWEEP,\
	BARRIER,\
	EARTHQUAKE,\
	RIPTIDE,\
	DIG,\
	SWORDS_DANCE,\
	BULK_UP,\
	SHADOW_BALL,\
	DEMOLISH,\
	ROCK_SLIDE,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	STRENGTH,\
	FLASH
	; end


	db BANK(KrabbyPicFront)
	db 0
	db BANK(KrabbyPicBack)
	db BANK(KrabbyPicBackSW)

	dw 0, KrabbyPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_SCRAPPY NATURE_CAUTIOUS
;@ pal_battle   PAL_REDMON
;@ pal_altbattle PAL_KELPMON
;@ pal_icon     PAL_ICON_04
;@ pal_alticon  $FF
;@ evo         EVOLVE_LEVEL, 29, KINGLER
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       14, MUD_CLAW
;@ learn       17, AGILITY
;@ learn       19, SUPER_SOAK
;@ learn       22, UNDERBUG
;@ learn       26, MUD_BOMB
;@ learn       30, SLASH
;@ learn       35, CRABHAMMER
;@ learn       39, EXTERMINATE
;@ learn       44, EARTHQUAKE
;@ learn       50, SPIKE_CANNON
