; Sunsette: STRENGTH + UNLEASH RAGE heavy logic, relocated to newCode3 because the newCode bank (which holds
; the remap modifiers + SpeciesMoveBonus) is full. Reached via callfar trampolines.

; STRENGTH weight-class recoil: if the user is a STRICTLY LIGHTER weight class than the target (Low Kick
; brackets <=10/25/50/100/200/>200 kg), the user takes 1/2-damage recoil and we print "But the foe was
; too heavy!". Same class or heavier = no recoil, so heavy hitters (Snorlax/Golem/Onix vs Dragonite, all
; class 6) swing freely. Weight class is a 1-6 rank; weightless foes (MISSINGNO / SPIRIT_* / >151) read as
; class 0. callfar'd from StrengthRagePostHit's strength branch, AFTER the move dealt damage (so wDamage is
; the damage dealt and the target survived). Reuses BigRecoilEffect_ (1/2 of damage) for the HP loss.
StrengthMaybeRecoil_::
	; user weight class
	ldh a, [hWhoseTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .gotUser
	ld a, [wEnemyMonSpecies]
.gotUser
	call .weightOf
	call .classOf
	push af                ; save user weight class (the target lookup clobbers regs)
	; target weight class
	ldh a, [hWhoseTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .gotTarget
	ld a, [wBattleMonSpecies]
.gotTarget
	call .weightOf
	call .classOf          ; a = target weight class
	pop bc                 ; b = user weight class
	cp b
	ret z                  ; equal class -> not lighter -> no recoil
	ret c                  ; target class < user class -> user heavier -> no recoil
	; target class > user class -> user is strictly lighter -> 1/2-damage recoil
	ld hl, StrengthTooHeavyText
	rst _PrintText
	callfar BigRecoilEffect_ ; 1/2 of the damage dealt to the user (prints the recoil line itself)
	ret

; a = species -> de = dex weight (1/10 kg), or de = 0 if non-dex (index 0 / >151)
.weightOf
	ld [wPokedexNum], a
	call IndexToPokedex
	ld a, [wPokedexNum]
	and a
	jr z, .noWeight
	cp 151 + 1
	jr nc, .noWeight
	farcall GetMetricMeasurements ; de = weight (survives the bankswitch)
	ret
.noWeight
	ld de, 0
	ret

; de = weight -> a = weight-class rank 1-6 (heavier = higher); de = 0 -> a = 0.
.classOf
	ld a, d
	or e
	ret z
	ld bc, 100
	call .leW
	ld a, 1
	ret c
	ld bc, 250
	call .leW
	ld a, 2
	ret c
	ld bc, 500
	call .leW
	ld a, 3
	ret c
	ld bc, 1000
	call .leW
	ld a, 4
	ret c
	ld bc, 2000
	call .leW
	ld a, 5
	ret c
	ld a, 6
	ret

; carry SET if de <= bc (weight <= threshold). Clobbers a only.
.leW
	ld a, c
	sub e
	ld a, b
	sbc d
	ccf
	ret

; Post-hit hook for STRENGTH / UNLEASH RAGE - callfar'd from SpeciesMoveBonus AFTER the move dealt damage
; (target alive = "able to damage"). Re-reads the move number to dispatch.
StrengthRagePostHit::
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveNum]
	jr z, .gotMove
	ld a, [wEnemyMoveNum]
.gotMove
	cp BLOOD_RUSH
	jr z, .rage
; STRENGTH (flat 100 BP): if the user is a lighter weight class than the target, take 1/2-damage recoil,
; then a 30% chance to raise the user's ATTACK by 1 (no cap).
	call StrengthMaybeRecoil_ ; "But the foe was too heavy!" + 1/2 recoil when the user is strictly lighter
	callfar FarBattleRandom ; d = random byte (de survives the bankswitch)
	ld a, d
	cp 30 percent + 1
	ret nc                 ; 70%: no ATTACK boost
	callfar RaiseUserAttackUp1 ; +1 ATK (newCode)
	ret
; UNLEASH RAGE: snap the user out of CONFUSION and clear its own non-sleep status (PSN/BRN/FRZ/PAR), recalcing
; the burn/paralysis stat penalties. Only when something is present.
; Sunsette: BLOOD RUSH (comeback). On a connecting hit, raise the user's ATTACK by (1 + desperation stage),
; so +1 healthy up to +4 at max desperation. The +1 plays the normal "ATTACK rose!" line; the extra `stage`
; is added to the mod silently and recalced. At stages 2-3 it then snaps the user out of CONFUSION and clears
; its own non-sleep status (PSN/BRN/FRZ/PAR), recalcing the burn/paralysis penalties.
.rage
	callfar GetDesperationStage  ; e = stage
	ld a, e
	push af                      ; save stage
	callfar RaiseUserAttackUp1   ; +1 ATTACK (with the "ATTACK rose!" message + recalc)
	pop af
	push af                      ; keep stage saved
	and a
	jr z, .rageClearCheck        ; stage 0 -> only the +1
	ld b, a                      ; b = stage (the extra raise)
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMonAttackMod
	jr z, .rageMod
	ld hl, wEnemyMonAttackMod
.rageMod
	ld a, [hl]
	add b
	cp 13 + 1
	jr c, .rageNoCap
	ld a, 13                     ; cap at +6 (mod 13)
.rageNoCap
	ld [hl], a
	ldh a, [hWhoseTurn]
	ld [wCalculateWhoseStats], a ; 0 = player / nonzero = enemy
	callfar CalculateModifiedStats ; apply the extra stages silently
.rageClearCheck
	pop af                       ; a = stage
	cp 2
	ret c                        ; stages 0-1: no status clear
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus1
	ld de, wBattleMonStatus
	jr z, .rageUser
	ld hl, wEnemyBattleStatus1
	ld de, wEnemyMonStatus
.rageUser
	ld a, [de]
	and $78                ; PSN/BRN/FRZ/PAR (non-sleep)
	jr nz, .rageClear
	bit CONFUSED, [hl]
	ret z                  ; nothing to clear
.rageClear
	res CONFUSED, [hl]
	callfar UndoBurnParStats ; recalc: undo the user's burn/par stat penalties (reads status first)
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonStatus
	jr z, .rageStat
	ld hl, wEnemyMonStatus
.rageStat
	ld a, [hl]
	and SLP_MASK           ; keep only sleep bits (clear PSN/BRN/FRZ/PAR; sleep can't be present here)
	ld [hl], a
	ld hl, UnleashRageClearText
	rst _PrintText
	ret

UnleashRageClearText:
	text_far _UnleashRageClearText
	text_end

StrengthTooHeavyText:
	text_far _StrengthTooHeavyText
	text_end
