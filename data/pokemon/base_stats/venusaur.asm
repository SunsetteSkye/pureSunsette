	db DEX_VENUSAUR ; pokedex id

	db 100,  82,  83,  80, 100
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 208 ; base exp

	INCBIN "gfx/pokemon/front/venusaur.pic", 0, 1 ; sprite dimensions
	dw VenusaurPicFront, VenusaurPicBackSW

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	FURY_ATTACK,\ ; MUD BOMB
	LOW_KICK,\
	SONICBOOM,\ ; ILL WIND
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	AMNESIA,\ ; CALM MIND
	ROLLING_KICK,\ ; METEOR SWEEP
	BARRIER,\
	RAZOR_LEAF,\
	SOLARBEAM,\ ; SOLAR CANNON
	DRAGON_RAGE,\ ; WYRM WRATH
	EARTHQUAKE,\
	DIG,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	SLAM,\ ; WASTEMAKER
	MEDITATE,\ ; VOID MIND
	LIGHT_SCREEN,\
	SLUDGE,\ ; SLUDGE BOMB
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH,\
	FLASH
	; end

	db BANK(VenusaurPicFront)
	db 0
	db BANK(VenusaurPicBack)
	db BANK(VenusaurPicBackSW)

	dw 0, VenusaurPicBack

