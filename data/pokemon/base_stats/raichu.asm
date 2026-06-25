; Sunsette: a Pokemon Tower B1F spirit borrows this dex slot -> base_stats/spirit_chunky.asm (Spirit (Chunky)).
	db DEX_RAICHU ; pokedex id

	db  60,  95,  55, 110, 100
	;   hp  atk  def  spd  spc

	db ELECTRIC, NORMAL ; type
	db 95 ; catch rate
	db 122 ; base exp

	INCBIN "gfx/pokemon/front/raichu.pic", 0, 1 ; sprite dimensions
	dw RaichuPicFront, RaichuPicBackSW

	db THUNDERSHOCK, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	DISABLE,\
	AURORA_MIST,\
	SHADOW_GAME,\
	TOXIC,\
	BODY_SLAM,\
	QUICK_ATTACK,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	ZAPPERCUT,\
	BLAZE_HAMMER,\
	SEISMIC_TOSS,\
	THUNDERBOLT,\
	THUNDER,\
	MUD_BOMB,\
	DIG,\
	FINISHER,\
	DEMOLISH,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	HEAT_RUSH,\
	ILL_WIND,\
	SHADOW_BOX,\
	BARRIER,\
	ENERGY_FLUX,\
	THUNDER_WAVE,\
	METEOR_SWEEP,\
	SUBSTITUTE,\
	RIPTIDE,\
	RAZOR_LEAF,\
	ADAPTATION,\
	CALM_MIND,\
	VOID_MIND,\
	PSYCHO_SHIFT,\
	LEAP_ATTACK,\
	ROCK_ON,\
	CUT,\
	SURF,\
	STRENGTH,\
	FLASH
	; end

	db BANK(RaichuPicFront)
	db 0
	db BANK(RaichuPicBack)
	db BANK(RaichuPicBackSW)

	dw 0, RaichuPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_PLAYFUL NATURE_HYPER
;@ pal_battle   PAL_GOLDMON
;@ pal_altbattle PAL_THUNDERMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   "It whips its tail," "sparks flying!"
;@ evo_react   "Sparks crackle" "across its cheeks!"
;@ evo_react   "It bounds high," "crackling bright!"
;@ evo_react   "A bolt arcs" "off its tail!"
;@ learn       36, PLASMA_BURN
;@ learn       42, BODY_SLAM
;@ learn       48, THUNDER
;@ learn       55, HYPER_BEAM
;@ tutor       PAY_DAY
;@ tutor       TELEPORT
;@ tutor       CLOBBERCLOCK
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
;@ tutor       SWIFT
