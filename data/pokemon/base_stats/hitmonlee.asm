	db DEX_HITMONLEE ; pokedex id

	db  85, 140,  53,  87,  45
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db 95 ; catch rate
	db 139 ; base exp

	INCBIN "gfx/pokemon/front/hitmonlee.pic", 0, 1 ; sprite dimensions
	dw HitmonleePicFront, HitmonleePicBackSW

	db DOUBLE_KICK, VOID_MIND, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	MUD_BOMB,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	LOW_KICK,\
	METEOR_SWEEP,\
	BARRIER,\
	EARTHQUAKE,\
	SWORDS_DANCE,\
	BULK_UP,\
	DEMOLISH,\
	VOID_MIND,\
	SHADOW_GAME,\
	ROCK_SLIDE,\
	ROCK_ON,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
	CUT,\
	STRENGTH
	; end


	db BANK(HitmonleePicFront)
	db 0
	db BANK(HitmonleePicBack)
	db BANK(HitmonleePicBackSW)

	dw 0, HitmonleePicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_SCRAPPY NATURE_STOLID
;@ pal_battle   PAL_CAVE
;@ pal_altbattle PAL_LEEKMON
;@ pal_icon     PAL_ICON_51
;@ pal_alticon  PAL_ICON_52
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       20, LOW_KICK
;@ learn       24, STOMP
;@ learn       27, FOCUS_ENERGY
;@ learn       31, METEOR_SWEEP
;@ learn       36, PISTON_KICK
;@ learn       41, BLITZ_STRIKE
;@ learn       46, METEOR_DRIVE
;@ learn       53, HI_JUMP_KICK
