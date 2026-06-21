	db DEX_RHYHORN ; pokedex id

	db  80,  85,  95,  25,  65
	;   hp  atk  def  spd  spc

	db GROUND, ROCK ; type
	db 120 ; catch rate
	db 105 ; base exp

	INCBIN "gfx/pokemon/front/rhyhorn.pic", 0, 1 ; sprite dimensions
	dw RhyhornPicFront, RhyhornPicBackSW

	db MUD_CLAW, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	ADAPTATION,\
	MUD_BOMB,\
	PIN_MISSILE,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	LOW_KICK,\
	METEOR_SWEEP,\
	BARRIER,\
	WYRM_WRATH,\
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
	DIG,\
	MIRAGE,\
	SWORDS_DANCE,\
	BULK_UP,\
	SHADOW_BALL,\
	FIRE_BLAST,\
	ROCK_SLIDE,\
	ROCK_ON,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
	CUT,\
	STRENGTH
	; end


	db BANK(RhyhornPicFront)
	db 0
	db BANK(RhyhornPicBack)
	db BANK(RhyhornPicBackSW)

	dw 0, RhyhornPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_RAGE NATURE_DITZ
;@ pal_battle   PAL_ASHMON
;@ pal_altbattle PAL_WHITEMON
;@ pal_icon     PAL_ICON_55
;@ pal_alticon  $FF
;@ evo         EVOLVE_LEVEL, 33, RHYDON
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       8, ROCK_THROW
;@ learn       12, BITE
;@ learn       15, DOUBLE_KICK
;@ learn       19, METEOR_HORN
;@ learn       23, MUD_BOMB
;@ learn       27, ROCK_ON
;@ learn       36, PISTON_KICK
;@ learn       39, ROCK_SLIDE
;@ learn       42, EARTHQUAKE
;@ learn       47, METAMORPHIC
;@ learn       52, AIR_DRILL
;@ learn       56, SPIKE_CANNON
