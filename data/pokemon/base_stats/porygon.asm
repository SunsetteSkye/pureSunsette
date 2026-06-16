	db DEX_PORYGON ; pokedex id

	db  65,  80,  70,  40, 120
	;   hp  atk  def  spd  spc

	db NORMAL, GHOST ; type
	db 45 ; catch rate
	db 130 ; base exp

	INCBIN "gfx/pokemon/front/porygon.pic", 0, 1 ; sprite dimensions
	dw PorygonPicFront, PorygonPicBackSW

	db TACKLE, SHARPEN, KINESIS, MIRROR_MOVE ; level 1 learnset (MOCKINGBIRD) (HONE EDGE)
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	PIN_MISSILE,\
	TOXIC,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	BARRIER,\
	SOLARBEAM,\ ; SOLARBEAM
	THUNDERBOLT,\
	THUNDER,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	KINESIS,\ ; MIRAGE
	REFLECT,\
	SONICBOOM,\ ; ILL WIND
	BARRAGE,\ ; SHADOW BALL
	FIRE_BLAST,\
	FLAMETHROWER,\
	MEDITATE,\ ; VOID MIND
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	PSYWAVE,\ ; SKITTERMIND
	SUBSTITUTE,\
	FLASH
	; end


	db BANK(PorygonPicFront)
	db 0
	db BANK(PorygonPicBack)
	db BANK(PorygonPicBackSW)

	dw 0, PorygonPicBack

