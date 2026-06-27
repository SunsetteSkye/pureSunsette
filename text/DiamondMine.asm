_DiamondMineProspectorText::
	text "Hey kid!"
	para "There's gold in these hills!"
	para "Or even better, diamonds!"
	para "Want to help find some?"
	done

_DiamondMineProspectorHelp::
	text "I like the cut of your jib!"
	para "The Zubat around here are getting a bit ridiculous!"
	para "I have to wear earplugs to drown out their ear-piercing cries!"
	para "I want to spend my time digging,"
	para "not swatting at Zubats!"
	para "I need exactly 10 Repels!"
	done

_DiamondProspectorRepels::
	text "Did you pick up 10 Repels yet?"
	done

_DiamondProspectorGiveRepels::
	text "Give 10 Repels?"
	done

_DiamondProspectorUseRepels::
	text "Great, let's spray Repel everywhere!"
	prompt

_DiamondMineProspectorHelp2::
	text "The Zubat have gone away!"
	para "Perfect!"
	para "On to the next thing."
	para "My boombox ran out of batteries!"
	para "How about you give it a zap with an Electric <Pokemon> to start it up again?"
	para "Or a <Pokemon> with Thunder Wave."
	para "I need my fave digging music!"
	done

_DiamondMineProspectorHelp3::
	text "That's my jam! Oh yeah!"
	para "Now we're cooking!"
	para "Let's do this!"
	prompt

_DiamondMineProspectorRagh::
	text "RAAAAAAAGH!!!"
	done

_DiamondMineProspectorHelp4::
	text "We're hitting bedrock!"
	para "I need a <Pokemon> that can smash hard stone!"
	para "Do you have an Onix?"
	done

_DiamondMineBoomboxInitial::
	text "It's a portable boombox!"
	para "It doesn't seem to turn on."
	done

_DiamondMineBoomboxZap::
	text "Zap it with electricity?"
	done

_DiamondMineBoomboxZapProc::
	text_ram_namebuffer
	text " zapped the boombox!"
	done

_DiamondMineBoomboxZapProc2::
	text_ram_namebuffer
	text " zapped the boombox with Thunder Wave!"
	done

_DiamondMineBoomboxFunctional::
	text "The boombox is playing a rather bombastic tune."
	done

_DiamondMinePickedOnix::
	text "Okay @"
	text_ram_namebuffer
	text ", now the real hard work begins!"
	prompt

_DiamondMineDownHere::
	text "Hey, kid! Climb down!"
	para "You won't believe your eyes!"
	done

_DiamondMineWeeksOfWork::
	text "<PLAYER>, the prospector, and @"
	text_ram_namebuffer
	text " spent weeks digging through the hard bedrock."
	para "Soon only @"
	text_ram_namebuffer
	text " could make progress."
	para "Until<...>"
	prompt

_DiamondMineFinished::
	text "Diamonds!! Everywhere!!"
	para "It's all thanks to @"
	text_ram_namebuffer
	text "!"
	para "Looks like its rocky body got harder from all that digging!"
	para "It's as hard as diamond now!"
	done

_DiamondMineFinished2::
	text_start
	para "@"
	text_ram_namebuffer
	text " has been powered up!"
	done

_DiamondMineFinished3::
	text_start
	para "Its base HP increased! 55→80"
	para "Its base Attack increased! 25→85"
	para "It'll also take less damage from Water, Ice, and Grass attacks!"
	done

_DiamondMineEndText::
	text "Whoo boy, kid!"
	para "These diamonds will take a while to cart out!"
	para "I was down on my luck and you helped me out!"
	para "Come say hi at my house in Celadon City sometime!"
	done

_DiamondMineMoreOnix::
	text "Or did you want me to train with another Onix?"
	done

_DiamondMineMoreOnix2::
	text "I'd love to! Here we go!"
	prompt

_DiamondMineOnixTrainDone::
	text "That was some intense digging!"
	done
