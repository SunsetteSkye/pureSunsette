	db DEX_KINGLER ; pokedex id

	db  75, 130, 115,  75,  50
	;   hp  atk  def  spd  spc

	db WATER, GROUND ; type
	db 60 ; catch rate
	db 206 ; base exp

	INCBIN "gfx/pokemon/front/kingler.pic", 0, 1 ; sprite dimensions
	dw KinglerPicFront, KinglerPicBackSW

	db SCRATCH, BUBBLE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	ADAPTATION,\
	MUD_BOMB,\
	PIN_MISSILE,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AQUA_RING,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	LOW_KICK,\
	METEOR_SWEEP,\
	BARRIER,\
	EARTHQUAKE,\
	DIG,\
	SWORDS_DANCE,\
	BULK_UP,\
	SHADOW_BALL,\
	DEMOLISH,\
	ROCK_SLIDE,\
	ROCK_ON,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	STRENGTH,\
	FLASH
	; end

	db BANK(KinglerPicFront)
	db 0
	db BANK(KinglerPicBack)
	db BANK(KinglerPicBackSW)

	dw 0, KinglerPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_SCRAPPY NATURE_CAUTIOUS
;@ pal_battle   PAL_REDMON
;@ pal_altbattle PAL_KELPMON
;@ pal_icon     PAL_ICON_04
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   "It snaps its" "huge claw wide!"
;@ evo_react   "It drums its claw" "with a loud snap!"
;@ evo_react   "It scuttles fast," "claw held high!"
;@ evo_react   "It blasts bubbles" "from its pincer!"
;@ learn       14, MUD_CLAW
;@ learn       17, AGILITY
;@ learn       19, SUPER_SOAK
;@ learn       22, UNDERBUG
;@ learn       26, MUD_BOMB
;@ learn       30, SLASH
;@ learn       35, CRABHAMMER
;@ learn       39, EXTERMINATE
;@ learn       44, EARTHQUAKE
;@ learn       50, SPIKE_CANNON
