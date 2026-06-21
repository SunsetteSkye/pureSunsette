	db DEX_SLOWPOKE ; pokedex id

	db  90,  65,  65,  15,  40
	;   hp  atk  def  spd  spc

	db WATER, PSYCHIC_TYPE ; type
	db 190 ; catch rate
	db 99 ; base exp

	INCBIN "gfx/pokemon/front/slowpoke.pic", 0, 1 ; sprite dimensions
	dw SlowpokePicFront, SlowpokePicBackSW

	db CONFUSION, SUPER_SOAK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	MUD_BOMB,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AQUA_RING,\
	ICE_BEAM,\
	BLIZZARD,\
	CALM_MIND,\
	LOW_KICK,\
	METEOR_SWEEP,\
	EARTHQUAKE,\
	RIPTIDE,\
	DIG,\
	PSYCHIC_M,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	FIRE_BLAST,\
	TWISTER,\
	VOID_MIND,\
	LIGHT_SCREEN,\
	SKITTERMIND,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	STRENGTH,\
	FLASH
	; end


	db BANK(SlowpokePicFront)
	db 0
	db BANK(SlowpokePicBack)
	db BANK(SlowpokePicBackSW)

	dw 0, SlowpokePicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_LAZY NATURE_DITZ
;@ pal_battle   PAL_BLUSHMON
;@ pal_altbattle PAL_MAGENTAMON
;@ pal_icon     PAL_ICON_40
;@ pal_alticon  PAL_ICON_41
;@ evo         EVOLVE_LEVEL, 28, SLOWBRO
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       12, CONFUSION
;@ learn       17, DISABLE
;@ learn       20, HEADBUTT
;@ learn       24, CLAMP
;@ learn       29, PSYBEAM
;@ learn       32, SHELL_GAME
;@ learn       36, SLUDGE_BOMB
;@ learn       41, CALM_MIND
;@ learn       45, PSYCHIC_M
