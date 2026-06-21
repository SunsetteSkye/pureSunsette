SpecialEffects:
; Effects from arrays 2, 4, and 5B, minus Twineedle and Rage.
; Includes all effects that do not need to be called at the end of
; ExecutePlayerMove (or ExecuteEnemyMove), because they have already been handled
	db DRAIN_HP_EFFECT
	db EXPLODE_EFFECT
	db DREAM_EATER_EFFECT
	db PAY_DAY_EFFECT
	; Sunsette: SWIFT_EFFECT removed - it now has a post-damage side effect (30% -1 EVASION), so it must
	; get the .executeOtherEffects JumpMoveEffect call instead of being skipped here.
	db TWO_OR_THREE_ATTACKS_EFFECT ; PureRGBnote: ADDED:
	db TWO_TO_FIVE_ATTACKS_EFFECT
	db CHARGE_EFFECT
	db SUPER_FANG_EFFECT
	db SPECIAL_DAMAGE_EFFECT
	db FLY_EFFECT
	db ATTACK_TWICE_EFFECT
	db JUMP_KICK_EFFECT
	db RECOIL_EFFECT
	db BIG_RECOIL_EFFECT ; PureRGBnote: ADDED:
	db ATTACK_UP_SIDE_EFFECT ; PureRGBnote: ADDED:
	db EXPLODE_RECOIL_EFFECT ; PureRGBnote: ADDED:
	db SIPHON_SNAG_EFFECT ; PureRGBnote: ADDED:
	db HEAT_RUSH_EFFECT ; PureRGBnote: ADDED:
	db SOLARBEAM_EFFECT ; Sunsette: kept out of the post-damage executeOtherEffects pass; it runs once via AlwaysHappenSideEffects
	db JOLT_BOLT_EFFECT ; Sunsette: RETIRED (POUND is now SPARK / PARALYZE_SIDE_EFFECT2) - dead entry, no move uses this effect
	db BLOSSOM_BLITZ_EFFECT ; Sunsette: ditto - BLOSSOM BLITZ's 50% user SPEED-up runs once via AlwaysHappenSideEffects
	db SENBONZAKURA_EFFECT ; Sunsette: ditto - SENBONZAKURA's self-buff runs once via AlwaysHappenSideEffects (kept out of the post-damage executeOtherEffects pass)
	; fallthrough
SpecialEffectsCont:
; damaging moves whose effect is executed prior to damage calculation
	db THRASH_PETAL_DANCE_EFFECT
	db TRAPPING_EFFECT
	db -1 ; end
	