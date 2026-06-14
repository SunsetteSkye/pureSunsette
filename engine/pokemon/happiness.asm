; Sunsette: happiness / affection system - storage primitives and helpers.
; Happiness is a per-party-slot value (0-255) in wPartyMonHappiness, saved with the
; main data via repurposed unused save bytes (so pre-feature saves stay valid).

DEF HAPPINESS_MAX           EQU 255
DEF HAPPINESS_DEFAULT       EQU 70  ; neutral base + one-time seed for old saves + non-Apex withdrawal
DEF HAPPINESS_STARTER       EQU 100 ; starter + Route 1 captures
DEF HAPPINESS_LEGENDARY     EQU 35  ; the six legendaries when caught (head start; Apex withdrawal overrides)
DEF HAPPINESS_SEED_MAGIC    EQU $2A ; marker that this save's happiness is initialized
DEF HAPPINESS_SURVIVE_FLOOR EQU 128 ; min happiness for the survival / 3rd-PP effects
DEF HAPPINESS_CACHE_SIZE    EQU 8   ; recently-boxed mons remembered (soft cache)
DEF HAPPINESS_CACHE_ENTRY   EQU 5   ; species + DV lo + DV hi + level + happiness
DEF HAPPINESS_STEP_INTERVAL EQU 128 ; overworld steps per +1 party-wide
DEF HAPPINESS_LEVELUP_GAIN  EQU 3
DEF HAPPINESS_FAINT_LOSS    EQU 1
DEF HAPPINESS_VITAMIN_GAIN  EQU 5
DEF HAPPINESS_DRINK_GAIN    EQU 3

; If this save hasn't had happiness seeded yet, default every party slot and mark it
; done. New games hit this with an empty party (harmless); pre-feature saves get their
; existing team seeded to HAPPINESS_DEFAULT. Idempotent.
MaybeSeedHappiness::
	ld a, [wHappinessSeedFlag]
	cp HAPPINESS_SEED_MAGIC
	ret z
	ld hl, wPartyMonHappiness
	ld c, PARTY_LENGTH
	ld a, HAPPINESS_DEFAULT
.loop
	ld [hli], a
	dec c
	jr nz, .loop
; clear the boxed-happiness cache (species 0 = empty) and reset its ring index
	call EnableSRAMBank0
	ld hl, sHappinessCache
	ld c, HAPPINESS_CACHE_SIZE * HAPPINESS_CACHE_ENTRY
	xor a
.clearCache
	ld [hli], a
	dec c
	jr nz, .clearCache
	xor a
	ld [sHappinessCacheNext], a
	call DisableSRAM
	ld a, HAPPINESS_SEED_MAGIC
	ld [wHappinessSeedFlag], a
	ret

; a = party slot (0-5) -> hl = &wPartyMonHappiness[slot]. Clobbers de.
GetHappinessAddr::
	ld e, a
	ld d, 0
	ld hl, wPartyMonHappiness
	add hl, de
	ret

; Raise party slot a's happiness by c (clamped to HAPPINESS_MAX).
GainHappiness::
	call GetHappinessAddr
	ld a, [hl]
	add c
	jr nc, .ok
	ld a, HAPPINESS_MAX
.ok
	ld [hl], a
	ret

; Lower party slot a's happiness by c (clamped to 0).
LoseHappiness::
	call GetHappinessAddr
	ld a, [hl]
	sub c
	jr nc, .ok
	xor a
.ok
	ld [hl], a
	ret

; Sunsette: assign base happiness to a freshly added PLAYER-party mon.
; Called from _AddPartyMon right before its success return (covers catch / gift /
; trade / starter). PC withdrawals use a separate path.
SetNewMonBaseHappiness::
	ld a, [wMonDataLocation]
	and %1111
	ret nz ; enemy party -> no happiness
	call .computeBase
	ld c, a
	ldh a, [hNewPartyLength]
	dec a ; slot of the new mon
	call GetHappinessAddr
	ld [hl], c
	ret
.computeBase
	ld a, [wCurPartySpecies]
	call CheckLegendaryAffectionSpecies
	jr nz, .notLegend
	ld a, HAPPINESS_LEGENDARY ; 35
	ret
.notLegend
	ld a, [wCurMap]
	cp OAKS_LAB
	jr z, .starter ; the starter is the only player-party add in Oak's lab
	ld a, [wIsInBattle]
	and a
	jr z, .seventy ; gift/trade (not a capture)
	ld a, [wCurMap]
	cp ROUTE_1
	jr z, .hundred ; Route 1 capture
.seventy
	ld a, HAPPINESS_DEFAULT ; 70
	ret
.hundred
	ld a, HAPPINESS_STARTER ; 100 (Route 1 captures)
	ret
.starter
	ld a, HAPPINESS_SURVIVE_FLOOR ; Sunsette: 128 - the starter begins in the bond-survival band
	ret

; Sunsette: set happiness for a mon just withdrawn into the party (box/daycare -> party).
; Apex (max genes, matching the in-game APEX check) -> 70 + level; otherwise -> 70.
; Expects wLoadedMon = the withdrawn mon and wPartyCount = the post-add party count.
SetWithdrawnMonHappiness::
	ld a, [wPartyCount]
	dec a ; the withdrawn mon is the last party slot
	push af
	call LookupBoxedMonHappiness ; a = slot in; carry + a = happiness if recently boxed
	jr nc, .notCached
	ld c, a
	pop af
	call GetHappinessAddr
	ld [hl], c
	ret
.notCached
	ld hl, wLoadedMonDVs
	ld a, [hli]
	xor [hl] ; 0 when both DV bytes match -> the game's "Apex" condition
	ld a, HAPPINESS_DEFAULT ; (ld does not disturb the z flag from xor)
	jr nz, .store
	ld a, [wLoadedMonLevel]
	add HAPPINESS_DEFAULT ; 70 + level (<= 170, no overflow)
.store
	ld c, a
	pop af
	call GetHappinessAddr
	ld [hl], c
	ret

; Sunsette: shift the happiness array down over a removed PARTY slot so happiness
; stays aligned with the mons after a deposit/removal. No-op for box removals.
ShiftHappinessForRemoval::
	ld a, [wRemoveMonFromBox]
	and a
	ret nz ; box removal - party happiness is unaffected
	call CacheBoxedMonHappiness ; stash this mon's happiness in case it's withdrawn again soon
	ld a, [wWhichPokemon]
	ld e, a
	ld d, 0
	ld hl, wPartyMonHappiness
	add hl, de ; hl = &happiness[removed slot]
	ld a, PARTY_LENGTH - 1
	sub e ; entries after the removed slot
	ret z ; removed the last slot -> nothing to shift
	ld b, a
.loop
	inc hl
	ld a, [hl]
	dec hl
	ld [hli], a ; happiness[j] = happiness[j+1]
	dec b
	jr nz, .loop
	ret

; Sunsette: swap two party slots' happiness when the party menu reorders mons,
; so affection follows the mon rather than the slot.
SwapPartyMonHappiness::
	ld a, [wSwappedMenuItem]
	call GetHappinessAddr
	push hl
	ld a, [wCurrentMenuItem]
	call GetHappinessAddr
	pop de ; de = &happiness[wSwappedMenuItem]
	ld a, [de]
	ld b, [hl]
	ld [hl], a
	ld a, b
	ld [de], a
	ret

; --- Boxed-happiness cache (Sunsette) -------------------------------------------
; A small ring of recently-boxed mons so a quick PC deposit/withdraw doesn't reset
; affection. Keyed by species + DVs + level (level is frozen in the box). Lives in
; SRAM bank 0 free space, so it persists with the save.

EnableSRAMBank0:
	ld a, RAMG_SRAM_ENABLE
	ld [rRAMG], a
	ld a, BMODE_ADVANCED
	ld [rBMODE], a
	xor a
	ld [rRAMB], a
	ret

DisableSRAM:
	xor a
	ld [rBMODE], a
	ld [rRAMG], a
	ret

; a = party slot. Writes {species, DV lo, DV hi, level} to wHappinessKeyScratch[0..3].
BuildPartyMonKey:
	ld hl, wPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes ; hl = &party mon (a consumed)
	ld de, wHappinessKeyScratch
	ld a, [hl] ; species (MON_SPECIES = 0)
	ld [de], a
	inc de
	push hl
	ld bc, MON_DVS
	add hl, bc
	ld a, [hli]
	ld [de], a ; DV lo
	inc de
	ld a, [hl]
	ld [de], a ; DV hi
	inc de
	pop hl
	ld bc, MON_LEVEL
	add hl, bc
	ld a, [hl]
	ld [de], a ; level
	ret

; Stash the about-to-be-removed party mon (wWhichPokemon) into the cache ring.
CacheBoxedMonHappiness:
	ld a, [wWhichPokemon]
	call BuildPartyMonKey
	ld a, [wWhichPokemon]
	call GetHappinessAddr
	ld a, [hl]
	ld [wHappinessKeyScratch + 4], a ; 5th entry byte = happiness
	call EnableSRAMBank0
	ld a, [sHappinessCacheNext]
	cp HAPPINESS_CACHE_SIZE
	jr c, .indexOk
	xor a ; defensive: bad/garbage index -> start at 0
.indexOk
	ld hl, sHappinessCache
	ld bc, HAPPINESS_CACHE_ENTRY
	call AddNTimes ; hl = &ring[next]
	ld de, wHappinessKeyScratch
	ld b, HAPPINESS_CACHE_ENTRY
.copy
	ld a, [de]
	ld [hli], a
	inc de
	dec b
	jr nz, .copy
	ld a, [sHappinessCacheNext]
	inc a
	cp HAPPINESS_CACHE_SIZE
	jr c, .store
	xor a
.store
	ld [sHappinessCacheNext], a
	jp DisableSRAM

; a = party slot of a just-withdrawn mon. If its key is in the cache, returns carry
; set + a = the remembered happiness (and invalidates the entry). Else carry clear.
LookupBoxedMonHappiness:
	call BuildPartyMonKey ; wHappinessKeyScratch[0..3] = key
	call EnableSRAMBank0
	ld hl, sHappinessCache
	ld c, HAPPINESS_CACHE_SIZE
.entryLoop
	push hl ; entry base
	ld de, wHappinessKeyScratch
	ld b, 4
.cmp
	ld a, [de]
	cp [hl]
	jr nz, .noMatch
	inc de
	inc hl
	dec b
	jr nz, .cmp
	ld a, [hl] ; happiness (offset 4)
	ld b, a
	pop hl
	ld [hl], 0 ; invalidate this entry (species 0)
	call DisableSRAM
	ld a, b
	scf
	ret
.noMatch
	pop hl
	ld de, HAPPINESS_CACHE_ENTRY
	add hl, de
	dec c
	jr nz, .entryLoop
	call DisableSRAM
	and a ; carry clear -> not cached
	ret

; --- Phase 2 gain/loss entry points (Sunsette) ----------------------------------
; All farcall-safe: they take no register parameters (farcall clobbers a), reading
; the relevant party slot from WRAM instead.

; +1 happiness to the whole party every HAPPINESS_STEP_INTERVAL overworld steps.
HandleHappinessStep::
	ld hl, wHappinessStepCounter
	inc [hl]
	ld a, [hl]
	cp HAPPINESS_STEP_INTERVAL
	ret c
	ld [hl], 0
	ld a, [wPartyCount]
	and a
	ret z
	ld b, a ; party size
	xor a   ; slot 0
	ld c, 1 ; +1 (GainHappiness preserves b and c)
.loop
	push af
	call GainHappiness
	pop af
	inc a
	dec b
	jr nz, .loop
	ret

; +3 to the mon that just leveled up (wWhichPokemon).
GainLevelUpHappiness::
	ld a, [wWhichPokemon]
	ld c, HAPPINESS_LEVELUP_GAIN
	jp GainHappiness

; -1 to the player's active mon when it faints (wPlayerMonNumber).
LoseFaintHappiness::
	ld a, [wPlayerMonNumber]
	ld c, HAPPINESS_FAINT_LOSS
	jp LoseHappiness

; +5 to the mon a vitamin was used on (wWhichPokemon).
GainVitaminHappiness::
	ld a, [wWhichPokemon]
	ld c, HAPPINESS_VITAMIN_GAIN
	jp GainHappiness

; +3 to the mon a drink was used on (wWhichPokemon) - self-gates so it can sit on the
; shared healing-item exit without rewarding potions.
GainDrinkHappiness::
	ld a, [wCurItem]
	cp FRESH_WATER
	jr z, .isDrink
	cp SODA_POP
	jr z, .isDrink
	cp LEMONADE
	ret nz
.isDrink
	ld a, [wWhichPokemon]
	ld c, HAPPINESS_DRINK_GAIN
	call GainHappiness
	ld a, [wIsInBattle]
	and a
	ret z ; only flash the cue during a battle
	jp PlayAffectionCue

; --- Phase 3: affection survive-at-1HP (non-legendary) ---------------------------
; c = a fresh random byte (0-255), supplied by the caller (BattleRandom is local to
; the battle bank). Returns carry set if the active player mon should hang on at 1 HP,
; applying the -16 happiness cost and setting the once-per-switch-in + just-survived
; flags. Carry clear -> faint normally. Curve: <128 never, 128..239 random<happiness>>1,
; >=240 guaranteed; requires current HP > 1; legendaries are excluded (they get Pressure).
TryAffectionSurvival::
	ld a, [wAffectionSurviveUsed]
	and a
	jr nz, .fail ; already hung on this switch-in
	ld a, [wHPBarOldHP + 1]
	and a
	jr nz, .hpOk ; HP high byte set -> well above 1
	ld a, [wHPBarOldHP]
	cp 2
	jr c, .fail ; current HP <= 1 -> no survival
.hpOk
	ld a, [wBattleMonSpecies]
	call CheckLegendaryAffectionSpecies
	jr z, .fail ; legendaries survive via Pressure flavor, not this
	ld a, [wPlayerMonNumber]
	call GetHappinessAddr
	ld a, [hl] ; happiness
	cp HAPPINESS_SURVIVE_FLOOR ; 128
	jr c, .fail
	cp 240
	jr nc, .survive ; >= 240 -> guaranteed
	srl a ; threshold = happiness >> 1 (64..119)
	ld b, a
	ld a, c ; random byte
	cp b
	jr nc, .fail ; random >= threshold -> no
.survive
	ld a, [wPlayerMonNumber]
	ld c, 16
	call LoseHappiness ; affection cost
	ld a, 1
	ld [wAffectionSurviveUsed], a
	ld [wAffectionJustSurvived], a
	scf
	ret
.fail
	and a
	ret

; Sunsette: c = random byte. Sets the enemy mon's HP after a would-be-fatal hit. Tough-trainer
; bond survival keeps it at 1 HP (~25%, as if 128 happiness) + flags wAffectionJustSurvived for the
; announce; otherwise zeroes it. Sets wDamage so the bar animates to the right value. The HP>1 guard
; limits it to one save per healthy state; reuses wAffectionJustSurvived (player- and enemy-damage
; applications don't overlap). Kept out of the cramped Battle Core bank.
HandleEnemyFaintOrSurvive::
	push bc ; Sunsette FIX: preserve the random byte in c - IsToughTrainerBattle -> IsInArray does
	call IsToughTrainerBattle ; `ld c, a`, which was clobbering c and making the 25% check always pass
	pop bc
	jr nz, .faint
	ld a, [wHPBarOldHP + 1] ; enemy old HP high byte
	and a
	jr nz, .hpOk
	ld a, [wHPBarOldHP] ; low byte
	cp 2
	jr c, .faint ; current HP <= 1
.hpOk
	ld a, c ; random byte
	cp 64 ; 25% (as if 128 happiness: 128 >> 1)
	jr nc, .faint
; survive: keep the enemy at 1 HP, wDamage = oldHP - 1
	ld a, 1
	ld [wAffectionJustSurvived], a
	ld a, [wHPBarOldHP]
	sub 1
	ld b, a
	ld a, [wHPBarOldHP + 1]
	sbc 0
	ld [wDamage], a
	ld a, b
	ld [wDamage + 1], a
	xor a
	ld [wEnemyMonHP], a
	inc a
	ld [wEnemyMonHP + 1], a
	ret
.faint
	ld a, [wHPBarOldHP + 1]
	ld [wDamage], a
	ld a, [wHPBarOldHP]
	ld [wDamage + 1], a
	xor a
	ld [wEnemyMonHP], a
	ld [wEnemyMonHP + 1], a
	ret

; Print the bond-survival line if the enemy just hung on (called after its HP bar animates).
AnnounceEnemyBondSurvival::
	ld a, [wAffectionJustSurvived]
	and a
	ret z
	xor a
	ld [wAffectionJustSurvived], a
	ld hl, BondSurvivedText
	rst _PrintText
	ret
BondSurvivedText:
	text_far _BondSurvivedText
	text_end

; --- Phase 3: legendary Pressure -------------------------------------------------
; A move used against a legendary drains an extra PP from the attacker's move; if the
; defender is the player's legendary, happiness >= 128 adds a happiness-scaled 3rd PP.
; PP is clamped at 0. (Lives here, not in the full Battle Core bank.)

; Drain 1 PP from [hl] if > 0. Returns carry set if this brought it to exactly 0.
ClampedDrainPP:
	ld a, [hl]
	and a
	jr z, .none
	dec a
	ld [hl], a
	jr z, .wornOut
	or a ; still has PP
	ret
.wornOut
	scf
	ret
.none
	or a
	ret

; Sunsette: "tough trainers" - gym leaders, Elite Four, Giovanni (every battle), the rival at Indigo
; (RIVAL3 only), and the four ROCKET SISTERS - run their mons with the legendary Pressure +
; bond-survival systems.
ToughTrainerClasses:
	db BROCK, MISTY, LT_SURGE, ERIKA, KOGA, SABRINA, BLAINE
	db GIOVANNI, LORELEI, BRUNO, AGATHA, LANCE, RIVAL3, ROCKET_QUEEN
	db -1

; z if the enemy's active mon should run Pressure: a legendary species, or any tough-trainer mon.
IsEnemyPressureMon::
	ld a, [wEnemyMonSpecies]
	call CheckLegendaryAffectionSpecies
	ret z
	; fall through to IsToughTrainerBattle
; z if the current battle is against a tough trainer.
IsToughTrainerBattle::
	ld a, [wIsInBattle]
	cp 2
	jr nz, .notTough ; not a trainer battle
	ld a, [wTrainerClass]
	ld hl, ToughTrainerClasses
	ld de, 1
	call IsInArray
	jr nc, .notTough
	xor a ; z = tough trainer
	ret
.notTough
	or 1 ; nz
	ret

; After the player's move PP is decremented: if the enemy runs Pressure (legendary or tough
; trainer), drain an extra PP from the player's move (battle + party copies). Base Pressure only.
PressureDrainPlayerMove::
	call IsEnemyPressureMon
	ret nz
	ld a, [wPlayerMoveListIndex]
	ld c, a
	ld b, 0
	ld hl, wBattleMonPP
	add hl, bc
	call ClampedDrainPP
	push af ; remember whether the battle-copy PP just hit 0
	ld a, [wPlayerMonNumber]
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1PP
	call AddNTimes
	ld a, [wPlayerMoveListIndex]
	ld c, a
	ld b, 0
	add hl, bc
	call ClampedDrainPP
	pop af
	ret nc ; the move still has PP -> no announcement
; an enemy legendary's Pressure emptied your move -> sparkle over the foe + message
	ld e, HAPPINESS_SPARKLE_ENEMY_ANIM ; anim ID in e (callfar clobbers a with the target bank); the
	callfar PlayEnemySideAnim ; ENEMY variant sits above the FOE's head (player coords flip below it)
	ld hl, PressureWornYoursText
	rst _PrintText
	ret

; After the enemy selects its move PP: if the player's active mon is a legendary, drain an
; extra PP (base Pressure) plus a happiness-scaled 3rd PP.
PressureDrainEnemyMove::
	ld a, [wBattleMonSpecies]
	call CheckLegendaryAffectionSpecies
	ret nz
	ld a, [wEnemyMoveListIndex]
	ld c, a
	ld b, 0
	ld hl, wEnemyMonPP
	add hl, bc
	call ClampedDrainPP ; base Pressure (hl preserved)
	jr c, .wornOut
	ld a, [wPlayerMonNumber]
	ld c, a
	ld b, 0
	push hl
	ld hl, wPartyMonHappiness
	add hl, bc
	ld a, [hl]
	pop hl
	cp HAPPINESS_SURVIVE_FLOOR ; 128
	ret c
	cp 240
	jr nc, .thirdPP ; >= 240 -> guaranteed 3rd
	srl a ; threshold = happiness >> 1
	ld b, a
	push hl
	push bc
	callfar FarBattleRandom ; d = random byte
	pop bc
	pop hl
	ld a, d
	cp b
	ret nc ; random >= threshold -> no 3rd
.thirdPP
	call ClampedDrainPP
	ret nc ; the 3rd PP didn't empty it
.wornOut
; your legendary's Pressure emptied an enemy move -> sparkle over your mon + message
	call PlayAffectionCue
	ld hl, PressureWornTheirsText
	rst _PrintText
	ret

PressureWornTheirsText:
	text_far _PressureWornTheirsText
	text_end
PressureWornYoursText:
	text_far _PressureWornYoursText
	text_end

; --- Phase 3: "second wind" heal on a trainer-battle KO --------------------------
; When you KO an enemy mon in a TRAINER battle and your active mon's happiness >= 128,
; restore 1/4 of its max HP, but only while the HP bar is YELLOW or RED (i.e. the mon is hurt - not
; green), with a flavor line (legendary -> "glory of battle", otherwise "second wind"). The caller
; redraws the player HUD afterward, showing the gain.
SecondWindHeal::
	ld a, [wIsInBattle]
	cp 2
	ret nz ; trainer battles only
	ld a, [wPlayerMonNumber]
	call GetHappinessAddr
	ld a, [hl]
	cp HAPPINESS_SURVIVE_FLOOR ; 128
	ret c
	; Sunsette: only on a hurt mon (yellow OR red bar - NOT green). wPlayerHPBarColor (0=green/1=yellow/
	; 2=red) is kept current by the in-battle HUD draws.
	ld a, [wPlayerHPBarColor]
	and a
	ret z ; green health -> no second wind (not hurt enough)
	; de = current HP, hl = max HP (both big-endian)
	ld a, [wBattleMonHP]
	ld d, a
	ld a, [wBattleMonHP + 1]
	ld e, a
	ld a, [wBattleMonMaxHP]
	ld h, a
	ld a, [wBattleMonMaxHP + 1]
	ld l, a
	; fainted guard: a 0-HP mon also reads as a RED bar (so the "not green" gate let it through). Without
	; this, a double-KO would let SecondWindHeal partially revive a fainted mon.
	ld a, d
	or e
	ret z
	; room to heal? ret if current HP >= max HP
	ld a, d
	cp h
	jr c, .hasRoom
	jr nz, .full
	ld a, e
	cp l
	jr nc, .full
.hasRoom
	push de ; current HP
	srl h
	rr l
	srl h
	rr l ; hl = maxHP / 4 (always >= 1: Gen 1's lowest maxHP is ~11 at level 1, and maxHP < 2048
	; so the whole quotient sits in l with h = 0)
	ld b, l
	pop de
	ld a, e
	add b
	ld e, a
	ld a, d
	adc 0
	ld d, a ; de = HP + heal
	ld a, [wBattleMonMaxHP]
	ld h, a
	ld a, [wBattleMonMaxHP + 1]
	ld l, a
	ld a, d
	cp h
	jr c, .store
	jr nz, .clampMax
	ld a, e
	cp l
	jr c, .store
.clampMax
	ld d, h
	ld e, l
.store
	; Sunsette: de = new HP. Store it + animate the player's HP bar filling like a Potion (instead of
	; snapping). The store/animation lives in a roomier bank (this bank is nearly full in the debug build);
	; de survives the callfar bankswitch, and wBattleMonHP still holds the OLD HP for the helper to capture.
	callfar SecondWindHealApply
	callfar SecondWindRestorePP ; Sunsette: also silently restore 1 PP to the lowest non-full-PP move
	ld a, [wBattleMonSpecies]
	call CheckLegendaryAffectionSpecies
	ld hl, SecondWindText
	jr nz, .printMsg ; not a legendary -> "second wind"
	ld hl, GloryOfBattleText
.printMsg
	push hl
	call PlayAffectionCue
	pop hl
	rst _PrintText
.full
	ret

SecondWindText:
	text_far _SecondWindText
	text_end

GloryOfBattleText:
	text_far _GloryOfBattleText
	text_end

; --- Phase 5: send-out greeting for high-happiness mons --------------------------
; >= 170 happiness -> a short greeting on send-out (heart cue added in the animation pass);
; legendaries get austere "impressed/respect" lines instead. Silent below the band.
; Play the affection cue (heart for normal mons, sparkle for legendaries) over the
; player's active mon. Triggers the battle-bank animation routine via farcall.
PlayAffectionCue:
	ld a, [wBattleMonSpecies]
	call CheckLegendaryAffectionSpecies
	ld e, HAPPINESS_HEART_ANIM
	jr nz, .gotId
	ld e, HAPPINESS_SPARKLE_ANIM
.gotId
	callfar PlayPlayerSideAnim ; anim ID in e - callfar clobbers a with the target bank, e survives
	ret

SendOutHappinessMessage::
	ld a, [wPlayerMonNumber]
	call GetHappinessAddr
	ld a, [hl]
	cp 170
	ret c ; below the greeting band -> silent
	ld d, a
	ld a, [wBattleMonSpecies]
	call CheckLegendaryAffectionSpecies
	jr z, .legendary
	ld a, d
	cp 240
	jr nc, .normalMax
	ld hl, SendOutAffectionText
	jr .play
.normalMax
	ld hl, SendOutAffectionMaxText
	jr .play
.legendary
	ld a, d
	cp 240
	jr nc, .legendMax
	ld hl, SendOutImpressedText
	jr .play
.legendMax
	ld hl, SendOutAweText
.play
	push hl
	call PlayAffectionCue
	pop hl
	rst _PrintText
	ret

SendOutAffectionText:
	text_far _SendOutAffectionText
	text_end
SendOutAffectionMaxText:
	text_far _SendOutAffectionMaxText
	text_end
SendOutImpressedText:
	text_far _SendOutImpressedText
	text_end
SendOutAweText:
	text_far _SendOutAweText
	text_end
