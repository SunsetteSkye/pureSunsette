DEF MAX_LEARNSET_LENGTH EQU 27

GetLearnsetPointerInHL:
	ld hl, EvosMovesPointerTable
	ld a, [wPokedexNum]
	dec a
	ld b, 0
	ld c, a
	add hl, bc
	add hl, bc
	hl_deref
	ret

; Loads level up learnset into wram, 2 bytes for each move, 1st one = level it's learned, 2nd one = which move
; due to the size of wram space, max learnset length will be 27 moves. Should be sufficient.
; presumes mon header is already loaded which we need for starting moves
LoadLevelUpLearnsetIntoWRAM:
	ld de, wLearnsetList
	; first load starting moves with level = 0 from already loaded mon header
	ld hl, wMonHMoves
	ld b, NUM_MOVES
	ld c, 0 ; c = length of learnset
.loopMonHeaderMoves
	ld a, [hli]
	cp NO_MOVE
	jr z, .doNotLoad
	inc de
	ld [de], a
	dec de
	xor a
	ld [de], a
	inc de
	inc de
	inc c
.doNotLoad
	dec b
	jr nz, .loopMonHeaderMoves
	push bc
	call GetLearnsetPointerInHL
	pop bc
	; skip past evos to learnset
.loopSkipEvos
	ld a, [hli]
	and a
	jr nz, .loopSkipEvos
	push hl
	; fall through
.getLengthLoop
	ld a, [hli]
	and a
	jr z, .doneGetLength
	inc hl
	inc c
	jr .getLengthLoop
.doneGetLength
	; b is still 0 from earlier
	pop hl
	ld a, c
	cp MAX_LEARNSET_LENGTH + 1
	ret z ; don't copy anything if the learnset is too long
	ld [wDexLearnsetListCount], a
	add a ; 2 bytes per move
	ld c, a
	rst _CopyData
	; TODO: end byte = 0?
	ret
	
; Sunsette: the Viridian Move Relearner uses this instead of LoadLevelUpLearnsetIntoWRAM so a
; stone (or other) evolution can also recall moves from its previous evolution(s). It loads the
; current mon's learnset as usual, then walks back through the evolution chain and appends every
; pre-evolution's base/level-up moves, skipping move ids already present. The shared filter in
; move_relearner.asm still drops over-level / already-known moves afterwards.
; Caller contract (same as LoadLevelUpLearnsetIntoWRAM): wCurSpecies = current mon's internal id,
; its header loaded, wPokedexNum = wCurSpecies, wDexLearnsetListCount pre-zeroed.
DEF MAX_RELEARN_RAW EQU 27 ; 2*27 = 54 bytes, fits wLearnsetList (56) before filtering

LoadLearnsetWithPreEvosIntoWRAM::
	call LoadLevelUpLearnsetIntoWRAM ; current mon -> wLearnsetList raw [level, move] pairs
	ld a, [wCurSpecies]
	ld e, a ; e = species whose pre-evolution we're looking for (start: the current mon)
.chainLoop
	call RelearnerFindPreEvo ; e = target -> a = pre-evo internal id (0 if none)
	and a
	ret z ; no (more) pre-evolutions
	ld [wCurSpecies], a
	ld e, a ; next loop seeks THIS pre-evo's own pre-evolution
	push de
	call GetMonHeader ; loads the pre-evo's base moves (wMonHMoves); clobbers wPokedexNum
	ld a, [wCurSpecies]
	ld [wPokedexNum], a ; restore the internal index for GetLearnsetPointerInHL
	call RelearnerAppendSpeciesLearnset
	pop de
	jr .chainLoop

; e = target internal species id (preserved). Returns a = the internal id of the species that
; evolves into the target (and nz), or a = 0 (and z) if nothing evolves into it.
RelearnerFindPreEvo:
	ld d, 1 ; d = candidate species index (1-based)
.speciesLoop
	ld hl, EvosMovesPointerTable
	ld a, d
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	hl_deref ; hl = candidate's evos+moves block
.evoLoop
	ld a, [hl]
	and a
	jr z, .nextSpecies ; 0 = end of this candidate's evolutions
	cp EVOLVE_ITEM
	jr z, .itemEvo
	; EVOLVE_LEVEL / EVOLVE_TRADE: 3-byte entry, target species at offset 2
	inc hl
	inc hl
	ld a, [hli]
	cp e
	jr z, .found
	jr .evoLoop
.itemEvo
	; EVOLVE_ITEM: 4-byte entry (method, item, 1, species)
	inc hl
	inc hl
	inc hl
	ld a, [hli]
	cp e
	jr z, .found
	jr .evoLoop
.nextSpecies
	inc d
	ld a, d
	cp NUM_POKEMON_INDEXES + 1
	jr nz, .speciesLoop
	xor a ; not found
	ret
.found
	ld a, d
	and a ; d >= 1, so nz
	ret

; Appends the base moves (level 0) and level-up learnset of the species whose header is loaded
; (wMonHMoves) and whose internal id is in wPokedexNum to wLearnsetList, after the existing
; wDexLearnsetListCount entries. Skips move ids already present and stops at MAX_RELEARN_RAW.
RelearnerAppendSpeciesLearnset:
	ld a, [wDexLearnsetListCount]
	add a ; 2 bytes per entry
	ld e, a
	ld d, 0
	ld hl, wLearnsetList
	add hl, de
	ld d, h
	ld e, l ; de = write pointer
	; base / starting moves (level 0)
	ld hl, wMonHMoves
	ld b, NUM_MOVES
.baseLoop
	ld a, [hli]
	and a ; NO_MOVE
	jr z, .baseNext
	ld c, a ; c = move id
	xor a ; level 0
	push hl
	push bc
	call RelearnerTryAppend
	pop bc
	pop hl
.baseNext
	dec b
	jr nz, .baseLoop
	; level-up learnset (skip the evolution entries first)
	call GetLearnsetPointerInHL
.skipEvos
	ld a, [hl]
	and a
	jr z, .evosDone
	cp EVOLVE_ITEM
	jr z, .skipItemEvo
	inc hl
	inc hl
	inc hl
	jr .skipEvos
.skipItemEvo
	inc hl
	inc hl
	inc hl
	inc hl
	jr .skipEvos
.evosDone
	inc hl ; skip the db 0 terminator
.lvlLoop
	ld a, [hli] ; level
	and a
	ret z ; 0 = end of learnset
	ld c, [hl] ; move
	inc hl
	push hl
	call RelearnerTryAppend
	pop hl
	jr .lvlLoop

; a = level, c = move id, de = current write pointer. If the move isn't already present in
; wLearnsetList and we're under MAX_RELEARN_RAW, writes [level, move] at de, advances de, and
; bumps wDexLearnsetListCount. Clobbers b; leaves c (move) and de (updated) for the caller.
RelearnerTryAppend:
	push af ; save level
	ld a, [wDexLearnsetListCount]
	cp MAX_RELEARN_RAW
	jr nc, .skip ; list full
	ld b, a ; b = current count
	and a
	jr z, .write ; empty list -> definitely new
	push de
	ld hl, wLearnsetList + 1 ; first stored move byte
.scan
	ld a, [hl]
	cp c
	jr z, .present
	inc hl
	inc hl
	dec b
	jr nz, .scan
	pop de
	jr .write
.present
	pop de
.skip
	pop af
	ret
.write
	pop af ; a = level
	ld [de], a
	inc de
	ld a, c
	ld [de], a
	inc de
	ld a, [wDexLearnsetListCount]
	inc a
	ld [wDexLearnsetListCount], a
	ret

LoadEvosIntoWram:
	ld de, wLearnsetList
	call GetLearnsetPointerInHL
	ld c, 0; length of list
.getLengthLoop
	ld a, [hli]
	and a
	jr z, .doneGetLength
	ld [de], a
	inc de
	cp EVOLVE_ITEM
	ld b, 2
	jr nz, .innerLoop
	; item evos have an extra byte of data
	inc b
.innerLoop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .innerLoop
	inc c
	jr .getLengthLoop
.doneGetLength
	ld a, c
	ld [wDexLearnsetListCount], a
	ret
	
