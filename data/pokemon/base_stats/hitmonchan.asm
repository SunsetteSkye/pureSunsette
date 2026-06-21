; Sunsette: a Pokemon Tower B1F spirit borrows this dex slot -> base_stats/spirit_irradiated.asm (Spirit (Irradiated)).
	db DEX_HITMONCHAN ; pokedex id

	db  50, 115,  79,  76,  90
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db 95 ; catch rate
	db 140 ; base exp

	INCBIN "gfx/pokemon/front/hitmonchan.pic", 0, 1 ; sprite dimensions
	dw HitmonchanPicFront, HitmonchanPicBackSW

	db SEISMIC_TOSS, AGILITY, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	FROST_FIST,\
	MUD_BOMB,\
	BLAZE_HAMMER,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	LOW_KICK,\
	ZAPPERCUT,\
	BARRIER,\
	SWORDS_DANCE,\
	BULK_UP,\
	DEMOLISH,\
	VOID_MIND,\
	SHADOW_GAME,\
	ROCK_ON,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
	CUT,\
	STRENGTH,\
	FLASH
	; end

	db BANK(HitmonchanPicFront)
	db 0
	db BANK(HitmonchanPicBack)
	db BANK(HitmonchanPicBackSW)

	dw 0, HitmonchanPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_STOLID NATURE_CALCULATING
;@ pal_battle   PAL_ROSEGOLDMON
;@ pal_altbattle PAL_BRICKMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   NONE
;@ learn       19, DOUBLE_TEAM
;@ learn       22, MACH_PUNCH
;@ learn       24, BLAZE_HAMMER
;@ learn       25, FROST_FIST
;@ learn       26, ZAPPERCUT
;@ learn       32, DIZZY_PUNCH
;@ learn       37, SHADOW_BOX
;@ learn       43, MIMIC
;@ learn       49, SHORYUKEN
