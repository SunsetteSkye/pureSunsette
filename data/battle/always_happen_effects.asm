AlwaysHappenSideEffects:
; Attacks that aren't finished after they faint the opponent.
	db DRAIN_HP_EFFECT
	db EXPLODE_EFFECT
	db DREAM_EATER_EFFECT
	db PAY_DAY_EFFECT
	db TWO_OR_THREE_ATTACKS_EFFECT ; PureRGBnote: ADDED:
	db TWO_TO_FIVE_ATTACKS_EFFECT
	db ATTACK_TWICE_EFFECT
	db RECOIL_EFFECT
	db BIG_RECOIL_EFFECT ; PureRGBnote: ADDED:
	db TWINEEDLE_EFFECT
	db ATTACK_UP_SIDE_EFFECT ; PureRGBnote: ADDED:
	db BONEMERANG_EFFECT ; PureRGBnote: ADDED:
	db EXPLODE_RECOIL_EFFECT ; PureRGBnote: ADDED:
	db SIPHON_SNAG_EFFECT ; PureRGBnote: ADDED:
	db HEAT_RUSH_EFFECT ; PureRGBnote: ADDED:
	db SOLARBEAM_EFFECT ; Sunsette: drain/recoil must land even on a KO (also in SpecialEffects so it fires here ONCE, not again post-damage)
	db JOLT_BOLT_EFFECT ; Sunsette: RETIRED (POUND is now SPARK / PARALYZE_SIDE_EFFECT2) - dead entry, no move uses this effect
	db BLOSSOM_BLITZ_EFFECT ; Sunsette: user SPEED-up (50%) should land even on a KO (also in SpecialEffects -> fires once)
	db SENBONZAKURA_EFFECT ; Sunsette: user self-buff (stat reset + FLOURISH + EVASION +1) should land even on a KO (also in SpecialEffects -> fires once)
	db -1 ; end
