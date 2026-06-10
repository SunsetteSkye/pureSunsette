_PewterGymBrockPostBattleAdviceText::
	text "There are all"
	line "kinds of trainers"
	cont "in the world!"

	para "You appear to be"
	line "very gifted as a"
	cont "#MON trainer!"

	para "Go to the GYM in"
	line "CERULEAN and test"
	cont "your abilities!"
	done

_PewterGymBrockWaitTakeThisText::
	text "Wait! Take this"
	line "with you!"
	done

_TM34ExplanationText::
	text_start

	para "A <TM> contains a"
	line "technique that"
	cont "can be taught to"
	cont "#MON!"

	para "A <TM> is good only"
	line "once! So when you"
	cont "use one to teach"
	cont "a new technique,"
	cont "pick the #MON"
	cont "carefully!"

	para "@"
	text_ram_stringbuffer
	text " contains"
	line "BIDE!"

	para "Your #MON will"
	line "steel itself,"
	cont "raising ATTACK"
	cont "and DEFENSE!"
	done

_GenericNoRoomText::
_PewterGymTM34NoRoomText::
	text "You don't have"
	line "room for this!"
	done

_PewterGymBrockReceivedBoulderBadgeText::
	text "I took"
	line "you for granted."

	para "As proof of your"
	line "victory, here's"
	cont "the BOULDERBADGE!"

	para "<PLAYER> received"
	line "the BOULDERBADGE!@"
	text_end

_PewterGymBrockBoulderBadgeInfoText::
	text_start

	para "That's an official"
	line "#MON LEAGUE"
	cont "BADGE!"

	para "Its bearer's"
	line "#MON grow"
	cont "faster, and hit"
	cont "a bit harder!"

	para "The technique"
	line "FLASH can now be"
	cont "used any time!"
	prompt

_PewterGymCooltrainerMBattleText::
	text "Stop right there,"
	line "kid!"

	para "You're still light"
	line "years from facing"
	cont "BROCK!"
	done

_PewterGymCooltrainerMEndBattleText::
	text "Darn!"

	para "Light years isn't"
	line "time! It measures"
	cont "distance!"
	prompt

_PewterGymCooltrainerMAfterBattleText::
	text "You're pretty hot,"
	line "but not as hot"
	cont "as BROCK!"
	done

_PewterGymGuidePreAdviceText::
	text "Hiya! I can tell"
	line "you have what it"
	cont "takes to become a"
	cont "#MON champ!"

	para "I'm no trainer,"
	line "but I can tell"
	cont "you how to win!"

	para "Let me take you"
	line "to the top!"
	done

_PewterGymGuideBeginAdviceText::
	text "All right! Let's"
	line "get happening!"
	prompt

_PewterGymGuideAdviceText::
	text "A GYM is an arena!"
	line "One type, bending"
	cont "the field to"
	cont "fight harder!"

	para "Here it's the"
	line "ROCK-type. Tough"
	cont "on FIRE and lots"
	cont "of common types,"
	cont "but with severe"
	cont "weaknesses!"

	para "The arena hides"
	line "some of those"
	cont "weaknesses, but"
	cont "not all!"
	done

_PewterGymGuideFreeServiceText::
	text "It's a free"
	line "service! Let's"
	cont "get happening!"
	prompt

_PewterGymGuidePostBattleText::
	text_asm
	push bc ; preserve the text cursor (bc) - the callfar macro's `ld b,BANK` clobbers b, which would
	callfar ComputeExpGrowthThreshold ; shift the first line off the top of the box. true badge count
	pop bc ; -> wExpGrowthThreshold (XP-growth level)
	ld hl, .body
	ret
.body:
	text "Just as I thought!"
	line "You're #MON"
	cont "champ material!"

	para "A BADGE lets you"
	line "raise #MON to a"
	cont "higher level"
	cont "before they slow."

	para "Right now, that's"
	line "about L@"
	text_decimal wExpGrowthThreshold, 1, 2
	text "!"

	para "But that's not"
	line "what I called"
	cont "you over for!"
	prompt

_PewterGymGuideApexChipText::
	text "I want you"
	line "to have these!"
	prompt

_ReceivedApexChipsText::
	text "<PLAYER> received"
	line "2 APEX CHIPs!@"
	text_end

_ApexChipExplanationText::
	text_start

	para "The APEX CHIP is a"
	line "special microchip"
	cont "I developed."
	
	para "You install it"
	line "onto a #MON's"
	cont "# Ball."

	para "It simulates the"
	line "natural wild"
	cont "environment of"
	cont "a #MON inside"
	cont "its # Ball!"

	para "It makes #MON"
	line "happy,"
	para "and helps achieve"
	line "max potential!"

	para "Use them on your"
	line "best #MON!"

	para "For Rock-type"
	line "#MON, an APEX"
	cont "CHIP simulates"
	cont "a jagged craggy"
	cont "ridge with cave"
	cont "systems and steep"
	cont "mountain terrain."
	prompt

_AlreadyReceivedApexChipsText::
	text "Talk to me at"
	line "the next GYM!"
	para "If you defeat the"
	line "GYM LEADER,"
	para "I'll give you more"
	line "APEX CHIPs!"
	done
