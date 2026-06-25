	db DEX_BEEDRILL ; pokedex id

	db  60,  80,  40, 135,  50
	;   hp  atk  def  spd  spc

	db BUG, POISON ; type
	db 105 ; catch rate
	db 159 ; base exp

	INCBIN "gfx/pokemon/front/beedrill.pic", 0, 1 ; sprite dimensions
	dw BeedrillPicFront, BeedrillPicBackSW

	db POISON_STING, STRING_SHOT, HARDEN, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	tmhm \
	HONE_EDGE,\
	DISABLE,\
	SWORDS_DANCE,\
	SHADOW_GAME,\
	TOXIC,\
	SLUDGE_BOMB,\
	QUICK_ATTACK,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	MUD_BOMB,\
	DIG,\
	FINISHER,\
	DEMOLISH,\
	BULK_UP,\
	REFLECT,\
	LIGHT_SCREEN,\
	ILL_WIND,\
	SHADOW_BOX,\
	BARRIER,\
	BRAVE_BIRD,\
	THUNDER_WAVE,\
	SUBSTITUTE,\
	ADAPTATION,\
	VOID_MIND,\
	PSYCHO_SHIFT,\
	ROOST,\
	PIN_MISSILE,\
	LEECH_LIFE,\
	CLAY_ARMOR,\
	ROCK_ON,\
	CUT,\
	FLY
	; end


	db BANK(BeedrillPicFront)
	db 0
	db BANK(BeedrillPicBack)
	db BANK(BeedrillPicBackSW)

	dw 0, BeedrillPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_RAGE NATURE_SCRAPPY
;@ pal_battle   PAL_SAFFRON
;@ pal_altbattle PAL_GREENBAR
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   "Wow, and it's" "already out of" "sight! Let's go!"
;@ evo_react   "Stingers gleam," "sharp and ready!"
;@ evo_react   "Wings buzz fast" "in an angry blur!"
;@ evo_react   "It darts in," "lances flashing!"
;@ learn       12, SUPERSONIC
;@ learn       15, AGILITY
;@ learn       18, ILL_WIND
;@ learn       23, BLOOD_RUSH
;@ learn       31, AIR_DRILL
;@ learn       42, FOCUS_ENERGY
;@ learn       49, TWINEEDLE
;@ learn       55, CRYSTALLIZE
;@ learn       58, VENOM_DRILL
;@ tutor       HURRICANE
