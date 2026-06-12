	db DEX_VENOMOTH ; pokedex id

	db  70,  85,  70,  90,  90
	;   hp  atk  def  spd  spc

	db BUG, POISON ; type
	db 75 ; catch rate
	db 138 ; base exp

	INCBIN "gfx/pokemon/front/venomoth.pic", 0, 1 ; sprite dimensions
	dw VenomothPicFront, VenomothPicBackSW

	db TACKLE, DISABLE, POISON_STING, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	DISABLE,\
	SONICBOOM,\ ; ILL WIND
	RAZOR_WIND,\ ; ROOST
	LEECH_SEED,\
	PIN_MISSILE,\
	TOXIC,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	HYPER_BEAM,\
	AMNESIA,\ ; CALM MIND
	BARRIER,\
	SOLARBEAM,\ ; SOLAR CANNON
	PSYCHIC_M,\
	MEGA_DRAIN,\
	KINESIS,\ ; MIRAGE
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	SKY_ATTACK,\
	LIGHT_SCREEN,\
	PSYWAVE,\ ; SKITTERMIND
	SLUDGE,\ ; SLUDGE BOMB
	SUBSTITUTE,\
	CUT,\
	FLY,\
	FLASH
	; end

	db BANK(VenomothPicFront)
	db 0
	db BANK(VenomothPicBack)
	db BANK(VenomothPicBackSW)

	dw 0, VenomothPicBack

