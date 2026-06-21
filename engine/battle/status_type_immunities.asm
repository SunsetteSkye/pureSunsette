; Sunsette: type/species status immunities relocated out of the full Battle Core bank.
; - GhostFlinchOrSet  : FlinchSideEffect's whole .flinch body (jpfar'd in).
; - SlowpokeConfusionCheck : a pre-check for ConfusionSideEffectSuccess (callfar'd; verdict in e,
;   because callfar clobbers flags/a but leaves de/hl untouched).
SECTION "Sunsette Status Immunities", ROMX

; FlinchSideEffect's .flinch body. GHOST-types can't be flinched ("You can't flinch a GHOST!"); everyone
; else flinches as normal. hWhoseTurn = attacker, so the target is the opposite side. jpfar'd, so the final
; ret returns to FlinchSideEffect's caller.
GhostFlinchOrSet::
	ldh a, [hWhoseTurn]
	and a
	jr z, .targetEnemy
	ld hl, wBattleMonType1      ; attacker = enemy -> target = player
	ld de, wPlayerBattleStatus1
	jr .check
.targetEnemy
	ld hl, wEnemyMonType1
	ld de, wEnemyBattleStatus1
.check
	ld a, [hli]
	cp GHOST
	jr z, .ghost
	ld a, [hl]
	cp GHOST
	jr z, .ghost
	ld h, d
	ld l, e
	set FLINCHED, [hl]
	callfar ClearHyperBeam
	ret
.ghost
	ld hl, GhostFlinchText
	rst _PrintText
	ret

; line text lives in this bank so rst _PrintText reads it directly (keeps it out of the full text banks)
GhostFlinchText:
	text "You can't flinch a"
	line "GHOST!"
	prompt

; Pre-check for ConfusionSideEffectSuccess. SLOWPOKE/SLOWBRO are too oblivious to be confused; if the target
; is one of them, print the oblivious line and return e=1. Otherwise return e=0 and the caller confuses as
; normal. (callfar leaves de intact, so the caller reads the verdict from e.)
SlowpokeConfusionCheck::
	ld e, 0
	ldh a, [hWhoseTurn]
	and a
	ld a, [wEnemyMonSpecies]   ; attacker = player -> target = enemy
	jr z, .gotTarget
	ld a, [wBattleMonSpecies]
.gotTarget
	cp SLOWPOKE
	jr z, .oblivious
	cp SLOWBRO
	ret nz
.oblivious
	ld hl, SlowpokeObliviousText
	rst _PrintText
	ld e, 1
	ret

SlowpokeObliviousText:
	text "...wait, how do"
	line "you tell the"
	cont "difference?"
	prompt

; Sunsette: shared helper for the two side-effect paralysis paths in FreezeBurnParalyzeEffect (Battle Core
; is full, especially in the _DEBUG build). Is the target (the side opposite hWhoseTurn) an ELECTRIC type?
; Returns e=1 if so (immune to paralysis). callfar leaves de intact, so the caller reads the verdict from e.
TargetIsElectric::
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyMonType1
	jr z, .got
	ld hl, wBattleMonType1
.got
	ld e, 0
	ld a, [hli]
	cp ELECTRIC
	jr z, .yes
	ld a, [hl]
	cp ELECTRIC
	ret nz
.yes
	ld e, 1
	ret

; Sunsette: PIKACHU/RAICHU signature - after FOCUS ENERGY ("Its tail is coiled!", GETTING_PUMPED set) they
; are immune to ELECTRIC damage until they switch out. callfar'd from AdjustDamageForMoveType (Battle Core is
; full). Returns the verdict in L (NOT e: the caller still needs de = the defender's types for the type loop;
; callfar preserves de/hl and the caller reloads hl right after). L=1 => immune.
CheckCoiledElectricImmunity::
	ld a, [wMoveType]
	cp ELECTRIC
	jr nz, .no
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyBattleStatus2 ; player attacking -> defender = enemy
	jr z, .gotStatus
	ld hl, wPlayerBattleStatus2
.gotStatus
	bit GETTING_PUMPED, [hl] ; FOCUS ENERGY up?
	jr z, .no
	ldh a, [hWhoseTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .gotSpecies
	ld a, [wBattleMonSpecies]
.gotSpecies
	cp PIKACHU
	jr z, .yesImmune
	cp RAICHU
	jr z, .yesImmune
.no
	ld l, 0
	ret
.yesImmune
	ld l, 1
	ret

; Sunsette: FLY's evasion + type-keep signature. Floated here (newCode/volcano is full).
; carry set if the user (side = hWhoseTurn) is already FLYING or FLOATING in either type slot.
UserIsAirborne:
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonType1
	jr z, .got
	ld hl, wEnemyMonType1
.got
	ld a, [hli]
	cp FLYING
	jr z, .yes
	cp FLOATING
	jr z, .yes
	ld a, [hl]
	cp FLYING
	jr z, .yes
	cp FLOATING
	jr z, .yes
	and a ; clear carry
	ret
.yes
	scf
	ret

; e = EVASION_UP2_EFFECT for FLY by an already-airborne user, else EVASION_UP1_EFFECT (grounded FLY, or DIG).
; callfar'd from ChargeMoveEvasionBoost; the caller reads the boost from e before loading de/hl.
ChooseFlyEvasionEffect::
	ld e, EVASION_UP1_EFFECT
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveNum]
	jr z, .gotMove
	ld a, [wEnemyMoveNum]
.gotMove
	cp FLY
	ret nz ; DIG / other charge -> +1
	call UserIsAirborne
	ret nc ; grounded FLY -> +1
	ld e, EVASION_UP2_EFFECT ; already-airborne FLY -> +2
	ret

; FLY's "keep airborne?" popup, callfar'd from ChargeEffect on the CHARGE turn (turn 1), AFTER the evasion
; boost so the +1/+2 is already locked in. Plan-ahead flavor. If the PLAYER's mon used FLY and is NOT already
; FLYING/FLOATING, ask whether to take on the airborne type for the rest of the battle: FLYING for CHARIZARD/
; CLEFAIRY/CLEFABLE/BEEDRILL, FLOATING otherwise. YES overwrites wBattleMonType2 (battle-only, resets on switch).
FlyKeepTypePrompt::
	ldh a, [hWhoseTurn]
	and a
	ret nz ; ChargeEffect runs for both sides; only the player's mon gets the choice
	ld a, [wPlayerMoveEffect]
	cp FLY_EFFECT
	ret nz
	call UserIsAirborne
	ret c ; already airborne -> no popup (it kept its +2 cushion)
	ld a, [wBattleMonSpecies]
	cp CHARIZARD
	jr z, .flying
	cp CLEFAIRY
	jr z, .flying
	cp CLEFABLE
	jr z, .flying
	cp BEEDRILL
	jr z, .flying
	ld b, FLOATING
	ld hl, FlyKeepFloatingPromptText
	jr .ask
.flying
	ld b, FLYING
	ld hl, FlyKeepFlyingPromptText
.ask
	push bc
	rst _PrintText
	call YesNoChoice ; z = YES
	pop bc
	ret nz
	ld a, b
	ld [wBattleMonType2], a
	ld hl, FlyKeptFormText
	rst _PrintText
	ret

FlyKeepFlyingPromptText:
	text "Keep flying as a"
	line "FLYING type?"
	done

FlyKeepFloatingPromptText:
	text "Float on as a"
	line "FLOATING type?"
	done

FlyKeptFormText:
	text "It held its"
	line "airborne form!"
	prompt

; Sunsette: AGILITY's brace rider (callfar'd from AgilityBraceModifier in the full newCode bank). Sets the
; ADAPTATION resist by the user's type: FLYING -> brace ROCK, FLOATING -> brace FLYING, else -> brace GROUND
; ("too nimble to be caught by Earthquake"). Battle-only; shares wPlayer/EnemyAdaptType with ADAPTATION, 2nd
; use overwrites. Then announces the braced type via AnnounceBrace.
AgilityBrace::
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonType1
	jr z, .got
	ld hl, wEnemyMonType1
.got
	ld a, [hli]
	ld b, a ; type1
	ld c, [hl] ; type2
	cp FLYING
	jr z, .braceRock
	ld a, c
	cp FLYING
	jr z, .braceRock
	ld a, b
	cp FLOATING
	jr z, .braceFlying
	ld a, c
	cp FLOATING
	jr z, .braceFlying
	ld a, GROUND ; grounded user -> dodge Earthquake
	jr .store
.braceRock
	ld a, ROCK ; FLYING user -> brace its Rock weakness
	jr .store
.braceFlying
	ld a, FLYING ; FLOATING user -> brace its Flying weakness
.store
	ld e, a ; e = braced type (kept for AnnounceBrace)
	inc a ; type + 1 for the AdaptType slot
	ld b, a
	ldh a, [hWhoseTurn]
	and a
	ld a, b
	jr nz, .enemy
	ld [wPlayerAdaptType], a
	jr .announce
.enemy
	ld [wEnemyAdaptType], a
.announce
	callfar AnnounceBrace ; e = braced type
	ret

; Sunsette: BARRIER's brace rider (callfar'd from BarrierBraceModifier in the full newCode bank). On top of
; its +2 DEFENSE it always braces NORMAL (no type-casing; a GHOST user already ignores NORMAL, so it's just
; redundant there). Reuses wPlayer/EnemyAdaptType + ApplyAdaptationResist; battle-only, shared slot.
BarrierBrace::
	ldh a, [hWhoseTurn]
	and a
	ld a, NORMAL + 1 ; AdaptType stores type+1 (NORMAL is 0)
	jr nz, .enemy
	ld [wPlayerAdaptType], a
	jr .announce
.enemy
	ld [wEnemyAdaptType], a
.announce
	ld e, NORMAL
	callfar AnnounceBrace ; "It braced against NORMAL!"
	ret
