; Sunsette: a Pokemon Tower B1F spirit borrows this dex slot -> base_stats/spirit_torched.asm (Spirit (Torched)).
	db DEX_EXEGGUTOR ; pokedex id

	db  95,  95,  85,  55, 125
	;   hp  atk  def  spd  spc

	db GRASS, PSYCHIC_TYPE ; type
	db 65 ; catch rate
	db 212 ; base exp

	INCBIN "gfx/pokemon/front/exeggutor.pic", 0, 1 ; sprite dimensions
	dw ExeggutorPicFront, ExeggutorPicBackSW

	db ABSORB, HYPNOSIS, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	MUD_BOMB,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AQUA_RING,\
	HYPER_BEAM,\
	CALM_MIND,\
	LOW_KICK,\
	METEOR_SWEEP,\
	BARRIER,\
	ADAPTATION,\
	SOLARBEAM,\ 
	EARTHQUAKE,\
	RIPTIDE,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	MIRAGE,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	TWISTER,\
	DEMOLISH,\
	VOID_MIND,\
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	SKITTERMIND,\
	SUBSTITUTE,\
	SURF,\
	STRENGTH,\
	FLASH
	; end

	db BANK(ExeggutorPicFront)
	db BANK(ExeggutorPicFrontAlt)
	db BANK(ExeggutorPicBack)
	db BANK(ExeggutorPicBackSW)

	dw ExeggutorPicFrontAlt, ExeggutorPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_DITZ NATURE_LAZY
;@ pal_battle   PAL_GREENBAR
;@ pal_altbattle PAL_SAFFRON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   "Every face grins" "as it stomps off."
;@ evo_react   "Its heads sway" "in lazy unison."
;@ evo_react   "It stomps down," "leaves rustling!"
;@ evo_react   "A coconut bonks" "off and grins!"
;@ learn       14, LEECH_SEED
;@ learn       18, MEGA_DRAIN
;@ learn       20, STUN_SPORE
;@ learn       23, PSYBEAM
;@ learn       27, SHADOW_BALL
;@ learn       32, RAZOR_LEAF
;@ learn       36, PSYCHIC_M
;@ learn       48, ADAPTATION
;@ learn       53, EGG_BOMB
;@ learn       60, SOLARBEAM
