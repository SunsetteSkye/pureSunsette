_DaycareGentlemanIntroText::
	text "I run a Daycare. Would you like me to raise one of your <Pokemon>?"
	done

_DaycareGentlemanWhichMonText::
	text "Which <Pokemon> should I raise?"
	prompt

_DaycareGentlemanWillLookAfterMonText::
	text "Fine, I'll look after @"
	text_ram_namebuffer
	text_start
	cont "for a while."
	prompt

_DaycareGentlemanComeSeeMeInAWhileText::
	text "Come see me in a while."
	done

_DaycareGentlemanMonHasGrownText::
	text "Your @"
	text_ram_namebuffer
	text_start
	line "has grown a lot!"
	para "By level, it's grown by @"
	text_decimal wDayCareNumLevelsGrown, 1, 3
	text "!"
	para "Aren't I great?"
	prompt

_DaycareGentlemanOweMoneyText::
	text "You owe me ¥@"
	text_bcd wDayCareTotalCost, 2 | LEADING_ZEROES | LEFT_ALIGN
	text_start
	line "for the return of this <Pokemon>."
	done

_DaycareGentlemanGotMonBackText::
	text "<PLAYER> got @"
	text_ram wDayCareMonName
	text " back!"
	done

_DaycareGentlemanMonNeedsMoreTimeText::
	text "Back already?"
	line "Your @"
	text_ram_namebuffer
	text_start
	cont "needs some more time with me."
	prompt
