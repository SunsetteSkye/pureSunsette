_CeruleanBadgeHouseMiddleAgedManText::
	text "<Pokemon> Badges are owned only by skilled Trainers."
	para "I see you have at least one."
	para "Those Badges have amazing secrets!"
	prompt

_CeruleanBadgeHouseNowThenText::
	text "Now then<...>"
	done

_CeruleanBadgeHouseMiddleAgedManWhichBadgeText::
	text "<PARA>Which of the 8 Badges should I describe?"
	done

_CeruleanBadgeHouseAnyMoreText::
	text "<PARA>Need info on any other Badges?"
	done

_CeruleanBadgeHouseMiddleAgedManVisitAnyTimeText::
	text "Come visit me any time you wish."
	done

_CeruleanBadgeHouseBoulderBadgeText::
	text "The Attack@"
	text_jump _CeruleanBadgeHouseIncreasesALittleBit

_CeruleanBadgeHouseCascadeBadgeText::
	text "Doubles the power of Potions!"
	para "Lets you use Cut out of battle."
	prompt

_CeruleanBadgeHouseThunderBadgeText::
	text "The Speed@"
	text_jump _CeruleanBadgeHouseIncreasesALittleBit

_CeruleanBadgeHouseRainbowBadgeText::
	text "Greatly boosts vitamin effects!"
	para "Lets you use Strength out of battle."
	prompt

_CeruleanBadgeHouseSoulBadgeText::
	text "The Defense@"
	text_jump _CeruleanBadgeHouseIncreasesALittleBit

_CeruleanBadgeHouseMarshBadgeText::
	text "Lets <Pokemon> use Teleport, like Fly, even indoors or on the water!"
	prompt

_CeruleanBadgeHouseVolcanoBadgeText::
	text "Your <Pokemon>'s Special abilities increase a bit."
	prompt

_CeruleanBadgeHouseEarthBadgeText::
	text "Lets <Pokemon> use their full Speed to land critical hits!"
	para "But I don't think it works on legendary <Pokemon>."
	prompt

_CeruleanBadgeHouseUpToLevel::
	db "<Pokemon> up to L@"
	text_decimal w2CharStringBuffer, 1, 2
	text "<LINE>train up nicely!"
	para "It's a proud sign of your progress!"
	done

_CeruleanBadgeHouseIncreasesALittleBit::
	text "of all <Pokemon> increases a little bit."
_CeruleanBadgeHouseAlsoLetsYouUseHM::
	para "Also lets you use @"
	text_ram wNameBuffer
	text " outside of battle."
	prompt

_CeruleanBadgeHouseLetsYouUseHM::
	text "Lets you use @"
	text_ram wNameBuffer
	text " outside of battle."
	prompt

_CeruleanBadgeHouseGrowthLine::
	text "Combined with your other Badges, <Pokemon> up to L"
	text_decimal wExpGrowthThreshold, 1, 2
	text "<LINE>grow more efficiently!"
	prompt

_CeruleanBadgeHouseCouldRaiseText::
	text "With that Badge, you could easily raise <Pokemon> up to L@"
	text_decimal wExpGrowthThreshold, 1, 2
	text "!"
	prompt

_GarbageCrumpledUpPaper::
	text "What's in the garbage bin?"
	para "A crumpled up sheet of paper."
	para "What's on it?@"
	text_end

_CeruleanBadgeHouseGarbageText::
	text "<PARA>Ohoho."
	para "Some drawings of Badges."
	para "Is he a designer?"
	done

_CeruleanBadgeHouseLeftPaperText::
	text "If you have a Movedex, you can record learnsets for <Pokemon> in your <poke>dex!"
	para "Read books or talk to experts on <Pokemon> to register their learnsets!"
	done

_CeruleanBadgeHouseCenterLeftPaperText::
	text "When you register a learnset for a specific <Pokemon>,"
	para "you will auto-register the learnsets of its whole evolution family too!"
	done

_CeruleanBadgeHouseCenterRightPaperText::
	text "Learnset data will only show names of moves you've seen used before."
	para "If you haven't seen the move,"
	para "you can at least see what level the <Pokemon> will learn a new move!"
	done

_CeruleanBadgeHouseRightPaperText::
	text "If you train your <Pokemon> to a high enough level,"
	para "you'll master using it!"
	para "This will unlock its learnset!"
	para "If you don't already have it."
	done
