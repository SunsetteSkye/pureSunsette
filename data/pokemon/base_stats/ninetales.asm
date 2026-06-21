	db DEX_NINETALES ; pokedex id

	db  73,  76,  75, 100, 100
	;   hp  atk  def  spd  spc

	db FIRE, GHOST ; type
	db 75 ; catch rate
	db 178 ; base exp

	INCBIN "gfx/pokemon/front/ninetales.pic", 0, 1 ; sprite dimensions
	dw NinetalesPicFront, NinetalesPicBackSW

	db EMBER, TAIL_WHIP, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	MUD_BOMB,\
	TOXIC,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	CALM_MIND,\
	METEOR_SWEEP,\
	BARRIER,\
	SOLARBEAM,\ 
	WYRM_WRATH,\
	DIG,\
	PSYCHIC_M,\
	MIRAGE,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	SUPERNOVA,\
	FIRE_BLAST,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	SKITTERMIND,\
	SHADOW_GAME,\
	SUBSTITUTE,\
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
;@ learn       9, LICK
;@ learn       12, DISABLE
;@ learn       16, BITE
;@ learn       21, MIRAGE
;@ learn       23, CONFUSE_RAY
;@ learn       28, PHANTASM
;@ learn       35, FLAMETHROWER
;@ learn       44, HYPNOSIS
;@ learn       50, PSYCHIC_M
;@ learn       56, SOULSTEALER
;@ learn       60, FIRE_SPIN
