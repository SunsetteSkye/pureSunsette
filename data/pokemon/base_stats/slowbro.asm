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
	DISABLE,\
	AURORA_MIST,\
	TOXIC,\
	SLUDGE_BOMB,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	WATER_PULSE,\
	SUPER_SOAK,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	FROST_FIST,\
	BLAZE_HAMMER,\
	SEISMIC_TOSS,\
	SOLARBEAM,\
	EARTHQUAKE,\
	MUD_BOMB,\
	DIG,\
	PSYCHIC_M,\
	FINISHER,\
	DEMOLISH,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	FLAMETHROWER,\
	FIRE_BLAST,\
	SHADOW_BALL,\
	SHADOW_BOX,\
	BARRIER,\
	THUNDER_WAVE,\
	SKITTERMIND,\
	METEOR_SWEEP,\
	SUBSTITUTE,\
	RIPTIDE,\
	AQUA_RING,\
	CALM_MIND,\
	VOID_MIND,\
	PSYCHO_SHIFT,\
	TEMPEST,\
	CLAY_ARMOR,\
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
;@ pal_icon     PAL_CREAMPINKMON
;@ pal_alticon  PAL_ICON_41
;@ evo_move    NO_MOVE
;@ evo_react   "It stares at you." "(<...><...><...><...><...><...><...><...>)"
;@ evo_react   "It blinks once<...>" "then nothing more."
;@ evo_react   "It looks around<...>" "still searching<...>"
;@ evo_react   "A long pause<...>" "Did it notice?"
;@ learn       8, DISABLE
;@ learn       12, HEADBUTT
;@ learn       16, WATER_PULSE
;@ learn       20, PSYBEAM
;@ learn       24, SHELL_GAME
;@ learn       29, SLAM
;@ learn       34, SURF
;@ learn       39, PSYCHIC_M
;@ learn       43, SLUDGE_BOMB
;@ learn       48, REST
;@ learn       55, HYDRO_PUMP
;@ tutor       TRI_ATTACK
;@ tutor       PAY_DAY
;@ tutor       TELEPORT
;@ tutor       CLOBBERCLOCK
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
