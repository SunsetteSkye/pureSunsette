; Sunsette: play an overlay animation (ID in e) over the player's or enemy's mon. Exported so the
; affection / Pressure cues in other banks can trigger them via farcall/callfar. The ID comes in e,
; NOT a: a cross-bank callfar runs through Bankswitch (`ld a, b`), so a = the caller-resolved bank on
; entry; Bankswitch never touches e, so callers pass the ID there.
;
; CRITICAL: these cues fire MID-turn (e.g. PressureDrainPlayerMove runs during the player's turn,
; right after PP decrement and before the move's animation/effect). They must SAVE and RESTORE
; hWhoseTurn around the overlay - otherwise the "enemy side" (hWhoseTurn=1) leaks into the rest of
; the turn and the next move animates mirrored + its effect resolves against the wrong mon
; ("But it failed!" / drain backwards). Lives here (own floating section) because Battle Core is full.
PlayEnemySideAnim:: ; over the ENEMY's mon (an enemy legendary's / tough trainer's Pressure)
	ld a, 1
	jr SetSideAnimTurn
PlayPlayerSideAnim:: ; over the player's mon
	xor a
SetSideAnimTurn:
	ld d, a ; desired turn for this overlay (0 = player, 1 = enemy)
	ldh a, [hWhoseTurn]
	push af ; save the REAL turn
	ld a, d
	ldh [hWhoseTurn], a
	ld a, e
	ld [wAnimationID], a
	xor a
	ld [wAnimationType], a ; no screen-shake/blink - plain overlay (stale type would flicker)
	callfar PlayMoveAnimationNoDelay
	pop af
	ldh [hWhoseTurn], a ; restore the real turn so the rest of the move resolves correctly
	ret
