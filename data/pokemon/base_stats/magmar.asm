; Sunsette: has a variant form -> base_stats/volcanic_magmar.asm (Volcanic Magmar).
	db DEX_MAGMAR ; pokedex id

	db  85,  95,  57,  93,  95
	;   hp  atk  def  spd  spc

	db FIRE, POISON ; type
	db 85 ; catch rate
	db 167 ; base exp

	INCBIN "gfx/pokemon/front/magmar.pic", 0, 1 ; sprite dimensions
	dw MagmarPicFront, MagmarPicBackSW

	db EMBER, FIRE_SPIN, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ADAPTATION,\
	FROST_FIST,\
	BLAZE_HAMMER,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	CALM_MIND,\
	LOW_KICK,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	BARRIER,\
	SOLARBEAM,\ 
	WYRM_WRATH,\
	EARTHQUAKE,\
	DIG,\
	PSYCHIC_M,\
	MIRAGE,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	SUPERNOVA,\
	FIRE_BLAST,\
	DEMOLISH,\
	VOID_MIND,\
	LOVELY_KISS,\
	BRAVE_BIRD,\
	LIGHT_SCREEN,\
	SKITTERMIND,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
	CUT,\
	STRENGTH,\
	FLASH
	; end


	db BANK(MagmarPicFront)
	db 0
	db BANK(MagmarPicBack)
	db BANK(MagmarPicBackSW)

	dw 0, MagmarPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CRUEL NATURE_HYPER
;@ pal_battle   PAL_REDMON
;@ pal_altbattle PAL_CYANMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       15, SMOG
;@ learn       17, SMOKESCREEN
;@ learn       20, METEOR_SWEEP
;@ learn       22, CONFUSE_RAY
;@ learn       24, EMETIC_PURGE
;@ learn       27, BLAZE_HAMMER
;@ learn       30, TELEPORT
;@ learn       37, EGG_BOMB
;@ learn       43, SLUDGE_BOMB
;@ learn       49, FIRE_BLAST
;@ learn       54, TOXIC
