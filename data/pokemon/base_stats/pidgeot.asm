	db DEX_PIDGEOT ; pokedex id

	db  72,  85,  68, 121, 104
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 65 ; catch rate
	db 172 ; base exp

	INCBIN "gfx/pokemon/front/pidgeot.pic", 0, 1 ; sprite dimensions
	dw PidgeotPicFront, PidgeotPicBackSW

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	tmhm \
	HONE_EDGE,\
	DISABLE,\
	SWORDS_DANCE,\
	AURORA_MIST,\
	SHADOW_GAME,\
	TOXIC,\
	QUICK_ATTACK,\
	DOUBLE_EDGE,\
	BLIZZARD,\
	HYPER_BEAM,\
	SEISMIC_TOSS,\
	THUNDERBOLT,\
	THUNDER,\
	MUD_BOMB,\
	FINISHER,\
	REFLECT,\
	LIGHT_SCREEN,\
	HEAT_RUSH,\
	ILL_WIND,\
	BARRIER,\
	BRAVE_BIRD,\
	SUBSTITUTE,\
	RAZOR_LEAF,\
	ADAPTATION,\
	VOID_MIND,\
	PSYCHO_SHIFT,\
	ROOST,\
	LEAP_ATTACK,\
	PIN_MISSILE,\
	TEMPEST,\
	CUT,\
	FLY,\
	FLASH
	; end


	db BANK(PidgeotPicFront)
	db BANK(PidgeotPicFrontAlt)
	db BANK(PidgeotPicBack)
	db BANK(PidgeotPicBackSW)

	dw PidgeotPicFrontAlt, PidgeotPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_ARROGANT NATURE_WISE
;@ pal_battle   PAL_BROWNGOLDMON
;@ pal_altbattle PAL_PIDGEOTMON
;@ pal_icon     PAL_ICON_10
;@ pal_alticon  PAL_ICON_11
;@ evo_move    NO_MOVE
;@ evo_react   "A gust of wind" "sends debris up!"
;@ evo_react   "It soars high," "feathers blazing!"
;@ evo_react   "Its plume flares" "bright and bold!"
;@ evo_react   "It dives fast," "talons spread!"
;@ learn_like  PIDGEY
;@ tutor       HURRICANE
;@ tutor       METEOR_DRIVE
;@ tutor       EGG_BOMB
