; try to evolve the mon in [wWhichPokemon]
TryEvolvingMon:
	ld hl, wCanEvolveFlags
	xor a
	ld [hl], a
	ld a, [wWhichPokemon]
	ld c, a
	ld b, FLAG_SET
	call Evolution_FlagAction

; this is only called after battle
; it is supposed to do level up evolutions, though there is a bug that allows item evolutions to occur
EvolutionAfterBattle:
	ldh a, [hTileAnimations]
	push af
	xor a
	ld [wEvolutionOccurred], a
	dec a
	ld [wWhichPokemon], a
	push hl
	push bc
	push de
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; shinpokerednote: FIXED: We keep a pointer to the current PKMN's Level at the Beginning of the Battle. Helps fix the evolution move learn skip bug.
	ld hl, wStartBattleLevels
	push hl
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ld hl, wPartyCount
	push hl

Evolution_PartyMonLoop: ; loop over party mons
	ld hl, wWhichPokemon
	inc [hl]
	pop hl
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; shinpokerednote: FIXED: We store current PKMN' Level at the Beginning of the Battle
; to a chosen memory address in order to be compared later with the evolution requirements.
	pop de
	ld a, [de]
	ld [wTempLevelStore], a
	inc de
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	inc hl
	ld a, [hl]
	cp $ff ; have we reached the end of the party?
	jp z, .done
	ld [wEvoOldSpecies], a
	push de; shinpokerednote: FIXED If we are not done we need to push the pointer for the next iteration. (next index of wStartBattleLevels)
	push hl
	ld a, [wWhichPokemon]
	ld c, a
	ld hl, wCanEvolveFlags
	ld b, FLAG_TEST
	call Evolution_FlagAction
	ld a, c
	and a ; is the mon's bit set?
	jp z, Evolution_PartyMonLoop ; if not, go to the next mon
	ld a, [wEvoOldSpecies]
	dec a
	ld b, 0
	ld hl, EvosMovesPointerTable
	add a
	rl b
	ld c, a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld a, [wcf91]
	push af
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a
	call LoadMonData
	pop af
	ld [wcf91], a
	pop hl

.evoEntryLoop ; loop over evolution entries
	ld a, [hli]
	and a ; have we reached the end of the evolution data?
	jr z, Evolution_PartyMonLoop
	ld b, a ; evolution type
	cp EV_TRADE
	jr z, .checkTradeEvo
; not trade evolution
	ld a, [wLinkState]
	cp LINK_STATE_TRADING
	jr z, Evolution_PartyMonLoop ; if trading, go the next mon
	ld a, b
	cp EV_ITEM
	jr z, .checkItemEvo
	ld a, [wForceEvolution]
	and a
	jr nz, Evolution_PartyMonLoop
	ld a, b
	cp EV_LEVEL
	jr z, .checkLevel
.checkTradeEvo
	ld a, [wLinkState]
	cp LINK_STATE_TRADING
	jp nz, .nextEvoEntry1 ; if not trading, go to the next evolution entry
	ld a, [hli] ; level requirement
	ld b, a
	ld a, [wLoadedMonLevel]
	cp b ; is the mon's level greater than the evolution requirement?
	jp c, Evolution_PartyMonLoop ; if so, go the next mon
	jr .doEvolution
.checkItemEvo
;;;;;;;;;; shinpokerednote: FIXED: skip checking stone evolutions if in battle to avoid the exploit with species numbers allowing stone evolution after battle.
	ld a, [wIsInBattle] 
	and a
	ld a, [hli]
	jp nz, .nextEvoEntry1
;;;;;;;;;;
	ld b, a ; evolution item
	ld a, [wcf91] ; BUG *fixed above*: this is supposed to be the last item used, but it is also used to hold species numbers
	cp b ; was the evolution item in this entry used?
	jp nz, .nextEvoEntry1 ; if not, go to the next evolution entry
.checkLevel
	ld a, [hli] ; level requirement
	ld b, a
	ld a, [wLoadedMonLevel]
	cp b ; is the mon's level greater than the evolution requirement?
	jp c, .nextEvoEntry2 ; if so, go the next evolution entry
.doEvolution
	ld [wCurEnemyLVL], a
	ld a, 1
	ld [wEvolutionOccurred], a
;;;;;;;;;; shinpokerednote: FIXED: skipping evolution learned moves if levelled up a non-evolved pokemon multiple times then evolving
	ld a, [wTempLevelStore]
	cp b
	jp nc, .evoLevelRequirementSatisfied
	ld a, b
	ld [wTempLevelStore], a
.evoLevelRequirementSatisfied
;;;;;;;;;;
	push hl
	ld a, [hl]
	ld [wEvoNewSpecies], a
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	call CopyToStringBuffer
	ld hl, IsEvolvingText
	rst _PrintText
	ld c, 50
	rst _DelayFrames
	xor a
	ldh [hAutoBGTransferEnabled], a
	hlcoord 0, 0
	lb bc, 12, 20
	call ClearScreenArea
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	ld a, $ff
	ld [wUpdateSpritesEnabled], a
	call ClearSprites
	callfar EvolveMon
	jp c, CancelledEvolution
	ld hl, EvolvedText
	rst _PrintText
	pop hl
	ld a, [hl]
	ld [wd0b5], a
	ld [wLoadedMonSpecies], a
	ld [wEvoNewSpecies], a
	ld a, MONSTER_NAME
	ld [wNameListType], a
	ld a, BANK(TrainerNames) ; bank is not used for monster names
	ld [wPredefBank], a
	call GetName
	push hl
	ld hl, IntoText
	call PrintText_NoCreatingTextBox
	ld a, SFX_GET_ITEM_2
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	ld c, 40
	rst _DelayFrames
	call ClearScreen
	call RenameEvolvedMon
	ld a, [wd11e]
	push af
	ld a, [wd0b5]
	ld [wd11e], a
	predef IndexToPokedex
;;;;;;;;;; FIXME: ? code that requires BaseStats to be in the same bank as evos_moves
	ld a, [wd11e]
	; missingno or mew can't evolve so this is never reached for them and their base stats aren't important here
	dec a
	ld hl, BaseStats
	ld bc, BASE_DATA_SIZE
	call AddNTimes
	ld de, wMonHeader
	rst _CopyData
;;;;;;;;;;
	ld a, [wd0b5]
	ld [wMonHIndex], a
	pop af
	ld [wd11e], a
	ld hl, wLoadedMonHPExp - 1
	ld de, wLoadedMonStats
	ld b, $1
	call CalcStats
	ld a, [wWhichPokemon]
	ld hl, wPartyMon1
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	ld e, l
	ld d, h
	push hl
	push bc
	ld bc, wPartyMon1MaxHP - wPartyMon1
	add hl, bc
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wLoadedMonMaxHP + 1
	ld a, [hld]
	sub c
	ld c, a
	ld a, [hl]
	sbc b
	ld b, a
	ld hl, wLoadedMonHP + 1
	ld a, [hl]
	add c
	ld [hld], a
	ld a, [hl]
	adc b
	ld [hld], a
	pop bc
	rst _CopyData
	ld a, [wd0b5]
	ld [wd11e], a
	xor a
	ld [wMonDataLocation], a
	call EeveelutionForceLearnMove ; PureRGBnote: ADDED: Force eeveelutions to learn a move on evolution
;;;;;;;;;; shinpokerednote: FIXED: fixing skip move-learn on level-up evolution
	ld a, [wIsInBattle]
	and a
	jr z, .notinbattle
	push bc
	
	ld a, [wCurEnemyLVL]	; load the final level into a.
	ld c, a	; load the final level to over to c
	ld a, [wTempLevelStore]	; load the evolution level into a
	ld b, a	; load the evolution level over to b
	dec b
.inc_level	; marker for looping back 
	inc b	;increment 	the current evolution level
	ld a, b	;put the evolution level in a
	ld [wCurEnemyLVL], a	;and reset the final level to the evolution level
	push bc	;save b & c on the stack as they hold the currently tracked evolution level a true final level
	call LearnMoveFromLevelUp
	pop bc	;get the current evolution and final level values back from the stack
	ld a, b	;load the current evolution level into a
	cp c	;compare it with the final level
	jr nz, .inc_level	;loop back again if final level has not been reached
	
	pop bc
	jr .skipfix_end
.notinbattle
	call LearnMoveFromLevelUp
.skipfix_end
;;;;;;;;;;
	pop hl
	predef SetPartyMonTypes
	ld a, [wIsInBattle]
	and a
	call z, Evolution_ReloadTilesetTilePatterns
	predef IndexToPokedex
	ld a, [wd11e]
	; missingno or mew can't evolve so this is never reached for them and their base stats aren't important here
	dec a
	ld c, a
	ld b, FLAG_SET
	ld hl, wPokedexOwned
	push bc
	call Evolution_FlagAction
	pop bc
	ld hl, wPokedexSeen
	call Evolution_FlagAction
	pop de
	pop hl
	ld a, [wLoadedMonSpecies]
	ld [hl], a
	push hl
	ld l, e
	ld h, d
	jr .nextEvoEntry2

.nextEvoEntry1
	inc hl

.nextEvoEntry2
	inc hl
	jp .evoEntryLoop

.done
	pop de
	pop bc
	pop hl
	pop af
	ldh [hTileAnimations], a
	ld a, [wLinkState]
	cp LINK_STATE_TRADING
	ret z
	ld a, [wIsInBattle]
	and a
	ret nz
	ld a, [wEvolutionOccurred]
	and a
	call nz, PlayDefaultMusic
	ret

RenameEvolvedMon:
; Renames the mon to its new, evolved form's standard name unless it had a
; nickname, in which case the nickname is kept.
	ld a, [wd0b5]
	push af
	ld a, [wMonHIndex]
	ld [wd0b5], a
	call GetName
	pop af
	ld [wd0b5], a
	ld hl, wcd6d
	ld de, wStringBuffer
.compareNamesLoop
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	ret nz
	cp "@"
	jr nz, .compareNamesLoop
	ld a, [wWhichPokemon]
	ld bc, NAME_LENGTH
	ld hl, wPartyMonNicks
	call AddNTimes
	push hl
	call GetName
	ld hl, wcd6d
	pop de
	jp CopyData

CancelledEvolution:
	ld hl, StoppedEvolvingText
	rst _PrintText
	call ClearScreen
	pop hl
	call Evolution_ReloadTilesetTilePatterns
	jp Evolution_PartyMonLoop

EvolvedText:
	text_far _EvolvedText
	text_end

IntoText:
	text_far _IntoText
	text_end

StoppedEvolvingText:
	text_far _StoppedEvolvingText
	text_end

IsEvolvingText:
	text_far _IsEvolvingText
	text_end

Evolution_ReloadTilesetTilePatterns:
	ld a, [wLinkState]
	cp LINK_STATE_TRADING
	ret z
	jp ReloadTilesetTilePatterns

; shinpokerednote: FIXED: supports learning multiple moves at the same level
LearnMoveFromLevelUp: 
	ld hl, EvosMovesPointerTable
	ld a, [wd11e] ; species
	ld [wcf91], a
	dec a
	ld bc, 0
	ld hl, EvosMovesPointerTable
	add a
	rl b
	ld c, a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
.skipEvolutionDataLoop ; loop to skip past the evolution data, which comes before the move data
	ld a, [hli]
	and a ; have we reached the end of the evolution data?
	jr nz, .skipEvolutionDataLoop ; if not, jump back up
.learnSetLoop ; loop over the learn set until we reach a move that is learnt at the current level or the end of the list
	ld a, [hli]
	and a ; have we reached the end of the learn set?
	jr z, .done ; if we've reached the end of the learn set, jump
	ld b, a ; level the move is learnt at
	ld a, [wCurEnemyLVL]
	cp b ; is the move learnt at the mon's current level?
	ld a, [hli] ; move ID
	jr nz, .learnSetLoop
	
;the move can indeed be learned at this level
.confirmlearnmove
	push hl	
	ld d, a ; ID of move to learn
	ld a, [wMonDataLocation]
	and a
	jr nz, .next
; If [wMonDataLocation] is 0 (PLAYER_PARTY_DATA), get the address of the mon's
; current moves in party data. Every call to this function sets
; [wMonDataLocation] to 0 because other data locations are not supported.
; If it is not 0, this function will not work properly.
	ld hl, wPartyMon1Moves
	ld a, [wWhichPokemon]
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
.next
	ld b, NUM_MOVES
.checkCurrentMovesLoop ; check if the move to learn is already known
	ld a, [hli]
	cp d
	jr z, .movesloop_done ; if already known, jump
	dec b
	jr nz, .checkCurrentMovesLoop
	ld a, d
	ld [wMoveNum], a
	ld [wd11e], a
	call GetMoveName
	call CopyToStringBuffer
	predef LearnMove
.movesloop_done
	pop hl
	jr .learnSetLoop
	
	
.done
	ld a, [wcf91]
	ld [wd11e], a
	ret

; PureRGBnote: ADDED: used to force the eeveelutions to learn a specific move on evolution so this move cannot be missed
EeveelutionForceLearnMove:
	push bc
	ld a, [wd11e] ; species
	cp FLAREON
	ld b, EMBER
	jr z, .forceLearnMove
	cp JOLTEON
	ld b, THUNDERSHOCK
	jr z, .forceLearnMove
	cp VAPOREON
	ld b, WATER_GUN
	jr nz, .done
.forceLearnMove
	push af ; put species number on the stack
	ld a, b
	push hl	
	push de
	ld [wMoveNum], a
	ld [wd11e], a
	call GetMoveName
	call CopyToStringBuffer
	predef LearnMove
	pop de
	pop hl
	pop af ; retrieve species number from the stack
	ld [wd11e], a
.done
	pop bc
	ret


; writes the moves a mon has at level [wCurEnemyLVL] to [de]
; move slots are being filled up sequentially and shifted if all slots are full
WriteMonMoves:
	call GetPredefRegisters
	push hl
	push de
	push bc
	ld hl, EvosMovesPointerTable
	ld b, 0
	ld a, [wcf91]  ; cur mon ID
	dec a
	add a
	rl b
	ld c, a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
.skipEvoEntriesLoop
	ld a, [hli]
	and a
	jr nz, .skipEvoEntriesLoop
	jr .firstMove
.nextMove
	pop de
.nextMove2
	inc hl
.firstMove
	ld a, [hli]       ; read level of next move in learnset
	and a
	jp z, .done       ; end of list
	ld b, a
	ld a, [wCurEnemyLVL]
	cp b
	jp c, .done       ; mon level < move level (assumption: learnset is sorted by level)
	ld a, [wLearningMovesFromDayCare]
	and a
	jr z, .skipMinLevelCheck
	ld a, [wDayCareStartLevel]
	cp b
	jr nc, .nextMove2 ; min level >= move level

.skipMinLevelCheck

; check if the move is already known
	push de
	ld c, NUM_MOVES
.alreadyKnowsCheckLoop
	ld a, [de]
	inc de
	cp [hl]
	jr z, .nextMove
	dec c
	jr nz, .alreadyKnowsCheckLoop

; try to find an empty move slot
	pop de
	push de
	ld c, NUM_MOVES
.findEmptySlotLoop
	ld a, [de]
	and a
	jr z, .writeMoveToSlot2
	inc de
	dec c
	jr nz, .findEmptySlotLoop

; no empty move slots found
	pop de
	push de
	push hl
	ld h, d
	ld l, e
	call WriteMonMoves_ShiftMoveData ; shift all moves one up (deleting move 1)
	ld a, [wLearningMovesFromDayCare]
	and a
	jr z, .writeMoveToSlot

; shift PP as well if learning moves from day care
	push de
	ld bc, wPartyMon1PP - (wPartyMon1Moves + 3)
	add hl, bc
	ld d, h
	ld e, l
	call WriteMonMoves_ShiftMoveData ; shift all move PP data one up
	pop de

.writeMoveToSlot
	pop hl
.writeMoveToSlot2
	ld a, [hl]
	ld [de], a
	ld a, [wLearningMovesFromDayCare]
	and a
	jr z, .nextMove

; write move PP value if learning moves from day care
	push hl
	ld a, [hl]
	ld hl, wPartyMon1PP - wPartyMon1Moves
	add hl, de
	push hl
	dec a
	ld hl, Moves
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld de, wBuffer
	ld a, BANK(Moves)
	call FarCopyData
	ld a, [wBuffer + 5]
	pop hl
	ld [hl], a
	pop hl
	jr .nextMove

.done
	pop bc
	pop de
	pop hl
	ret

; shifts all move data one up (freeing 4th move slot)
WriteMonMoves_ShiftMoveData:
	ld c, NUM_MOVES - 1
.loop
	inc de
	ld a, [de]
	ld [hli], a
	dec c
	jr nz, .loop
	ret

Evolution_FlagAction:
	predef_jump FlagActionPredef

INCLUDE "data/pokemon/evos_moves.asm"
