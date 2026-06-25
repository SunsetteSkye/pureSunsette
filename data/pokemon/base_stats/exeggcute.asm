	db DEX_EXEGGCUTE ; pokedex id

	db  60,  40,  80,  40,  60
	;   hp  atk  def  spd  spc

	db GRASS, PSYCHIC_TYPE ; type
	db 90 ; catch rate
	db 98 ; base exp

	INCBIN "gfx/pokemon/front/exeggcute.pic", 0, 1 ; sprite dimensions
	dw ExeggcutePicFront, ExeggcutePicBackSW

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
	METEOR_SWEEP,\
	BARRIER,\
	ADAPTATION,\
	SOLARBEAM,\
	EARTHQUAKE,\
	RIPTIDE,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	TEMPEST,\
	VOID_MIND,\
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	SKITTERMIND,\
	SUBSTITUTE,\
	SURF,\
	FLASH
	; end


	db BANK(ExeggcutePicFront)
	db BANK(ExeggcutePicFrontAlt)
	db BANK(ExeggcutePicBack)
	db BANK(ExeggcutePicBackSW)

	dw ExeggcutePicFrontAlt, ExeggcutePicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CAUTIOUS NATURE_CALCULATING
;@ pal_battle   PAL_BLUSHMON
;@ pal_altbattle PAL_CAVE
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo         EVOLVE_ITEM, LEAF_STONE, 1, EXEGGUTOR
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       14, LEECH_SEED
;@ learn       18, MEGA_DRAIN
;@ learn       20, STUN_SPORE
;@ learn       23, PSYBEAM
;@ learn       27, SHADOW_BALL
;@ learn       32, RAZOR_LEAF
;@ learn       34, SOFTBOILED
;@ learn       36, PSYCHIC_M
;@ learn       48, ADAPTATION
;@ learn       53, EGG_BOMB
;@ learn       60, SOLARBEAM
;@ tutor       EXPLOSION
;@ tutor       TELEPORT
;@ tutor       SOFTBOILED
;@ tutor       EGG_BOMB
