; Sunsette: Viridian schoolhouse blackboard SLEEP entry, relocated here from text_2.asm (the "Text 3"
; section it lived in was full). Referenced via text_far from scripts/ViridianSchoolHouse.asm, so the bank
; is irrelevant. Updated with the hit-shortens-sleep rule.
_ViridianBlackboardSleepText::
	text "A #MON can't"
	line "attack if it's"
	cont "asleep!"

	para "It can wake up"
	line "during battle."

	para "#MON will stay"
	line "asleep even after"
	cont "battles."

	para "Striking a sleeper"
	line "stirs it: each hit"
	cont "cuts a round, a"
	cont "crit cuts two!"

	para "But GRASS types"
	line "are restless --"
	cont "they can't be put"
	cont "to sleep at all!"

	para "Use AWAKENING to"
	line "wake them up!"
	prompt
