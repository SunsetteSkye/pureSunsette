	db DEX_PRIMEAPE ; pokedex id

	db  70, 105,  60,  95,  80
	;   hp  atk  def  spd  spc

	db NORMAL, FIGHTING ; type
	db 75 ; catch rate
	db 149 ; base exp

	INCBIN "gfx/pokemon/front/primeape.pic", 0, 1 ; sprite dimensions
	dw PrimeapePicFront, PrimeapePicBackSW

	db SCRATCH, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ADAPTATION,\
	FROST_FIST,\
	MUD_BOMB,\
	BLAZE_HAMMER,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	LOW_KICK,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	WYRM_WRATH,\
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
	DIG,\
	SWORDS_DANCE,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	DEMOLISH,\
	VOID_MIND,\
	SHADOW_GAME,\
	ROCK_SLIDE,\
	ROCK_ON,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
	CUT,\
	STRENGTH
	; end

	db BANK(PrimeapePicFront)
	db 0
	db BANK(PrimeapePicBack)
	db BANK(PrimeapePicBackSW)

	dw 0, PrimeapePicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_RAGE NATURE_HYPER
;@ pal_battle   PAL_MOCHAMON
;@ pal_altbattle PAL_REDBAR
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   "It pounds the" "ground in a fury!"
;@ evo_react   "It throws a flurry" "of wild punches!"
;@ evo_react   "It shrieks, fuming" "with pure rage!"
;@ evo_react   "It stomps around," "seeing red!"
;@ learn       9, DEMOLISH
;@ learn       12, MUD_CLAW
;@ learn       15, SCREECH
;@ learn       18, FOCUS_ENERGY
;@ learn       20, LOW_KICK
;@ learn       23, SEISMIC_TOSS
;@ learn       25, BLOOD_RUSH
;@ learn       27, ILL_WIND
;@ learn       35, UNDERBUG
;@ learn       39, MACH_PUNCH
;@ learn       45, SHADOW_BOX
;@ learn       51, OUTRAGE
;@ learn       54, COMBOBREAKER
