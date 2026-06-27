_CeruleanGymMistyPreBattleText::
	text "Hi, you're a new face!"
	para "Trainers who want to turn pro have to have a policy about <Pokemon>!"
	para "What is your approach when you catch <Pokemon>?"
	para "My policy is an all-out offensive with Water-type <Pokemon>!"
	done

_CeruleanGymMistyTM11ExplanationText::
	text "<TM>52 teaches Aqua Ring!"
	para "A veil of water mends your team each turn!"
	done

_CeruleanGymMistyPostBattleText::
	text "Listen! Gym Leaders don't go all out on some newbie!"
	para "Don't go getting full of hot air, boy<...>"
	para "<...>or I'll soak you good!"
	done

_CeruleanGymMistyCascadeBadgeInfoText::
	text "The Cascade Badge lets you use Cut any time!"
	para "You can Cut down small bushes to open new paths!"
	para "It also doubles the power of your Potions!"
	para "You can also have my favorite <TM>!"
	done

_CeruleanGymMistyReceivedCascadeBadgeText::
	text "Wow! You're too much!"
	para "Truth is, I held back. A rookie isn't ready for my Hydro Pumps."
	para "Face me again as a pro<...> I won't go easy twice."
	para "All right!"
	para "You can have the Cascade Badge to show you beat me!@"
	text_end

_CeruleanGymBattleText1::
	text "I'm more than good enough for you!"
	para "Misty can wait!"
	done

_CeruleanGymEndBattleText1::
	text "You overwhelmed me!"
	prompt

_CeruleanGymAfterBattleText1::
	text "You have to face other Trainers to find out how good you really are."
	done

_CeruleanGymBattleText2::
	text "Splash!"
	para "I'm first up! Let's do it!"
	done

_CeruleanGymEndBattleText2::
	text "That can't be!"
	prompt

_CeruleanGymAfterBattleText2::
	text "Misty is going to keep improving!"
	para "She won't lose to someone like you!"
	done

_GymGuideChampInMakingText::
	text "Yo! Champ in making!<PARA>@"
	text_end

_CeruleanGymGymGuideChampInMakingText::
	text "Here's my advice!"
	para "Misty floods this Gym into a pool!"
	para "Water <Pokemon> on both sides swim faster here!"
	done

_CeruleanGymGymGuideBeatMistyText::
	text_asm
	push bc
	callfar ComputeExpGrowthThreshold
	pop bc
	ld hl, .body
	ret
.body:
	text "You beat Misty! What'd I tell ya?"
	para "You and me kid, we make a good team!"
	para "That Badge lets you raise <Pokemon> up to L@"
	text_decimal wExpGrowthThreshold, 1, 2
	text "!"
	prompt

_GymGuideMoreApexChipText::
	text "I've got two more Apex Chips, here!"
	prompt

_CeruleanGymGuideApexChipWaterText::
	text "For Water <Pokemon>, an Apex Chip will evoke a beautiful ocean or river biome."
	prompt
