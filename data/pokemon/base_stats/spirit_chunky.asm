	db DEX_RAICHU ; pokedex id

	db  225,  85,  65, 25, 100
	;   hp  atk  def  spd  spc

	db ELECTRIC, FLOATING ; type
	db 95 ; catch rate
	db 122 ; base exp

	INCBIN "gfx/battle/spirit_chunky.pic", 0, 1 ; sprite dimensions
	dw ChunkyPicFront, RaichuPicBackSW

	db SOFTBOILED, REST, BODY_SLAM, WITHDRAW ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ICE_PUNCH,\
	FIRE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	AMNESIA,\
	LOW_KICK,\
	THUNDERPUNCH,\
	ROLLING_KICK,\ ; METEOR SWEEP
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	DIG,\
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	SLAM,\ ; WASTEMAKER
	KARATE_CHOP,\
	MEDITATE,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	STRENGTH,\
	FLASH
	; end

	db BANK(ChunkyPicFront)
	db 0
	db BANK(RaichuPicBack)
	db BANK(RaichuPicBackSW)

	dw 0, RaichuPicBack

