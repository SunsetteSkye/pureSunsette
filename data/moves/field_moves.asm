FieldMoveDisplayData:
	; move id, FieldMoveNames index, leftmost tile
	; (leftmost tile = -1 + tile column in which the first
	;  letter of the move's name should be displayed)
	db CUT,        1, $0C
	db FLY,        2, $0C
	db SURF,       3, $0C
	db STRENGTH,   4, $0A
	db FLASH,      5, $0C
	db DIG,        6, $0C
	db TELEPORT,   7, $0A
	db SOFTBOILED, 8, $08
	db CONFUSE_RAY, 9, $07 ; Sunsette: ADDED: arms next wild encounter to use its alt palette
	; Sunsette: GROWTH (FLOURISH) + SAND_ATTACK lost their field-move status; the invert-rarity effect moved
	; to METRONOME/SING/HYPNOSIS (below), and grass already covers the Repel-hiding effect via the powders.
	; (FieldMoveNames index 10 = "GROWTH@" and 12 = "SAND-ATTACK@" are now dead - left in place so the other
	;  indices stay aligned with .outOfBattleMovePointers.)
	db FLAMETHROWER, 11, $06 ; Sunsette: ADDED: burns down all on-screen grass and trees (Cascade Badge)
	db AURORA_MIST,        13, $0E ; Sunsette: ADDED: hides you from wild encounters like a Repel (ETHEREAL)
	db SHADOW_GAME,        14, $0E ; Sunsette: ADDED: hides you from wild encounters like a Repel (BLACK HAZE)
	db SMOKESCREEN, 15, $07 ; Sunsette: ADDED: hides you from wild encounters like a Repel
	db POISONPOWDER, 16, $06 ; Sunsette: ADDED: hides you from wild encounters like a Repel
	db SLEEP_POWDER, 17, $06 ; Sunsette: ADDED: hides you from wild encounters like a Repel
	db STUN_SPORE,   18, $08 ; Sunsette: ADDED: hides you from wild encounters like a Repel
	db SPORE,        19, $0D ; Sunsette: ADDED: hides you from wild encounters like a Repel
	db SMOG,         20, $0E ; Sunsette: ADDED: hides you from wild encounters like a Repel
	; Sunsette: ADDED: METRONOME / SING / HYPNOSIS all invert wild-encounter rarity until you change maps
	; (rare<->common), the effect formerly on GROWTH. All three route to the shared .mystic handler.
	db METRONOME,   21, $09
	db SING,        22, $0E
	db HYPNOSIS,    23, $0A
	db -1 ; end
