	db DEX_CLOYSTER ; pokedex id

	db  50,  95, 180,  70,  85
	;   hp  atk  def  spd  spc

	db WATER, ICE ; type
	db 70 ; catch rate
	db 203 ; base exp

	INCBIN "gfx/pokemon/front/cloyster.pic", 0, 1 ; sprite dimensions
	dw CloysterPicFront, CloysterPicBackSW

	db TACKLE, WATER_GUN, NO_MOVE, NO_MOVE ; level 1 learnset (SUPER SOAK)
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	FURY_ATTACK,\ ; MUD BOMB
	DISABLE,\
	TOXIC,\
	HORN_DRILL,\ ; VENOM DRILL
	BODY_SLAM,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	AMNESIA,\ ; CALM MIND
	BARRIER,\
	EARTHQUAKE,\
	CRABHAMMER,\
	DIG,\
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	SLAM,\ ; WASTEMAKER
	LIGHT_SCREEN,\
	SLUDGE,\ ; SLUDGE BOMB
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	SURF,\
	STRENGTH,\
	FLASH
	; end

	db BANK(CloysterPicFront)
	db BANK(CloysterPicFrontAlt)
	db BANK(CloysterPicBack)
	db BANK(CloysterPicBackSW)

	dw CloysterPicFrontAlt, CloysterPicBack

