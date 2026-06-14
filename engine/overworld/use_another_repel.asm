; PureRGBnote: ADDED: code to allow repeated usages of REPEL once one runs out.
UseAnotherRepel::
	ld b, MAX_REPEL
	push bc
	call IsItemInBag
	pop bc
	jr nz, .checkUse
	ld b, SUPER_REPEL
	push bc
	call IsItemInBag
	pop bc
	jr nz, .checkUse
	ld b, REPEL
	push bc
	call IsItemInBag
	pop bc
	ret z
.checkUse
	push bc
	ld hl, RepelUseAnotherText
	rst _PrintText
	call YesNoChoice
	pop bc
	ret nz
	ld a, b
	ld [wCurItem], a	;load item to be used
	ld [wNamedObjectIndex], a	;load item so its name can be grabbed
	predef GetIndexOfItemInBag
	ld a, b
	ld [wWhichPokemon], a ; load item index to be deleted when used
	call GetItemName	;get the item name into de register
	call CopyToStringBuffer ; copy name from de to wcf4b so it shows up in text
	jp UseItem	;use the item

RepelUseAnotherText:
	text_far _RepelUseAnotherText
	text_end

; Sunsette: ADDED: called when the repel/hiding step counter reaches 0 (DisplayRepelWoreOffText).
; Branches on wHidingMoveID: 0 = a normal Repel item wore off (vanilla "use another?"); otherwise a
; "hiding" field move (SAND ATTACK / MIST / HAZE / SMOKESCREEN / the powders / SPORE / SMOG) wore off, so we offer to (BLACK HAZE, ETHEREAL)
; keep hiding only if a party member can still use that exact move.
RepelOrHidingWoreOff::
	ld a, [wHidingMoveID]
	and a
	jr nz, .hiding
; normal Repel item wore off
	ld hl, RepelWoreOffText ; home text wrapper, mapped in every bank
	rst _PrintText
	jr UseAnotherRepel
.hiding
	ld hl, StoppedHidingText
	rst _PrintText
	ld a, [wHidingMoveID]
	ld d, a
	call IsMoveInParty ; d = move -> d = match count, z if none (direct call: z flag survives)
	jr z, .stopHiding ; no party member can keep it up -> hiding ends
	ld hl, KeepHidingText
	rst _PrintText
	call YesNoChoice
	jr nz, .stopHiding ; chose No
	ld a, 100
	ld [wRepelRemainingSteps], a ; re-arm the hiding counter; wHidingMoveID unchanged
	ret
.stopHiding
	xor a
	ld [wHidingMoveID], a
	ret

StoppedHidingText:
	text_far _StoppedHidingText
	text_end

KeepHidingText:
	text_far _KeepHidingText
	text_end

; Sunsette: FLASH ran out in a cave - FlashRanOut already blacked the screen out and restored the darkness;
; here (via the TEXT_FLASH_WORE_OFF DisplayTextID handler) we offer to re-light if a party mon still knows
; FLASH. On yes, re-arm through the FLASH field-move event so CheckUsedFlash relights next map-script frame
; (re-saving the dark level + the 200-step timer). Mirrors RepelOrHidingWoreOff's "keep hiding?" flow.
FlashWoreOffPrompt::
	ld hl, FlashFadedText
	rst _PrintText
	ld d, FLASH
	call IsMoveInParty ; d = move -> match count, z if no party mon knows FLASH (z survives the direct call)
	ret z ; nobody can re-light -> stay dark (the "flickered out" line already played)
	ld hl, FlashUseAgainText
	rst _PrintText
	call YesNoChoice
	ret nz ; chose No -> stay dark
	SetEvent EVENT_USED_FLASH_FROM_PARTY_MENU ; re-light next CheckUsedFlash frame
	ret

FlashFadedText:
	text_far _FlashFadedText
	text_end

FlashUseAgainText:
	text_far _FlashUseAgainText
	text_end