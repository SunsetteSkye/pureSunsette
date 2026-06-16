	db DEX_BUTTERFREE ; pokedex id

	db  70,  25,  95,  75,  92
	;   hp  atk  def  spd  spc

	db BUG, PSYCHIC_TYPE ; type
	db 105 ; catch rate
	db 160 ; base exp

	INCBIN "gfx/pokemon/front/butterfree.pic", 0, 1 ; sprite dimensions
	dw ButterfreePicFront, ButterfreePicBackSW

	db HARDEN, TACKLE, STRING_SHOT, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	DISABLE,\
	RAZOR_WIND,\ ; ROOST
	TOXIC,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	HYPER_BEAM,\
	AMNESIA,\ ; CALM MIND
	BARRIER,\
	RAZOR_LEAF,\
	SOLARBEAM,\ ; SOLARBEAM
	PSYCHIC_M,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	SLAM,\ ; WASTEMAKER
	MEDITATE,\ ; VOID MIND
	LOVELY_KISS,\
	SKY_ATTACK,\ ; BRAVE BIRD
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	PSYWAVE,\ ; SKITTERMIND
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	SURF,\
	FLASH
	;end

	db BANK(ButterfreePicFront)
	db BANK(ButterfreePicFrontAlt)
	db BANK(ButterfreePicBack)
	db BANK(ButterfreePicBackSW)

	dw ButterfreePicFrontAlt, ButterfreePicBack
