_ErikSaraInSafariZoneText::
	text "Oh! She's already in the Safari Zone?"
	para "Guess I'll head over there!"
	para "Thanks!"
	done

_SaraErikOutsideText::
	text "Oh! He's waiting outside the Safari Zone?"
	para "When you're done, could you ask him to come in here?"
	para "I already paid for entry, so we can meet up here."
	para "Thanks!"
	done

_WereMarineBiologists:
	para "We're marine biologists!"
	done

_SaraReunitedText::
	text "Sara: Thanks for finding my boyfriend!@"
	text_call _WereMarineBiologists
	para "We live out on Route 19!"
	para "You're welcome to visit anytime!"
	prompt

_SaraOkayRicky::
	text "Come on, Ricky! Time to start our research!"
	done

_ErikReunitedText::
	text "Erik: Thanks for helping me find my girlfriend!@"
	text_call _WereMarineBiologists
	para "Did you know there are rare Dratini in the waters of the Safari Zone?"
	para "Fishers sometimes catch them."
	done

_ShouldntLookNoOneHome::
	text "No one's home, so it's not right to poke about."
	done

_PeriscopeInitialText::
	text "Looks like some sort of periscope piped through the glass floor."
	para "Does it look underwater?"
	para "Seems to be turned off currently."
	done

_ErikSarasHouseNoteNotHomeText::
	text "Note: We're off studying Dratini sightings in the Safari Zone!"
	para "-Sara and Erik"
	done

_ErikSarasHouseNoteHomeText::
	text "Results: Dratini seems to enter the fresh water in the Safari Zone by swimming upstream from the northern Vermilion Seaway."
	para "Perhaps this is where juveniles go for safety?"
	done

_ErikSarasHousePhoneText::
	text "A bright blue rotary phone!"
	para "Marine Sighting Hotline is written on it."
	done

_ErikSarasHouseDragonairEmailText::
	text "<PARA>Dear Sara and Erik,"
	para "I heard from Misty that she's seen Dragonair while training at the Seafoam Islands."
	para "Maybe you should take a look?"
	para "-Lorelei"
	done

_ErikSarasHouseLeftBookText::
	text "Secrets of the Sea@"
	text_end
_ErikSarasHouseLeftBookText2::
	text "<PARA>Coral reefs have incredibly high biodiversity."
	para "It's theorized that thousands of new species of <Pokemon> are still undiscovered in these habitats."
	done

_ErikSarasHouseCenterBookText::
	text "Abyssal Sea Life@"
	text_end
_ErikSarasHouseCenterBookText2::
	text "<PARA>Deep Sea Volcanic Vents"
	para "A miraculous habitat for life in the depths of the ocean."
	para "Small colonies of <Pokemon> bask in the volcanic heat."
	done

_ErikSarasHouseRightBookText::
	text "Ancient Oceans@"
	text_end
_ErikSarasHouseRightBookText2::
	text "<PARA>Millions of years in the past,"
	para "primitive sea organisms named Omanyte / Kabuto reigned over the primordial froth."
	para "Both fed on micro-organisms and vegetation on the sea floor."
	done

_ErikSarasHouseNorthGarbageText::
	text "<PARA>Installing Your Seaglass Flooring"
	para "Quick start guide!"
	done

_ErikSarasHouseSouthGarbageText::
	text "A magazine is in the garbage."
	para "The front page is outrageous!"
	para "Has Erika Found Love?! Scandalous!"
	para "<...>"
	para "Top 5 Outfits Inspired by Water <Pokemon>!"
	para "<...>"
	para "How to Make Your Hair Gorgeous! We Asked Sabrina!"
	para "<...>"
	para "Wow! Lt. Surge Caught Training at the Beach! Steamy!"
	done

_ErikSarasHouseBookText::
	text "Migratory Patterns of Marine <Pokemon>"
	para "They're reading this!"
	done

_ErikSarasHousePeriscopeExplanation::
	text "Erik: Those are sea periscopes."
	para "They're attached to long video cables that run underwater."
	para "I turned them on earlier!"
	para "Have a look!"
	para "Maybe you'll see something cool!"
	done

_PeriscopeLookedThroughThe:
	db "Looked into the"
	done

_ErikSarasHouseLeftPeriscopeIntro::
	text "@"
	text_call _PeriscopeLookedThroughThe
	line "Coral Reef Camera."
	para "<...>"
	prompt

_ErikSarasHouseRightPeriscopeIntro::
	text "@"
	text_call _PeriscopeLookedThroughThe
	line "Deep Sea Camera."
	para "<...>"
	prompt

_DeepSeaCameraMagikarp::
	text "A Magikarp with a Shellder clamped onto it is slowly sinking down."
	para "It doesn't seem to mind."
	done

_DeepSeaCameraTentacruel::
	text "A Tentacruel is floating in front of the viewfinder menacingly."
	para "It's emitting a sinister red glow."
	done

_DeepSeaCameraGyarados::
	text "Whoa! A Gyarados is chomping on a Cloyster's shell!"
	para "Such ferocity!"
	done

_DeepSeaCameraBubbles::
	text "Nothing but big bubbles!"
	done

_CoralReefCameraStaryu::
	text "A Staryu is hiding stealthily in the sand near coral that looks a bit like a brain."
	done

_CoralReefCameraHorsea::
	text "Many Horsea are weaving in and out of a distant kelp forest!"
	done

_CoralReefCameraKrabby::
	text "A Krabby's picking bits of algae off of a round rock."
	para "It's nibbling on the algae happily."
	done

_CoralReefCameraGoldeen::
	text "A few Goldeen are swirling around gracefully."
	para "Whoa! They quickly scattered!"
	para "A Vaporeon popped up out of nowhere!"
	done

_SaraHouseIntroText::
	text "Sara: Look who it is! Come on in!"
	para "This is our little slice of paradise!"
	done

_ErikHouseIntroText::
	text "Erik: Welcome to our humble abode!"
	para "Stay awhile if you like!"
	done

_SaraInterestedQuestion::
	text "Sara: Interested in our research?"
	done

_ErikInterestedQuestion::
	text "Erik: Wanna hear what we're up to?"
	done

_SaraHouseFirstStepText::
	text "Sara: We're looking into sightings of Dragonair at the nearby Seafoam Islands."
	para "Have you ever been there?"
	done

_SaraSeafoamExplanationText::
	text "Sara: The Seafoam Islands are found west of here, on Route 20."
	para "They're a system of caves."
	para "Deeper down, the tide flows into the caves."
	para "It's a fascinating marine habitat!"
	prompt

_ErikDragonairResearch::
	text "Erik: Recently the lower levels of Seafoam Islands have been cooled by some unknown phenomenon."
	para "They're very near freezing cold!"
	para "But the most intriguing aspect we just found<...>"
	para "For some reason many Dragonair are now gathering down there."
	para "Sara: Many are at unusually high levels!"
	para "At levels they usually would've evolved!"
	para "We're trying to figure out why they aren't evolving!"
	prompt

_ErikWantsDragonairText::
	text "Erik: Maybe if we had a high level Dragonair to take to the Islands<...>"
	para "Sara: Sometimes I regret our pledge not to catch any wild <Pokemon><...>"
	prompt

_ShowedDragonairLowLevelText::
	text "Erik: A Dragonair! <...>But it's a bit too low level."
	para "Try to get it to at least level 45."
	done

_ShowedDragonairText::
	text "Sara: Perfect!"
	para "We can bring your Dragonair to the Seafoam Islands!!"
	para "But a bit of a warning<...>"
	para "It might not evolve anymore if it goes there."
	para "Are you ready to go with us?"
	done

_ShowedDragonairLetsDoThis::
	text "Alright!"
	para "Ricky!"
	para "Get the scuba gear!"
	para "Let's do this!"
	done

_SeafoamIslandsB4FDragonairEventStartText::
	text "Sara: Okay! Here's the plan!"
	para "We'll dive down with @"
	text_ram_namebuffer
	text_start
	cont "into the water and see what happens!"
	para "Ready Ricky?"
	para "Ready <PLAYER>?"
	para "Erik: Time to wear your scuba diving suit, <PLAYER>!"
	prompt

_SeafoamIslandsB4FDragonairEventStartText2::
	text "Let's dive down!"
	prompt

_DragonairEventDragonairText1::
	text "Dragonair: Fwee?"
	done

_DragonairEventDragonairText2::
	text "Dragonair: Draogh!"
	done

_DragonairEventErikText::
	text "Erik: Wow! Look at all these Dragonair!"
	para "They seem to be drawn to the big ice crystals."
	done

_DragonairEventSaraText::
	text "Sara: Fascinating!"
	para "Are the Dragonair trying to build resistance to the icy temperatures?"
	done

_DragonairEventCloysterText::
	text "Looks like this Cloyster is very territorial."
	done

_DragonairEventCloysterText2::
	text "It won't let you pass without a fight."
	para "Fight it with your Dragonair?"
	done

_DragonairEventLowLevelText::
	text "It's too low level."
	done

_DragonairEventNoPartyMenuText::
	text "No! This is @"
	text_ram wBattleMonNick
	text "'s fight!"
	prompt

_DragonairEventCloysterBeatenText::
	text "The Cloyster acknowledges your Dragonair's power."
	para "It lets you pass."
	done

_DragonairEventTransformText::
	text "@"
	text_ram_namebuffer
	text " went near the ice crystals."
	prompt

_DragonairEventTransformText2::
	text "@"
	text_ram_namebuffer
	text " was filled with the freezing power of winter!@"
	sound_get_item_2
	text "<PARA>It gained the Ice type!"
	para "Its base stats increased!"
	prompt

_DragonairEventTransformText3::
	text "Sara: WOW! What a discovery!"
	para "Erik: I can't wait to record all this data!"
	para "Sara: Let's go home and get some food!"
	done

_DragonairEventAlready::
	text "It's already been powered up."
	done

_DragonairEventEnd::
	text "Sara: So Dragonair seem to gather in Seafoam Islands to acclimatize to the cold."
	para "Erik: And in the process they evolved new icy powers! Wow!"
	para "Sara: Usually they evolve into Dragonite, which hates ice!"
	para "Erik: The frigid splendor of all the Dragonair was so beautiful!"
	para "Hey, <PLAYER>!"
	para "Take a look at my computer if you want to check your Dragonair's new abilities!"
	done

_ErikSarasHouseComputerAfterText::
	text "Winter Dragonair Analysis"
	para "Dragon / Ice type."
	para "Base Stats:"
	para "HP: 91 Attack: 84 Defense: 75"
	para "Speed: 80 Special: 130"
	done

_ErikSarasHouseGoBackErikText::
	text "Erik: So what do you think about the analysis of Dragonair on my computer?"
	para "Or should we go back for more research?"
	prompt

_ErikSarasHouseGoBackSaraText::
	text "Sara: Ricky and I have been itching to go see the ice crystals!"
	prompt

_ErikSarasHouseGoBackQuestionText::
	text "Do you have another Dragonair to bring to the Seafoam Islands?"
	prompt

_DragonairEventLeaveText::
	text "Erik: That darn Cloyster won't let you go through!"
	para "Want to go back home for now?"
	prompt

_DragonairEventHealText::
	text "Sara: Ack!"
	para "Why won't that Cloyster get out of the way?!"
	para "Here let me heal your <Pokemon>!"
	prompt

_DragonairEventSaraReturnText::
	text "Sara: Ahh, I'll never get tired of seeing these graceful <Pokemon> floating about."
	done

_DragonairEventErikReturnText::
	text "Erik: I feel such serenity when swimming with these beautiful Dragonair."
	done

_ErikSarasHouseSecondNoteText::
	text "Results: Dragonair evolved special abilities in the presence of ice."
	para "The source of the cold temperatures in the Seafoam Islands is still unknown."
	done
