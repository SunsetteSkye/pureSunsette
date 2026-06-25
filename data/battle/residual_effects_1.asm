; These are move effects (second value from the Moves table in bank $E).
ResidualEffects1:
; most non-side effects
	db HAZE_EFFECT
	db TELEPORT_EFFECT
	db MIST_EFFECT
	db FOCUS_ENERGY_EFFECT
	db CONFUSION_EFFECT
	db HEAL_EFFECT
	db TRANSFORM_EFFECT
	db LIGHT_SCREEN_EFFECT
	db REFLECT_EFFECT
	db POISON_EFFECT
	db PARALYZE_EFFECT
	db SUBSTITUTE_EFFECT
	db LEECH_SEED_EFFECT
	; Sunsette: SPLASH_EFFECT removed - SPLASH is now a user-weight DAMAGING move, so it must go through
	; damage calc/accuracy instead of skipping them. (MAGIKARP's no-damage signature comes from the modifier
	; forcing 0 power; SplashEffect_ prints its comedy line.)
	db MINDWIPE_EFFECT ; Sunsette: no-damage status move (PSYWAVE); MindwipeEffect_ runs its own accuracy test
	db ROOST_EFFECT ; Sunsette: ROOST (RAZOR_WIND) - heal + type/palette refresh; handled by RoostEffect_
	db MIASMA_EFFECT ; Sunsette: no-damage status move (EMETIC PURGE) - one-sided stat clear + poison; MiasmaEffect_ (always lands, like Haze)
	db PSYCHO_SHIFT_EFFECT ; Sunsette: no-damage status move (PSYCHO SHIFT) - transfers the user's status + confusion to the target; PsychoShiftEffect_ (always attempts, like Haze)
	db AQUA_RING_EFFECT ; Sunsette: no-damage self-buff (ACID_ARMOR) - FLOURISH + DOUBLE_FLOURISH regen; AquaRingEffect_
	db CLAY_ARMOR_EFFECT ; Sunsette: no-damage (FISSURE) - type-gated dual screens + Ground heal; ClayArmorEffect_
	db ENERGY_FLUX_EFFECT ; Sunsette: no-damage capacitor setup (ENERGY FLUX) - type2->FLOATING + SPECIAL+2 + ENERGIZED; EnergyFluxEffect_
	db BUG_OFF_EFFECT ; Sunsette: no-damage disrupt-and-pivot (BUG OFF) - confuse + SPECIAL -1 the target, then user switches out; BugOffEffect_
	db HYDROBATH_EFFECT ; Sunsette: HYDROBATH's turn-2 release (skip damage/accuracy, run the self-buff); HydrobathEffect_ via the Haze trampoline. Turn 1 charged separately and never reaches here.
	db -1 ; end
