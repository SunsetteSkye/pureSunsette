; Sunsette: the two functionless side scrolls in the Fighting Dojo, repurposed into critical-hit lessons in
; the dojo's cryptic martial-arts style. Referenced via text_far from scripts/FightingDojo.asm, so the bank
; is irrelevant. (Floated section because the numbered text banks are full.)

; Left scroll: a FIGHTING-type's crit rate scales with desperation - ordinary at full health, x2 at yellow,
; x4 at red (its Demolish / Pivot Strike movepool covers the healthy case).
_FightingDojoCritFightingText::
	text "A hale body strikes as any other."
	para "But corner a fighter, and it finds the vital point far more often."
	para "Wounded, its aim only sharpens, twice over, then fourfold."
	para "Such is the way of the Fighting type."
	para "A scroll on the way of the critical strike."
	done

; Right scroll: a critical hit is +50% damage, and the rate rides on a #MON's inborn (base) Speed.
_FightingDojoCritSpeedText::
	text "A blow true to the vital point cuts half again as deep."
	para "The swift of foot find it soonest."
	para "Inborn speed guides the killing blow."
	done
