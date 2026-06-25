	db DEX_SHELLDER ; pokedex id

	db  30,  65, 100,  40,  45
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 190 ; catch rate
	db 97 ; base exp

	INCBIN "gfx/pokemon/front/shellder.pic", 0, 1 ; sprite dimensions
	dw ShellderPicFront, ShellderPicBackSW

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
	SHADOW_GAME,\
	ROCK_SLIDE,\
	SUBSTITUTE,\
	SURF,\
	STRENGTH,\
	FLASH
	; end


	db BANK(ShellderPicFront)
	db 0
	db BANK(ShellderPicBack)
	db BANK(ShellderPicBackSW)

	dw 0, ShellderPicBack

; --- Sunsette SSOT directives (parsed by tools/gen_pokemon_data.py) ---
;@ nature       NATURE_CAUTIOUS NATURE_CRUEL
;@ pal_battle   PAL_LAVENDERMON
;@ pal_altbattle PAL_IVORYMON
;@ pal_icon     $FF
;@ pal_alticon  $FF
;@ evo         EVOLVE_ITEM, WATER_STONE, 1, CLOYSTER
;@ evo_move    NO_MOVE
;@ evo_react   NONE
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
