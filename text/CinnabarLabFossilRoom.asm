_CinnabarLabFossilRoomScientist1Text::
	text "Hiya!"
	para "I am important doctor!"
	para "I study here rare <Pokemon> fossils!"
	para "You! Have you a fossil for me?"
	prompt

_CinnabarLabFossilRoomScientist1NoFossilsText::
	text "No! Is too bad!"
	done

_CinnabarLabFossilRoomScientist1GoForAWalkText::
	text "I take a little time!"
	para "You go for walk a little while!"
	done

_CinnabarLabFossilRoomScientist1FossilIsBackToLifeText::
	text "Where were you?"
	para "Your fossil is back to life!"
	para "It was @"
	text_ram_stringbuffer
	text_start
	line "like I think!"
	prompt

_CinnabarLabFossilRoomScientist1SeesFossilText::
	text "Oh! That is @"
	text_ram_namebuffer
	text "!"
	para "It is fossil of @"
	text_ram_stringbuffer
	text ", a <Pokemon> that is already extinct!"
	para "My Resurrection Machine will make that <Pokemon> live again!"
	done

_CinnabarLabFossilRoomScientist1TakesFossilText::
	text "So! You hurry and give me that!"
	para "<PLAYER> handed over @"
	text_ram_namebuffer
	text "!"
	prompt

_CinnabarLabFossilRoomScientist1GoForAWalkText2::
	text "I take a little time!"
	para "You go for walk a little while!"
	done

_CinnabarLabFossilRoomScientist1ComeAgainText::
	text "Aiyah! You come again!"
	done

_CinnabarLabFossilRoomDeskPapersText::
	text "Next Research Target:"
	para "Perform a deep study on how Ponyta survives with fiery mane."
	done
