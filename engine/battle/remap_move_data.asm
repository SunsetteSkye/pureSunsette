; PureRGBnote: ADDED: Certain moves get better accuracy, power, or other effects when used by specific pokemon
; Also this list can be used to modify a move's data such as power/accuracy after selecting it based on the current state of battle.
; TODO: make multiple pokemon able to receive remap for the same move
; Sunsette: wrapper - clear the signature-message flag, run the remap, then announce "Signature Move!"
; if a species-specific bonus on a NORMAL move (Beedrill/Golem/Wigglytuff/etc.) actually applied this
; turn. Called right after "X used Y!" (DisplayUsedMoveText) and before damage, so the alert reads
; "X used Y! Signature Move!" then proceeds as normal. .doRemap's many ret/jp-hl exits all return here.
CheckRemapMoveData::
	xor a
	ld [wSignatureMoveActive], a
	call .doRemap
	callfar CheckPsyduckHeadache ; Sunsette: PSYDUCK's hidden psychic-move headache recoil (floated section)
	callfar CheckClefairyMetronome ; Sunsette: CLEFAIRY/CLEFABLE METRONOME also raises a random stat (floated)
	callfar ComebackApplyPower ; Sunsette: comeback family - stage-scaled power + desperation flavour (no-op for other moves)
	ld a, [wSignatureMoveActive]
	and a
	ret z
	ld hl, SignatureMoveText
	jp PrintText
.doRemap:
	call GetMoveRemapData
	push de
	ld hl, RemappableMoves
	ld de, 4
	call IsInArray
	pop de
	ret nc
	inc hl
	ld a, [hl]
	cp -1
	jr z, .donePokemonCheck
	; the move has a specific pokemon required (it is a signature move)
	CheckEvent FLAG_SIGNATURE_MOVES_TURNED_OFF
	ret nz
	ld a, d
	cp VOLCANIC_MAGMAR
	jr nz, .notVolcanicMagmar
	ld a, MAGMAR ; treat VOLCANIC_MAGMAR as MAGMAR when checking for signature moves
.notVolcanicMagmar
	cp FLOATING_WEEZING
	jr nz, .notFloatingWeezing
	ld a, WEEZING ; Sunsette: treat FLOATING WEEZING as WEEZING for signatures (same idea as VOLCANIC MAGMAR), so its SLUDGE BOMB also gets the burn signature
.notFloatingWeezing
	cp [hl]
	ret nz
	; Sunsette: a species-specific signature matched (and signatures are ON) -> flag the message.
	; a is reloaded immediately below, so clobbering it here is fine.
	ld a, 1
	ld [wSignatureMoveActive], a
.donePokemonCheck
	inc hl
	ld a, [hl]
	cp -2
	jr z, .modifierFunction
	call GetMoveRemapData2
	ld a, [hli]
	cp -1
	jr z, .donePowerCheck
	ld [bc], a
.donePowerCheck
	ld a, [hli]
	and a
	ret z ; no accuracy change
	ld [de], a
	ret
.modifierFunction
	inc hl
	ld a, [hl]
	ld hl, ModifierFuncs
	call GetAddressFromPointerArray
	jp hl

SignatureMoveText: ; Sunsette: "Signature Move!" - shown after a species-specific signature on a normal move
	text_far _SignatureMoveText
	text_end

GetMoveRemapData:
	ldh a, [hWhoseTurn]
	and a
	ld a, [wBattleMonSpecies]
	ld d, a
	ld a, [wBattleMonLevel]
	ld e, a
	ld a, [wPlayerMoveNum]
	ret z
	ld a, [wEnemyMonSpecies]
	ld d, a
	ld a, [wEnemyMonLevel]
	ld e, a
	ld a, [wEnemyMoveNum]
	ret

GetMoveRemapData2:
	ldh a, [hWhoseTurn]
	and a
	ld bc, wPlayerMovePower
	ld de, wPlayerMoveAccuracy
	ret z
	ld bc, wEnemyMovePower
	ld de, wEnemyMoveAccuracy
	ret

; byte 1 = move
; byte 2 = required pokemon for modifier or -1 for any pokemon
; byte 3 = modified power or -1 if no change or -2 if the move uses a modifier function
; byte 4 = modified accuracy or 0 if no accuracy change, or which modifier function to use if previous byte was -2
RemappableMoves::
	db SING, -1, -2, 1
	db DOUBLESLAP, -1, -2, 0
	; Sunsette: OROCLASM no longer uses a power modifier - it's a flat 110 BP anti-barrier finisher now
	; (goes last + pre-damage screen clear, both handled outside the remap system). The old 70/140
	; counter-puncher (OroclasmPowerModifier/Impl, slot 19 below) is retired/orphaned, kept only so the
	; ModifierFuncs indices don't shift.
	db SUPERNOVA, -1, -2, 2
	db TOXIC, -1, -2, 4
	db EXPLOSION, -1, -2, 14 ; Sunsette: vanilla EXPLOSION faints the user on use (ExplosionFaintModifier); the DEFENSE-halve is in core.asm's EXPLODE_EFFECT branch
	db CRYSTALLIZE, -1, -2, 15 ; Sunsette: type1 -> CRYSTAL (Rock-like user) / ROCK (else); +2 DEF is the move's own DEFENSE_UP2_EFFECT
	db AGILITY, -1, -2, 16 ; Sunsette: +2 SPEED is the move's own SPEED_UP2_EFFECT; this adds the type-keyed ADAPTATION brace (AgilityBrace)
	db BARRIER, -1, -2, 17 ; Sunsette: +2 DEF is the move's own DEFENSE_UP2_EFFECT; this always braces NORMAL (BarrierBrace)
	; Sunsette: METEOR_DRIVE's ROCK/CRYSTAL-user 100%-accuracy remap (SkullBashModifier, ModifierFuncs slot 5)
	; removed - it now keeps its base 80 accuracy for everyone. Slot 5 is kept dead so indices 6+ don't shift.
	; Sunsette: SLAM is now TEMPEST (DRAGON, 30% flinch, hits FLY users); its old FilthySlamModifier
	; (130 BP vs poisoned) entry was removed. ModifierFuncs slot 6 is kept dead so indices 7+ don't shift.
	db SOLARBEAM, -1, -2, 7 ; Sunsette: live power - 60 (charge) / 120 (release, primed) / 90 (FIRE user) (SOLARBEAM)
	; signature moves start here
	; Sunsette: BEEDRILL's POISON STING signature removed (reverts to base 15 BP).
	db TWINEEDLE, BEEDRILL, -1, 0 ; Sunsette: no power change, just trips the "Signature Move!" flag; BEEDRILL's real Twineedle signature is the 40% poison (POISON_SIDE_EFFECT2) swap in TwoToFiveAttacksEffect
	db ZAPPERCUT, ELECTABUZZ, 90, 0
	db BLAZE_HAMMER, MAGMAR, 90, 0
	db FROST_FIST, JYNX, 90, 0
	db HYPNOSIS, HYPNO, -1, 85 percent
	; Sunsette: DRAGONITE's DRAGON_RAGE signature removed (no longer a MOVE MYSTIC signature mon).
	; Sunsette: RIPTIDE (WATERFALL) is no longer a power remap - its 50% user-SPEED-up (guaranteed for
	; GYARADOS/SEAKING/GOLDEEN) lives in BlossomBlitzEffect_. RIPTIDE is now the ONLY user of that effect
	; (PETAL_DANCE split off to SENBONZAKURA_EFFECT -> SenbonzakuraEffect_).
	; Sunsette: LICKITUNG's LICK signature (30 -> 70 BP) removed; its terminal VENOM LASH (CONSTRICT, L50) covers the niche.
	db SPIKE_CANNON, OMASTAR, 70, 0
	db HURRICANE, PIDGEOT, -1, 100 percent
	; Sunsette: BLASTOISE's HYDRO_PUMP / SKULL_BASH signatures removed (no longer a MOVE MYSTIC mon).
	db PSYBEAM, GOLDUCK, 105, 0
	db FLAMETHROWER, WEEZING, -1, 0 ; Sunsette: WEEZING's signature is now FLAMETHROWER - it gets STAB on it despite being POISON (granted in ShouldMoveGetStabBoost). This table entry only flags the "Signature Move!" banner. (SLUDGE BOMB reverts to its base 40% poison for WEEZING/KOFFING alike.)
	; Sunsette: TANGELA's VENOM LASH (CONSTRICT) signature removed. The remap only set 90 BP, which is already
	; the move's flat base power, so it changed nothing but the "Signature Move!" alert + Move Mystic listing.
	db CLOBBERCLOCK, KANGASKHAN, 90, 0 ; Sunsette: 70 BP normally, 90 BP for KANGASKHAN (signature)
	db TEMPEST, -1, -2, 8 ; Sunsette: power scales with the TARGET's weight (TempestWeightModifier, compressed brackets)
	db FINISHER, -1, -2, 6 ; Sunsette: power 150 unimpeded / 50 if the user took a direct hit first (FinisherPowerModifier -> FinisherPowerImpl, reads FINISHER_INTERRUPTED)
	; Sunsette: CRABHAMMER is a flat 100-BP move now (no longer a KRABBY/KINGLER signature, since RIPTIDE took
	; its TM slot and CRABHAMMER is no longer widespread). Its old by-user power remap was removed.
	; Sunsette: STRENGTH no longer remaps its power (flat 100 BP); its weight-class recoil + 30% +ATK are all in StrengthRagePostHit.
	; Sunsette: BLOOD RUSH (was MAD RUSH) is now a comeback-family move (flat 50 BP via ComebackPowerTables, with
	; an on-hit Attack ramp); its old slot-10 power remap is gone. ModifierFuncs slot 10 is kept dead so 11+ hold.
	; Sunsette: no-op (power/accuracy unchanged) species entry whose REAL signature bonus is an EFFECT applied
	; elsewhere (SnorlaxRestBonus). It lives here only so the species-match path flags the "Signature Move!"
	; message right after the move is announced.
	db REST, SNORLAX, -1, 0          ; SNORLAX: REST also grants FLOURISH + SPEED +1 (SnorlaxRestBonus)
	; Sunsette: EKANS/ARBOK FOCUS ENERGY signature - it also heals 1/4 max HP (EkansLineFocusEnergyHeal, in
	; arbok_signature.asm). These no-op entries just flag the "Signature Move!" banner when Focus Energy is used.
	db FOCUS_ENERGY, ARBOK, -1, 0
	db FOCUS_ENERGY, EKANS, -1, 0
	db SPLASH, -1, -2, 11            ; Sunsette: power scales with the USER's weight (SplashWeightModifier); MAGIKARP -> 0 (signature comedy)
	db SURF, -1, -2, 13              ; Sunsette: SURF is a PIKACHU/RAICHU signature once EVENT_SURFED_WITH_DUDE is set; SurfSignatureModifier only flags the "Signature Move!" alert (the WATERIFY itself is in SpeciesMoveBonus)
	db SHADOW_BOX, -1, -2, 18        ; Sunsette: SHADOW BOX power 75 (foe's selected move is Special) / 35 (anything else) - ShadowBoxPowerModifier
	db -1

ModifierFuncs:
	dw DoubleSlapModifier
	dw SingModifier
	dw ExplosionSelfdestructModifier
	dw FirewallModifier
	dw ToxicModifier
	dw SkullBashModifier
	dw FinisherPowerModifier ; 6 - Sunsette: PIVOT STRIKE power 60->80 vs a statused target (reuses the old dead FilthySlam slot)
	dw SolarBeamPowerModifier
	dw TempestWeightModifier
	dw FirewallModifier ; Sunsette: DEAD (CRABHAMMER no longer a signature); slot kept so the indices below don't shift
	dw UnleashRageModifier
	dw SplashWeightModifier
	dw SludgeBombModifier ; 12 - Sunsette: DEAD (WEEZING's SLUDGE BOMB burn signature removed 2026-06-23; slot kept so indices 13+ don't shift)
	dw SurfSignatureModifier ; 13 - Sunsette: PIKACHU/RAICHU SURF "Signature Move!" alert (gated on EVENT_SURFED_WITH_DUDE)
	dw ExplosionFaintModifier ; 14 - Sunsette: vanilla EXPLOSION faints the user the instant it is used
	dw CrystallizeModifier ; 15 - Sunsette: CRYSTALLIZE retypes the user's type1 (Rock-like -> CRYSTAL, else -> ROCK)
	dw AgilityBraceModifier ; 16 - Sunsette: AGILITY's type-keyed ADAPTATION brace
	dw BarrierBraceModifier ; 17 - Sunsette: BARRIER always braces NORMAL
	dw ShadowBoxPowerModifier ; 18 - Sunsette: SHADOW BOX power 75 (read foe's Special) / 35 (whiff)
	dw OroclasmPowerModifier ; 19 - Sunsette: OROCLASM power 70 / 140 if hit by a physical-typed move this turn (go-last counter)

; Sunsette: SolarBeam's power is decided live, before damage calc, from the user's state:
;   FIRE-type user           -> 120 (one-shot full power; recoil + 30% burn + -1 SPC, never charges)
;   non-fire, SOLARBEAM_PRIMED set -> 120 (the release of a charged beam; 30% burn + -1 SPC)
;   non-fire, not primed     -> 0   (the NON-DAMAGING charge turn: +1 SPC + FLOURISH; primes the release)
; The matching behavior (charge buffs / recoil / burn / -1 SPC / arm / disarm) is SolarBeamEffect_.
SolarBeamPowerModifier:
	call GetMoveRemapData2 ; bc = wXxxMovePower for the active side (de = accuracy, unused)
	call GetUserType       ; hl -> user's type1
	ld a, [hli]
	cp FIRE
	jr z, .fire
	ld a, [hl]
	cp FIRE
	jr z, .fire
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus3
	jr z, .gotStatus
	ld hl, wEnemyBattleStatus3
.gotStatus
	bit SOLARBEAM_PRIMED, [hl]
	ld a, 0   ; Sunsette: not primed -> charge turn is now NON-DAMAGING (+1 SPC + FLOURISH instead); SolarBeamEffect_ runs via ResidualEffects2 on this 0-power turn
	jr z, .store
	ld a, 120 ; primed -> release (full power)
	jr .store
.fire
	ld a, 120 ; Sunsette: FIRE users skip the charge and fire at full power (with recoil + the -1 SPC)
.store
	ld [bc], a
	ret

; Sunsette: TEMPEST (was TWISTER) scales with the TARGET's weight (Low Kick style), so a heavy flyer/dragon
; takes a real hit while a light bird is mostly just grounded. Brackets are COMPRESSED vs Low Kick so the
; top end doesn't collide with DRAGON's 2x-vs-Dragon (capped 90, not 120). Non-dex foes (MISSINGNO, the
; SPIRIT_* ghosts, etc.) fall back to the move's listed 60 BP. Weight (GetMetricMeasurements) is 1/10 kg:
;   <=10kg(100):20  <=25kg(250):35  <=50kg(500):50  <=100kg(1000):65  <=200kg(2000):80  else:90
TempestWeightModifier:
	call GetMoveRemapData2 ; bc = wXxxMovePower (user side); de = accuracy (unused)
	push bc                ; save the power pointer across the lookups
	ldh a, [hWhoseTurn]
	and a
	ld a, [wEnemyMonSpecies] ; player's turn -> target = enemy
	jr z, .gotSpecies
	ld a, [wBattleMonSpecies]
.gotSpecies
	ld [wPokedexNum], a
	call IndexToPokedex      ; wPokedexNum: internal index -> dex number (home)
	ld a, [wPokedexNum]
	and a
	jr z, .fallback          ; index 0 / non-dex
	cp 151 + 1
	jr nc, .fallback         ; > 151 (MISSINGNO / spirits) -> no real weight
	farcall GetMetricMeasurements ; de = weight in 1/10 kg (de survives the bankswitch)
	ld bc, 100
	call .weightLE
	ld a, 20
	jr c, .store
	ld bc, 250
	call .weightLE
	ld a, 35
	jr c, .store
	ld bc, 500
	call .weightLE
	ld a, 50
	jr c, .store
	ld bc, 1000
	call .weightLE
	ld a, 65
	jr c, .store
	ld bc, 2000
	call .weightLE
	ld a, 80
	jr c, .store
	ld a, 90
.store
	pop hl                   ; recover the power pointer
	ld [hl], a
	ret
.fallback
	ld a, 60                 ; listed power for non-dex foes
	pop hl
	ld [hl], a
	ret
; carry SET if de <= bc (weight <= threshold). Clobbers a only.
.weightLE
	ld a, c
	sub e
	ld a, b
	sbc d                    ; bc - de: carry set if bc < de (weight > threshold)
	ccf                      ; invert: carry set if de <= bc
	ret

; Sunsette: SPLASH now deals damage scaled by the USER's own weight (Low Kick style, but the heavier the
; USER, the harder the splash - think Gyarados, or a kaiju), at HALF Low Kick's power per bracket. MAGIKARP
; is the comedic exception: its SPLASH is a no-effect signature (power 0; the random "still nothing" line is
; printed by SplashEffect_). Weight (GetMetricMeasurements) is 1/10 kg:
;   <=10kg:10  <=25kg:20  <=50kg:30  <=100kg:40  <=200kg:50  else:60  (non-dex user -> 30 fallback)
SplashWeightModifier:
	call GetMoveRemapData2 ; bc = wXxxMovePower (user side); de = accuracy (unused)
	push bc                ; save the power pointer across the lookups
	ldh a, [hWhoseTurn]
	and a
	ld a, [wBattleMonSpecies] ; user's turn -> user = player
	jr z, .gotSpecies
	ld a, [wEnemyMonSpecies]
.gotSpecies
	cp MAGIKARP
	jr z, .magikarp
	ld [wPokedexNum], a
	call IndexToPokedex      ; internal index -> dex number
	ld a, [wPokedexNum]
	and a
	jr z, .fallback          ; index 0 / non-dex
	cp 151 + 1
	jr nc, .fallback         ; > 151 (MISSINGNO / spirits)
	farcall GetMetricMeasurements ; de = weight in 1/10 kg (survives the bankswitch)
	ld bc, 100
	call TempestWeightModifier.weightLE
	ld a, 10
	jr c, .store
	ld bc, 250
	call TempestWeightModifier.weightLE
	ld a, 20
	jr c, .store
	ld bc, 500
	call TempestWeightModifier.weightLE
	ld a, 30
	jr c, .store
	ld bc, 1000
	call TempestWeightModifier.weightLE
	ld a, 40
	jr c, .store
	ld bc, 2000
	call TempestWeightModifier.weightLE
	ld a, 50
	jr c, .store
	ld a, 60
.store
	pop hl                   ; recover the power pointer
	ld [hl], a
	ret
.fallback
	ld a, 30
	pop hl
	ld [hl], a
	ret
.magikarp
	pop hl                   ; hl = power pointer
	xor a
	ld [hl], a               ; 0 power -> MAGIKARP's SPLASH does no damage (signature comedy)
	CheckEvent FLAG_SIGNATURE_MOVES_TURNED_OFF
	ret nz
	ld a, 1
	ld [wSignatureMoveActive], a ; "Signature Move!" then SplashEffect_'s comedy line
	ret

; Sunsette: CrabhammerModifier removed - CRABHAMMER is now a flat 100-BP move (no by-user signature).
; Its ModifierFuncs slot was repointed to the no-op FirewallModifier so later indices stay put.

; Sunsette: UNLEASH RAGE / MAD RUSH (RAGE). Base 40 BP, TRIPLED to 120 if the user is hurt (HP bar not green) OR
; confused OR has a non-sleep status (PSN/BRN/FRZ/PAR). The matching on-hit status/confusion clear + recalc
; is in SpeciesMoveBonus.
UnleashRageModifier:
	jpfar UnleashRageModifier_ ; Sunsette: floated to the roomy comeback bank (reuses GetDesperationStage) to free newCode

CheckIfAsleep::
GetOpponentStatus::
	ldh a, [hWhoseTurn]
	and a
	ld bc, wEnemyMonStatus
	ld hl, wPlayerMovePower
	jr z, .gotStatus
	ld bc, wBattleMonStatus
	ld hl, wEnemyMovePower
.gotStatus
	ld a, [bc]
	and SLP_MASK
	ret

DoubleSlapModifier::
	call CheckIfAsleep
	jr nz, .double
	; Sunsette: awake target -> normally no bonus, but SNORLAX is "always drowsy" so it still takes the
	; wake-up bonus (and the hit never rouses it; see the deep-sleeper guard in ApplySleepHitTally). The
	; SNORLAX message + power-double live in the roomy sleep-hit section to spare the near-full Battle Core.
	callfar DoubleSlapAwakeBonus
	ret
.double
	ld a, [hl]
	sla a
	ld [hl], a ; double DOUBLESLAP's power vs a sleeping (or always-drowsy SNORLAX) target
	ret

; Sunsette: DoubleSlapModifierPart2 (force the sleeping target to "1 turn left") was removed - the general
; per-hit sleep-reduction system now handles waking a target that gets pummeled. See ApplySleepHitTally.

; Sunsette: DEAD as of 2026-06-23 - WEEZING's SLUDGE BOMB burn signature was removed (its signature is now
; FLAMETHROWER-with-STAB). No table entry dispatches here anymore; the body is kept only because ModifierFuncs
; slot 12 still points at it (kept dead so indices 13+ don't shift). Formerly: swapped SLUDGE BOMB's poison for
; a FIRE-immune 40% burn for WEEZING / FLOATING WEEZING.
SludgeBombModifier::
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyMonType1   ; player's turn -> target = enemy
	ld bc, wPlayerMoveEffect
	jr z, .gotPtrs
	ld hl, wBattleMonType1
	ld bc, wEnemyMoveEffect
.gotPtrs
	ld a, [hli]
	cp FIRE
	ret z                   ; target type 1 FIRE -> burn-immune -> keep the poison
	ld a, [hl]
	cp FIRE
	ret z                   ; target type 2 FIRE -> keep the poison
	ld a, BURN_SIDE_EFFECT2
	ld [bc], a              ; otherwise swap the 40% poison for a 40% burn (bumped in FreezeBurnParalyzeEffect)
	ret

SurfSignatureModifier::
	; Sunsette: flags the "Signature Move!" alert when PIKACHU/RAICHU use SURF, but only after the
	; player has surfed at the Summer Beach House (EVENT_SURFED_WITH_DUDE). The WATERIFY itself is
	; applied post-damage in SpeciesMoveBonus. No power/accuracy change. Reached via ModifierFuncs[13].
	CheckEvent FLAG_SIGNATURE_MOVES_TURNED_OFF
	ret nz
	call GetMoveRemapData
	ld a, d ; user species
	cp PIKACHU
	jr z, .check
	cp RAICHU
	ret nz
.check
	CheckEvent EVENT_SURFED_WITH_DUDE
	ret z
	ld a, 1
	ld [wSignatureMoveActive], a
	ret

SingModifier::
	CheckEvent FLAG_SIGNATURE_MOVES_TURNED_OFF
	ret nz
	call GetMoveRemapData
	ld a, d
	cp WIGGLYTUFF
	jr z, .checkLevel
	cp JIGGLYPUFF
	jr z, .checkLevel
	ret
.checkLevel
	ld a, e
	cp 20
	ret c
	call GetMoveRemapData2
	ld a, 85 percent
	ld [de], a ; sing gets 85% accuracy for jigglypuff/wigglytuff if they're past level 20
	; Sunsette: JIGGLYPUFF/WIGGLYTUFF SING signature applied -> drive the "Signature Move!" message
	ld a, 1
	ld [wSignatureMoveActive], a
	ret

ExplosionSelfdestructModifier:
	ldh a, [hWhoseTurn]
	and a
	jr z, .playerTurn
.enemyTurn
	ld d, 3
	callfar FarCheckIfEnemyHPBelowFraction
	jr .doneHPCheck
.playerTurn
	ld d, 3
	callfar FarCheckIfPlayerHPBelowFraction
.doneHPCheck
	ret nc
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMovePower
	ld bc, wPlayerMoveEffect
	jr z, .gotTurn
	ld hl, wEnemyMovePower
	ld bc, wEnemyMoveEffect
.gotTurn
	; if less then 1/3 hp, explosion/selfdestruct do their original effect and much more power
	ld [hl], 250
	ld a, EXPLODE_EFFECT
	ld [bc], a
	; the below code was originally in ExplodeEffect but was moved because it looks nicer to happen instantly on using the move
ExplosionFaintAndClear: ; Sunsette: shared faint+leech-clear tail (also entered by ExplosionFaintModifier for vanilla EXPLOSION)
	xor a
	ld [wAnimationType], a
	ld hl, wBattleMonHP
	ld de, wPlayerBattleStatus2
	ldh a, [hWhoseTurn]
	and a
	jr z, .faintUser
	ld hl, wEnemyMonHP
	ld de, wEnemyBattleStatus2
.faintUser
	xor a
	ld [hli], a ; set the mon's HP to 0
	ld [hli], a
	inc hl
	ld [hl], a ; set mon's status to 0
	ld a, [de]
	res SEEDED, a ; clear mon's leech seed status
	ld [de], a
	jpfar DrawHUDsAndHPBars

; Sunsette: vanilla EXPLOSION - faint the user the instant the move is used, regardless of
; HP (unlike ExplosionSelfdestructModifier above, which only bursts below 1/3 HP). CheckRemapMoveData runs this
; right after "X used Y!" and before the damage step, so the move still connects and THEN the user is gone.
; Reuses ExplosionSelfdestructModifier's faint+clear tail to stay small (newCode is tight).
ExplosionFaintModifier:
	jp ExplosionFaintAndClear

; Sunsette: CRYSTALLIZE retypes the USER's type1 at move-use (Rock-like -> CRYSTAL, else -> ROCK). The body
; lives in the roomier black_haze bank (newCode is full); the +2 DEFENSE is the move's own DEFENSE_UP2_EFFECT.
CrystallizeModifier:
	jpfar CrystallizeRetype

AgilityBraceModifier:
	jpfar AgilityBrace

BarrierBraceModifier:
	jpfar BarrierBrace

; PureRGBnote: Mirage (formerly Firewall) no longer remaps its power, so this is now a no-op.
; The label/slot is kept so the ModifierFuncs indices that follow it stay correct.
FirewallModifier:
	ret

; input d = which pokemon
GetRemappedMoveAndPowerFromPokemon::
	ld hl, RemappableMoves + 1
.loop
	ld a, [hl]
	cp d
	jr z, .found
	dec hl
	ld a, [hli]
	cp $FF
	jr z, .notFound
	inc hl
	inc hl
	inc hl
	inc hl
	jr .loop
.notFound
	and a
	ret
.found
	scf
	dec hl
	ld d, [hl] ; move ID
	inc hl
	inc hl
	ld e, [hl] ; move remapped power
	ret

GetUserType:
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonType1
	ret z
	ld hl, wEnemyMonType1
	ret

ToxicModifier:
	call GetUserType
	ld a, [hli]
	cp POISON
	jr z, Modifier100Accuracy
	ld a, [hl]
	cp POISON
	ret nz
	; fall through
Modifier100Accuracy:
	call GetMoveRemapData2
	ld a, 100 percent
	ld [de], a
	ret

; Sunsette: METEOR DRIVE (SKULL_BASH) gets 100% accuracy for ROCK/CRYSTAL-type users (a type bonus,
; not a species signature, so it does NOT trigger the "Signature Move!" message). BLASTOISE's old
; species-specific 100%-accuracy signature was removed (no longer a MOVE MYSTIC mon).
SkullBashModifier: ; Sunsette: DEAD (METEOR_DRIVE's ROCK/CRYSTAL 100%-accuracy perk removed); collapsed to a no-op, label kept for ModifierFuncs slot 5
	ret

; Sunsette: FINISHER (was PIVOT STRIKE) - a Focus-Punch-like commitment. It goes LAST (negative priority,
; handled in the turn-order code); if the user takes a direct damaging hit before it fires, power drops to
; 50, else it's a 150-BP "FINISH THEM!". The body is jpfar'd out (newCode is full). Pre-damage, ModifierFuncs slot 6.
FinisherPowerModifier::
	jpfar FinisherPowerImpl

; Sunsette: OROCLASM live power - 70 base, 140 if the user took a PHYSICAL-typed hit this turn (the counter-
; punch). Body jpfar'd out (newCode full); reads FINISHER_INTERRUPTED + the foe's move type. ModifierFuncs slot 19.
OroclasmPowerModifier::
	jpfar OroclasmPowerImpl

; Sunsette: SHADOW BOX live power - 75 if the FOE's selected move this turn is special-typed (you read the
; attack), else 35 (you whiffed the read). The read itself lives in FoeSelectedMoveIsSpecial (volcano bank,
; alongside the post-damage confuse handler), callfar'd so the verdict rides home in e.
ShadowBoxPowerModifier::
	callfar FoeSelectedMoveIsSpecial ; e = 1 (foe's move special) / 0
	ld a, e
	push af
	call GetMoveRemapData2   ; bc = wXxxMovePower (clobbers de)
	pop af
	and a
	ld a, 60                 ; whiff -> modest 60 BP (never a fully wasted turn)
	jr z, .storeSB
	ld a, 90                 ; read the Special -> decent 90 BP
.storeSB
	ld [bc], a
	ret ; Sunsette: the COMBO_MOVE_USED lock is now armed centrally by CheckComboMoveLock (set-on-allow), not here