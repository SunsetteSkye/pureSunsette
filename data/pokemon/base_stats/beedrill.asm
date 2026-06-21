	db DEX_BEEDRILL ; pokedex id

	db  60,  80,  40, 135,  60
	;   hp  atk  def  spd  spc

	db BUG, POISON ; type
	db 105 ; catch rate
	db 159 ; base exp

	INCBIN "gfx/pokemon/front/beedrill.pic", 0, 1 ; sprite dimensions
	dw BeedrillPicFront, BeedrillPicBackSW

	db POISON_STING, STRING_SHOT, HARDEN, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	tmhm \
	ADAPTATION,\
	ROOST,\
	MUD_BOMB,\
	PIN_MISSILE,\
	TOXIC,\
	HONE_EDGE,\
	DISABLE,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	CALM_MIND,\
	BARRIER,\
	SOLARBEAM,\ 
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BULK_UP,\
	ILL_WIND,\
	SHADOW_BALL,\
	DEMOLISH,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	SHADOW_GAME,\
	ROCK_ON,\
	SUBSTITUTE,\
	CLAY_ARMOR,\
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
;@ learn       10, PIN_MISSILE
;@ learn       10, SUPERSONIC
;@ learn       14, FOCUS_ENERGY
;@ learn       17, ILL_WIND
;@ learn       22, BLOOD_RUSH
;@ learn       25, OUTRAGE
;@ learn       30, AGILITY
;@ learn       35, TWINEEDLE
;@ learn       40, AIR_DRILL
;@ learn       47, VENOM_DRILL
;@ learn       50, CRYSTALLIZE
