MoveEffectPointerTable:
; entries correspond to *_EFFECT constants
	table_width 2
	dw BigRecoilEffect           ; BIG_RECOIL_EFFECT
	dw PoisonEffect              ; POISON_SIDE_EFFECT1
	dw DrainHPEffect             ; DRAIN_HP_EFFECT
	dw FreezeBurnParalyzeEffect  ; BURN_SIDE_EFFECT1
	dw FreezeBurnParalyzeEffect  ; FREEZE_SIDE_EFFECT1
	dw FreezeBurnParalyzeEffect  ; PARALYZE_SIDE_EFFECT1
	dw DoRet                     ; EXPLODE_EFFECT
	dw DrainHPEffect             ; DREAM_EATER_EFFECT
	dw NULL                      ; MIRROR_MOVE_EFFECT (MOCKINGBIRD)
	dw StatModifierUpEffect      ; ATTACK_UP1_EFFECT
	dw StatModifierUpEffect      ; DEFENSE_UP1_EFFECT
	dw StatModifierUpEffect      ; SPEED_UP1_EFFECT
	dw StatModifierUpEffect      ; SPECIAL_UP1_EFFECT
	dw StatModifierUpEffect      ; ACCURACY_UP1_EFFECT
	dw StatModifierUpEffect      ; EVASION_UP1_EFFECT
	dw PayDayEffect              ; PAY_DAY_EFFECT
	dw HazeEffect                ; SWIFT_EFFECT ; Sunsette: shares the Haze/Flash trampoline; the floating HazeFlinchEffect_ dispatches it to SwiftEffect_ (30% -1 EVASION). Never-miss is still handled by the hit-test.
	dw StatModifierDownEffect    ; ATTACK_DOWN1_EFFECT
	dw StatModifierDownEffect    ; DEFENSE_DOWN1_EFFECT
	dw StatModifierDownEffect    ; SPEED_DOWN1_EFFECT
	dw StatModifierDownEffect    ; SPECIAL_DOWN1_EFFECT
	dw AccuracyDownEffect        ; ACCURACY_DOWN1_EFFECT
	dw StatModifierDownEffect    ; EVASION_DOWN1_EFFECT
	dw TriAttackEffect           ; TRI_ATTACK_EFFECT
	dw HazeEffect                ; HAZE_EFFECT
	dw TwoToFiveAttacksEffect    ; TWO_OR_THREE_ATTACKS_EFFECT
	dw ThrashPetalDanceEffect    ; THRASH_PETAL_DANCE_EFFECT
	dw TeleportEffect            ; TELEPORT_EFFECT
	dw TwoToFiveAttacksEffect    ; TWO_TO_FIVE_ATTACKS_EFFECT
	dw MirageEffect              ; MIRAGE_EFFECT
	dw FlinchSideEffect          ; FLINCH_SIDE_EFFECT1
	dw SleepEffect               ; SLEEP_EFFECT
	dw PoisonEffect              ; POISON_SIDE_EFFECT2
	dw FreezeBurnParalyzeEffect  ; BURN_SIDE_EFFECT2
	dw FreezeBurnParalyzeEffect  ; FREEZE_SIDE_EFFECT2 ; Sunsette: 30% freeze, handled natively by the EFFECT2 path
	dw FreezeBurnParalyzeEffect  ; PARALYZE_SIDE_EFFECT2
	dw FlinchSideEffect          ; FLINCH_SIDE_EFFECT2
	dw OneHitKOEffect            ; OHKO_EFFECT
	dw ChargeEffect              ; CHARGE_EFFECT
	dw NULL                      ; SUPER_FANG_EFFECT
	dw NULL                      ; SPECIAL_DAMAGE_EFFECT
	dw TrappingEffect            ; TRAPPING_EFFECT
	dw ChargeEffect              ; FLY_EFFECT
	dw TwoToFiveAttacksEffect    ; ATTACK_TWICE_EFFECT
	dw NULL                      ; JUMP_KICK_EFFECT
	dw MistEffect                ; MIST_EFFECT
	dw FocusEnergyEffect         ; FOCUS_ENERGY_EFFECT
	dw RecoilEffect              ; RECOIL_EFFECT
	dw ConfusionEffect           ; CONFUSION_EFFECT
	dw StatModifierUpEffect      ; ATTACK_UP2_EFFECT
	dw StatModifierUpEffect      ; DEFENSE_UP2_EFFECT
	dw StatModifierUpEffect      ; SPEED_UP2_EFFECT
	dw StatModifierUpEffect      ; SPECIAL_UP2_EFFECT
	dw StatModifierUpEffect      ; ACCURACY_UP2_EFFECT
	dw StatModifierUpEffect      ; EVASION_UP2_EFFECT
	dw HealEffect                ; HEAL_EFFECT
	dw TransformEffect           ; TRANSFORM_EFFECT
	dw StatModifierDownEffect    ; ATTACK_DOWN2_EFFECT
	dw StatModifierDownEffect    ; DEFENSE_DOWN2_EFFECT
	dw StatModifierDownEffect    ; SPEED_DOWN2_EFFECT
	dw StatModifierDownEffect    ; SPECIAL_DOWN2_EFFECT
	dw StatModifierDownEffect    ; ACCURACY_DOWN2_EFFECT
	dw StatModifierDownEffect    ; EVASION_DOWN2_EFFECT
	dw ReflectLightScreenEffect  ; LIGHT_SCREEN_EFFECT
	dw ReflectLightScreenEffect  ; REFLECT_EFFECT
	dw PoisonEffect              ; POISON_EFFECT
	dw ParalyzeEffect            ; PARALYZE_EFFECT
	dw StatModifierDownEffect    ; ATTACK_DOWN_SIDE_EFFECT
	dw StatModifierDownEffect    ; DEFENSE_DOWN_SIDE_EFFECT
	dw StatModifierDownEffect    ; SPEED_DOWN_SIDE_EFFECT
	dw StatModifierDownEffect    ; SPECIAL_DOWN_SIDE_EFFECT
	dw StatUpSideEffect          ; ATTACK_UP_SIDE_EFFECT
	dw AccuracyAttackUpEffect    ; ATTACK_ACCURACY_UP1_EFFECT
	dw AttackDefenseUpEffect     ; ATTACK_DEFENSE_UP1_EFFECT
	dw ConfusionBigSideEffect    ; CONFUSION_BIG_SIDE_EFFECT
	dw ConfusionSideEffect       ; CONFUSION_SIDE_EFFECT
	dw TwoToFiveAttacksEffect    ; TWINEEDLE_EFFECT
	dw MeditateEffect            ; MEDITATE_EFFECT
	dw SubstituteEffect          ; SUBSTITUTE_EFFECT
	dw HyperBeamEffect           ; HYPER_BEAM_EFFECT
	dw TwoToFiveAttacksEffect    ; BONEMERANG_EFFECT
	dw MimicEffect               ; MIMIC_EFFECT
	dw NULL                      ; METRONOME_EFFECT
	dw LeechSeedEffect           ; LEECH_SEED_EFFECT
	dw SplashEffect              ; SPLASH_EFFECT
	dw DisableEffect             ; DISABLE_EFFECT
	dw WithdrawEffect            ; WITHDRAW_EFFECT
	dw GrowthEffect              ; GROWTH_EFFECT
	dw DefenseCurlEffect         ; DEFENSE_CURL_EFFECT
	dw ReflectLightScreenEffect  ; ACID_ARMOR_EFFECT
	dw ExplodeRecoilEffect       ; EXPLODE_RECOIL_EFFECT
	dw ConversionEffect          ; CONVERSION_EFFECT
	dw AcidEffect                ; ACID_EFFECT
	dw SiphonSnagEffect          ; SIPHON_SNAG_EFFECT
	dw HeatRushEffect            ; HEAT_RUSH_EFFECT
	dw MegaPunchEffect           ; MEGA_PUNCH_EFFECT
	dw ScreechEffect             ; SCREECH_EFFECT
	dw WaterifyEffect            ; WATERIFY_EFFECT
	dw DisableEffectCore         ; CUT_DISABLE_EFFECT ; Sunsette: runs after Cut's damage -> disable the target's last move (in Battle Core, so no trampoline needed)
	dw NULL                      ; SPEED_UP_SIDE_EFFECT ; Sunsette: moved here from $23 (NULL handler; Meditate applies it via stat-mapping)
	dw HazeEffect                ; FLASH_EFFECT ; Sunsette: shares Haze's Battle Core trampoline (Battle Core is full); the floating HazeFlinchEffect_ dispatches Haze vs Flash by effect
	dw HazeEffect                ; ACCURACY_DOWN_SIDE_EFFECT ; Sunsette: also shares the Haze trampoline; HazeFlinchEffect_ dispatches it to GustAccuracyEffect_ (30% -1 ACCURACY, post-damage)
	dw HazeEffect                ; SOLARBEAM_EFFECT ; Sunsette: also shares the Haze trampoline; HazeFlinchEffect_ dispatches it to SolarBeamEffect_ (drain+prime / release-burn / fire recoil+burn)
	dw HazeEffect                ; MINDWIPE_EFFECT ; Sunsette: also shares the Haze trampoline; HazeFlinchEffect_ dispatches it to MindwipeEffect_ (retype BUG + gray + -1 ACC, no damage)
	dw HazeEffect                ; ROOST_EFFECT ; Sunsette: also shares the Haze trampoline; HazeFlinchEffect_ dispatches it to RoostEffect_ (heal + natural-type/palette refresh + strip FLYING/FLOATING)
	dw HazeEffect                ; JOLT_BOLT_EFFECT ; Sunsette: also shares the Haze trampoline; HazeFlinchEffect_ dispatches it to JoltBoltEffect_ (50% chance +1 user EVASION, post-damage)
	assert_table_length NUM_MOVE_EFFECTS
