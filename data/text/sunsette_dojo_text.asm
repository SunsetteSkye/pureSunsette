; Sunsette: the two functionless side scrolls in the Fighting Dojo, repurposed into critical-hit lessons in
; the dojo's cryptic martial-arts style. Referenced via text_far from scripts/FightingDojo.asm, so the bank
; is irrelevant. (Floated section because the numbered text banks are full.)

; Left scroll: FIGHTING-type mons land critical hits twice as often as anyone else.
_FightingDojoCritFightingText::
	text "THE TRAINED BODY"
	line "FINDS THE VITAL"
	cont "POINT TWICE AS"
	cont "OFTEN."

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
