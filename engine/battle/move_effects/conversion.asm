; Sunsette: CONVERSION redesign (Phase 2). CONVERSION now works exactly like MIMIC - it copies one of
; the foe's moves into the user's move slot and uses it immediately (that whole flow lives in
; MimicEffect / MimicCommon in engine/battle/effects.asm) - and ADDITIONALLY retypes the user to the
; copied move's type, so the copied move benefits from STAB. This file is now just the retype helper
; plus its text; the old two-mode attack/defense Conversion (super-effective-move lookup tables, the
; mode-select menu, the forced-mode plumbing) was removed.

; Reached via `callfar ConversionRetypeUser_` from MimicCommon's tail, right after ReloadMoveData has
; loaded the copied move's data - so wPlayerMoveType / wEnemyMoveType already hold that move's type.
; Sets BOTH of the user's type bytes to it (the user becomes mono-typed) and announces the change.
; hWhoseTurn = the CONVERSION user.
ConversionRetypeUser_:
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMoveType
	ld de, wBattleMonType1
	jr z, .gotPtrs
	ld hl, wEnemyMoveType
	ld de, wEnemyMonType1
.gotPtrs
	ld a, [hl] ; the copied move's type
	ld [de], a ; user Type1 = move type
	inc de
	ld [de], a ; user Type2 = move type
	call ConversionSetPalette ; recolor the user's battle sprite to suit the new type
	ld hl, ConvertedTypeText
	jp PrintText ; tail-call; its ret returns through the callfar back to MimicCommon -> ExecuteReplacedMove

ConvertedTypeText:
	text_far _ConvertedTypeText
	text_end

; Sunsette: recolor the CONVERSION user's battle sprite to suit its new type. If the new type matches the
; species' NATURAL type1, keep the mon's natural (or alt) palette by clearing the forced-palette flags;
; otherwise force the type's battle-animation palette (TypePalColorList[type]) via Flags bit 2 +
; wXxxConvertPalette (read back by SetPal_Battle). hWhoseTurn = the user. This file shares the newCode bank
; with TypePalColorList; GetMonHeader and RunDefaultPaletteCommand are home routines.
ConversionSetPalette:
	ldh a, [hWhoseTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .gotSpecies
	ld a, [wEnemyMonSpecies]
.gotSpecies
	ld [wCurSpecies], a
	call GetMonHeader ; -> wMonHType1 = the species' natural type1
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonType1
	ld de, wBattleMonFlags
	jr z, .gotSide
	ld hl, wEnemyMonType1
	ld de, wEnemyMonFlags
.gotSide
	ld a, [hl] ; the new (converted) type
	ld c, a
	ld a, [wMonHType1]
	cp c
	jr z, .natural ; converting to our own natural type1 -> keep the natural look
; force the type's animation palette
	ld b, 0
	ld hl, TypePalColorList
	add hl, bc ; index by type id
	ld a, [hl] ; palette id for this type
	push af
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerConvertPalette
	jr z, .storePal
	ld hl, wEnemyConvertPalette
.storePal
	pop af
	ld [hl], a ; remember the forced palette for SetPal_Battle
	ld a, [de] ; Flags
	set 2, a ; bit 2 = use wXxxConvertPalette
	res 1, a ; clear any WATERIFY soak - we're recoloring now
	ld [de], a
	jp RunDefaultPaletteCommand
.natural
	ld a, [de] ; Flags
	res 2, a ; no forced conversion palette
	res 1, a ; no WATERIFY soak either
	ld [de], a
	jp RunDefaultPaletteCommand
