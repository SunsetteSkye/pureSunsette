; Sunsette: Route 22 Gate (Boulder Badge) guard "do you know what a BADGE is?" lecture.
; Kept in its own file because Text 5 (Route22Gate's main text bank) is full; reached cross-bank
; via text_far from scripts/Route22Gate.asm.
_Route22GateKnowWhatBadgeText::
	text "You DO know what a Badge is, right?"
	done

_Route22GateThenYouKnowText::
	text "Then you know why I can't let you through!@"
	text_end

_Route22GateBadgeSpielText::
	text "Tough Trainers earn Badges at <Pokemon> Gyms."
	para "The experience teaches you to raise <Pokemon> far more efficiently!"
	para "No Badges? Then your <Pokemon> grow slowly and stay weak. Get going!@"
	text_end
