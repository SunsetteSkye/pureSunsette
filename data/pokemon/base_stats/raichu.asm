; Sunsette: a Pokemon Tower B1F spirit borrows this dex slot -> base_stats/spirit_chunky.asm (Spirit (Chunky)).
	db DEX_RAICHU ; pokedex id

	db  70,  95,  65, 100, 100
	;   hp  atk  def  spd  spc

	db ELECTRIC, NORMAL ; type
	db 95 ; catch rate
	db 122 ; base exp

	INCBIN "gfx/pokemon/front/raichu.pic", 0, 1 ; sprite dimensions
	dw RaichuPicFront, RaichuPicBackSW

	db THUNDERSHOCK, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ADAPTATION,\
	MUD_BOMB,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AURORA_MIST,\
	HYPER_BEAM,\
	LOW_KICK,\
	ZAPPERCUT,\
	METEOR_SWEEP,\
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	RIPTIDE,\
	DIG,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	DEMOLISH,\
	VOID_MIND,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	SHADOW_GAME,\
	ROCK_ON,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	STRENGTH,\
	FLASH
	; end

	db BANK(RaichuPicFront)
	db 0
	db BANK(RaichuPicBack)
	db BANK(RaichuPicBackSW)

	dw 0, RaichuPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_PLAYFUL NATURE_HYPER
;@ pal_battle   PAL_GOLDMON
;@ pal_altbattle PAL_THUNDERMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   "It whips its tail," "sparks flying!"
;@ evo_react   "Sparks crackle" "across its cheeks!"
;@ evo_react   "It bounds high," "crackling bright!"
;@ evo_react   "A bolt arcs" "off its tail!"
;@ learn       6, TACKLE
;@ learn       9, THUNDER_WAVE
;@ learn       12, SPARK
;@ learn       16, AGILITY
;@ learn       22, SWIFT
;@ learn       26, THUNDERBOLT
;@ learn       31, FOCUS_ENERGY
;@ learn       36, BLITZ_STRIKE
;@ learn       45, THUNDER
;@ learn       52, HYPER_BEAM
