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
	HONE_EDGE,\
	DISABLE,\
	SWORDS_DANCE,\
	SHADOW_GAME,\
	TOXIC,\
	SLUDGE_BOMB,\
	BODY_SLAM,\
	QUICK_ATTACK,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	SUPER_SOAK,\
	ZAPPERCUT,\
	FROST_FIST,\
	BLAZE_HAMMER,\
	SEISMIC_TOSS,\
	WYRM_WRATH,\
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
	MUD_BOMB,\
	DIG,\
	FINISHER,\
	DEMOLISH,\
	BULK_UP,\
	HEAT_RUSH,\
	SUPERNOVA,\
	ILL_WIND,\
	SHADOW_BALL,\
	SHADOW_BOX,\
	METEOR_SWEEP,\
	ROCK_SLIDE,\
	OROCLASM,\
	SUBSTITUTE,\
	ADAPTATION,\
	LEAP_ATTACK,\
	CLAY_ARMOR,\
	ROCK_ON,\
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
;@ learn       6, SAND_ATTACK
;@ learn       10, DEMOLISH
;@ learn       14, STOMP
;@ learn       18, MUD_BOMB
;@ learn       22, SCREECH
;@ learn       29, CLOBBERCLOCK
;@ learn       34, BLOOD_RUSH
;@ learn       39, UNDERBUG
;@ learn       45, FOCUS_ENERGY
;@ learn       51, SUPERPOWER
;@ learn       57, SLASH
;@ tutor       EXPLOSION
;@ tutor       PAY_DAY
;@ tutor       CLOBBERCLOCK
;@ tutor       PISTON_KICK
;@ tutor       METEOR_DRIVE
;@ tutor       SCREECH
