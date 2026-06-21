	db DEX_SLOWBRO ; pokedex id

	db  95,  75, 110,  30,  90
	;   hp  atk  def  spd  spc

	db WATER, PSYCHIC_TYPE ; type
	db 75 ; catch rate
	db 164 ; base exp

	INCBIN "gfx/pokemon/front/slowbro.pic", 0, 1 ; sprite dimensions
	dw SlowbroPicFront, SlowbroPicBackSW

	db CONFUSION, SUPER_SOAK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	FROST_FIST,\
	MUD_BOMB,\
	BLAZE_HAMMER,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AQUA_RING,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	CALM_MIND,\
	LOW_KICK,\
	ZAPPERCUT,\
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
	DEMOLISH,\
	VOID_MIND,\
	LIGHT_SCREEN,\
	SKITTERMIND,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	STRENGTH,\
	FLASH
	; end

	db BANK(SlowbroPicFront)
	db 0
	db BANK(SlowbroPicBack)
	db BANK(SlowbroPicBackSW)

	dw 0, SlowbroPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_LAZY NATURE_DITZ
;@ pal_battle   PAL_BLUSHMON
;@ pal_altbattle PAL_MAGENTAMON
;@ pal_icon     PAL_ICON_40
;@ pal_alticon  PAL_ICON_41
;@ evo_move    NO_MOVE
;@ evo_react   "It stares at you." "(<...><...><...><...><...><...><...><...>)"
;@ evo_react   "It blinks once<...>" "then nothing more."
;@ evo_react   "It looks around<...>" "still searching<...>"
;@ evo_react   "A long pause<...>" "Did it notice?"
;@ learn       12, CONFUSION
;@ learn       17, DISABLE
;@ learn       20, HEADBUTT
;@ learn       24, CLAMP
;@ learn       28, PSYBEAM
;@ learn       32, SHELL_GAME
;@ learn       36, SLUDGE_BOMB
;@ learn       41, CALM_MIND
;@ learn       45, PSYCHIC_M
