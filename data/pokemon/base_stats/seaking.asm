	db DEX_SEAKING ; pokedex id

	db  90, 102,  65,  68,  95
	;   hp  atk  def  spd  spc

	db WATER, NORMAL ; type
	db 90 ; catch rate
	db 170 ; base exp

	INCBIN "gfx/pokemon/front/seaking.pic", 0, 1 ; sprite dimensions
	dw SeakingPicFront, SeakingPicBackSW

	db SPLASH, SUPER_SOAK, SUPERSONIC, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ROCK_ON,\
	ADAPTATION,\
	MUD_BOMB,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AQUA_RING,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	BARRIER,\
	RIPTIDE,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	TWISTER,\
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	SURF,\
	FLASH
	; end

	db BANK(SeakingPicFront)
	db 0
	db BANK(SeakingPicBack)
	db BANK(SeakingPicBackSW)

	dw 0, SeakingPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_ARROGANT NATURE_CONSIDERATE
;@ pal_battle   PAL_GOLDMON
;@ pal_altbattle PAL_PEWTER
;@ pal_icon     PAL_ICON_60
;@ pal_alticon  PAL_ICON_59
;@ evo_move    NO_MOVE
;@ evo_react   "It thrashes, horn" "cutting the water!"
;@ evo_react   "It leaps up, fins" "catching the sun!"
;@ evo_react   "It charges, horn" "aimed dead ahead!"
;@ evo_react   "It splashes hard" "and dives deep!"
;@ learn       15, SUPERSONIC
;@ learn       18, WATER_PULSE
;@ learn       21, HEADBUTT
;@ learn       24, MUD_BOMB
;@ learn       27, AIR_DRILL
;@ learn       31, RIPTIDE
;@ learn       35, AGILITY
;@ learn       38, METEOR_DRIVE
;@ learn       43, DOUBLE_EDGE
;@ learn       45, HYDRO_PUMP
