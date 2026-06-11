	db DEX_WEEPINBELL ; pokedex id

	db  65,  90,  50,  55,  85
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 120 ; catch rate
	db 151 ; base exp

	INCBIN "gfx/pokemon/front/weepinbell.pic", 0, 1 ; sprite dimensions
	dw WeepinbellPicFront, WeepinbellPicBackSW

	db VINE_WHIP, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	SONICBOOM,\ ; ILL WIND
	LEECH_SEED,\
	PIN_MISSILE,\
	TOXIC,\
	DISABLE,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	AMNESIA,\
	BARRIER,\
	RAZOR_LEAF,\
	SOLARBEAM,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	SLAM,\ ; WASTEMAKER
	LIGHT_SCREEN,\
	SLUDGE,\ ; SLUDGE BOMB
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLASH
	; end
	
	db BANK(WeepinbellPicFront)
	db 0
	db BANK(WeepinbellPicBack)
	db BANK(WeepinbellPicBackSW)

	dw 0, WeepinbellPicBack

