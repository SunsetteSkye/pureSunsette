; Sunsette: Route 23 guard "do you know what a BADGE is?" lecture (relocated here to keep Text 5 in budget).
; Reached cross-bank via text_far from scripts/Route23.asm.
_Route23KnowWhatBadgeText::
	text "You DO know what"
	line "a BADGE is,"
	cont "right?"
	done

_Route23ThenYouKnowText::
	text "Then you know why"
	line "I can't let you"
	cont "through!@"
	text_end

_Route23BadgeSpielText::
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
