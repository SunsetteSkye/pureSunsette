_CeruleanGymMistyPreBattleText::
	text "Hi, you're a new"
	line "face!"

	para "Trainers who want"
	line "to turn pro have"
	cont "to have a policy"
	cont "about #MON!"

	para "What is your"
	line "approach when you"
	cont "catch #MON?"

	para "My policy is an"
	line "all-out offensive"
	cont "with water-type"
	cont "#MON!"
	done

_CeruleanGymMistyTM11ExplanationText::
	text "<TM>52 teaches"
	line "AQUA RING!"

	para "A veil of water"
	line "mends your team"
	cont "each turn!"
	done

_CeruleanGymMistyPostBattleText::
	text "Listen! GYM"
	line "LEADERS don't go"
	cont "all out on some"
	cont "newbie!"

	para "Don't go getting"
	line "full of hot air,"
	cont "boy<...>"

	para "<...>or I'll soak"
	line "you good!"
	done

_CeruleanGymMistyCascadeBadgeInfoText::
	text "The CASCADEBADGE"
	line "lets you use CUT"
	cont "any time!"

	para "You can CUT down"
	line "small bushes to"
	cont "open new paths!"

	para "It also doubles"
	line "the power of your"
	cont "POTIONs!"

	para "You can also have"
	line "my favorite <TM>!"
	done

_CeruleanGymMistyReceivedCascadeBadgeText::
	text "Wow!"
	line "You're too much!"

	para "Truth is, I held"
	line "back. A rookie"
	cont "isn't ready for"
	cont "my HYDRO PUMPs."

	para "Face me again as"
	line "a pro<...> I won't"
	cont "go easy twice."

	para "All right!"

	para "You can have the"
	line "CASCADEBADGE to"
	cont "show you beat me!@"
	text_end

_CeruleanGymBattleText1::
	text "I'm more than good"
	line "enough for you!"

	para "MISTY can wait!"
	done

_CeruleanGymEndBattleText1::
	text "You"
	line "overwhelmed me!"
	prompt

_CeruleanGymAfterBattleText1::
	text "You have to face"
	line "other trainers to"
	cont "find out how good"
	cont "you really are."
	done

_CeruleanGymBattleText2::
	text "Splash!"

	para "I'm first up!"
	line "Let's do it!"
	done

_CeruleanGymEndBattleText2::
	text "That"
	line "can't be!"
	prompt

_CeruleanGymAfterBattleText2::
	text "MISTY is going to"
	line "keep improving!"

	para "She won't lose to"
	line "someone like you!"
	done

_GymGuideChampInMakingText::
	text "Yo! Champ in"
	line "making!<PARA>@"
	text_end

_CeruleanGymGymGuideChampInMakingText::
	text "Here's my advice!"

	para "MISTY floods this"
	line "GYM into a pool!"

	para "WATER #MON on"
	line "BOTH sides swim"
	cont "faster here!"
	done

_CeruleanGymGymGuideBeatMistyText::
	text_asm
	push bc
	callfar ComputeExpGrowthThreshold
	pop bc
	ld hl, .body
	ret
.body:
	text "You beat MISTY!"
	line "What'd I tell ya?"

	para "You and me kid, we"
	line "make a good team!"

	para "That BADGE lets"
	line "you raise #MON"
	cont "up to L@"
	text_decimal wExpGrowthThreshold, 1, 2
	text "!"
	prompt

_GymGuideMoreApexChipText::
	text "I've got two more"
	line "APEX CHIPs, here!"
	prompt

_CeruleanGymGuideApexChipWaterText::
	text "For water #MON,"
	line "an APEX CHIP will"
	cont "evoke a beautiful"
	cont "ocean or river"
	cont "biome."
	prompt