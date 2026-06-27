_PokemonTowerCatacombsTorchedGraveText::
	text "Here Lies Koko the Exeggutor"
	para "Koko tragically perished in a house fire."
	; fall through
_PokemonTowerCatacombsWavedStaff::
	para "<PLAYER> waved the Channeler's Staff."
	prompt

_PokemonTowerCatacombsTorchedGraveText2::
	text "NEED@"
	text_dots 3
	text ""
	para "WATER@"
	text_dots 3
	text ""
	para "NOW!@"
	text_dots 3
	text ""
	done

_PokemonTowerCatacombsMonSpeaksText::
	text "Listen, child!"
	para "The <Pokemon>'s spirit speaks through me:"
	para "@"
	text_dots 3
	text ""
	done

_PokemonTowerCatacombsTorchedAfterText::
	text ""
	para "My Trainer didn't own a fire extinguisher!"
	para "Why were they so short sighted??"
	; fall through
_PokemonTowerCatacombsSpiritDissipatedText::
	para "@"
	text_dots 3
	text ""
	para "The spirit seems satisfied."
	para "It departed to the afterlife!"
	done

_PokemonTowerCatacombsChunkyGraveText::
	text "Here Lies Zappy the Raichu"
	para "Zappy had a sudden heart attack while sleeping.@"
	text_jump _PokemonTowerCatacombsWavedStaff

_PokemonTowerCatacombsChunkyGraveText2::
	text "I HUNGER@"
	text_dots 3
	text ""
	done

_PokemonTowerCatacombsChunkyAfterText::
	text ""
	para "I loved my Trainer very much!"
	para "She gave me lots of yummy food!"
	para "But I ate too much I think!"
	para "Whoops!"
	para "Do you have anything to eat?"
	para "No?"
	para "Oh well!"
	para "I'll wait for my Trainer in the great beyond!@"
	text_jump _PokemonTowerCatacombsSpiritDissipatedText

_PokemonTowerCatacombsPainlessGraveText::
	text "Here Lies Tuff the Wigglytuff"
	para "Tuff passed away due to blunt force trauma.@"
	text_jump _PokemonTowerCatacombsWavedStaff

_PokemonTowerCatacombsPainlessGraveText2::
	text "MUST@"
	text_dots 3
	text ""
	para "FIGHT@"
	text_dots 3
	text ""
	para "HARDER@"
	text_dots 3
	text ""
	done

_PokemonTowerCatacombsPainlessAfterText::
	text ""
	para "My Trainer made me fight so hard, I got permanent brain damage!"
	para "I just wanted to make him happy!"
	para "We should have known our limits!@"
	text_jump _PokemonTowerCatacombsSpiritDissipatedText

_PokemonTowerCatacombsIrradiatedGraveText::
	text "Here Lies Bob the Hitmonchan"
	para "Bob perished with their Trainer due to radiation sickness.@"
	text_jump _PokemonTowerCatacombsWavedStaff

_PokemonTowerCatacombsIrradiatedGraveText2::
	text "WHAT IS HAPPENING@"
	text_dots 3
	text ""
	cont "TO ME??@"
	text_dots 3
	text ""
	done

_PokemonTowerCatacombsIrradiatedAfterText::
	text ""
	para "My Trainer and I trespassed in a restricted cave!"
	para "We had no idea it was nuclear waste storage!"
	para "We shouldn't have gone there!@"
	text_jump _PokemonTowerCatacombsSpiritDissipatedText

_PokemonTowerCatacombsDarkChannelerText::
	text "Kekeke, are you getting a bit too spooked out?"
	para "Want to go back upstairs?"
	done

_PokemonTowerCatacombsDarkChannelerTextYes::
	text "Follow me, child!"
	done

_GhostMarowakAfterGiovanniText::
	text "<PLAYER>!"
	para "This is Ghost Marowak speaking through the Karate King."
	para "Thank you for defeating <TEAM><ROCKET>."
	para "It was my last wish to help get rid of them."
	para "If you could, please take me to the basement of <Pokemon> Tower."
	para "There I can finally be laid to rest."
	done

_ViridianGymHiker3WhatText::
	text "Huh??"
	para "What happened?"
	para "How'd I get over here?"
	done

_DarkChannelerGoDownText::
	text "Hmm? I sense a spirit among your <Pokemon>."
	para "Hoho! The mother Marowak?"
	para "She wishes to be laid to rest at her grave now, is that it?"
	para "It's downstairs in the catacombs."
	para "I'll let you go down for this one special case."
	para "Want to go?"
	done

_DarkChannelerCatacombsIntroText::
	text "Just follow the path to reach Marowak's grave!"
	para "But you'll probably encounter some restless spirits along the way."
	para "Here! Use my Channeler's Staff."
	para "It'll reveal and purify spirits better than a Silph Scope!"
	para "All because of the special hexes I put on it!"
	para "<PLAYER> borrowed Channeler's Staff!"
	done

_TorchedOnFire::
	text "@"
	text_ram wEnemyMonNick
	text_start
	line "is consumed by scorching flames!"
	prompt

_PainlessBattleInitText::
	text "Painless won't feel any pain from your attacks!"
	prompt

_IrradiatedBattleInitText::
	text "Radiation spreads everywhere!"
	prompt

_IrradiatedGrowsLarger::
	text "Irradiated twists and contorts,"
	para "its body morphing strangely!"
	prompt

_CatacombsCuboneText::
	text "Looks like Cubone is visiting its mother's grave."
	done

_CatacombsMarowakTouchedText::
	text "@"
	text_ram_namebuffer
	text " seems really happy!"
	done

_DarkChannelerReunionText::
	text "What a touching reunion!"
	para "But @"
	text_ram_namebuffer
	text " can't be laid to rest yet!"
	para "There's still a dark presence around here!"
	para "Once it's gone everything should be ready!"
	done

_PokemonTowerCatacombsTheMawGraveText::
	text "Here Lies a Notorious Golbat"
	para "This Golbat killed its own Trainer and continued on a violent spree."
	para "It is unknown whether it had a nickname.@"
	text_jump _PokemonTowerCatacombsWavedStaff

_PokemonTowerCatacombsTheMawGraveText2::
	text "YOU DIE NOW"
	done

_PokemonTowerB1FTheMawUsedHyperBeamText::
	text "The dark spirit used Hyper Beam!"
	done

_PokemonTowerB1FMarowakBlockedHyperBeamText::
	text "@"
	text_ram_namebuffer
	text " blocked the Hyper Beam from hitting Cubone!"
	para "But the beam was too powerful!"
	para "@"
	text_ram_namebuffer
	text " can't maintain its physical form anymore!"
	done

_PokemonTowerB1FMarowakBuffedCubone::
	text "@"
	text_ram_namebuffer
	text "'s spirit cradled Cubone, and transferred all of its power!"
	para "Cubone joined your party."
	prompt

_PokemonTowerB1FTheMawAttacked::
	text "It's time to fight!"
	para "The dark spirit attacked!"
	done

_CubonePoweredUp::
	text "@"
	text_ram wTrainerName
	text "'s spirit bestowed divine energy on Cubone!"
	prompt

_CuboneGainedUltimateProtection::
	text "Cubone gained ultimate protection!"
	prompt

_TheMawMeltedIntoShadows::
	text "The dark spirit faded into the shadows, never to return."
	done

_GhostMarowakOneLastTime::
	text "@"
	text_ram wTrainerName
	text " used the remnants of its energy to show itself one last time."
	prompt

_PokemonTowerGhostMarowakAfterText::
	text ""
	para "Thank you <PLAYER>!"
	para "I can finally rest in peace!"
	para "I love you Cubone!"
	para "But it's time for mother to go."
	para "Don't be sad."
	para "Enjoy life while you can<...>"
	para "Goodbye<...>"
	prompt

_PokemonTowerCatacombsDoneText::
	text "Well, thanks for doing my job for me!"
	para "The Dark Channeler took back her Channeler's Staff."
	para "Time to go back upstairs!"
	done

_PokemonTowerCatacombsGoBackDown::
	text "Want to go back downstairs?"
	done
