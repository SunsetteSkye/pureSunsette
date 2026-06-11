; PureRGBnote: CHANGED: Priority moves are now stored in a list instead of hardcoded Quick Attack only.

PriorityMoves:
	db QUICK_ATTACK
	db POUND ; Sunsette: JOLT BOLT - priority ELECTRIC move
	db COMET_PUNCH
	db FLASH
	db TRANSFORM
	db MIRROR_MOVE ; MOCKINGBIRD
	db SONICBOOM
	db PIN_MISSILE
	db MEDITATE
	db POISON_GAS ; MIASMA
	db HAZE ; Sunsette: Haze is now a priority move with a 30% flinch (BLACK HAZE)
	db -1 ; end

FarCheckPriority:
	ld c, d
; returns with c set if move in c is a priority move
CheckPriority:
	push hl
	ld hl, PriorityMoves         ; table of high priority moves
.priorityLoop
	ld a, [hli]                  ; read move from move table
	cp -1                        ; did we reach the end of the list
	jr z, .noPriority            ; if so, not a priority move
	cp c                         ; does it match the move about to be used?
	jr nz, .priorityLoop         ; continue as a normal move if not
	; if so, the move about to be used is a priority move
.foundPriority 
	scf
.noPriority
	pop hl
	ret
