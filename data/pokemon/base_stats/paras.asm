	db DEX_PARAS ; pokedex id

	db  35,  70,  55,  25,  55
	;   hp  atk  def  spd  spc

	db BUG, GRASS ; type
	db 190 ; catch rate
	db 70 ; base exp

	INCBIN "gfx/pokemon/front/paras.pic", 0, 1 ; sprite dimensions
	dw ParasPicFront, ParasPicBackSW

	db SCRATCH, ABSORB, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AMNESIA,\ ; CALM MIND
	BARRIER,\
	RAZOR_LEAF,\
	SOLARBEAM,\ ; SOLARBEAM
	EARTHQUAKE,\
	CRABHAMMER,\
	DIG,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	SLAM,\ ; WASTEMAKER
	KARATE_CHOP,\
	LIGHT_SCREEN,\
	SLUDGE,\ ; SLUDGE BOMB
	SUBSTITUTE,\
	CUT,\
	FLASH
	; end


	db BANK(ParasPicFront)
	db 0
	db BANK(ParasPicBack)
	db BANK(ParasPicBackSW)

	dw 0, ParasPicBack

