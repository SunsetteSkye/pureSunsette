; Load TM Learnset into wram, 1 byte per move that is learnable, byte value = TM/HM item ID
LoadTMLearnsetIntoWram:
	ld a, [wPokedexNum] 
	push af
	; mon header already presumed to be loaded
	ld de, wLearnsetList
	ld hl, TechnicalMachines
	ld b, 0 ; which TM we're on
	ld c, 0 ; how many learnable TMs in this learnset
.loop
	; load total length of TMs+HMs
	ld a, [hli]
	ld [wMoveNum], a
	push hl
	push bc
	push de
	call CanLearnTMBody
	pop de
	pop bc
	pop hl
	jr z, .notLearnable
	ld a, b
	cp NUM_TMS
	jr c, .tm
	sub NUM_TMS ; hm item ids are before TMs
	jr .gotItemID
.tm
	add NUM_HMS
.gotItemID
	add HM01 ; TM/HM item ID offset (base of the block)
	ld [de], a
	inc de
	inc c
.notLearnable
	inc b
	ld a, b
	cp NUM_HMS + NUM_TMS
	assert HM01 + NUM_TMS + NUM_HMS - 1 < $FF, "TM/HM item-id block runs into the $FF item-list terminator"
	jr nz, .loop
	ld a, c
	ld [wDexLearnsetListCount], a
	pop af
	ld [wPokedexNum], a 
	ret