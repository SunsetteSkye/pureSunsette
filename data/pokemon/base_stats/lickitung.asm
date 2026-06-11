	db DEX_LICKITUNG ; pokedex id

	db 120,  65,  75,  85,  60
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 125 ; catch rate
	db 127 ; base exp

	INCBIN "gfx/pokemon/front/lickitung.pic", 0, 1 ; sprite dimensions
	dw LickitungPicFront, LickitungPicBackSW

	db LICK, TACKLE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	LOW_KICK,\
	ICE_PUNCH,\
	PIN_MISSILE,\
	FIRE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	ICE_BEAM,\
	BLIZZARD,\ ; SLEET STORM
	HYPER_BEAM,\
	AMNESIA,\
	THUNDERPUNCH,\
	ROLLING_KICK,\ ; METEOR SWEEP
	BARRIER,\
	SOLARBEAM,\
	DRAGON_RAGE,\ ; WYRM WRATH
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
	CRABHAMMER,\
	DIG,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\ ; BULK UP
	BARRAGE,\ ; SHADOW BALL
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\ ; WASTEMAKER
	KARATE_CHOP,\
	MEDITATE,\
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	SLUDGE,\ ; SLUDGE BOMB
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	STRENGTH,\
	FLASH
	; end


	db BANK(LickitungPicFront)
	db 0
	db BANK(LickitungPicBack)
	db BANK(LickitungPicBackSW)

	dw 0, LickitungPicBack

