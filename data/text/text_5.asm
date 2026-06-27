_CableClubNPCPleaseComeAgainText::
	text "Please come again!"
	done

_CableClubNPCMakingPreparationsText::
	text "We're making"
	line "preparations."
	cont "Please wait."
	done

_UsedStrengthText::
	text_ram_namebuffer
	text " used"
	line "Strength.@"
	text_end

_CanMoveBouldersText::
	text_ram_namebuffer
	text " can"
	line "move boulders."
	done

_CurrentTooFastText::
	text_start
_CurrentTooFastTextEntry::
	db "The current is"
	line "much too fast!"
	done

_CurrentTooFastText2::
	text "Can't Surf here!"
	para "@"
	text_jump _CurrentTooFastTextEntry

_CyclingIsFunText::
	text "Cycling is fun!"
	line "Forget Surfing!"
	prompt

_FlashLightsAreaText::
	text "A blinding flash"
	line "lights the area!"
	prompt

_WindSeedsText::
	text "An energizing wind"
	line "seeds the area!"
	prompt

_ViridianForestDefenseText::
	text "The dense forest"
	line "raises Defense!"
	prompt

_ConfuseRayFieldText::
	text "An eerie light"
	line "warps the air..."

	para "The next <Pokemon>"
	line "here will look"
	cont "strange!"
	prompt

_EscapeText::
	text "Escape@"
	text_end

_WarpText::
	text "Warp@"
	text_end

_ToLastPkmnCenterText::
	text " to the last"
	line "<Pokemon> Center?"
	prompt

_PocketAbraFlavorText1::
	text_ram wPocketAbraNick
	text " "
	line "grabbed your"
	cont "hand quickly in"
	cont "anticipation."
	prompt

_PocketAbraFlavorText2::
	text_ram wPocketAbraNick
	text " looks"
	line "very excited!"
	prompt

_PocketAbraFlavorText3::
	text_ram wPocketAbraNick
	text " was"
	line "dozing off in"
	cont "your bag."
	prompt

_PocketAbraFlavorText4::
	text_ram wPocketAbraNick
	text " sat"
	line "on your shoulder"
	cont "comfily."
	prompt

_PocketAbraFlavorText5::
	text_ram wPocketAbraNick
	text_start
	line "focused with"
	cont "all its might!"
	prompt

_PocketAbraNo::
	text_ram wPocketAbraNick
	text " looks"
	line "disappointed<...>"
	prompt

_WarpToLastPokemonCenterText::
	text "Warp to the last"
	line "<Pokemon> CENTER."
	prompt

_CannotUseTeleportNowText::
	text_ram_namebuffer
	text " can't"
	line "use Teleport now."
	prompt

_CannotFlyHereText::
	text_ram_namebuffer
	text " can't"
	line "Fly here."
	prompt

_CannotDigHereText::
	text_ram_namebuffer
	text " can't"
	line "Dig here."
	prompt

_CannotDigWhileSurfingText::
	text "Can't Dig while"
	line "Surfing on water!"
	prompt

_NoWhereToDigDown::
	text "You'll hit water"
	line "if you dig here."
	para "Find some"
	line "stabler ground."
	prompt

_NotHealthyEnoughText::
	text "Not healthy"
	line "enough."
	prompt

_AlreadyBrightText::
	text "It's already"
	line "bright enough."
	prompt

_NewBadgeRequiredText::
	text "No! A new Badge"
	line "is required."
	prompt

_CannotUseItemsHereText::
	text "You can't use items"
	line "here."
	prompt

_CannotGetOffHereText::
	text "You can't get off"
	line "here."
	prompt

_GotMonText::
	text "<PLAYER> got"
	line "@"
	text_ram_namebuffer
	text "!@"
	text_end

_SentToBoxText::
	text "There's no more"
	line "room for <Pokemon>!"
	cont "@"
	text_ram wBoxMonNicks
	text " was"
	cont "sent to <Pokemon>"
	cont "Box @"
	text_ram_stringbuffer
	text " on <PC>!"
	prompt

_BoxIsFullText::
	text "There's no more"
	line "room for <Pokemon>!"

	para "The <Pokemon> Box"
	line "is full and can't"
	cont "accept any more!"

	para "Change the Box at"
	line "a <Pokemon> Center!"
	done