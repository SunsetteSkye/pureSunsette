; {stat}_(UP|DOWN)(1|2) means that the move raises the user's (or lowers the target's) corresponding stat modifier by 1 (or 2) stages
; {status condition}_SIDE_EFFECT means that the move has a side chance of causing that condition
; {status condition}_EFFECT means that the move causes the status condition every time it hits the target

; MoveEffectPointerTable indexes (see data/moves/effects_pointers.asm)
	const_def
	const NO_ADDITIONAL_EFFECT       ; $00
	const BIG_RECOIL_EFFECT          ; $01 ; PureRGBnote: ADDED: new effect, 50% recoil
	const POISON_SIDE_EFFECT1        ; $02
	const DRAIN_HP_EFFECT            ; $03
	const BURN_SIDE_EFFECT1          ; $04
	const FREEZE_SIDE_EFFECT1        ; $05
	const PARALYZE_SIDE_EFFECT1      ; $06
	const EXPLODE_EFFECT             ; $07 Explosion, Self Destruct
	const DREAM_EATER_EFFECT         ; $08
	const MIRROR_MOVE_EFFECT         ; $09
	const ATTACK_UP1_EFFECT          ; $0A
	const DEFENSE_UP1_EFFECT         ; $0B
	const SPEED_UP1_EFFECT           ; $0C
	const SPECIAL_UP1_EFFECT         ; $0D
	const ACCURACY_UP1_EFFECT        ; $0E
	const EVASION_UP1_EFFECT         ; $0F
	const PAY_DAY_EFFECT             ; $10
	const SWIFT_EFFECT               ; $11
	const ATTACK_DOWN1_EFFECT        ; $12
	const DEFENSE_DOWN1_EFFECT       ; $13
	const SPEED_DOWN1_EFFECT         ; $14
	const SPECIAL_DOWN1_EFFECT       ; $15
	const ACCURACY_DOWN1_EFFECT      ; $16
	const EVASION_DOWN1_EFFECT       ; $17
	const TRI_ATTACK_EFFECT          ; $18 ; PureRGBnote: ADDED: new effect, 10% chance of burn / freeze / paralyze
	const HAZE_EFFECT                ; $19
	const TWO_OR_THREE_ATTACKS_EFFECT; $1A ; PureRGBnote: ADDED: new effect, 50% chance of 2 hits, 50% chance of 3
	const THRASH_PETAL_DANCE_EFFECT  ; $1B
	const TELEPORT_EFFECT            ; $1C
	const TWO_TO_FIVE_ATTACKS_EFFECT ; $1D
	const MIRAGE_EFFECT              ; $1E ; RETIRED: Mirage is now a FIRE clone of WATER PULSE (CONFUSION_BIG_SIDE_EFFECT). Const kept (no move uses it) to avoid shifting the effect enum; MirageEffect_ is dead-but-harmless.
	const FLINCH_SIDE_EFFECT1        ; $1F
	const SLEEP_EFFECT               ; $20
	const POISON_SIDE_EFFECT2        ; $21
	const BURN_SIDE_EFFECT2          ; $22
	const FREEZE_SIDE_EFFECT2        ; $23 ; Sunsette: 30% freeze (Ice Beam). Lives in the native EFFECT2 slot so FreezeBurnParalyzeEffect handles it with no special-casing (swapped with SPEED_UP_SIDE_EFFECT, now $64)
	const PARALYZE_SIDE_EFFECT2      ; $24
	const FLINCH_SIDE_EFFECT2        ; $25
	const OHKO_EFFECT                ; $26 moves like Horn Drill
	const CHARGE_EFFECT              ; $27 moves like Solar Beam
	const SUPER_FANG_EFFECT          ; $28
	const SPECIAL_DAMAGE_EFFECT      ; $29 Seismic Toss, Sonic Boom
	const TRAPPING_EFFECT            ; $2A moves like Wrap
	const FLY_EFFECT                 ; $2B
	const ATTACK_TWICE_EFFECT        ; $2C
	const JUMP_KICK_EFFECT           ; $2D Jump Kick and Hi Jump Kick effect
	const MIST_EFFECT                ; $2E
	const FOCUS_ENERGY_EFFECT        ; $2F
	const RECOIL_EFFECT              ; $30 moves like Double Edge
	const CONFUSION_EFFECT           ; $31 Confuse Ray, Supersonic (not the move Confusion)
	const ATTACK_UP2_EFFECT          ; $32
	const DEFENSE_UP2_EFFECT         ; $33
	const SPEED_UP2_EFFECT           ; $34
	const SPECIAL_UP2_EFFECT         ; $35
	const ACCURACY_UP2_EFFECT        ; $36
	const EVASION_UP2_EFFECT         ; $37
	const HEAL_EFFECT                ; $38 Recover, Softboiled, Rest
	const TRANSFORM_EFFECT           ; $39
	const ATTACK_DOWN2_EFFECT        ; $3A
	const DEFENSE_DOWN2_EFFECT       ; $3B
	const SPEED_DOWN2_EFFECT         ; $3C
	const SPECIAL_DOWN2_EFFECT       ; $3D
	const ACCURACY_DOWN2_EFFECT      ; $3E
	const EVASION_DOWN2_EFFECT       ; $3F
	const LIGHT_SCREEN_EFFECT        ; $40
	const REFLECT_EFFECT             ; $41
	const POISON_EFFECT              ; $42
	const PARALYZE_EFFECT            ; $43
	const ATTACK_DOWN_SIDE_EFFECT    ; $44
	const DEFENSE_DOWN_SIDE_EFFECT   ; $45
	const SPEED_DOWN_SIDE_EFFECT     ; $46
	const SPECIAL_DOWN_SIDE_EFFECT   ; $47
;;;;;;;;;; PureRGB: ADDED: new move effects
	const ATTACK_UP_SIDE_EFFECT      ; $48 ; used in bide, sharpen, submission and meditate
	const ATTACK_ACCURACY_UP1_EFFECT ; $49 ; used in sharpen
	const ATTACK_DEFENSE_UP1_EFFECT  ; $4A ; used in bide
	const CONFUSION_BIG_SIDE_EFFECT  ; $4B ; used in Whirlwind and Dizzy punch
;;;;;;;;;;
	const CONFUSION_SIDE_EFFECT      ; $4C
	const TWINEEDLE_EFFECT           ; $4D
	const VOID_MIND_EFFECT            ; $4E ; VOID MIND: max the user's ACCURACY (+6) + clear its own CONFUSION (VoidMindEffect)
	const SUBSTITUTE_EFFECT          ; $4F
	const HYPER_BEAM_EFFECT          ; $50
	const BONEMERANG_EFFECT          ; $51
	const MIMIC_EFFECT               ; $52
	const METRONOME_EFFECT           ; $53
	const LEECH_SEED_EFFECT          ; $54
	const SPLASH_EFFECT              ; $55
	const DISABLE_EFFECT             ; $56
	const WITHDRAW_EFFECT            ; $57
	const GROWTH_EFFECT              ; $58
	const DEFENSE_CURL_EFFECT        ; $59 ; PureRGBnote: ADDED: new effect, makes super effective moves do neutral damage
	const ACID_ARMOR_EFFECT          ; $5A ; PureRGBnote: ADDED: new effect, does light screen and reflect in one move
	const EXPLODE_RECOIL_EFFECT      ; $5B ; PureRGBnote: ADDED: new effect, selfdestruct/explosion base effect, changes at lower health to EXPLODE_EFFECT
	const CONVERSION_EFFECT          ; $5C ; PureRGBnote: ADDED: new effect, used with conversion
	const MAXIMIZE_EFFECT            ; $5D ; Sunsette: REPURPOSED (was ACID_SIDE_EFFECT, which no move used). MAXIMIZE - sets the user's ATTACK to +6, drops its EVASION and SPEED by 2 each, plays a slowed cry. In ResidualEffects2 -> trampoline MaximizeEffect -> jpfar MaximizeEffect_
	const SIPHON_SNAG_EFFECT         ; $5E ; PureRGBnote: ADDED: new effect, heals status on self, or a mon in party if no status on self
	const HEAT_RUSH_EFFECT           ; $5F ; PureRGBnote: ADDED: new effect, 30% burn chance, and if used by a fire pokemon, 40% chance of raising special one stage
	const MEGA_PUNCH_EFFECT          ; $60 ; PureRGBnote: ADDED: new effect, 30% flinch chance if user is FIGHTING type, 10% flinch otherwise
	const SCREECH_EFFECT             ; $61 ; PureRGBnote: ADDED: new effect, Defense down 2, but also prevents SLEEP status for the battle. Auto-used when a pokemon who has it is put to sleep.
	const WATERIFY_EFFECT            ; $62 ; Sunsette: ADDED: damaging move that retypes the surviving target to pure WATER until it switches out
	const CUT_DISABLE_EFFECT         ; $63 ; Sunsette: ADDED: damaging move that also DISABLEs the target's last move (Cut)
	const SPEED_UP_SIDE_EFFECT       ; $64 ; PureRGBnote: ADDED: new effect, used in meditate (NULL handler; applied via stat-mapping). Sunsette: moved from $23 to free the freeze EFFECT2 slot
	const FLASH_EFFECT               ; $65 ; Sunsette: ADDED: no-damage priority move; raises user ACCURACY +3 and 30% chance to flinch (Flash)
	const ACCURACY_DOWN_SIDE_EFFECT  ; $66 ; Sunsette: ADDED: damaging move with a 30% post-damage chance to lower the target's ACCURACY (Gust). Shares Haze's trampoline -> GustAccuracyEffect_
	const SOLARBEAM_EFFECT           ; $67 ; Sunsette: ADDED: SolarBeam pseudo-charge. Non-fire: 1st use drains 1/2 + "primes"; next use is the 120-BP release with a 30% burn. FIRE users: 90 BP, 1/3 recoil, 30% burn, no priming. Shares Haze's trampoline -> SolarBeamEffect_
	const MINDWIPE_EFFECT            ; $68 ; Sunsette: ADDED: PSYWAVE->SKITTERMIND. No damage; retypes the target to BUG (+ gray palette) and drops its ACCURACY by 1. In ResidualEffects1 -> MindwipeEffect_
	const ROOST_EFFECT               ; $69 ; Sunsette: ADDED: RAZOR_WIND->ROOST. Heal 1/2 + refresh user to natural types/palette (cures SKITTERMIND/WATERIFY) + strip FLYING/FLOATING this turn (NORMAL if that leaves it typeless); restored next turn. In ResidualEffects1 -> RoostEffect_
	const SHADOW_BOX_EFFECT          ; $6A ; Sunsette: SHADOW BOX - GHOST 90/60-BP brace-counter (reused the retired JOLT_BOLT_EFFECT slot). Reads the foe's intended move: Special -> half damage taken + decent hit + confuse the foe; anything else -> modest hit + confuse yourself. Routes through the Haze trampoline (HazeEffect -> HazeFlinchEffect_ -> ShadowBoxEffect_), post-damage.
	const HOBBLE_EFFECT              ; $6B ; Sunsette: ADDED: UNDERBUG (Vicegrip) / METEOR SWEEP (Rolling Kick) signature. Damaging move that guarantees -1 SPEED and -1 EVASION to the target on hit (post-damage side effect). Shares Haze's trampoline -> HobbleEffect_
	const CALM_MIND_EFFECT           ; $6C ; Sunsette: ADDED: CALM MIND (AMNESIA). +1 user SPECIAL AND clears the user's own CONFUSION (only when the move actually executes - the confusion self-hit check is NOT bypassed). In ResidualEffects2; shares Haze's trampoline -> CalmMindEffect_
	const STRENGTH_EFFECT            ; $6D ; Sunsette: STRENGTH (flat 100 BP) + reused by SHORYUKEN. Effect itself is a no-op (Haze trampoline -> ret); its only purpose is to be NONZERO so the engine reaches SpeciesMoveBonus, which dispatches by MOVE number: STRENGTH -> StrengthRagePostHit (30% +1 ATK + lighter-class recoil); SHORYUKEN -> .shoryukenAtk (~80% +1 ATK setup).
	const BLOSSOM_BLITZ_EFFECT       ; $6E ; Sunsette: RIPTIDE (WATERFALL) now. Damaging move with a 50% post-damage chance to raise the USER's SPEED by 1 (guaranteed for the GYARADOS/SEAKING/GOLDEEN signature). Was also PETAL_DANCE's effect; PETAL_DANCE split off to SENBONZAKURA_EFFECT, so this is RIPTIDE-only. Shares Haze's trampoline -> BlossomBlitzEffect_, in AlwaysHappen + SpecialEffects.
	const TEMPEST_EFFECT           ; $6F ; Sunsette: TEMPEST (was TWISTER). No-op via the Haze trampoline EXCEPT it dispatches in HazeFlinchEffect_ -> TempestGround, which strips the TARGET's FLYING/FLOATING type on hit (restored by ROOST). Fly-invuln bypass is in CheckSemiInvulnBypass; weight-based power is TempestWeightModifier.
	const MIASMA_EFFECT              ; $70 ; Sunsette: ADDED: EMETIC PURGE. No-damage priority move; one-sided "revenge stat clear" - resets the FOE's stat stages to neutral (Haze, foe only) and regular-poisons it (POISON/GHOST immune; Sub blocks the poison). In ResidualEffects1; shares Haze's trampoline -> MiasmaEffect_
	const AQUA_RING_EFFECT           ; $71 ; Sunsette: ADDED: AQUA RING (ACID_ARMOR const). 0-BP self-buff; grants FLOURISH + the DOUBLE_FLOURISH flag (1/8-per-turn regen). In ResidualEffects1; shares Haze's trampoline -> AquaRingEffect_
	const CLAY_ARMOR_EFFECT          ; $72 ; Sunsette: ADDED: CLAY ARMOR (FISSURE const). 0-BP. Type-gated (GROUND/FIGHTING/POISON/ROCK/BUG, not FLYING/FLOATING); fails if a screen is up. Sets Reflect+Light Screen; GROUND users also heal 1/2. In ResidualEffects1; Haze trampoline -> ClayArmorEffect_
	const METAMORPHIC_EFFECT         ; $73 ; Sunsette: ADDED: OROCLASM (EXPLOSION const). Damaging ROCK move; post-damage (hit only) it applies heavy recoil, and a ROCK user sheds its ROCK type (mono-Rock -> NORMAL), gains +6 SPEED, and a PAL_GAMEFREAK glow. Haze trampoline -> MetamorphicEffect_
	const SUPERNOVA_EFFECT           ; $74 ; Sunsette: ADDED: SUPERNOVA (SELFDESTRUCT const). Damaging FIRE move; post-damage (hit only) a FIRE user takes NO recoil, sheds FIRE (mono-Fire -> NORMAL) + PAL_MINDWIPE gray; a non-FIRE user takes heavy recoil + self-burn. Haze trampoline -> SupernovaEffect_
	const SENBONZAKURA_EFFECT        ; $75 ; Sunsette: ADDED: SENBONZAKURA (PETAL_DANCE). Damaging GRASS comeback move; post-damage (hit OR KO) self-effect - grants FLOURISH regen scaled by the desperation stage (none/single/double). Power is scaled 60/90/120/150 by ComebackModifier. Split off BLOSSOM_BLITZ_EFFECT so RIPTIDE keeps its +SPEED. Haze trampoline -> SenbonzakuraEffect_; in AlwaysHappen + SpecialEffects.
	const PSYCHO_SHIFT_EFFECT        ; $76 ; Sunsette: ADDED: PSYCHO SHIFT. No-damage status move; transfers the USER's main status (PSN/BRN/PAR, toxic flag+counter aware) and CONFUSION onto the target, then cures the user of whatever lands. Type-immune / already-afflicted halves are skipped; a Substitute blocks all of it; nothing landing = the move fails. In ResidualEffects1; shares Haze's trampoline -> PsychoShiftEffect_
	const SAPPING_COLD_EFFECT        ; $77 ; Sunsette: ADDED: SAPPING COLD. Damaging ICE drain (heals 1/2 like Absorb); goes LAST (negative priority), and if the user took NO direct hit this turn (FINISHER_INTERRUPTED clear) it freezes the target. Haze trampoline -> SappingColdEffect_ (post-damage).
	const ENERGY_FLUX_EFFECT         ; $78 ; Sunsette: ADDED: ENERGY FLUX. 0-BP capacitor setup: type2 -> FLOATING (unless already FLYING/FLOATING) + SPECIAL +2 + sets ENERGIZED. Fails if already energized. The charge DISCHARGES (resets stat stages + natural type) when the user lands a special-TYPED damaging move (type >= SPECIAL or GHOST) - see EnergyFluxDischarge in the ApplyDamage hooks. In ResidualEffects1; Haze trampoline -> EnergyFluxEffect_.
	const BUG_OFF_EFFECT             ; $79 ; Sunsette: ADDED: BUG OFF. 0-BP disrupt-and-pivot: confuse the target + SPECIAL -1, then the user switches out / flees (teleport-style). In ResidualEffects1; Haze trampoline -> BugOffEffect_ (black_haze).
	const HYDROBATH_EFFECT           ; $7A ; Sunsette: ADDED: HYDROBATH - a Fly/Dig-style TWO-TURN move with no damage. Turn 1 charges (real CHARGING_UP+INVULNERABLE, stat reset, no evasion pin); turn 2 cures the user's status + raises SPEED and SPECIAL by 2. The semi-invuln state is breached only by SWIFT or ELECTRIC attacks (CheckSemiInvulnBypass). Turn 1 routed through ChargeEffect by HydrobathChargeTurn; turn 2 via ResidualEffects1 + Haze trampoline -> HazeFlinchEffect_ -> HydrobathEffect_.
	const DEGENERATION_EFFECT        ; $7B ; Sunsette: ADDED: DEGENERATION - the poison self-faint trump. 0-BP, in ResidualEffects1 (no accuracy test). Resets the foe's stat stages, badly-poisons it (overriding any status), confuses it, and rots 2-5 PP off each of its moves; fails ENTIRELY vs POISON/GHOST. The user always faints (registered to ExplosionFaintModifier). DegenerationEffect_ (black_haze).
DEF NUM_MOVE_EFFECTS EQU const_value - 1
