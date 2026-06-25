	db DEX_ABRA ; pokedex id

	db  25,  20,  15,  90, 105
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 200 ; catch rate
	db 73 ; base exp

	INCBIN "gfx/pokemon/front/abra.pic", 0, 1 ; sprite dimensions
	dw AbraPicFront, AbraPicBackSW

	db TELEPORT, SEISMIC_TOSS, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	DISABLE,\
	AURORA_MIST,\
	SHADOW_GAME,\
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	ZAPPERCUT,\
	FROST_FIST,\
	BLAZE_HAMMER,\
	SEISMIC_TOSS,\
	DIG,\
	PSYCHIC_M,\
	FINISHER,\
	DEMOLISH,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	ILL_WIND,\
	SHADOW_BALL,\
	SHADOW_BOX,\
	BARRIER,\
	ENERGY_FLUX,\
	SKITTERMIND,\
	METEOR_SWEEP,\
	SUBSTITUTE,\
	CALM_MIND,\
	VOID_MIND,\
	PSYCHO_SHIFT,\
	FLASH
	; end

	; PureRGBnote: ADDED: in pokemon base stat headers, these point to which bank the various sprites are stored in.
	db BANK(AbraPicFront)
	db BANK(AbraPicFrontAlt)
	db BANK(AbraPicBack) 
	db BANK(AbraPicBackSW)

	dw AbraPicFrontAlt, AbraPicBack ; PureRGBnote: ADDED: the first byte is a pointer to alt front sprite if the pokemon has one, the second is a pointer to the original back sprite.

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_LAZY NATURE_CAUTIOUS
;@ pal_battle   PAL_AMBERMON
;@ pal_altbattle PAL_BRICKMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo         EVOLVE_LEVEL, 16, KADABRA
;@ evo_move    CONFUSION
;@ evo_react   NONE
;@ tutor       TELEPORT
;@ tutor       CLOBBERCLOCK
;@ tutor       PISTON_KICK
