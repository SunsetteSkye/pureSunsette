_PewterGymBrockPostBattleAdviceText::
	text "<...>"
	para "Rock On is how rock endures."
	para "Raise your guard, steady your aim, then turn what struck you aside."
	para "(<...>He's still staring. Is he blushing?)"
	done

_PewterGymBrockWaitTakeThisText::
	text "Wait! Take this with you!"
	done

_TM34ExplanationText::
	text_start

	para "A <TM> contains a technique that can be taught to <Pokemon>!"
	para "A <TM> is good only once! So when you use one to teach a new technique, pick the <Pokemon> carefully!"
	para "@"
	text_ram_stringbuffer
	text " is Rock On!"
	para "It makes <Pokemon> steady as a rock."
	para "In dire straits, it unleashes their hardcore defensive power."
	para "It works different for <Pokemon> with a Special type, like your starter."
	para "I'm no good at explanations..."
	para "The headmaster at the Viridian Trainers' School could help if you're confused."
	done

_GenericNoRoomText::
_PewterGymTM34NoRoomText::
	text "You don't have room for this!"
	done

_PewterGymBrockReceivedBoulderBadgeText::
	text "I took you for granted."
	para "As proof of your victory, here's the Boulder Badge!"
	para "<PLAYER> received the Boulder Badge!@"
	text_end

_PewterGymBrockBoulderBadgeInfoText::
	text_start

	para "That's an official <Pokemon> League Badge!"
	para "Its bearer's <Pokemon> grow faster, and hit a bit harder!"
	para "The technique Flash can now be used any time!"
	prompt

_PewterGymCooltrainerMBattleText::
	text "Stop right there, kid!"
	para "You're still light years from facing Brock!"
	done

_PewterGymCooltrainerMEndBattleText::
	text "Darn!"
	para "Light years isn't time! It measures distance!"
	prompt

_PewterGymCooltrainerMAfterBattleText::
	text "You're pretty hot, but not as hot as Brock!"
	done

_PewterGymGuidePreAdviceText::
	text "Hiya! I can tell you have what it takes to become a <Pokemon> champ!"
	para "I'm no Trainer, but I can tell you how to win!"
	para "Let me take you to the top!"
	done

_PewterGymGuideBeginAdviceText::
	text "All right! Let's get happening!"
	prompt

_PewterGymGuideAdviceText::
	text "A Gym is an arena! One type, bending the field to fight harder!"
	para "Here it's the Rock-type. Tough on Fire and lots of common types, but with severe weaknesses!"
	para "The arena hides some of those weaknesses, but not all!"
	done

_PewterGymGuideFreeServiceText::
	text "It's a free service! Let's get happening!"
	prompt

_PewterGymGuidePostBattleText::
	text_asm
	push bc ; preserve the text cursor (bc) - the callfar macro's `ld b,BANK` clobbers b, which would
	callfar ComputeExpGrowthThreshold ; shift the first line off the top of the box. true badge count
	pop bc ; -> wExpGrowthThreshold (XP-growth level)
	ld hl, .body
	ret
.body:
	text "Just as I thought! You're <Pokemon> champ material!"
	para "A Badge lets you raise <Pokemon> to a higher level before they slow."
	para "Right now, that's about L@"
	text_decimal wExpGrowthThreshold, 1, 2
	text "!"
	para "Keep climbing, champ in the making!"
	done

_PewterGymGuideApexChipText::
	text "I want you to have these!"
	prompt

_ReceivedApexChipsText::
	text "<PLAYER> received 2 Apex Chips!@"
	text_end

_ApexChipExplanationText::
	text_start

	para "The Apex Chip is a special microchip I developed."
	para "You install it onto a <Pokemon>'s <poke> Ball."
	para "It simulates the natural wild environment of a <Pokemon> inside its <poke> Ball!"
	para "It makes <Pokemon> happy, and helps achieve max potential!"
	para "Use them on your best <Pokemon>!"
	para "For Rock-type <Pokemon>, an Apex Chip simulates a jagged craggy ridge with cave systems and steep mountain terrain."
	prompt

_AlreadyReceivedApexChipsText::
	text "Talk to me at the next Gym!"
	para "If you defeat the Gym Leader,"
	para "I'll give you more Apex Chips!"
	done
