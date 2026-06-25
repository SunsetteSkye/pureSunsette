	db DEX_CLOYSTER ; pokedex id

	db  50,  95, 180,  70,  85
	;   hp  atk  def  spd  spc

	db WATER, ICE ; type
	db 70 ; catch rate
	db 203 ; base exp

	INCBIN "gfx/pokemon/front/cloyster.pic", 0, 1 ; sprite dimensions
	dw CloysterPicFront, CloysterPicBackSW

	db TACKLE, SUPER_SOAK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	LEAP_ATTACK,\
	MUD_BOMB,\
	TOXIC,\
	HONE_EDGE,\
	BODY_SLAM,\
	DISABLE,\
	DOUBLE_EDGE,\
	AQUA_RING,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	CALM_MIND,\
	BARRIER,\
	EARTHQUAKE,\
	RIPTIDE,\
	DIG,\
	REFLECT,\
	BULK_UP,\
	SHADOW_BALL,\
	TEMPEST,\
	LIGHT_SCREEN,\
	ROCK_SLIDE,\
	SUBSTITUTE,\
	SURF,\
	STRENGTH,\
	FLASH
	; end

	db BANK(CloysterPicFront)
	db BANK(CloysterPicFrontAlt)
	db BANK(CloysterPicBack)
	db BANK(CloysterPicBackSW)

	dw CloysterPicFrontAlt, CloysterPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CAUTIOUS NATURE_CRUEL
;@ pal_battle   PAL_GRAYMON
;@ pal_altbattle PAL_PEWTER
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo_move    NO_MOVE
;@ evo_react   "Its shell clamps" "shut with a slam!"
;@ evo_react   "It fires a spike" "with a clack!"
;@ evo_react   "Its shell gleams," "hard as steel!"
;@ evo_react   "It spins, spikes" "bristling out!"
;@ learn       18, POWER_BIND
;@ learn       23, SHELL_GAME
;@ learn       28, AURORA_BEAM
;@ learn       32, CLAMP
;@ learn       36, UNDERBUG
;@ learn       45, ICE_BEAM
;@ learn       52, VENOM_DRILL
;@ learn       56, SPIKE_CANNON
;@ tutor       EXPLOSION
;@ tutor       TELEPORT
;@ tutor       METEOR_DRIVE
;@ tutor       SWIFT
;@ tutor       EGG_BOMB
;@ tutor       SCREECH
