; PureRGBnote: CHANGED: Priority moves are now stored in a list instead of hardcoded Quick Attack only.

PriorityMoves:
	db BLITZ_STRIKE
	db QUICK_ATTACK ; Sunsette: comeback - the weak early priority sibling of BLITZ STRIKE (+1 priority)
	db DISABLE ; Sunsette: priority - ONLY the DISABLE move (CUT_DISABLE moves are separate ids, not affected)
	db MACH_PUNCH ; MACH_PUNCH
	db TRANSFORM
	db ILL_WIND
	db PIN_MISSILE
	db VOID_MIND
	db EMETIC_PURGE
	db VINE_WHIP ; Sunsette: priority GRASS move with 30% -1 DEFENSE
	db COMBOBREAKER ; Sunsette: comeback - always +1 priority, but VERY inaccurate at desperation stage 0 (ComboBreakerAccuracy)
	db -1 ; end

FarCheckPriority:
; The AI only ever checks its own (enemy) mon's move, so the user is the enemy mon.
	ld a, [wEnemyMonSpecies] ; Sunsette: user species, for species-gated priority (Ekans-line ACID)
	ld b, a
	ld c, d
; in:  c = move about to be used, b = the user's species
; out: carry set if the move should strike first this turn
CheckPriority:
	push hl
	ld hl, PriorityMoves         ; table of unconditional priority moves
.priorityLoop
	ld a, [hli]                  ; read move from move table
	cp -1                        ; did we reach the end of the list
	jr z, .checkSignaturePriority ; if so, fall back to species-signature priorities
	cp c                         ; does it match the move about to be used?
	jr nz, .priorityLoop         ; continue as a normal move if not
	; if so, the move about to be used is a priority move
.foundPriority
	scf
	jr .done
;;;;;;;;;; Sunsette: ADDED: priority moves that only apply to a specific user species, so the
;;;;;;;;;; signature stays legible (a generic user of the same move doesn't get the priority).
; The Ekans line's ACID strikes first, a quick venom spit; ACID from any other species stays normal speed.
.checkSignaturePriority
	ld a, c
	cp ACID
	jr nz, .noPriority
	; Sunsette: obey the MOVE MYSTIC's "signatures off" world option, like every other signature.
	CheckEvent FLAG_SIGNATURE_MOVES_TURNED_OFF
	jr nz, .noPriority ; signatures globally disabled -> ACID acts at normal speed
	ld a, b
	cp EKANS
	jr z, .foundSignature
	cp ARBOK
	jr nz, .noPriority
.foundSignature
	scf
	jr .done
;;;;;;;;;;
.noPriority
	and a ; clear carry
.done
	pop hl
	ret
