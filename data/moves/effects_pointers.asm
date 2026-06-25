MoveEffectPointerTable:
; entries correspond to *_EFFECT constants
; Sunsette 2026-06-25: FAR-POINTER dispatch. Each entry is `dba <handler>` (db BANK, dw addr) so a handler
; can live in ANY bank and be reached directly. This replaced the old in-bank `dw <handler>` table, which
; (because the dispatcher did `jp hl` out of the full Battle Core bank) forced every handler to be in-bank
; and spawned the per-effect `jpfar` stubs + the 25-deep Haze `cp`-chain trampoline (HazeEffect ->
; HazeFlinchEffect_). Those are all gone now: every effect points straight at its real body.
; Read by GetMoveEffectHandler (same bank); dispatched by _JumpMoveEffect (engine/battle/effects.asm).
; `DoRet` (home) is the no-op handler for effects with no JumpMoveEffect body (handled in damage calc, etc.).
	table_width 3
	dba BigRecoilEffect_         ; BIG_RECOIL_EFFECT
	dba PoisonEffect             ; POISON_SIDE_EFFECT1
	dba DrainHPEffect_           ; DRAIN_HP_EFFECT
	dba FreezeBurnParalyzeEffect ; BURN_SIDE_EFFECT1
	dba FreezeBurnParalyzeEffect ; FREEZE_SIDE_EFFECT1
	dba FreezeBurnParalyzeEffect ; PARALYZE_SIDE_EFFECT1
	dba DoRet                    ; EXPLODE_EFFECT
	dba DrainHPEffect_           ; DREAM_EATER_EFFECT
	dba DoRet                    ; MIRROR_MOVE_EFFECT ; no JumpMoveEffect body (was NULL)
	dba StatModifierUpEffect     ; ATTACK_UP1_EFFECT
	dba StatModifierUpEffect     ; DEFENSE_UP1_EFFECT
	dba StatModifierUpEffect     ; SPEED_UP1_EFFECT
	dba StatModifierUpEffect     ; SPECIAL_UP1_EFFECT
	dba StatModifierUpEffect     ; ACCURACY_UP1_EFFECT
	dba StatModifierUpEffect     ; EVASION_UP1_EFFECT
	dba PayDayEffect_            ; PAY_DAY_EFFECT
	dba SwiftEffect_             ; SWIFT_EFFECT ; Sunsette: auto-hit moves, 30% -1 EVASION post-damage (never-miss via the hit-test)
	dba StatModifierDownEffect   ; ATTACK_DOWN1_EFFECT
	dba StatModifierDownEffect   ; DEFENSE_DOWN1_EFFECT
	dba StatModifierDownEffect   ; SPEED_DOWN1_EFFECT
	dba StatModifierDownEffect   ; SPECIAL_DOWN1_EFFECT
	dba _AccuracyDownEffect      ; ACCURACY_DOWN1_EFFECT
	dba StatModifierDownEffect   ; EVASION_DOWN1_EFFECT
	dba TriAttackEffect          ; TRI_ATTACK_EFFECT
	dba HazeResetFieldEffect_    ; HAZE_EFFECT ; Sunsette: stat reset (status preserved) + black-haze toxic fog
	dba TwoToFiveAttacksEffect   ; TWO_OR_THREE_ATTACKS_EFFECT
	dba ThrashPetalDanceEffect   ; THRASH_PETAL_DANCE_EFFECT
	dba _TeleportEffect          ; TELEPORT_EFFECT
	dba TwoToFiveAttacksEffect   ; TWO_TO_FIVE_ATTACKS_EFFECT
	dba MirageEffect_            ; MIRAGE_EFFECT
	dba FlinchSideEffect         ; FLINCH_SIDE_EFFECT1
	dba _SleepEffect             ; SLEEP_EFFECT
	dba PoisonEffect             ; POISON_SIDE_EFFECT2
	dba FreezeBurnParalyzeEffect ; BURN_SIDE_EFFECT2
	dba FreezeBurnParalyzeEffect ; FREEZE_SIDE_EFFECT2 ; Sunsette: 30% freeze, native EFFECT2 path
	dba FreezeBurnParalyzeEffect ; PARALYZE_SIDE_EFFECT2
	dba FlinchSideEffect         ; FLINCH_SIDE_EFFECT2
	dba OneHitKOEffect_          ; OHKO_EFFECT
	dba ChargeEffect             ; CHARGE_EFFECT
	dba DoRet                    ; SUPER_FANG_EFFECT ; no JumpMoveEffect body (was NULL)
	dba DoRet                    ; SPECIAL_DAMAGE_EFFECT ; no JumpMoveEffect body (was NULL)
	dba TrappingEffect           ; TRAPPING_EFFECT
	dba ChargeEffect             ; FLY_EFFECT
	dba TwoToFiveAttacksEffect   ; ATTACK_TWICE_EFFECT
	dba DoRet                    ; JUMP_KICK_EFFECT ; no JumpMoveEffect body (was NULL)
	dba AuroraMistEffect_        ; MIST_EFFECT ; Sunsette: AURORA MIST - Mist stat-immunity + clear both statuses; Ice raises screens, non-Ice retypes to ICE
	dba FocusEnergyEffect_       ; FOCUS_ENERGY_EFFECT
	dba DefaultRecoilEffect_     ; RECOIL_EFFECT
	dba ConfusionEffect          ; CONFUSION_EFFECT
	dba StatModifierUpEffect     ; ATTACK_UP2_EFFECT
	dba StatModifierUpEffect     ; DEFENSE_UP2_EFFECT
	dba StatModifierUpEffect     ; SPEED_UP2_EFFECT
	dba StatModifierUpEffect     ; SPECIAL_UP2_EFFECT
	dba StatModifierUpEffect     ; ACCURACY_UP2_EFFECT
	dba StatModifierUpEffect     ; EVASION_UP2_EFFECT
	dba HealEffect_              ; HEAL_EFFECT
	dba TransformEffect_         ; TRANSFORM_EFFECT
	dba StatModifierDownEffect   ; ATTACK_DOWN2_EFFECT
	dba StatModifierDownEffect   ; DEFENSE_DOWN2_EFFECT
	dba StatModifierDownEffect   ; SPEED_DOWN2_EFFECT
	dba StatModifierDownEffect   ; SPECIAL_DOWN2_EFFECT
	dba StatModifierDownEffect   ; ACCURACY_DOWN2_EFFECT
	dba StatModifierDownEffect   ; EVASION_DOWN2_EFFECT
	dba ReflectLightScreenEffect_ ; LIGHT_SCREEN_EFFECT
	dba ReflectLightScreenEffect_ ; REFLECT_EFFECT
	dba PoisonEffect             ; POISON_EFFECT
	dba ParalyzeEffect_          ; PARALYZE_EFFECT
	dba StatModifierDownEffect   ; ATTACK_DOWN_SIDE_EFFECT
	dba StatModifierDownEffect   ; DEFENSE_DOWN_SIDE_EFFECT
	dba StatModifierDownEffect   ; SPEED_DOWN_SIDE_EFFECT
	dba StatModifierDownEffect   ; SPECIAL_DOWN_SIDE_EFFECT
	dba StatUpSideEffect         ; ATTACK_UP_SIDE_EFFECT
	dba AccuracyAttackUpEffect   ; ATTACK_ACCURACY_UP1_EFFECT
	dba AttackDefenseUpEffect    ; ATTACK_DEFENSE_UP1_EFFECT
	dba ConfusionBigSideEffect   ; CONFUSION_BIG_SIDE_EFFECT
	dba ConfusionSideEffect      ; CONFUSION_SIDE_EFFECT
	dba TwoToFiveAttacksEffect   ; TWINEEDLE_EFFECT
	dba VoidMindEffect           ; VOID_MIND_EFFECT
	dba SubstituteEffect_        ; SUBSTITUTE_EFFECT
	dba HyperBeamEffect          ; HYPER_BEAM_EFFECT
	dba TwoToFiveAttacksEffect   ; BONEMERANG_EFFECT
	dba MimicEffect              ; MIMIC_EFFECT
	dba DoRet                    ; METRONOME_EFFECT ; no JumpMoveEffect body (was NULL)
	dba LeechSeedEffect_         ; LEECH_SEED_EFFECT
	dba SplashEffect_            ; SPLASH_EFFECT
	dba DisableEffect            ; DISABLE_EFFECT
	dba ShellGameEffect_         ; WITHDRAW_EFFECT ; Sunsette: SUBMERGE -> SHELL GAME (waterify foe, then switch out / take Reflect)
	dba AdaptationEffect         ; GROWTH_EFFECT ; Sunsette: ADAPTATION - status cure + FLOURISH regen + adapt-to-last-hit + ATTACK +1
	dba _DefenseCurlEffect       ; DEFENSE_CURL_EFFECT
	dba ReflectLightScreenEffect_ ; ACID_ARMOR_EFFECT
	dba ExplodeRecoilEffect_     ; EXPLODE_RECOIL_EFFECT
	dba ConversionEffect         ; CONVERSION_EFFECT
	dba MaximizeEffect_          ; MAXIMIZE_EFFECT ; Sunsette: ATTACK -> +6, EVASION/SPEED -2, slowed cry
	dba _SiphonSnagEffect        ; SIPHON_SNAG_EFFECT
	dba HeatRushEffect_          ; HEAT_RUSH_EFFECT
	dba MegaPunchEffect          ; MEGA_PUNCH_EFFECT
	dba _ScreechEffect           ; SCREECH_EFFECT
	dba WaterifyEffect_          ; WATERIFY_EFFECT
	dba DisableEffectCore        ; CUT_DISABLE_EFFECT ; Sunsette: after Cut's damage -> disable the target's last move
	dba DoRet                    ; SPEED_UP_SIDE_EFFECT ; no JumpMoveEffect body (Meditate applies it via stat-mapping; was NULL)
	dba FlashEffect_             ; FLASH_EFFECT ; Sunsette: wipe target's stat stages + -2 ACCURACY (no damage)
	dba GustAccuracyEffect_      ; ACCURACY_DOWN_SIDE_EFFECT ; Sunsette: 30% -1 ACCURACY post-damage (Gust)
	dba SolarBeamEffect_         ; SOLARBEAM_EFFECT ; Sunsette: drain+prime / release-burn / fire recoil+burn
	dba MindwipeEffect_          ; MINDWIPE_EFFECT ; Sunsette: retype BUG + gray + -1 ACC, no damage
	dba RoostEffect_             ; ROOST_EFFECT ; Sunsette: heal + natural-type/palette refresh + strip FLYING/FLOATING
	dba ShadowBoxEffect_         ; SHADOW_BOX_EFFECT ; Sunsette: post-damage confuse rider (foe special -> confuse foe / else self)
	dba HobbleEffect_            ; HOBBLE_EFFECT ; Sunsette: guaranteed -1 SPEED and -1 EVASION to the target, post-damage
	dba CalmMindEffect_          ; CALM_MIND_EFFECT ; Sunsette: +1 user SPECIAL + clear the user's own CONFUSION
	dba DoRet                    ; STRENGTH_EFFECT ; Sunsette: no-op body; effect just needs to be nonzero so SpeciesMoveBonus runs
	dba BlossomBlitzEffect_      ; BLOSSOM_BLITZ_EFFECT ; Sunsette: 50% chance +1 user SPEED, post-damage
	dba TempestGround            ; TEMPEST_EFFECT ; Sunsette: strips the TARGET's FLYING/FLOATING on hit
	dba MiasmaEffect_            ; MIASMA_EFFECT ; Sunsette: one-sided stat clear + regular poison, no damage
	dba AquaRingEffect_          ; AQUA_RING_EFFECT ; Sunsette: FLOURISH + DOUBLE_FLOURISH, no damage
	dba ClayArmorEffect_         ; CLAY_ARMOR_EFFECT ; Sunsette: type-gated dual screens + Ground heal, no damage
	dba MetamorphicEffect_       ; METAMORPHIC_EFFECT ; Sunsette: post-damage recoil; ROCK user sheds ROCK + +6 SPEED + glow
	dba SupernovaEffect_         ; SUPERNOVA_EFFECT ; Sunsette: FIRE user no-recoil/shed-FIRE/gray; non-FIRE recoil + self-burn
	dba SenbonzakuraEffect_      ; SENBONZAKURA_EFFECT ; Sunsette: FLOURISH regen scaled by desperation (runs even on a KO)
	dba PsychoShiftEffect_       ; PSYCHO_SHIFT_EFFECT ; Sunsette: transfer the user's status + confusion onto the target
	dba SappingColdEffect_       ; SAPPING_COLD_EFFECT ; Sunsette: drain + conditional freeze, post-damage
	dba EnergyFluxEffect_        ; ENERGY_FLUX_EFFECT ; Sunsette: 0-BP capacitor setup (discharge in the ApplyDamage hooks)
	dba BugOffEffect_            ; BUG_OFF_EFFECT ; Sunsette: confuse + SPECIAL -1, then the user switches out
	dba HydrobathEffect_         ; HYDROBATH_EFFECT ; Sunsette: turn-2 release - cure status + SPEED/SPECIAL +2 (turn-1 charge via HydrobathChargeTurn)
	assert_table_length NUM_MOVE_EFFECTS
