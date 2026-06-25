; Sunsette: a Pokemon Tower B1F spirit borrows this dex slot -> base_stats/spirit_painless.asm (Spirit (Painless)).
	db DEX_WIGGLYTUFF ; pokedex id

	db 140,  70,  55,  55,  70
	;   hp  atk  def  spd  spc

	db NORMAL, FLOATING ; type
	db 50 ; catch rate
	db 109 ; base exp

	INCBIN "gfx/pokemon/front/wigglytuff.pic", 0, 1 ; sprite dimensions
	dw WigglytuffPicFront, WigglytuffPicBackSW

	db DOUBLESLAP, SING, FLUTTER_KICK, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	HONE_EDGE,\
	DISABLE,\
	SWORDS_DANCE,\
	AURORA_MIST,\
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	WATER_PULSE,\
	SUPER_SOAK,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	ZAPPERCUT,\
	FROST_FIST,\
	BLAZE_HAMMER,\
	SEISMIC_TOSS,\
	SOLARBEAM,\
	THUNDERBOLT,\
	THUNDER,\
	MUD_BOMB,\
	DIG,\
	PSYCHIC_M,\
	FINISHER,\
	DEMOLISH,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	SUPERNOVA,\
	FLAMETHROWER,\
	FIRE_BLAST,\
	ILL_WIND,\
	SHADOW_BALL,\
	SHADOW_BOX,\
	BARRIER,\
	ENERGY_FLUX,\
	THUNDER_WAVE,\
	SKITTERMIND,\
	METEOR_SWEEP,\
	SUBSTITUTE,\
	AQUA_RING,\
	RAZOR_LEAF,\
	ADAPTATION,\
	CALM_MIND,\
	VOID_MIND,\
	PSYCHO_SHIFT,\
	LOVELY_KISS,\
	ROOST,\
	LEAP_ATTACK,\
	TEMPEST,\
	ROCK_ON,\
	FLY,\
	STRENGTH,\
	FLASH
	; end

	db BANK(WigglytuffPicFront)
	db 0
	db BANK(WigglytuffPicBack)
	db BANK(WigglytuffPicBackSW)

	dw 0, WigglytuffPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_PLAYFUL NATURE_CONSIDERATE
;@ pal_battle   PAL_JIGGMON
;@ pal_altbattle PAL_GRAYVELVET
;@ pal_icon     PAL_ICON_26
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   "It puffs up big," "then squeaks!"
;@ evo_react   "It bounces high" "on a big breath!"
;@ evo_react   "Its fur fluffs out" "soft and round!"
;@ evo_react   "It claps its hands" "with a happy hop!"
;@ learn       36, SOFTBOILED
;@ learn       43, CLOBBERCLOCK
;@ learn       50, AIR_DRILL
;@ learn       58, EXPLOSION
;@ tutor       EXPLOSION
;@ tutor       TRI_ATTACK
;@ tutor       SOULSTEALER
;@ tutor       PAY_DAY
;@ tutor       TELEPORT
;@ tutor       SOFTBOILED
;@ tutor       CLOBBERCLOCK
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
;@ tutor       SWIFT
;@ tutor       EGG_BOMB
;@ tutor       SCREECH
