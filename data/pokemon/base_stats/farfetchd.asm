	db DEX_FARFETCHD ; pokedex id

	db  90,  80,  55,  85,  80
	;   hp  atk  def  spd  spc

	db GRASS, FLYING ; type
	db 85 ; catch rate
	db 130 ; base exp

	INCBIN "gfx/pokemon/front/farfetchd.pic", 0, 1 ; sprite dimensions
	dw FarfetchdPicFront, FarfetchdPicBackSW

	db PECK, SAND_ATTACK, LEER, MIRROR_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	SONICBOOM,\ ; ILL WIND
	RAZOR_WIND,\ ; ROOST
	LEECH_SEED,\
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	HYPER_BEAM,\
	HI_JUMP_KICK,\
	ROLLING_KICK,\
	BARRIER,\
	RAZOR_LEAF,\
	DIG,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	SLAM,\ ; FILTHY SLAM
	KARATE_CHOP,\
	MEDITATE,\
	SKY_ATTACK,\
	LIGHT_SCREEN,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	SURF,\
	STRENGTH,\
	FLASH
	; end


	db BANK(FarfetchdPicFront)
	db BANK(FarfetchdPicFrontAlt)
	db BANK(FarfetchdPicBack)
	db BANK(FarfetchdPicBackSW)

	dw FarfetchdPicFrontAlt, FarfetchdPicBack

