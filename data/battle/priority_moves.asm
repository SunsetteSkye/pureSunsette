; PureRGBnote: CHANGED: Priority moves are now stored in a list instead of hardcoded Quick Attack only.

PriorityMoves:
	db BLITZ_STRIKE
	db QUICK_ATTACK ; Sunsette: comeback - the weak early priority sibling of BLITZ STRIKE (+1 priority)
	db DISABLE ; Sunsette: priority - ONLY the DISABLE move (CUT_DISABLE moves are separate ids, not affected)
	db MACH_PUNCH ; MACH_PUNCH
	db TRANSFORM
	db ILL_WIND
	db PIN_MISSILE
	db EMETIC_PURGE
	db VINE_WHIP ; Sunsette: priority GRASS move with 30% -1 DEFENSE
	db COMBOBREAKER ; Sunsette: comeback - always +1 priority, but VERY inaccurate at desperation stage 0 (ComboBreakerAccuracy)
	db -1 ; end

FarCheckPriority:
; The AI only ever checks its own (enemy) mon's move, so the user is the enemy mon.
	ld a, [wEnemyMonSpecies] ; Sunsette: user species, for species-gated priority (Ekans-line ACID)
	ld b, a
	ld c, d
	ld d, 1 ; Sunsette: the AI user is always the enemy -> side 1 (for the BUG red-HP priority check)
; in:  c = move about to be used, b = the user's species, d = the user's side (0 player / 1 enemy)
; out: carry set if the move should strike first this turn
CheckPriority:
	push hl
	ld hl, PriorityMoves         ; table of unconditional priority moves
.priorityLoop
	ld a, [hli]                  ; read move from move table
	cp -1                        ; did we reach the end of the list
	jr z, .noPriority            ; Sunsette: BUG red-HP priority retired (Bug passive is now the "relentless swarm")
	cp c                         ; does it match the move about to be used?
	jr nz, .priorityLoop         ; continue as a normal move if not
	; if so, the move about to be used is a priority move
.foundPriority
	scf
	jr .done
.noPriority
	and a ; clear carry
.done
	pop hl
	ret
