	db DEX_ELECTABUZZ ; pokedex id

	db  75,  93,  57, 105,  95
	;   hp  atk  def  spd  spc

	db ELECTRIC, FIGHTING ; type
	db 75 ; catch rate
	db 156 ; base exp

	INCBIN "gfx/pokemon/front/electabuzz.pic", 0, 1 ; sprite dimensions
	dw ElectabuzzPicFront, ElectabuzzPicBackSW

	db QUICK_ATTACK, LEER, THUNDERSHOCK, SCREECH ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	FURY_ATTACK,\ ; MUD BOMB
	ICE_PUNCH,\ ; FROST FIST
	PIN_MISSILE,\
	FIRE_PUNCH,\ ; BLAZE HAMMER
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	AMNESIA,\ ; CALM MIND
	LOW_KICK,\
	THUNDERPUNCH,\ ; ZAPPERCUT
	ROLLING_KICK,\ ; METEOR SWEEP
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	DIG,\
	KINESIS,\ ; MIRAGE
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	SLAM,\ ; WASTEMAKER
	KARATE_CHOP,\
	MEDITATE,\ ; VOID MIND
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH,\
	FLASH
	; end


	db BANK(ElectabuzzPicFront)
	db BANK(ElectabuzzPicFrontAlt)
	db BANK(ElectabuzzPicBack)
	db BANK(ElectabuzzPicBackSW)

	dw ElectabuzzPicFrontAlt, ElectabuzzPicBack

