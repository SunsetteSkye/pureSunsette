	db DEX_NINETALES ; pokedex id

	db  73,  76,  75, 100, 100
	;   hp  atk  def  spd  spc

	db FIRE, GHOST ; type
	db 75 ; catch rate
	db 178 ; base exp

	INCBIN "gfx/pokemon/front/ninetales.pic", 0, 1 ; sprite dimensions
	dw NinetalesPicFront, NinetalesPicBackSW

	db EMBER, QUICK_ATTACK, CONFUSE_RAY, HYPNOSIS ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	DISABLE,\
	AURORA_MIST,\
	SHADOW_GAME,\
	TOXIC,\
	BODY_SLAM,\
	QUICK_ATTACK,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	SOLARBEAM,\
	THUNDERBOLT,\
	THUNDER,\
	MUD_BOMB,\
	DIG,\
	PSYCHIC_M,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	HEAT_RUSH,\
	SUPERNOVA,\
	FLAMETHROWER,\
	FIRE_BLAST,\
	ILL_WIND,\
	SHADOW_BALL,\
	BARRIER,\
	ENERGY_FLUX,\
	THUNDER_WAVE,\
	SKITTERMIND,\
	METEOR_SWEEP,\
	SUBSTITUTE,\
	RAZOR_LEAF,\
	ADAPTATION,\
	CALM_MIND,\
	PSYCHO_SHIFT,\
	LEAP_ATTACK,\
	CUT,\
	FLASH
	; end

	db BANK(NinetalesPicFront)
	db 0
	db BANK(NinetalesPicBack)
	db BANK(NinetalesPicBackSW)

	dw 0, NinetalesPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_ARROGANT NATURE_CALCULATING
;@ pal_battle   PAL_GOLDMON
;@ pal_altbattle PAL_WHITEMON
;@ pal_icon     PAL_ICON_25
;@ pal_alticon  PAL_ICON_13
;@ evo_move    NO_MOVE
;@ evo_react   "From the flame," "eyes gleaming."
;@ evo_react   "Its nine tails" "fan out grandly!"
;@ evo_react   "Embers swirl" "around its paws!"
;@ evo_react   "It tosses its mane" "with proud glint!"
;@ learn       36, PSYCHIC_M
;@ learn       44, SOULSTEALER
;@ learn       52, FLAMETHROWER
;@ learn       60, FIRE_BLAST
;@ tutor       TRI_ATTACK
;@ tutor       TELEPORT
;@ tutor       SWIFT
