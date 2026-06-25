; Sunsette: the two functionless side scrolls in the Fighting Dojo, repurposed into critical-hit lessons in
; the dojo's cryptic martial-arts style. Referenced via text_far from scripts/FightingDojo.asm, so the bank
; is irrelevant. (Floated section because the numbered text banks are full.)

; Left scroll: a FIGHTING-type's crit rate scales with desperation - ordinary at full health, x2 at yellow,
; x4 at red (its Demolish / Pivot Strike movepool covers the healthy case).
_FightingDojoCritFightingText::
	text "A HALE BODY"
	line "STRIKES AS ANY"
	cont "OTHER."

	para "BUT CORNER A"
	line "FIGHTER, AND IT"
	cont "FINDS THE VITAL"
	cont "POINT FAR MORE"
	cont "OFTEN."

	para "WOUNDED, ITS AIM"
	line "ONLY SHARPENS --"
	cont "TWICE OVER, THEN"
	cont "FOURFOLD."

	para "SUCH IS THE WAY"
	line "OF THE FIGHTING"
	cont "TYPE."

	para "A scroll on the"
	line "way of the"
	cont "critical strike."
	done

; Right scroll: a critical hit is +50% damage, and the rate rides on a #MON's inborn (base) Speed.
_FightingDojoCritSpeedText::
	text "A BLOW TRUE TO"
	line "THE VITAL POINT"
	cont "CUTS HALF AGAIN"
	cont "AS DEEP."

	para "THE SWIFT OF FOOT"
	line "FIND IT SOONEST."

	para "Inborn speed"
	line "guides the"
	cont "killing blow."
	done
