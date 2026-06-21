	db DEX_RHYDON ; pokedex id

	db 105, 130, 120,  40, 105
	;   hp  atk  def  spd  spc

	db GROUND, ROCK ; type
	db 60 ; catch rate
	db 255 ; base exp

	INCBIN "gfx/pokemon/front/rhydon.pic", 0, 1 ; sprite dimensions
	dw RhydonPicFront, RhydonPicBackSW

	db MUD_CLAW, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

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
	LOW_KICK,\
	ZAPPERCUT,\
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
	DEMOLISH,\
	ROCK_SLIDE,\
	ROCK_ON,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
	CUT,\
	SURF,\
	STRENGTH
	; end

	db BANK(RhydonPicFront)
	db 0
	db BANK(RhydonPicBack)
	db BANK(RhydonPicBackSW)

	dw 0, RhydonPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_RAGE NATURE_DITZ
;@ pal_battle   PAL_ASHMON
;@ pal_altbattle PAL_WHITEMON
;@ pal_icon     PAL_ICON_55
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   "Its whirring horn" "gleams bright!"
;@ evo_react   "It paws the ground" "and snorts hard!"
;@ evo_react   "It charges, horn" "lowered to ram!"
;@ evo_react   "It flexes, rocky" "hide gleaming!"
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
