_MtMoonB2FDomeFossilYouWantText::
	text "You want the Dome Fossil?"
	done

_MtMoonB2FHelixFossilYouWantText::
	text "You want the Helix Fossil?"
	done

_MtMoonB2FReceivedFossilText::
	text "<PLAYER> got the @"
	text_ram_stringbuffer
	text "!@"
	text_end

_MtMoonB2FYouHaveNoRoomText::
	text "Look, you've got no room for this.@"
	text_end

_MtMoonB2FSuperNerdTheyreBothMineText::
	text "Hey, hands off!"
	para "I found these fossils, and they're a pair!"
	done

_MtMoonB2FSuperNerdOkIllShareText::
	text "OK! I'll share!"
	prompt

_MtMoonB2fSuperNerdEachTakeOneText::
	text "We'll each take one! No being greedy!"
	done

_MtMoonB2FSuperNerdTheresAPokemonLabText::
	text "Far away, on Cinnabar Island, there's a <Pokemon> Lab."
	para "They do research on regenerating fossils."
	prompt

_MtMoon3TextSuperNerdGiveFossil::
	text "I plan on taking my fossil there!"
	para "Tell you what:"
	para "If you give me your fossil too, I can bring it to the lab and see if it can be regenerated!"
	para "How about it?@"
	text_end

_MtMoon3TextSuperNerdNoFossil::
	text "Looks like you don't have your fossil in your bag. Go get it!"
	done

_MtMoon3TextSuperNerdGaveHelix::
	text "<PLAYER> gave the Helix Fossil to the Super Neet!"
	done

_MtMoon3TextSuperNerdGaveDome::
	text "<PLAYER> gave the Dome Fossil to the Super Neet!"
	done

_MtMoon3TextSuperNerdGaveFossil::
	text "Eee, perfect! I'll revive them as a pair!"
	prompt

_MtMoon3TextSuperNerdKeptFossil::
	text "No worries!"
	para "It's your fossil after all."
	done

_MtMoon3TextSuperNerdGaveFossilEnd::
	text "Meet me in Saffron City."
	para "I'll tell you the results!"
	done

_MtMoon3TextSuperNerdLookingForMoreFossils::
	text "Hey! I'm hunting for more fossils."
	para "No luck yet... oh well."
	para "I live for the hunt!"
	done

_MtMoonB2FSuperNerdThenThisIsMineText::
	text "All right. Then this is mine!@"
	text_end

_MtMoonB2FRocket1BattleText::
	text "<TEAM><ROCKET> will find the fossils, revive and sell them for cash!"
	done

_MtMoonB2FRocket1EndBattleText::
	text "Urgh! Now I'm mad!"
	prompt

_MtMoonB2FRocket1AfterBattleText::
	text "You made me mad! <TEAM><ROCKET> will blacklist you!"
	done

_MtMoonB2FRocket2BattleText::
	text "We, <TEAM><ROCKET>, are <Pokemon> gangsters!"
	done

_MtMoonB2FRocket2EndBattleText::
	text "I blew it!"
	prompt

_MtMoonB2FRocket2AfterBattleText::
	text "Darn it all! My associates won't stand for this!"
	done

_MtMoonB2FRocket3BattleText::
	text "We're pulling a big job here! Get lost, kid!"
	done

_MtMoonB2FRocket3EndBattleText::
	text "So, you are good."
	prompt

_MtMoonB2FRocket3AfterBattleText::
	text "If you find a fossil, give it to me and scram!"
	done

_MtMoonB2FRocket4BattleText::
	text "Little kids should leave grown-ups alone!"
	done

_MtMoonB2FRocket4EndBattleText::
	text "I'm steamed!"
	prompt

_MtMoonB2FRocket4AfterBattleText::
	text "<Pokemon> lived here long before people came."
	done

_MtMoonB2fRocket4AfterBattleLearnsetText::
	text "So kid, how'd you like my @"
	text_ram_namebuffer
	text "?"
	para "Pretty scary, huh?"
	para "@"
	text_end
