	db DEX_POLIWHIRL ; pokedex id

	db  65,  65,  65,  90,  50
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 120 ; catch rate
	db 131 ; base exp

	INCBIN "gfx/pokemon/front/poliwhirl.pic", 0, 1 ; sprite dimensions
	dw PoliwhirlPicFront, PoliwhirlPicBackSW

	db BUBBLE, SPLASH, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	FROST_FIST,\
	MUD_BOMB,\
	BLAZE_HAMMER,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AQUA_RING,\
	ICE_BEAM,\
	BLIZZARD,\
	CALM_MIND,\
	LOW_KICK,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	BARRIER,\
	RIPTIDE,\
	DIG,\
	PSYCHIC_M,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	TWISTER,\
	DEMOLISH,\
	VOID_MIND,\
	LIGHT_SCREEN,\
	SKITTERMIND,\
	SHADOW_GAME,\
	SUBSTITUTE,\
	SURF,\
	STRENGTH,\
	FLASH
	; end

	db BANK(PoliwhirlPicFront)
	db 0
	db BANK(PoliwhirlPicBack)
	db BANK(PoliwhirlPicBackSW)

	dw 0, PoliwhirlPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_PLAYFUL NATURE_LAZY
;@ pal_battle   PAL_PEWTER
;@ pal_altbattle PAL_GREENBAR
;@ pal_icon     PAL_ICON_34
;@ pal_alticon  PAL_ICON_35
;@ evo         EVOLVE_ITEM, WATER_STONE, 1, POLIWRATH
;@ evo_move    NO_MOVE
;@ evo_react   "Its belly spiral" "starts to whirl!"
;@ evo_react   "Its spiral spins" "faster and faster!"
;@ evo_react   "It dives in," "leaving ripples!"
;@ evo_react   "Its slick skin" "glistens wet!"
;@ learn       12, SUPER_SOAK
;@ learn       15, HYPNOSIS
;@ learn       19, CONFUSION
;@ learn       22, WATER_PULSE
;@ learn       27, BODY_SLAM
;@ learn       30, RIPTIDE
;@ learn       36, DIZZY_PUNCH
;@ learn       41, CALM_MIND
;@ learn       45, HYDRO_PUMP
;@ learn       52, SHADOW_BOX
