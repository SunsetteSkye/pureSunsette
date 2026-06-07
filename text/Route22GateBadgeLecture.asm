; Sunsette: Route 22 Gate (Boulder Badge) guard "do you know what a BADGE is?" lecture.
; Kept in its own file because Text 5 (Route22Gate's main text bank) is full; reached cross-bank
; via text_far from scripts/Route22Gate.asm.
_Route22GateKnowWhatBadgeText::
	text "You DO know what"
	line "a BADGE is,"
	cont "right?"
	done

_Route22GateThenYouKnowText::
	text "Then you know why"
	line "I can't let you"
	cont "through!@"
	text_end

_Route22GateBadgeSpielText::
	text "Tough trainers"
	line "earn BADGEs at"
	cont "#MON GYMs."

	para "The experience"
	line "teaches you to"
	cont "raise #MON far"
	cont "more efficiently!"

	para "No BADGEs? Then"
	line "your #MON grow"
	cont "slowly and stay"
	cont "weak. Get going!@"
	text_end
