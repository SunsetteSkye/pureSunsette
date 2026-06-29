; Sunsette: type/species status immunities relocated out of the full Battle Core bank.
; - DragonFlinchOrSet : FlinchSideEffect's whole .flinch body (jpfar'd in).
; - SlowpokeConfusionCheck : a pre-check for ConfusionSideEffectSuccess (callfar'd; verdict in e,
;   because callfar clobbers flags/a but leaves de/hl untouched).
SECTION "Sunsette Status Immunities", ROMX

; FlinchSideEffect's .flinch body. DRAGON-types can't be flinched ("You can't flinch a DRAGON!"); everyone
; else flinches as normal. hWhoseTurn = attacker, so the target is the opposite side. jpfar'd, so the final
; ret returns to FlinchSideEffect's caller.
DragonFlinchOrSet::
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
	cp DRAGON
	jr z, .dragon
	ld a, [hl]
	cp DRAGON
	jr z, .dragon
	ld h, d
	ld l, e
	set FLINCHED, [hl]
	callfar ClearHyperBeam
	ret
.dragon
	ld hl, DragonFlinchText
	rst _PrintText
	ret

; line text lives in this bank so rst _PrintText reads it directly (keeps it out of the full text banks)
DragonFlinchText:
	text "You can't flinch a"
	line "DRAGON!"
	prompt

; Sunsette: unified MIST / DRAGON stat-drop immunity check, callfar'd from StatModifierDownEffect (Battle Core).
; The target is the side opposite hWhoseTurn. Returns e = 0 (not immune) / 1 (MIST: target has Mist's
; STAT_DOWN_IMMUNITY) / 2 (DRAGON-type target). DRAGON is checked first so its line wins if a Dragon also has
; Mist up. callfar leaves de/hl intact, so the caller reads the verdict from e.
TargetResistsStatDrop::
	ld e, 0
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyMonType1       ; player's turn -> target = enemy
	jr z, .gotType
	ld hl, wBattleMonType1
.gotType
	ld a, [hli]
	cp DRAGON
	jr z, .dragon
	ld a, [hl]
	cp DRAGON
	jr z, .dragon
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyBattleStatus2
	jr z, .gotStatus
	ld hl, wPlayerBattleStatus2
.gotStatus
	bit STAT_DOWN_IMMUNITY, [hl]
	ret z                       ; e = 0: no immunity
	ld e, 1                     ; MIST
	ret
.dragon
	ld e, 2                     ; DRAGON
	ret

; Sunsette: announce a blocked PRIMARY stat-down move. a = 1 (MIST) / 2 (DRAGON). jpfar'd from
; StatModifierDownEffect, so the final ret returns to that effect's caller.
PrintStatDropBlockedText::
	cp 2
	jr z, .dragon
	ld hl, MistProtectedText
	rst _PrintText
	ret
.dragon
	ld hl, DragonUnshakenText
	rst _PrintText
	ret

MistProtectedText:
	text "It's protected"
	line "by MIST!"
	prompt

DragonUnshakenText:
	text "The DRAGON won't"
	line "be cowed!"
	prompt

; Pre-check for ConfusionSideEffectSuccess. PSYCHIC-types can't be confused (their minds stay clear), and
; SLOWPOKE/SLOWBRO get their own oblivious line on top (they are PSYCHIC, but the gag overrides the generic
; line). If the target is immune, print the matching line and return e=1; otherwise return e=0 and the caller
; confuses as normal. (callfar leaves de intact, so the caller reads the verdict from e.)
SlowpokeConfusionCheck::
	ld e, 0
	ldh a, [hWhoseTurn]
	and a
	ld a, [wEnemyMonSpecies]   ; attacker = player -> target = enemy
	jr z, .gotSpecies
	ld a, [wBattleMonSpecies]
.gotSpecies
	cp SLOWPOKE
	jr z, .oblivious
	cp SLOWBRO
	jr z, .oblivious
; PSYCHIC-types (other than the Slowpoke gag above) are immune to confusion
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyMonType1
	jr z, .gotType
	ld hl, wBattleMonType1
.gotType
	ld a, [hli]
	cp PSYCHIC_TYPE
	jr z, .psychicImmune
	ld a, [hl]
	cp PSYCHIC_TYPE
	ret nz
.psychicImmune
	ld hl, PsychicFocusedText
	rst _PrintText
	ld e, 1
	ret
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

PsychicFocusedText:
	text "Its mind stays"
	line "perfectly clear!"
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

; Sunsette: FIRE and WATER types are immune to burn (callfar'd from the burn paths in
; FreezeBurnParalyzeEffect, Battle Core being full). Target = side opposite hWhoseTurn. e=1 => burn-immune.
TargetIsBurnImmune::
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyMonType1
	jr z, .got
	ld hl, wBattleMonType1
.got
	ld e, 0
	ld a, [hli]
	cp FIRE
	jr z, .yes
	cp WATER
	jr z, .yes
	ld a, [hl]
	cp FIRE
	jr z, .yes
	cp WATER
	ret nz
.yes
	ld e, 1
	ret

; Sunsette: FIRE types are immune to freeze (ICE-types are already immune via the move-type/target-type
; match in FreezeBurnParalyzeEffect, so only FIRE needs an explicit check). e=1 => freeze-immune.
TargetIsFreezeImmune::
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyMonType1
	jr z, .got
	ld hl, wBattleMonType1
.got
	ld e, 0
	ld a, [hli]
	cp FIRE
	jr z, .yes
	ld a, [hl]
	cp FIRE
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

; Sunsette: ROCK and CRYSTAL defenders take 25% less damage (a flat x0.75 on the final type-adjusted damage)
; from super-effective hits. jpfar'd from the end of AdjustDamageForMoveType's type loop, so the final ret
; returns to AdjustDamageForMoveType's caller. wDamageMultipliers holds the NET effectiveness by this point
; (the shinpokered cumulative-multiplier fix), so a single check covers 2x and 4x alike. Defender = the side
; opposite hWhoseTurn. Reads/writes wDamage; uses the home Multiply/Divide + HRAM scratch.
; Sunsette: SHADOW BOX brace. If the DEFENDER (the side being hit = opposite hWhoseTurn) selected SHADOW BOX
; this turn and the incoming move is special-typed (type >= SPECIAL, the same boundary the read uses), halve
; the final damage. Runs at the damage-finalization stage (folded into RockCrystalSEReduction's caller path).
; Clobbers a, hl. wDamage is big-endian (hi at wDamage, lo at wDamage+1).
ShadowBoxBrace:
	ld a, [wMoveType]
	cp SPECIAL
	ret c                      ; non-special incoming move -> no brace
	ldh a, [hWhoseTurn]
	and a
	ld a, [wEnemySelectedMove] ; attacker = player -> defender = enemy
	jr z, .gotDefenderMove
	ld a, [wPlayerSelectedMove]
.gotDefenderMove
	cp SHADOW_BOX
	ret nz                     ; defender isn't bracing with SHADOW BOX
	ld hl, wDamage
	srl [hl]                   ; halve hi
	inc hl
	rr [hl]                    ; ...lo
	ld a, [wDamage]
	or [hl]
	ret nz                     ; nonzero -> done
	inc [hl]                   ; never zero out a hit that landed
	ret

RockCrystalSEReduction::
	call ShadowBoxBrace        ; Sunsette: SHADOW BOX's "half from a Special hit" brace (independent of the SE reduction below)
	ld a, [wDamageMultipliers]
	and EFFECTIVENESS_MASK
	cp EFFECTIVE + 1
	ret c                      ; neutral or resisted -> no reduction
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyMonType1      ; player attacking -> defender = enemy
	jr z, .gotDefender
	ld hl, wBattleMonType1
.gotDefender
	ld a, [hli]
	cp ROCK
	jr z, .reduce
	cp CRYSTAL
	jr z, .reduce
	ld a, [hl]
	cp ROCK
	jr z, .reduce
	cp CRYSTAL
	ret nz
.reduce
; wDamage = wDamage * 3 / 4
	xor a
	ldh [hMultiplicand], a
	ld hl, wDamage
	ld a, [hli]
	ldh [hMultiplicand + 1], a ; high byte
	ld a, [hl]
	ldh [hMultiplicand + 2], a ; low byte
	ld a, 3
	ldh [hMultiplier], a
	call Multiply
	ld a, 4
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ld hl, wDamage
	ldh a, [hQuotient + 2]
	ld [hli], a
	ld b, a
	ldh a, [hQuotient + 3]
	ld [hl], a
	or b
	ret nz                     ; nonzero damage -> done
	ld a, 1                    ; never let the reduction zero out a hit that should land
	ld [wDamage + 1], a
	ret

; Sunsette: FLYING pivot tailwind. When a FLYING-type mon is switched out VOLUNTARILY (not on a faint), the
; mon that replaces it comes in with +1 SPEED - the "hit and fly off, hand momentum to the next mon" pivot
; fantasy. Because switch-out (latch) and switch-in (apply) are two points in the same linear SwitchPlayerMon
; routine, the verdict is carried across them by bit 3 of wBattleFunctionalFlags (set+consumed in one routine,
; so it never leaks). callfar'd from Battle Core; input a = the side that moved (0 = player, 1 = enemy).

; Switch-OUT: if the LEAVING mon is FLYING, latch the tailwind for whoever comes in next.
FlyTailwindLatchIfFlying::
	and a
	ld hl, wBattleMonType1      ; player's mon left -> read the player's (leaving) mon
	jr z, .gotType
	ld hl, wEnemyMonType1
.gotType
	ld a, [hli]
	cp FLYING
	jr z, .flying
	ld a, [hl]
	cp FLYING
	ret nz
.flying
	ld hl, wBattleFunctionalFlags
	set 3, [hl]                 ; tailwind pending for the incoming mon
	ret

; Switch-IN: if a tailwind is latched, consume it and raise the INCOMING mon's SPEED by 1.
FlyTailwindApplyIfLatched::
	ld hl, wBattleFunctionalFlags
	bit 3, [hl]
	ret z                       ; nothing latched
	res 3, [hl]                 ; consume the latch
	ld c, a                     ; c = incoming side (0 player / 1 enemy)
	ldh a, [hWhoseTurn]
	push af                     ; save hWhoseTurn; we point it at the incoming side so the boost targets it
	ld a, c
	ldh [hWhoseTurn], a
	ld hl, FlyTailwindText
	rst _PrintText
	ld a, SPEED_UP1_EFFECT
	callfar RaiseUserStatViaSwap ; +1 SPEED to the incoming mon (prints "SPEED rose!")
	pop af
	ldh [hWhoseTurn], a
	ret

FlyTailwindText:
	text "It left a tailwind"
	line "for its ally!"
	prompt

; Sunsette: the gate for the "relentless swarm" BUG passive (Compound Eyes accuracy + ignore Substitute +
; ignore screens). Returns e = 1 if the attacker (hWhoseTurn side) is a BUG-type AND the move it is using is
; BUG-typed, else e = 0. (Result rides in e, not carry, because callers reach it via callfar which clobbers
; flags.) Clobbers a, hl, e. Replaced the old BUG red-HP +1-priority passive.
IsBugUsingBugMove::
	ld e, 0
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveType]
	jr z, .gotMoveType
	ld a, [wEnemyMoveType]
.gotMoveType
	cp BUG
	ret nz                      ; not a BUG move
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonType1
	jr z, .gotAtkType
	ld hl, wEnemyMonType1
.gotAtkType
	ld a, [hli]
	cp BUG
	jr z, .yes
	ld a, [hl]
	cp BUG
	ret nz                      ; attacker is not a BUG-type
.yes
	ld e, 1
	ret

; Sunsette: COMPOUND EYES - a BUG-type using a BUG move gets x1.5 accuracy. callfar'd from the top of
; CalcHitChance; scales the move's stored accuracy (0-255, 255 = 100%) by 3/2 in place, capped at 255 - so any
; move at ~67% base or higher becomes a guaranteed 100%, and the rest get a real boost. No-op otherwise.
; Clobbers a, b, e, hl.
BugCompoundEyes::
	call IsBugUsingBugMove
	ld a, e
	and a
	ret z                       ; not Bug-on-Bug -> leave accuracy alone
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMoveAccuracy
	jr z, .gotAcc
	ld hl, wEnemyMoveAccuracy
.gotAcc
	ld a, [hl]
	srl a                       ; a = acc / 2
	ld b, a
	ld a, [hl]                  ; a = acc
	add b                       ; a = acc + acc/2 = acc * 1.5
	jr nc, .store
	ld a, $ff                   ; overflow -> cap at 100% accuracy
.store
	ld [hl], a
	ret

; Sunsette: AURORA MIST ward. Returns e = 1 if the STATUS TARGET (the side opposite hWhoseTurn - the defender a
; foe-inflicted status would land on) currently has the UNUSED_6 "warded" flag, else e = 0. While warded, no new
; non-volatile status (poison/burn/freeze/paralysis/sleep) can land. The literal inversion of Shadow Game's
; "badly-poison both". callfar'd from the status chokepoints (PoisonEffect / FreezeBurnParalyzeEffect /
; ParalyzeEffect / _SleepEffect); result in e because callfar clobbers flags. Clobbers a, hl, e.
TargetIsWarded::
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyBattleStatus2   ; player attacking -> target = enemy
	jr z, .got
	ld hl, wPlayerBattleStatus2
.got
	ld e, 0
	bit STATUS_WARDED, [hl]
	ret z
	ld e, 1
	ret

; Sunsette: the DAMAGE half of Bug's ignore-Substitute passive. Returns e = 1 if the target's substitute should
; absorb this hit, e = 0 if not. The target side is FIXED by the entry point (ApplyDamageToEnemyPokemon always
; damages the enemy, ApplyDamageToPlayerPokemon always the player) - NOT hWhoseTurn, because those routines are
; also reached by confusion/crash self-hits with the "wrong" hWhoseTurn. The sub absorbs UNLESS a BUG-type's BUG
; move is hitting through it. Floated to spare the Battle Core bank. Clobbers a, e (callers keep hl = wDamage+1).
EnemySubAbsorbsHit::
	ld hl, wEnemyBattleStatus2
	jr _SubAbsorbsHit
PlayerSubAbsorbsHit::
	ld hl, wPlayerBattleStatus2
_SubAbsorbsHit:
	ld e, 0
	bit HAS_SUBSTITUTE_UP, [hl]
	ret z                       ; no substitute -> don't absorb
	push hl
	callfar IsBugUsingBugMove   ; e = 1 if a BUG-type's BUG move (hits through the decoy)
	pop hl
	ld a, e
	and a
	ld e, 1                     ; default: the substitute absorbs the hit
	ret z                       ; not Bug-on-Bug -> absorb
	ld e, 0                     ; Bug-on-Bug -> hit through (don't absorb)
	ret

; Sunsette: COMBO MOVE consecutive-turn lock. Combo moves (SHADOW BOX / FINISHER / SHORYUKEN) can't be used
; two turns running - using ANY one locks ALL of them next turn (one shared COMBO_MOVE_USED bit). For the
; hWhoseTurn side's SELECTED move:
;   non-combo move  -> clear the lock (a turn off / other move re-arms it); e = 0 (allow).
;   combo, locked   -> clear the lock + print the recover line; e = 1 (caller fails the move).
;   combo, unlocked -> SET the lock (no combo move next turn); e = 0 (allow).
; callfar'd from both move-execution gates; the verdict rides home in e.
CheckComboMoveLock::
	ldh a, [hWhoseTurn]
	and a
	jr nz, .enemy
	ld a, [wPlayerSelectedMove]
	ld hl, wPlayerBattleStatus2
	jr .gotSide
.enemy
	ld a, [wEnemySelectedMove]
	ld hl, wEnemyBattleStatus2
.gotSide
	call IsComboMove           ; carry set if the selected move is a combo move
	jr c, .isCombo
	res COMBO_MOVE_USED, [hl]   ; a non-combo move re-arms the combo slot
	ld e, 0
	ret
.isCombo
	bit COMBO_MOVE_USED, [hl]
	jr nz, .locked
	set COMBO_MOVE_USED, [hl]   ; using a combo move -> no combo move next turn
	ld e, 0
	ret
.locked
	res COMBO_MOVE_USED, [hl]   ; clear so a combo move is usable again next turn
	ld hl, ComboRecoverText
	rst _PrintText
	ld e, 1                    ; tell the caller to fail the move
	ret

; Sunsette: carry SET if a = a COMBO MOVE id. Preserves a/hl. Used by CheckComboMoveLock.
IsComboMove:
	cp SHADOW_BOX
	jr z, .yes
	cp FINISHER
	jr z, .yes
	cp SHORYUKEN
	jr z, .yes
	and a                      ; clear carry
	ret
.yes
	scf
	ret

ComboRecoverText:
	text "It can't combo"
	line "again so soon!"
	prompt

; Sunsette: FINISHER live power. 50 BP if the user took a direct damaging hit this turn (FINISHER_INTERRUPTED,
; set in ApplyDamageTo*Pokemon while FINISHER waits - it resolves LAST), else 150 BP + "FINISH THEM!".
; jpfar'd from FinisherPowerModifier (newCode is full); the final ret returns to CheckRemapMoveData.
FinisherPowerImpl::
	ldh a, [hWhoseTurn]
	and a
	ld bc, wPlayerMovePower
	ld hl, wPlayerBattleStatus1
	jr z, .got
	ld bc, wEnemyMovePower
	ld hl, wEnemyBattleStatus1
.got
	bit FINISHER_INTERRUPTED, [hl]
	jr nz, .interrupted
	ld a, 150                  ; unimpeded -> the big finish
	ld [bc], a
	ld hl, FinishThemText
	rst _PrintText
	ret
.interrupted
	ld a, 50                   ; took a hit first -> a clipped 50-BP finish (never a wasted turn)
	ld [bc], a
	ret

FinishThemText:
	text "FINISH THEM!"
	prompt

; Sunsette: OROCLASM live power (the mirror of FINISHER). jpfar'd from OroclasmPowerModifier (newCode full),
; pre-damage. OROCLASM goes LAST, so by now the foe has acted. Base 70; but 140 if the user took a PHYSICAL
; hit this turn = FINISHER_INTERRUPTED set (took a direct damaging hit) AND the foe's move type < SPECIAL
; (physical). GHOST ($08) is below SPECIAL ($14), so a GHOST move counts as physical here - the user's call:
; GHOST attacks always pick the better category, so they're treated as the worse one when defending.
OroclasmPowerImpl::
	ldh a, [hWhoseTurn]
	and a
	ld bc, wPlayerMovePower      ; the OROCLASM user's move power to set
	ld hl, wPlayerBattleStatus1
	ld de, wEnemyMoveType        ; the FOE's move type (player user -> foe = enemy)
	jr z, .got
	ld bc, wEnemyMovePower
	ld hl, wEnemyBattleStatus1
	ld de, wPlayerMoveType
.got
	ld a, 70                     ; default: the foe didn't hit it physically -> base 70
	ld [bc], a
	bit FINISHER_INTERRUPTED, [hl]
	ret z                        ; took no direct hit this turn -> stays 70
	ld a, [de]
	cp SPECIAL
	ret nc                       ; special-typed hit (>= SPECIAL) -> stays 70 (GHOST < SPECIAL falls through)
	ld a, 140                    ; took a PHYSICAL-typed hit -> retaliate at 140
	ld [bc], a
	ld hl, OroclasmRetaliateText
	rst _PrintText
	ret

OroclasmRetaliateText:
	text "It struck back"
	line "twice as hard!"
	prompt

; Sunsette: ENERGY FLUX (0-BP capacitor setup). callfar'd from HazeFlinchEffect_ (newCode was full, so this
; lives in the floated status-immunities bank). Fails (no effect) if the user is already ENERGIZED; otherwise
; it arms the charge:
;   - retype slot 2 to FLOATING ($12), UNLESS the user already has an air type (FLYING/FLOATING) in either
;     slot - a Flyer/Floater is already aloft, so its typing is left alone;
;   - raise the user's SPECIAL by 2 (SPECIAL_UP2_EFFECT via RaiseUserStatViaSwap's temp-swap);
;   - set the ENERGIZED bit (BattleStatus1). The charge is spent later by EnergyFluxDischarge.
; hWhoseTurn = the ENERGY FLUX user.
EnergyFluxEffect_::
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus1
	jr z, .gotStatus
	ld hl, wEnemyBattleStatus1
.gotStatus
	bit ENERGIZED, [hl]
	jr nz, .failed                ; already charged -> "but it failed!"
	callfar PlayCurrentMoveAnimation2 ; 0-BP move: nothing else plays its anim, so do it here
	; retype slot 2 -> FLOATING unless an air type is already present in either slot
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonType1
	jr z, .gotType
	ld hl, wEnemyMonType1
.gotType
	ld a, [hli]                   ; type1 (hl -> type2)
	call .isAir
	jr z, .skipRetype             ; already a FLYER/FLOATER -> leave typing alone
	ld a, [hl]                    ; type2
	call .isAir
	jr z, .skipRetype
	ld a, FLOATING
	ld [hl], a                    ; type2 = FLOATING
.skipRetype
	; set ENERGIZED on the user's BattleStatus1
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus1
	jr z, .arm
	ld hl, wEnemyBattleStatus1
.arm
	set ENERGIZED, [hl]
	ld hl, EnergyFluxChargeText
	rst _PrintText
	ld a, SPECIAL_UP2_EFFECT
	jpfar RaiseUserStatViaSwap    ; +2 SPECIAL ("greatly rose"); tail-call (newCode)
.failed
	jpfar PrintButItFailedText_   ; "but it failed!"
.isAir
	cp FLYING
	ret z
	cp FLOATING
	ret

EnergyFluxChargeText:
	text_far _EnergyFluxChargeText
	text_end

; Sunsette: ENERGY FLUX discharge. callfar'd from the ApplyDamage hooks AFTER an attacker's damaging hit lands
; (the call sites gate out confusion/crash self-hits). hWhoseTurn = the attacker. If the attacker is ENERGIZED
; and the move it just landed is special-typed (>= SPECIAL or GHOST - keyed to the move's TYPE so it never
; flickers per-target), spend the charge: clear ENERGIZED, reset the user's stat stages to neutral, reload its
; natural types + palette (undoing the FLOATING), and announce it. The special/GHOST test is inlined because
; callfar would clobber the type in a before the routine ran.
EnergyFluxDischarge::
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus1
	ld a, [wPlayerMoveType]
	jr z, .gotSide
	ld hl, wEnemyBattleStatus1
	ld a, [wEnemyMoveType]
.gotSide
	bit ENERGIZED, [hl]
	ret z                          ; not charged -> nothing to discharge
	; a = the just-used move's type; discharge only on a special-category (or GHOST) move
	cp GHOST
	jr z, .discharge
	cp SPECIAL
	ret c                          ; < SPECIAL and not GHOST -> physical, keep the charge
.discharge
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus1
	jr z, .clear
	ld hl, wEnemyBattleStatus1
.clear
	res ENERGIZED, [hl]
	callfar RockOnReset            ; reset the user's own stat stages to neutral (recomputes battle stats)
	callfar RefreshUserNaturalTypes ; reload natural types + repaint (removes the FLOATING) (newCode)
	ld hl, EnergyFluxDischargeText
	rst _PrintText
	ret

EnergyFluxDischargeText:
	text_far _EnergyFluxDischargeText
	text_end

; Sunsette: INDIGNATION / PSYCHOCRISIS activation cleanse. Runs ONCE, when the thrash lock is first set
; (callfar'd from ThrashPetalDanceEffect, which only fires on turn 1; continuation turns re-enter at
; PlayerCalcMoveDamage). The user throws everything away to rage: stat stages -> neutral (RockOnReset also
; restores the unmodified stats, so any burn/paralysis stat penalty is undone), all major status cured, and
; every positive battle state wiped EXCEPT FLOURISH/DOUBLE_FLOURISH (the regen gambit), CONFUSED,
; THRASHING_ABOUT (the lock itself, just set) and TRANSFORMED (structural - it's what species you are).
; hWhoseTurn = the user. Status-cure sync is modeled on PsychoShift: ReadPlayerMonCurHPAndStatus copies the
; battle mon's HP/status back into the party data, so the cure persists out of battle. Clobbers everything.
IndignationCleanse::
; --- substitute: clear the bit AND restore the mon sprite, else the doll lingers ---
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus2
	jr z, .gotSubStatus
	ld hl, wEnemyBattleStatus2
.gotSubStatus
	bit HAS_SUBSTITUTE_UP, [hl]
	jr z, .noSub
	res HAS_SUBSTITUTE_UP, [hl]      ; clear first so the anim slides the doll down (like it broke), not off
	callfar HideSubstituteShowMonAnim ; the user's own sub (hWhoseTurn side) - no turn flip
.noSub
; --- major status byte -> 0 (PSN/BRN/PAR/FRZ/SLP) + toxic counter ---
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonStatus
	ld de, wPlayerToxicCounter
	jr z, .gotStatus
	ld hl, wEnemyMonStatus
	ld de, wEnemyToxicCounter
.gotStatus
	xor a
	ld [hl], a                       ; clear all major status
	ld [de], a                       ; clear the toxic counter (the BADLY_POISONED bit is cleared by the BS3 mask)
; --- stat stages -> neutral (and restore full unmodified stats) ---
	callfar RockOnReset
; --- BattleStatus1/2/3 (consecutive bytes): keep only the carve-outs, clear every other battle state ---
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus1
	jr z, .gotBattleStatus
	ld hl, wEnemyBattleStatus1
.gotBattleStatus
	ld a, [hl]
	and (1 << THRASHING_ABOUT) | (1 << CONFUSED)  ; BS1: keep the lock + confusion
	ld [hli], a
	ld a, [hl]
	and (1 << DOUBLE_FLOURISH)                     ; BS2: keep only the FLOURISH doubler (the gambit)
	ld [hli], a
	ld a, [hl]
	and (1 << TRANSFORMED) | (1 << FLOURISH)       ; BS3: keep TRANSFORMED (structural) + FLOURISH (the gambit)
	ld [hl], a
; --- push the cleared status into party data, then repaint both HUDs so the status icon clears ---
	callfar ReadPlayerMonCurHPAndStatus
	callfar DrawPlayerHUDAndHPBar
	callfar DrawEnemyHUDAndHPBar
	ret

; Sunsette: per-move post-hit SELF effects. callfar'd from the top of SpeciesMoveBonus (post-damage, target
; alive) on every connecting hit; a no-op unless the move matches. Lives here rather than inline in
; SpeciesMoveBonus because the newCode bank is full. hWhoseTurn = the user.
;   PSYCHOCRISIS -> 1/2-of-damage self-recoil (BigRecoilEffect_, the same recoil STRUGGLE uses, reads wDamage).
;   SUPERPOWER   -> lower the user's own ATTACK + DEFENSE by 1 each (recompute, then re-apply burn/par penalties
;                   since the recompute reads the UNMODIFIED stats and would otherwise un-halve a burned ATK).
; NB: SpeciesMoveBonus only runs when the target survives, so neither effect fires on the precise turn the move
; lands a KO (acceptable - recoil/self-drop is the cost of NOT finishing, and you "won" the KO turn either way).
SunsettePostHitSelfEffects::
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveNum]
	jr z, .gotMove
	ld a, [wEnemyMoveNum]
.gotMove
	cp PSYCHOCRISIS
	jr z, .recoil
	cp SUPERPOWER
	jr z, .superpower
	ret
.recoil
	jpfar BigRecoilEffect_
.superpower
	ldh a, [hWhoseTurn]
	and a
	ld [wCalculateWhoseStats], a   ; 0 = player / 1 = enemy (matches hWhoseTurn); ld doesn't disturb the z flag
	ld hl, wPlayerMonStatMods
	jr z, .gotMods
	ld hl, wEnemyMonStatMods
.gotMods
	; stat-mod bytes: [0] = ATTACK, [1] = DEFENSE; neutral 7, min 1 (= -6). Lower each if not already floored.
	ld a, [hl]
	cp 1
	jr z, .recalcAtk
	dec [hl]
.recalcAtk
	push hl
	ld c, 0                        ; recompute ATTACK from its (now lowered) mod
	callfar CalculateModifiedStat
	pop hl
	inc hl                         ; -> DEFENSE mod
	ld a, [hl]
	cp 1
	jr z, .recalcDef
	dec [hl]
.recalcDef
	ld c, 1                        ; recompute DEFENSE
	callfar CalculateModifiedStat
	; the recompute discarded any burn/paralysis penalty - put it back. ApplyBurnAndParalysisPenalties
	; CLOBBERS hWhoseTurn (ldh [hWhoseTurn],a) and never restores it, so save + restore it ourselves -
	; the post-hit caller (SpeciesMoveBonus / the move flow) still needs the original side.
	ldh a, [hWhoseTurn]
	push af
	and a
	jr nz, .penEnemy
	callfar ApplyBurnAndParalysisPenaltiesToPlayer
	jr .penDone
.penEnemy
	callfar ApplyBurnAndParalysisPenaltiesToEnemy
.penDone
	pop af
	ldh [hWhoseTurn], a
	ld hl, SuperpowerStrainText
	rst _PrintText
	ret

SuperpowerStrainText:
	text "It strained its"
	line "muscles!"
	prompt
