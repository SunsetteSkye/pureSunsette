; Sunsette: the semi-invulnerable (Fly/Dig/HYDROBATH) reach + auto-hit hit-test helpers. Floated into their own
; ROMX section because newCode is full; both are reached from the Battle Core only via callfar (bank-independent),
; and CheckReachAndAutoHit calls CheckSemiInvulnBypass in-section, so they travel together safely.
SECTION "Sunsette Semi-Invuln Reach", ROMX

; Sunsette: decide whether the move being used can reach the target through a semi-invulnerable (Fly/Dig)
; state. Self-contained (derives target + move from hWhoseTurn) so it's safe to callfar from MoveHitTest
; (Battle Core is full); callfar preserves carry, so the caller branches on the result directly.
; Returns carry SET = reachable: the target isn't semi-invulnerable, OR this move can bypass its state.
; Returns carry CLEAR = the target dodges (semi-invulnerable in a state this move can't reach).
; The INVULNERABLE bit is shared by Fly and Dig; wChargeMoveNum (set by ChargeEffect on the most recent
; charger - the target mid-charge) tells which one. SWIFT bypasses both; SURF/EARTHQUAKE bypass DIG only;
; BLIZZARD/THUNDER/WHIRLWIND bypass FLY only; HYDROBATH has its OWN rule (SWIFT or ELECTRIC); else can't reach.
CheckSemiInvulnBypass::
	ldh a, [hWhoseTurn]
	and a
	jr nz, .enemyTurn
	ld a, [wEnemyBattleStatus1] ; player attacking -> target is the enemy
	bit INVULNERABLE, a
	jr z, .reachable ; not flying/digging -> reachable
	ld a, [wChargeMoveNum]
	cp HYDROBATH ; Sunsette: a HYDROBATH dive has its OWN breach rule (only SWIFT or ELECTRIC), not the Fly/Dig table
	jr z, .hydrobathTarget
	ld a, [wPlayerMoveNum]
	jr .classify
.enemyTurn
	ld a, [wPlayerBattleStatus1]
	bit INVULNERABLE, a
	jr z, .reachable
	ld a, [wChargeMoveNum]
	cp HYDROBATH
	jr z, .hydrobathTarget
	ld a, [wEnemyMoveNum]
.classify
	cp SWIFT
	jr z, .reachable ; Swift reaches both Fly and Dig
	cp SURF
	jr z, .digOnly
	cp EARTHQUAKE
	jr z, .digOnly
	cp BLIZZARD
	jr z, .flyOnly
	cp THUNDER
	jr z, .flyOnly
	cp HURRICANE
	jr z, .flyOnly
	cp SHORYUKEN ; SHORYUKEN - an anti-air uppercut, reaches FLY users
	jr z, .flyOnly
	cp TEMPEST ; TEMPEST - a tornado that reaches FLY users
	jr z, .flyOnly
	and a ; no bypass -> clear carry (dodged)
	ret
.digOnly
	ld a, [wChargeMoveNum]
	cp DIG
	jr z, .reachable
	and a
	ret
.flyOnly
	ld a, [wChargeMoveNum]
	cp FLY
	jr z, .reachable
	and a
	ret
.hydrobathTarget
	; Sunsette: a target mid-HYDROBATH is breached ONLY by SWIFT (universal never-miss) or an ELECTRIC-type
	; attack ("electricity conducts through the water"). Surf/Earthquake/Blizzard/Thunder-as-fly-bypass etc.
	; all dodge it - the breach is keyed to the attacker's TYPE here, not the Fly/Dig move-number table.
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveNum]
	jr z, .gotBathMove
	ld a, [wEnemyMoveNum]
.gotBathMove
	cp SWIFT
	jr z, .reachable
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveType]
	jr z, .gotBathType
	ld a, [wEnemyMoveType]
.gotBathType
	cp ELECTRIC
	jr z, .reachable
	and a ; not Swift or Electric -> the bath dodges it
	ret
.reachable
	scf
	ret

; Sunsette: MoveHitTest helper (callfar'd from the full Battle Core). Combines the semi-invuln reach
; test with the "never-miss" decision so Battle Core needs only one callfar. Returns:
;   carry CLEAR           -> target dodged (semi-invulnerable & this move can't reach it)
;   carry SET + Z SET     -> reachable AND auto-hits (SWIFT_EFFECT, PIDGEOT's HURRICANE, or ELECTRIC vs HYDROBATH)
;   carry SET + Z CLEAR   -> reachable, roll accuracy normally
; rst _Bankswitch pops the saved bank into bc (not af), so the returned carry AND Z both survive back
; to MoveHitTest. PIDGEOT's HURRICANE auto-hits like Swift, but since CheckSemiInvulnBypass only lets it
; reach FLY (not DIG), a DIGging target still dodges it.
CheckReachAndAutoHit::
	call CheckSemiInvulnBypass ; carry = reachable
	ret nc                     ; dodged -> return with carry clear (Z unused on this path)
	; Sunsette: an ELECTRIC attack that reaches a target mid-HYDROBATH also AUTO-HITS it (parity with Surf/EQ
	; auto-hitting a digger). Gated on the defender actually being mid-bath (INVULNERABLE + wChargeMoveNum =
	; HYDROBATH) so a normal Electric move never gains never-miss.
	ldh a, [hWhoseTurn]
	and a
	ld a, [wEnemyBattleStatus1] ; player's turn -> defender = enemy
	jr z, .gotDefBathStatus
	ld a, [wPlayerBattleStatus1]
.gotDefBathStatus
	bit INVULNERABLE, a
	jr z, .notBathHit
	ld a, [wChargeMoveNum]
	cp HYDROBATH
	jr nz, .notBathHit
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveType]
	jr z, .gotBathAtkType
	ld a, [wEnemyMoveType]
.gotBathAtkType
	cp ELECTRIC
	jp z, .neverMiss
.notBathHit
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveEffect]
	jr z, .gotEffect
	ld a, [wEnemyMoveEffect]
.gotEffect
	cp SWIFT_EFFECT
	jr z, .neverMiss
	cp DISABLE_EFFECT ; Sunsette: DISABLE proper auto-hits; a Fly/Dig target already dodged above (CheckSemiInvulnBypass). NOT CUT_DISABLE_EFFECT (those are damaging, accuracy handled in the main flow).
	jr z, .neverMiss
	callfar ComebackCantMiss ; Sunsette: BLITZ STRIKE / QUICK ATTACK auto-hit at desperation stage 2-3
	ld a, e
	and a
	jr nz, .neverMiss
	CheckEvent FLAG_SIGNATURE_MOVES_TURNED_OFF
	jr nz, .rollAccuracy ; signatures off -> no Pidgeot bonus
	ldh a, [hWhoseTurn]
	and a
	ld a, [wBattleMonSpecies]
	ld b, a
	ld a, [wPlayerMoveNum]
	jr z, .gotMon
	ld a, [wEnemyMonSpecies]
	ld b, a
	ld a, [wEnemyMoveNum]
.gotMon
	cp HURRICANE
	jr nz, .rollAccuracy
	ld a, b
	cp PIDGEOT
	jr nz, .rollAccuracy
	; PIDGEOT + HURRICANE -> auto-hit
.neverMiss
	xor a  ; Z set, carry clear
	scf    ; carry set; scf leaves Z untouched -> carry SET + Z SET
	ret
.rollAccuracy
	or 1   ; a nonzero -> Z clear, carry clear
	scf    ; carry set; Z untouched -> carry SET + Z CLEAR
	ret
