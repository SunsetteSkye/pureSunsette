_CinnabarVolcanoBombRocksText::
	text "These rocks are blocking the lava from flowing out."
	para "Smash them with a <Pokemon>?"
	done

_CinnabarVolcanoBombRocksTextDoneJump::
	para "@"
_CinnabarVolcanoBombRocksTextDone::
	text "Lava's flowing out of the volcano."
	done

_CinnabarVolcanoProspectorGreetingNotMetText::
	text "Hey kid!"
	para "This place is dangerous!"
	para "What are you doing here?"
	para "Huh! You've got strong <Pokemon>!"
	prompt

_CinnabarVolcanoProspectorGreetingMetText::
	text "Prospector: Hey kid!"
	para "Imagine meeting you again here!"
	para "You came at a great time!"
	para "You've got strong <Pokemon>!"
	prompt

_CinnabarVolcanoProspectorStrongMonsText::
	text "It's too hot in Cinnabar Volcano for the average explorer."
	para "Maybe you can help us out in here!"
	para "But first you'll need to put on one of these<...>"
	prompt

_CinnabarVolcanoProspectorLavaSuitText::
	text "It's a Lava Suit!"
	para "It'll protect you from the heat!"
	para "It's like an oven in there!"
	para "Here try this one on!"
	prompt

_CinnabarVolcanoProspectorLetsGo::
	text "Lookin' good!"
	para "Alright, follow me!"
	done

_CinnabarVolcanoProspectorHeresProblem::
	text "Alright kid, here's the problem<...>"
	prompt

_CinnabarVolcanoProspectorLavaExplain::
	text "There's too much lava here in the main lava cone!"
	para "It usually flows out underwater."
	para "If we don't drain out all the lava,"
	para "the volcano will erupt soon!"
	para "The lava must be clogged up below."
	para "You've got to clear those blockages!"
	prompt

_CinnabarVolcanoProspectorBlowRocks::
	text "Rocks that look like this one create blockages!"
	para "Find the blockages and blow them up,"
	para "smash them, melt them down<...>"
	para "Just do anything to destroy them!"
	prompt

_CinnabarVolcanoGiveDrill::
	text "You'll need to dig down deeper into the volcano!"
	para "There isn't any way down yet, so take a Drill!"
	prompt

_CinnabarVolcanoGotDrill::
	text "<PLAYER> got a Power Drill!"
	done

_CinnabarVolcanoDrill::
	text "Press SELECT to use your Drill."
	para "You can drill a hole down where you see cracks!"
	para "But it'll take a lot of fuel to dig down."
	para "If you run out, just pop 3 Rubies into the Drill!"
	para "You should be able to find lots of them here!"
	prompt

_CinnabarVolcanoFriend::
	text "This guy with his Arcanine'll clear the west side."
	prompt

_CinnabarVolcanoYouClearEast::
	text "You clear the east side!"
	para "Oh and one last thing."
	para "It's too hot for most <Pokemon>!"
	para "Stick to Fire, Rock and Ground-types."
	para "They're the only ones who can take this heat!"
	prompt

_ExplodeRocksExplosionText::
	text_ram_namebuffer
	text " used Explosion to blow up rock!"
	done

_ExplodeRocksSelfdestructText::
	text_ram_namebuffer
	text " used Selfdestruct to blow up rock!"
	done

_ShatteredRocksSkullBashText::
	text_ram_namebuffer
	text " smashed the rocks with Meteor Drive!"
	done

_ShatteredRocksText::
	text_ram_namebuffer
	text " smashed the rocks with a powerful blow!"
	done

_MeltedRocksText::
	text_ram_namebuffer
	text " melted the rocks with superheated fire!"
	done

_RocksGoneText::
	text "The lava flow was unclogged!"
	done

_WhereRubiesText::
	text "Time to find some Rubies for the Drill!"
	para "They should be on this floor!"
	done

_FoundRubyText::
	text "<PLAYER> found a Ruby!"
	done

_RubyTwoMoreToGoText::
	text "Two@"
	text_jump _MoreToGoText

_MoreToGoText:
	text_end
	text " more to go!"
	done

_RubyOneMoreToGoText::
	text "One@"
	text_jump _MoreToGoText

_RubyGotAllOfThemText::
	text "<PLAYER> inserted the 3 Rubies into the Drill."
	done

_RubyGoodToGo::
	text "The Drill entered power mode!"
	para "Time to dig down to the next floor!"
	done

_ItsRhydon::
	text "It's a Rhydon."
	para "It looks bored."
	prompt

_RhydonGetOnBack::
	text "Jump on its back?"
	done

_RhydonGotOnBack::
	text "Here we go!"
	done

_GotRocksalts::
	text "<PLAYER> found Rock Salts!"
	done

_GotLimestone::
	text "<PLAYER> found Limestone!"
	done

_ItsGraveler::
	text "It's a Graveler."
	para "It's enjoying a massage from the flowing lava."
	para "It looks a bit hungry."
	done

_GiveGravelerRockSalts::
	text "Give it Rock Salts to eat?"
	done

_GravelerMunching::
	text "The Graveler is munching on the Rock Salts."
	para "Looks satisfied!"
	done

_ItsSickRhydon::
	text "It's another Rhydon."
	para "This one seems to have an upset stomach."
	done

_GiveRhydonLimestone::
	text "Give it some crushed Limestone to cure its indigestion?"
	done

_RhydonGrinded::
	text "<PLAYER> ground the Limestone to a fine powder with the Drill."
	done

_GotAntacidText::
	text "The Limestone became Antacid!"
	done

_GaveRhydonAntacid::
	text "The sick Rhydon swallowed the Antacid."
	prompt

_RhydonResting::
	text "The sick Rhydon will feel better, but needs rest!"
	done

_MagmarBoss::
	text "A big Magmar is blocking the way."
	done

_MagmarFight::
	text "It looks very aggressive."
	para "Fight it?"
	done

_VolcanoBattleBurnText::
	text "The volcano's too hot for @"
	text_ram_cont wBattleMonNick
	text "!"
	prompt


_LetsDoThis::
	text "Let's do this!"
	done

_MagmarBattleInit::
	text "A veil of magma covers @"
	text_ram wEnemyMonNick
	text "!"
	para "It powered up!"
	prompt

_EnemyMonWasDefeatedText::
	text "Enemy @"
	text_ram wEnemyMonNick
	text_start
	line "was defeated!"
	prompt

_MagmarDefeat::
	text "Magmar conceded defeat and moved to let you pass."
	done

_UhohVolcano::
	text "Uh oh. The lava is about to burst through the whole eastern wall!"
	para "Gotta get behind cover quick!"
	done

_VolcanoBlockagesGone::
	text "Wow! That should drain any excess lava!"
	para "<PLAYER> cleared all blockages!"
	done

_VolcanoGoBackMainFloor::
	text_start
	para "Let's see how they did back up at the top."
	done

_VolcanoBlaineJoinUs::
	text "Nice of you to join us!"
	done

_VolcanoProspectorDone::
	text "Whoa!"
	para "What did you do?"
	para "The lava is draining out like crazy!!"
	para "Look!"
	prompt

_VolcanoProspectorDone2::
	text "Well, that should stop an eruption!"
	para "Let's get out of here, kid!"
	para "I'm sweating like an Oddish at a salad bar!"
	done

_VolcanoProspectorPhew::
	text "Phew, we can finally get out of these suits!"
	prompt

_VolcanoProspectorRightBlaine::
	text "Glad I got them!"
	para "They came in handy!"
	para "Even though you and Blaine did all the work!"
	prompt

_VolcanoBlaineMessage1::
	text "Blaine: Well that should keep the eruption at bay."
	para "That heat is something else!"
	para "Thought I might catch a glimpse of a fiery bird <Pokemon> I saw many years ago."
	para "Oh well!"
	para "Maybe I'll see it again someday!"
	prompt

_VolcanoBlaineMessageNotDone::
	text "<PLAYER> was your name, correct?"
	para "Great work!"
	para "I hope you come to challenge me at Cinnabar Gym!"
	para "That is, if you can get in!"
	para "Hah! Until next time!"
	done

_VolcanoBlaineMessageGymDone::
	text "We meet again, <PLAYER>!"
	para "This young buck was one of the two Trainers who trounced me at the Gym recently!"
	para "Keep at it, boy!"
	para "Hah! Until next time!"
	done

_VolcanoProspectorAfterMessage::
	text "I'll be here for a while, doing what I do best<...>"
	para "prospecting!"
	para "You saw all those Rubies!"
	para "You can use that Lava Suit as much as you like, kid!"
	done

_VolcanoAvoidWestSide::
	text "Someone's taking care of the west side already."
	para "Gotta clear the blockages on the other side!"
	done

_VolcanoGetToIt::
	text "I'll keep an eye on the amount of lava up here."
	para "I'd join you, but I don't have <Pokemon> to bring with me!"
	prompt

_VolcanoNeedSomeInfo::
	text "Hmm<...>do you need more info?"
	done

_VolcanoGetToIt2::
	text "Get to it, kid!"
	done

_FailedDrillFloorText::
	text "The Drill doesn't have enough fuel!"
	para "Find 3 Rubies to fuel it up!"
	done

_CinnabarVolcanoFloor2WarpTilesText::
	text "Whoa! What are those?"
	para "Looks like the lava flow opened up the ground over there!"
	done

_CinnabarVolcanoWestMagmar1Text::
	text "Many Magmar are relaxing in the lava flow."
	done

_CinnabarVolcanoWestMagmar1QuestionText::
	text "It looks like there's room for one more!"
	prompt

_CinnabarVolcanoWestMagmar2Text::
	text "Magmar: Fwoo?"
	done

_CinnabarVolcanoWestMagmar3Text::
	text "Magmar: Fshaa!"
	done

_CinnabarVolcanoWestLavaFlowText::
	text "This is where Blaine cleared a lava blockage.@"
	text_jump _CinnabarVolcanoBombRocksTextDoneJump

_CinnabarVolcanoWestMagmarTransformText1::
	text "@"
	text_ram_namebuffer
	text " looks excited for a lava bath!"
	done

_CinnabarVolcanoWestMagmarTransformText2::
	text "@"
	text_ram_namebuffer
	text " did a cannonball into the lava pool!"
	done

_CinnabarVolcanoWestMagmarTransformText3::
	text "Volcanic power radiated through @"
	text_ram_namebuffer
	text "!"
	done

_MagmarEventAlready::
	text "It's already filled with the burning heat of the volcano."
	done

_CinnabarVolcanoWestMagmarTransformText4::
	text "<PARA>It became so scorchingly hot, all water near it will vaporize!"
	para "@"
	text_ram_namebuffer
	text " became immune to Water, Fire, and Electric moves!"
	para "The tectonic power of the volcano flows through it!"
	para "Ground-type moves will get bonus damage!"
	done

_Route21CinnabarVolcanoSignText::
	text "Cinnabar Volcano"
	para "Danger!"
	para "Do Not Enter Without Heat-Resistant Kit!"
	done
