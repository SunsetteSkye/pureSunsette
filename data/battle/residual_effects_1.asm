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
	db SPLASH_EFFECT
	db MIRAGE_EFFECT ; PureRGBnote: no-damage status move; runs its own accuracy test + animation
	db MINDWIPE_EFFECT ; Sunsette: no-damage status move (PSYWAVE); MindwipeEffect_ runs its own accuracy test
	db ROOST_EFFECT ; Sunsette: ROOST (RAZOR_WIND) - heal + type/palette refresh; handled by RoostEffect_
	db -1 ; end
