; Sunsette: the critical-hit routine + its helpers + the high-crit move table, floated out of the full
; "Battle Core" bank into their own ROMX section (Battle Core had only 3 bytes free). Callers use
; `callfar CriticalHitTest` - the routine only outputs to wCriticalHitOrOHKO (RAM), so the bankswitch's
; register clobber is harmless at the call sites. The one Battle-Core-local dependency, BattleRandom, is
; reached via FarBattleRandom (b = crit threshold is push/pop'd across the bankswitch). The HighCriticalMoves
; table rides along so CriticalHitTest can still read it inline with [hli] in this same bank.
SECTION "Sunsette Critical Hit", ROMX

; Azure Heights claims "the fastest pokémon (who are, not coincidentally,
; among the most popular) tend to CH about 20 to 25% of the time."
CriticalHitTest:
	xor a
	ld [wCriticalHitOrOHKO], a
	call DemolishBreakScreens ; Sunsette: DEMOLISH (always) + HYPER BEAM (desperate) shatter the target's screens pre-damage
	call CheckBrunoNoCrit ; Sunsette: BRUNO's room - his mons cannot be crit (overrides forced crits)
	ret c
	; Sunsette: forced-crit-vs-status fully retired (FINISHER, the last user, no longer does it); no move
	; force-crits a statused target now - POISON's flat crit-floor vs statused (CheckPoisonCritVsStatus) is the only punish.
.normalCalc
	ldh a, [hWhoseTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr nz, .handleEnemy
	ld a, [wBattleMonSpecies]
.handleEnemy
	ld [wCurSpecies], a
	call GetMonHeader
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMovePower
	ld de, wPlayerBattleStatus2
	jr z, .calcCriticalHitProbability
	ld hl, wEnemyMovePower
	ld de, wEnemyBattleStatus2
.calcCriticalHitProbability
	ld a, [hld]                  ; read base power from RAM
	and a
	ret z                        ; do nothing if zero
	dec hl
	ld c, [hl]                   ; read move id
; PureRGBnote: CHANGED: crit chance is now a quadratic curve of base Speed.
; threshold = baseSpeed^2 / 256, then x1.5 (normal) / x8 (high-crit) / x4 (focus energy), capped at 255.
	xor a
	ldh [hMultiplicand], a
	ldh [hMultiplicand + 1], a
	ld a, [wMonHBaseSpeed]
	ldh [hMultiplicand + 2], a
	ldh [hMultiplier], a
	push de
	call Multiply
	pop de
	ldh a, [hProduct + 2]        ; baseSpeed^2 / 256
	ld b, a
; Sunsette: halve Speed's contribution to crit rate unless the attacker is "important"
	call CheckFullCritSpeed
	jr nz, .fullCritSpeed
	srl b
.fullCritSpeed
; Sunsette: FIGHTING-type attackers are vital-point strikers whose crit rate scales with desperation -
; x1 at green HP, x2 at yellow, x4 at red. Applied to the speed contribution before the Focus Energy /
; high-crit multipliers, so it compounds. Base x1 means a healthy Fighting-type has an ordinary crit rate;
; the menace only emerges as it gets cornered (its Demolish/Pivot Strike movepool covers the full-HP case).
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonType1
	jr z, .gotCritAtkType
	ld hl, wEnemyMonType1
.gotCritAtkType
	ld a, [hli]
	cp FIGHTING
	jr z, .fightingScale
	ld a, [hl]
	cp FIGHTING
	jr nz, .afterFighting
.fightingScale
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerHPBarColor]   ; attacker's HP-bar colour: 0 green / 1 yellow / 2 red
	jr z, .gotFightingHP
	ld a, [wEnemyHPBarColor]
.gotFightingHP
	and a
	jr z, .afterFighting        ; green -> x1 (no boost)
	sla b                       ; yellow/red -> at least x2
	jr c, .fightingCap
	dec a
	jr z, .afterFighting        ; yellow (tier 1) -> x2, done
	sla b                       ; red (tier 2) -> x4
	jr nc, .afterFighting
.fightingCap
	ld b, $ff ; cap
.afterFighting
; Sunsette: the POISON-vs-statused crit bonus is a FLAT additive floor applied at .finishcalc (after the move
; multiplier), NOT a multiplier here - a x4 just re-floors the slow poisons whose speed rate is near zero.
; Sunsette: Articuno/Zapdos/Moltres/Mewtwo/Mew can only crit via Focus Energy or a high-crit move
	call CheckCritRestrictedSpecies
	jr nz, .critAllowed
	ld a, [de]
	bit GETTING_PUMPED, a        ; focus energy active -> crit allowed
	jr nz, .critAllowed
	ld hl, HighCriticalMoves
.restrictLoop
	ld a, [hli]
	cp c                         ; high-crit move -> crit allowed
	jr z, .critAllowed
	inc a                        ; FF terminates loop
	jr nz, .restrictLoop
	ld b, 0                      ; otherwise this legendary cannot crit at all
	jr .finishcalc
.critAllowed
	ld a, [de]
	bit GETTING_PUMPED, a        ; test for focus energy
	jr z, .noFocusEnergyUsed
	sla b                        ; focus energy: x4 crit rate
	jr c, .capCritical
	sla b
	jr c, .capCritical
.noFocusEnergyUsed
	ld hl, HighCriticalMoves     ; table of high critical hit moves
.Loop
	ld a, [hli]                  ; read move from move table
	cp c                         ; does it match the move about to be used?
	jr z, .HighCritical          ; high critical hit ratio move
	inc a                        ; FF terminates loop
	jr nz, .Loop
.normalCritRate
	ld a, b                      ; normal move: x1.5 crit rate
	srl a
	add b
	jr c, .capCritical
	ld b, a
	jr .finishcalc
.HighCritical
; Sunsette: EXTERMINATE only earns its high-crit ratio if it MOVED SECOND this turn - a true turn-order check.
; wFirstMoverTurn records who acted first (0 player / 1 enemy), set at the order decision and reset at turn
; start, so this fires even when the foe used a status move or whiffed (unlike the old FINISHER_INTERRUPTED
; "took a hit" proxy). If the user led the turn it falls back to x1.5; every other high-crit move is uncond.
	ld a, c                      ; c = move id
	cp EXTERMINATE
	jr nz, .doHighCrit
	ldh a, [hWhoseTurn]          ; a = current attacker (0 = player, 1 = enemy)
	ld hl, wFirstMoverTurn
	cp [hl]
	jr z, .normalCritRate        ; attacker WAS the first mover -> moved first -> ordinary crit rate
.doHighCrit
	sla b                        ; x2
	jr c, .capCritical
	sla b                        ; x4
	jr c, .capCritical
	sla b                        ; x8 -> baseSpeed^2 / 32 (auto-crit near Speed 90)
	jr nc, .finishcalc
.capCritical
	ld b, $ff
.finishcalc
	call ApplyArenaCritScale     ; Sunsette: VIRIDIAN GYM / final RIVAL (Champion's room) - enemy crit rate x2
; Sunsette: POISON-type attacker vs a statused/confused target gets a FLAT +25% crit floor (additive). It
; lifts the slow poisons (whose speed-based rate is near zero) to a worthwhile ~25%, while the speed term
; above still scales the fast ones higher - and the Earth Badge amplifies that speed term, not this flat.
; Applied after the move multiplier + arena scale so it's a true flat add. Capped at 255.
	call CheckPoisonCritVsStatus
	jr nc, .afterPoisonFloor
	ld a, b
	add 64                       ; +64/256 ~= +25% crit chance
	jr nc, .poisonFloorStore
	ld a, $ff                    ; cap
.poisonFloorStore
	ld b, a
.afterPoisonFloor
	push bc                      ; Sunsette: FarBattleRandom (callfar) clobbers b via the bankswitch; b is the crit threshold
	callfar FarBattleRandom      ; d = random value (survives the bankswitch)
	pop bc                       ; restore b = crit threshold
	ld a, d
	rlca
	rlca
	rlca
	cp b                         ; check a against calculated crit rate
	ret nc                       ; no critical hit if no borrow
	ld a, $1
	ld [wCriticalHitOrOHKO], a   ; set critical hit flag
	ret

; Sunsette: DEMOLISH (display name; const DEMOLISH) is Karate Chop with Brick Break's screen-break.
; Called at the very top of CriticalHitTest (pre-damage, and a high-crit move already passes through here, so
; this costs zero bytes in the full Battle Core / newCode banks). For any other move it returns immediately.
; For DEMOLISH it clears the TARGET's REFLECT + LIGHT SCREEN *before* damage is rolled, so the strike lands
; at full power and the screens are gone for the rest of the battle. HYPER BEAM does the same at desperation
; stage 2-3. This runs BEFORE the accuracy check, so a miss still shatters the screens - INTENTIONAL: a near
; miss still smashes through the wall (matters most for HYPER BEAM, which is 90% acc). Clobbers a/hl/flags -
; fine, CriticalHitTest reloads everything after this returns.
DemolishBreakScreens:
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveNum]
	jr z, .gotMove
	ld a, [wEnemyMoveNum]
.gotMove
	cp DEMOLISH
	jr z, .break                 ; DEMOLISH always shatters screens
	cp OROCLASM
	jr z, .break                 ; Sunsette: OROCLASM (anti-barrier finisher) always shatters screens pre-damage
	cp HYPER_BEAM
	ret nz                       ; only DEMOLISH, OROCLASM and HYPER BEAM break screens
	callfar GetDesperationStage  ; Sunsette: HYPER BEAM only shatters them at desperation stage 2-3
	ld a, e
	cp 2
	ret c
.break
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyBattleStatus3   ; player attacking -> target = enemy
	jr z, .gotTarget
	ld hl, wPlayerBattleStatus3
.gotTarget
	bit HAS_LIGHT_SCREEN_UP, [hl]
	jr nz, .hadScreen
	bit HAS_REFLECT_UP, [hl]
	ret z                        ; no screens up -> nothing to shatter, stay silent
.hadScreen
	res HAS_LIGHT_SCREEN_UP, [hl]
	res HAS_REFLECT_UP, [hl]
	ld hl, ScreenShatteredText
	jp PrintText

ScreenShatteredText:
	text "The barrier"
	line "shattered!"
	prompt

; Sunsette: a PHYSICAL-type (NOT Ghost) CRITICAL HIT cracks the target's screens AFTER its damage - the crit is
; still mitigated by the screen (DoubleDefenseForScreen ran in the pre-damage calc), then the barrier shatters
; for everything after. This is the "crack" tier, distinct from DemolishBreakScreens' pre-damage "sledgehammer".
; callfar'd from PrintCriticalOHKOText (the shared post-damage crit-text site), only when a crit/OHKO just
; landed. Type-based like the rest of the engine: physical = move type < SPECIAL; GHOST (< SPECIAL) is excluded
; so it can't be the universal screen-breaker. Breaks BOTH screens + one "barrier shattered" line. Clobbers a/hl.
CritCrackScreens::
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveType]
	jr z, .gotType
	ld a, [wEnemyMoveType]
.gotType
	cp GHOST
	ret z                        ; Ghost is dynamic-category here -> never cracks screens
	cp SPECIAL
	ret nc                       ; special-typed (>= SPECIAL) -> not a physical crit
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyBattleStatus3   ; player attacking -> target = enemy
	jr z, .gotTarget
	ld hl, wPlayerBattleStatus3
.gotTarget
	bit HAS_LIGHT_SCREEN_UP, [hl]
	jr nz, .hadScreen
	bit HAS_REFLECT_UP, [hl]
	ret z                        ; no screens up -> nothing to crack
.hadScreen
	res HAS_LIGHT_SCREEN_UP, [hl]
	res HAS_REFLECT_UP, [hl]
	ld hl, ScreenShatteredText
	jp PrintText

; Sunsette: carry SET if the attacker (hWhoseTurn side) is a POISON-type AND the target currently has a major
; status (PSN/BRN/PAR/SLP/FRZ) OR is confused. Drives the POISON flat +25% crit floor (.finishcalc). Clobbers a, hl, flags.
CheckPoisonCritVsStatus:
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonType1     ; player attacking -> attacker = player's mon
	jr z, .gotAtkType
	ld hl, wEnemyMonType1
.gotAtkType
	ld a, [hli]
	cp POISON
	jr z, .atkIsPoison
	ld a, [hl]
	cp POISON
	jr nz, .no
.atkIsPoison
	ldh a, [hWhoseTurn]
	and a
	jr z, .targetEnemy
	ld a, [wBattleMonStatus]   ; enemy attacking -> target = player
	ld hl, wPlayerBattleStatus1
	jr .checkStatus
.targetEnemy
	ld a, [wEnemyMonStatus]
	ld hl, wEnemyBattleStatus1
.checkStatus
	and a
	jr nz, .yes                ; any major status
	bit CONFUSED, [hl]
	jr nz, .yes
.no
	and a                      ; clear carry
	ret
.yes
	scf
	ret

; Sunsette: returns nz if the attacker keeps its full Speed->crit contribution, z if it should be halved.
; Full for: the player while holding the EARTHBADGE; enemy gym leaders / Giovanni / the rival / the
; Elite Four. Uses only register a.
CheckFullCritSpeed:
	ldh a, [hWhoseTurn]
	and a
	jr nz, .enemyTurn
; the player's mon is attacking
	ld a, [wObtainedBadges]
	bit BIT_EARTHBADGE, a
	ret ; nz (full) with the Earth Badge, z (halve) without
.enemyTurn
	ld a, [wIsInBattle]
	cp 2
	jr nz, .halve ; Sunsette: wild battles no longer grant a crit-speed exception
.enemyTrainer
	ld a, [wTrainerClass]
	cp RIVAL1
	jr z, .full
	cp GIOVANNI
	jr z, .full
	cp RIVAL2
	jr z, .full
	cp RIVAL3
	jr z, .full
	cp ROCKET_QUEEN ; Sunsette: the four ROCKET SISTERS also get unlocked (full base-Speed) crit
	jr z, .full
	cp LORELEI
	jr z, .full
	cp AGATHA
	jr z, .full
	cp LANCE
	jr z, .full
	cp BRUNO
	jr c, .halve ; below BRUNO -> ordinary trainer
	cp SABRINA + 1
	jr c, .full ; BRUNO..SABRINA (all gym leaders) -> full
.halve
	xor a ; z -> halve
	ret
.full
	or 1 ; nz -> full
	ret

; Sunsette: ARENA EFFECT - BRUNO's room: his Pokemon cannot be critically hit. Carry SET (suppress the
; crit, even forced ones) when the DEFENDER is the enemy mon, i.e. the player is attacking (hWhoseTurn 0)
; in BRUNOS_ROOM. The Champ Arena rematch is a different map, so it is unaffected. Uses register a.
CheckBrunoNoCrit:
	ld a, [wCurMap]
	cp BRUNOS_ROOM
	jr nz, .allow
	ldh a, [hWhoseTurn]
	and a                        ; player's turn -> target = enemy = Bruno's mon
	jr nz, .allow                ; enemy attacking the player -> ordinary crits
	scf
	ret
.allow
	or a
	ret

; Sunsette: ARENA EFFECT - VIRIDIAN GYM (vicious trainers) and CHAMPIONS_ROOM (the final rival) double
; the ENEMY's crit threshold (b). Only the enemy's attacks get the boost; map-gated so the Champ Arena
; rematches are untouched. b is the crit threshold computed in .finishcalc.
ApplyArenaCritScale:
	ldh a, [hWhoseTurn]
	and a
	ret z                        ; player attacking -> no arena boost
	ld a, [wCurMap]
	cp VIRIDIAN_GYM
	jr z, .double
	cp CHAMPIONS_ROOM
	ret nz
.double
	sla b                        ; x2 crit rate
	ret nc
	ld b, $ff                    ; cap
	ret

; Sunsette: returns z if the attacker (wCurSpecies) is one of the legendaries that can only crit
; via Focus Energy or a high-crit move (Articuno / Zapdos / Moltres / Mewtwo / Armored Mewtwo / Mew). Uses register a.
CheckCritRestrictedSpecies:
	ld a, [wCurSpecies]
	jp CheckLegendaryAffectionSpecies ; Sunsette: shared legendary check in home/pokemon.asm

; Sunsette: crit DAMAGE scaler. Crits multiply the attacker's level by x1.5 normally (the hack's nerfed crit),
; but NORMAL-type attackers - and FARFETCH'D, whose Grass typing would otherwise lose its old Normal-type crit
; signature - crit for x2 (vanilla strength). In/out: e = level (<= 100, so the x2 sla can't overflow a byte).
; callfar'd from both GetDamageVars crit branches; the bankswitch clobbers b, so those call sites push/pop bc.
ScaleCritDamage::
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonType1     ; player attacking -> attacker = player's mon
	jr z, .gotTypes
	ld hl, wEnemyMonType1
.gotTypes
	ld a, [hli]
	and a                      ; NORMAL == $00
	jr z, .double
	ld a, [hl]
	and a
	jr z, .double
	ldh a, [hWhoseTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .gotSpecies
	ld a, [wEnemyMonSpecies]
.gotSpecies
	cp FARFETCHD
	jr z, .double
	ld a, e                    ; x1.5 (level + level/2)
	srl a
	add e
	ld e, a
	ret
.double
	sla e                      ; x2
	ret

; Sunsette: Super Fang deals fixed fractional damage - half the target's current HP normally, but
; 2/3 on a critical hit ("a particularly vicious bite"). Super Fang is a SetDamageEffects move, so the
; main damage path SKIPS CriticalHitTest for it; we run the test here instead, which means the crit
; chance follows the engine's normal speed-based rules (Focus Energy / Earth Badge / arena scaling all
; apply). Setting wCriticalHitOrOHKO also makes PrintCriticalOHKOText announce "Critical hit!" for free
; right after the damage is applied. Floated here (with the crit code) because the Battle Core bank is full.
; Lives in the same section as CriticalHitTest, so the call below is a near call. Reached via callfar.
SuperFangEffect:
	call CriticalHitTest ; sets wCriticalHitOrOHKO = 1 on a crit; Super Fang has power 1, so the test runs
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyMonHP
	jr z, .gotTarget
	ld hl, wBattleMonHP
.gotTarget
; stash the target's current HP in wDamage and load it as the dividend
	ld de, wDamage
	ld a, [hli]
	ldh [hDividend], a
	ld [de], a
	inc de
	ld a, [hl]
	ldh [hDividend + 1], a
	ld [de], a
	ld a, [wCriticalHitOrOHKO]
	and a
	jr nz, .crit
; normal hit: damage = HP / 2 (the quotient is the result directly)
	ld a, 2
	ldh [hDivisor], a
	ld b, 2
	call Divide
	ldh a, [hQuotient + 2]
	ld d, a
	ldh a, [hQuotient + 3]
	ld e, a
	jr .store
.crit
; critical hit: damage = HP - HP/3 = 2/3 HP
	ld a, 3
	ldh [hDivisor], a
	ld b, 2
	call Divide
	ldh a, [hQuotient + 2]
	ld b, a
	ldh a, [hQuotient + 3]
	ld c, a
	ld hl, wDamage ; full HP stashed above
	ld a, [hli]
	ld d, a
	ld a, [hl]
	ld e, a
	sub c ; de = HP - HP/3
	ld e, a
	ld a, d
	sbc b
	ld d, a
.store
	ld hl, wDamage
	ld a, d
	ld [hli], a
	ld a, e
	ld [hl], a
	or d
	ret nz
; Super Fang's damage is always at least 1
	ld [hl], 1
	ret

INCLUDE "data/battle/critical_hit_moves.asm"
