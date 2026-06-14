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
	db EXPLOSION, -1, -2, 2
	db SELFDESTRUCT, -1, -2, 2
	db TOXIC, -1, -2, 4
	db SKULL_BASH, -1, -2, 5 ; METEOR DRIVE
	db SLAM, -1, -2, 6 ; WASTEMAKER
	db SOLARBEAM, -1, -2, 7 ; Sunsette: live power - 60 (charge) / 120 (release, primed) / 90 (FIRE user) (SOLAR CANNON)
	; signature moves start here
	db POISON_STING, BEEDRILL, 45, 0
	db TWINEEDLE, BEEDRILL, 65, 0
	db ROCK_SLIDE, GOLEM, 110, 0
	db THUNDERPUNCH, ELECTABUZZ, 90, 0 ; ZAPPERCUT
	db FIRE_PUNCH, MAGMAR, 90, 0 ; BLAZE HAMMER
	db ICE_PUNCH, JYNX, 90, 0 ; FROST FIST
	db HYPNOSIS, HYPNO, -1, 85 percent
	; Sunsette: DRAGONITE's DRAGON_RAGE signature removed (no longer a MOVE MYSTIC signature mon).
	db WATERFALL, SEAKING, 110, 0
	db LICK, LICKITUNG, 70, 0
	db SPIKE_CANNON, OMASTAR, 70, 0
	db WHIRLWIND, PIDGEOT, -1, 100 percent ; HURRICANE
	; Sunsette: BLASTOISE's HYDRO_PUMP / SKULL_BASH (METEOR DRIVE) signatures removed (no longer a MOVE MYSTIC mon).
	db PSYBEAM, GOLDUCK, 105, 0
	db CONSTRICT, TANGELA, 90, 0 ; STRANGLEVINE: 75 BP normally, 90 BP for TANGELA (signature)
	db LOW_KICK, -1, -2, 8 ; Sunsette: power scales with the TARGET's weight (LowKickModifier)
	db CRABHAMMER, -1, -2, 9 ; Sunsette: signature power by user - 75 KRABBY / 100 KINGLER (CrabhammerModifier)
	; Sunsette: STRENGTH no longer remaps its power (flat 100 BP); its weight-class recoil + 30% +ATK are all in StrengthRagePostHit.
	db RAGE, -1, -2, 10 ; Sunsette: UNLEASH RAGE - 40 BP, tripled to 120 when the user is hurt/confused/statused (UnleashRageModifier) (MAD RUSH)
	; Sunsette: no-op (power/accuracy unchanged) species entries whose REAL signature bonus is an EFFECT
	; applied elsewhere (SnorlaxRestBonus / ArbokFocusEnergyBonus / ArbokWrapBonus). They live here only
	; so the species-match path flags the "Signature Move!" message right after the move is announced.
	db REST, SNORLAX, -1, 0          ; SNORLAX: REST also grants GROWING + SPEED +1 (SnorlaxRestBonus)
	db FOCUS_ENERGY, ARBOK, -1, 0    ; ARBOK: FOCUS ENERGY also raises SPEED (ArbokFocusEnergyBonus)
	db WRAP, ARBOK, -1, 0            ; ARBOK: WRAP traps 2 rounds longer (ArbokWrapBonus)
	db -1

ModifierFuncs:
	dw DoubleSlapModifier
	dw SingModifier
	dw ExplosionSelfdestructModifier
	dw FirewallModifier
	dw ToxicModifier
	dw SkullBashModifier
	dw FilthySlamModifier
	dw SolarBeamPowerModifier
	dw LowKickModifier
	dw CrabhammerModifier
	dw UnleashRageModifier

; Sunsette: SolarBeam's power is decided live, before damage calc, from the user's state:
;   FIRE-type user           -> 90  (one-shot recoil+burn variant, never primes)
;   non-fire, SOLARBEAM_PRIMED set -> 120 (the release of a charged beam)
;   non-fire, not primed     -> 60  (the Mega-Drain-like charge turn that primes it)
; The matching post-damage behavior (drain / recoil / burn / arm / disarm) is SolarBeamEffect_.
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
	ld a, 60  ; not primed -> charge turn
	jr z, .store
	ld a, 120 ; primed -> release
	jr .store
.fire
	ld a, 90
.store
	ld [bc], a
	ret

; Sunsette: LOW KICK scales with the TARGET's weight (Gen-4+ style). We look up the target's dex weight
; and pick a power bracket. Non-dex foes (MISSINGNO, the SPIRIT_* ghosts, etc.) have no real dex weight,
; so they fall back to the move's listed 60 BP. Weight from GetMetricMeasurements is in 1/10 of a kg:
;   <=10kg(100):20  <=25kg(250):40  <=50kg(500):60  <=100kg(1000):80  <=200kg(2000):100  else:120
LowKickModifier:
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
	ld a, 40
	jr c, .store
	ld bc, 500
	call .weightLE
	ld a, 60
	jr c, .store
	ld bc, 1000
	call .weightLE
	ld a, 80
	jr c, .store
	ld bc, 2000
	call .weightLE
	ld a, 100
	jr c, .store
	ld a, 120
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

; Sunsette: CRABHAMMER is the KRABBY line's signature move - 75 BP for KRABBY, 100 BP for KINGLER.
; Any other user keeps the move's listed 50 BP. Toggleable via the MOVE MYSTIC's signature switch.
; byte 2 of its RemappableMoves entry is -1, so CheckRemapMoveData skips the signature gate - we do it here.
CrabhammerModifier:
	CheckEvent FLAG_SIGNATURE_MOVES_TURNED_OFF
	ret nz
	call GetMoveRemapData ; d = user species
	ld a, d
	cp KRABBY
	jr z, .krabby
	cp KINGLER
	ret nz
	call GetMoveRemapData2 ; bc = wXxxMovePower (clobbers a)
	ld a, 100
	ld [bc], a
	jr .flagSignature
.krabby
	call GetMoveRemapData2
	ld a, 75
	ld [bc], a
.flagSignature
	; Sunsette: KRABBY/KINGLER signature applied -> drive the "Signature Move!" message
	ld a, 1
	ld [wSignatureMoveActive], a
	ret

; Sunsette: UNLEASH RAGE / MAD RUSH (RAGE). Base 40 BP, TRIPLED to 120 if the user is hurt (HP bar not green) OR
; confused OR has a non-sleep status (PSN/BRN/FRZ/PAR). The matching on-hit status/confusion clear + recalc
; is in SpeciesMoveBonus.
UnleashRageModifier:
	call GetMoveRemapData2 ; bc = power ptr
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerHPBarColor]
	ld hl, wBattleMonStatus
	ld de, wPlayerBattleStatus1
	jr z, .gotPtrs
	ld a, [wEnemyHPBarColor]
	ld hl, wEnemyMonStatus
	ld de, wEnemyBattleStatus1
.gotPtrs
	and a
	jr nz, .triple         ; HP bar not green -> hurt
	ld a, [hl]
	and $78                ; PSN/BRN/FRZ/PAR (non-sleep statuses)
	jr nz, .triple
	ld a, [de]
	bit CONFUSED, a
	jr nz, .triple
	ld a, 40
	jr .rstore
.triple
	ld a, 120
.rstore
	ld [bc], a
	ret

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
	ret z
	ld a, [hl]
	sla a
	ld [hl], a ; double doubleslap's power when opponent is asleep
	ret

DoubleSlapModifierPart2::
	call CheckIfAsleep
	ret z
	ld a, [bc]
	and %11111000
	inc a
	ld [bc], a ; 1 turn of sleep left now (needs to be applied separately by the effect so it only triggers if the attack hits)
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
	xor a
	ld [wAnimationType], a
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
SkullBashModifier:
	call GetUserType
	ld a, [hli]
	cp ROCK
	jr z, Modifier100Accuracy
	cp CRYSTAL
	jr z, Modifier100Accuracy
	ld a, [hl]
	cp ROCK
	jr z, Modifier100Accuracy
	cp CRYSTAL
	ret nz
	jr Modifier100Accuracy

FilthySlamModifier::
	call GetOpponentStatus
	ld a, [bc]
	bit PSN, a
	ret z
	ld [hl], 130 ; increase filthy slam power to 130 if opponent poisoned
	ret