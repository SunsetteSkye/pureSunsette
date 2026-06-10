; Sunsette: the Viridian Schoolhouse B1F left teacher becomes a Move Relearner once
; the player owns the MOVEDEX and has at least 2 badges. He can re-teach a party mon any
; move it could learn by level-up (or one of its base moves) that it doesn't currently know,
; AS LONG AS that move's learn level is no higher than the mon's current level.
; Cost = 100 Yen per level the move is learned at (base moves count as level 1).

MoveRelearnerScript::
	call SaveScreenTilesToBuffer2
	ld hl, RelearnerIntroText
	rst _PrintText
	; choose the mon to relearn a move for
	callfar GenericShowPartyMenuSelection
	jp c, .return ; party menu cancelled
	; load the chosen mon's header + level-up learnset
	ld a, [wWhichPokemon]
	ld hl, wPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl] ; a = internal species index
	ld [wCurSpecies], a
	call GetMonHeader ; loads wMonHMoves (the base moves) for the learnset loader
	ld a, [wCurSpecies]
	ld [wPokedexNum], a ; GetLearnsetPointerInHL indexes EvosMovesPointerTable by this
	; record the mon's current level (cap for relearnable moves)
	ld a, [wWhichPokemon]
	ld hl, wPartyMon1Level
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	ld [wRelearnerLevel], a
	; load [level, move] pairs into wLearnsetList, count into wDexLearnsetListCount
	xor a
	ld [wDexLearnsetListCount], a ; in case the loader bails on an over-long learnset
	callfar LoadLevelUpLearnsetIntoWRAM
	call RelearnerFilterLearnset ; compact wLearnsetList to relearnable entries; wDexLearnsetListCount = kept
	ld a, [wDexLearnsetListCount]
	and a
	jr nz, .haveMoves
	ld hl, RelearnerNoMovesText
	rst _PrintText
	jp .return
.haveMoves
	call RelearnerBuildMenuList ; build the count-prefixed move-id list for the list menu
	xor a
	ld [wCurrentMenuItem], a
	ld [wListScrollOffset], a
	ld [wPrintItemPrices], a
	ld [wListMenuHoverTextType], a
	ld a, MOVESLISTMENU
	ld [wListMenuID], a
	call DisplayListMenuID
	jp c, .return ; move list cancelled
	; wCurListMenuItem = chosen move, wWhichPokemon = chosen index in our list
	ld a, [wCurListMenuItem]
	ld [wRelearnerMove], a
	; look up that entry's learn level (still stored in the [level, move] pairs at the front)
	ld a, [wWhichPokemon]
	call RelearnerPtrFromIndex ; hl = wLearnsetList + 2*index
	ld a, [hl] ; learn level (0 = base move)
	and a
	jr nz, .haveCostLevel
	inc a ; base move -> charge as level 1
.haveCostLevel
	call RelearnerSetCost ; a (1..100) -> hMoney as level*100 in BCD
	; show cost + confirm
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld hl, RelearnerCostText
	rst _PrintText
	xor a
	ld [wCurrentMenuItem], a
	call YesNoChoice
	jp nz, .return ; declined to pay
	; enough money?
	ld de, wPlayerMoney
	ld hl, hMoney
	ld c, 3
	call StringCmp
	jr nc, .enough
	ld hl, RelearnerNotEnoughText
	rst _PrintText
	jp .return
.enough
	; restore the party mon index (the list menu used wWhichPokemon for its own cursor)
	ld a, [wRelearnerPartyIndex]
	ld [wWhichPokemon], a
	ld a, [wRelearnerMove]
	ld d, a
	callfar FarLearnArbitraryMove ; d in = move; d out = 1 if actually taught
	push de
	call LoadScreenTilesFromBuffer2
	call UpdateSprites
	pop de
	ld a, d
	cp 1
	jr nz, .farewell ; mon didn't end up learning it (player backed out of forgetting) -> no charge
	; charge the player
	call Delay3
	call SubtractAmountPaidFromMoney
	ld a, SFX_PURCHASE
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
.farewell
	ld hl, RelearnerFarewellText
	rst _PrintText
	ret
.return
	call LoadScreenTilesFromBuffer2
	call UpdateSprites
	jr .farewell

; Compact wLearnsetList (2-byte [level, move] entries, count in wDexLearnsetListCount) in place,
; keeping only entries whose level <= the mon's current level, that the mon doesn't already know,
; and that aren't a duplicate of one we've already kept. New count -> wDexLearnsetListCount.
; Also saves the selected party index into wRelearnerPartyIndex for later.
RelearnerFilterLearnset:
	ld a, [wWhichPokemon]
	ld [wRelearnerPartyIndex], a
	ld a, [wDexLearnsetListCount]
	ld b, a ; b = source entry count
	ld c, 0 ; c = kept entry count
	ld e, 0 ; e = source index
.loop
	ld a, e
	cp b
	jr z, .done
	call RelearnerReadPtr ; hl = wLearnsetList + 2*e
	ld a, [hli] ; entry level
	ld d, a
	ld a, [wRelearnerLevel] ; mon's current level
	cp d ; carry if currentLevel < entryLevel
	jr c, .next ; learns too high -> skip
	ld a, [hl] ; entry move
	ld d, a ; d = candidate move (helpers read d)
	push bc
	push de
	call RelearnerMonKnowsMove ; z if already known
	pop de
	pop bc
	jr z, .next
	push bc
	push de
	call RelearnerListHasMove ; d = move, c = kept count; z if duplicate
	pop de
	pop bc
	jr z, .next
	; keep it: write [entryLevel, move] to wLearnsetList + 2*c
	push de ; d = move, e = source index
	ld a, c
	call RelearnerPtrFromIndex ; hl = write slot
	pop de
	push hl ; write slot
	push de
	call RelearnerReadPtr ; hl = read slot (from e)
	ld a, [hl] ; entry level
	pop de ; d = move
	pop hl ; write slot
	ld [hli], a ; level
	ld [hl], d ; move
	inc c
.next
	inc e
	jr .loop
.done
	ld a, c
	ld [wDexLearnsetListCount], a
	ret

; Build the list-menu input for MOVESLISTMENU at wLearnsetList + 2*K (right after the kept
; [level, move] pairs, which we keep around for the post-selection level lookup):
;   [count][move 0]...[move K-1][$FF]
; K = wDexLearnsetListCount. Sets wListPointer to this list.
RelearnerBuildMenuList:
	ld a, [wDexLearnsetListCount]
	ld b, a ; b = K
	add a ; 2*K
	call RelearnerPtrFromIndexA ; hl = wLearnsetList + 2*K (a already doubled, so pass via helper that skips doubling)
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	ld a, b
	ld [hli], a ; count byte
	ld de, wLearnsetList + 1 ; first kept pair's move byte
.loop
	ld a, [de]
	ld [hli], a
	inc de
	inc de
	dec b
	jr nz, .loop
	ld [hl], $FF ; list terminator
	ret

; hl = wLearnsetList + 2*index. Preserves bc, de.
RelearnerReadPtr:
	ld a, e
RelearnerPtrFromIndex:
	add a ; 2*index
RelearnerPtrFromIndexA: ; entry when a already holds the byte offset
	ld l, a
	ld h, 0
	push bc
	ld bc, wLearnsetList
	add hl, bc
	pop bc
	ret

; d = candidate move. Returns z if the selected mon already knows it. Preserves d, e.
RelearnerMonKnowsMove:
	ld hl, wPartyMon1Moves
	ld a, [wWhichPokemon]
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld c, NUM_MOVES
.loop
	ld a, [hli]
	cp d
	ret z
	dec c
	jr nz, .loop
	ld a, 1
	and a ; force nz (not known)
	ret

; d = candidate move, c = number of kept pairs. Returns z if the move is already kept. Preserves d, e.
RelearnerListHasMove:
	ld a, c
	and a
	jr z, .notFound
	ld b, c
	ld hl, wLearnsetList + 1 ; first kept move byte
.loop
	ld a, [hl]
	cp d
	ret z
	inc hl
	inc hl
	dec b
	jr nz, .loop
.notFound
	ld a, 1
	and a ; force nz (not present)
	ret

; a = cost level (1..100). Writes level*100 into hMoney as 3-byte BCD.
RelearnerSetCost:
	push af
	xor a
	ldh [hMoney], a
	ldh [hMoney + 2], a
	pop af
	cp 100
	jr nz, .below100
	ld a, 1
	ldh [hMoney], a ; 100 * 100 = 10000 -> "01 00 00"
	xor a
	ldh [hMoney + 1], a
	ret
.below100
	ld b, 0 ; tens digit
.tensLoop
	cp 10
	jr c, .ones
	sub 10
	inc b
	jr .tensLoop
.ones
	swap b ; tens in high nibble
	or b ; a = (tens << 4) | ones = BCD
	ldh [hMoney + 1], a ; level*100 -> middle BCD byte
	ret

RelearnerCostText:
	text "This lesson will"
	line "cost ¥@"
	text_bcd hMoney, 3 | LEADING_ZEROES | LEFT_ALIGN
	text "!"
	prompt

RelearnerNotEnoughText:
	text_far _MoveTutorNotEnoughCash
	text_end

RelearnerFarewellText:
	text "Jolly good! Good"
	line "luck with the"
	cont "MOVEDEX!"
	done

RelearnerIntroText:
	text "Wot wot! I can"
	line "help your #MON"
	cont "recall a move"
	cont "it's forgot!"
	prompt

RelearnerNoMovesText:
	text "Hmm... that one"
	line "has no moves to"
	cont "recall just now."
	prompt

; printed by the schoolhouse script (text_far) when the player has the MOVEDEX but < 2 badges
_SchoolB1FRelearnerComeBack::
	text "When you've got a"
	line "few BADGEs, come"
	cont "back to me!"
	para "I can help your"
	line "#MON recall a"
	cont "move they forgot,"
	cont "for a small fee."
	done
