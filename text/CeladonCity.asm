_CeladonCityLittleGirlText::
	text "I got my Koffing in Cinnabar!"
	para "It's nice, but it breathes poison when it's angry!"
	done

_CeladonCityLittleGirlText2::
	text "Want to see?"
	done

_CeladonCityLittleGirlText3::
	text "Haha, it is pretty cool after all!"
	done

_KoffingLearnsetText::
	text "Watch this!"
	para "Go, Koffing!@"
	text_asm
	ld a, [wPlayerDirection]
	cp PLAYER_DIR_RIGHT
	lb hl, 1, 1
	jr z, .continue
	cp PLAYER_DIR_UP
	lb hl, -1, -1
	jr z, .continue
	cp PLAYER_DIR_DOWN
	lb hl, -1, 1
	jr z, .continue
	lb hl, -2, 0
.continue
	ld de, vNPCSprites tile $78
	lb bc, CELADONCITY_ANIMATION_PROXY, KOFFING
	predef MakePokemonAppearInOverworld
	ld a, KOFFING
	call PlayCry
	rst TextScriptEnd

_CeladonCityGramps1Text::
	text "Heheh! This Gym is great! It's full of women!"
	done

_CeladonCityGirlText::
	text "The Game Corner is bad for our city's image!"
	done

_CeladonCityGramps2Text::
	text "Moan! I blew it all at the slots!"
	para "I knew I should have cashed in my coins for prizes!"
	done

_CeladonCityGramps3Text::
	text "Hello, there!"
	para "I've seen you, but I never had a chance to talk!"
	para "Shall I reward you for dropping by?"
	para "Hmm<...> I know!"
	para "I'm a retired teacher."
	para "I know a lot about less popular <Pokemon> moves!"
	para "So I'll teach your <Pokemon>!"
	prompt

_CeladonCityGramps3Text2::
	text "Hello again!"
	para "Do your <Pokemon> want to learn?"
	prompt

_CeladonPoolGrampsAfterTeachText::
	text "A new move is always exciting!"
	para "Use it well!"
	done

_GenericPlayerReceivedText::
_PewterGymReceivedTM34Text::
_CeruleanGymMistyReceivedTM11Text::
_VermilionGymLTSurgeReceivedTM24Text::
_CeladonGymReceivedTM21Text::
_CeladonMart3FClerkReceivedTM18Text::
_CeladonMartRoofLittleGirlReceivedTM13Text::
_CeladonMartRoofLittleGirlReceivedTM48Text::
_CopycatsHouse2FCopycatReceivedTM31Text::
_MrPsychicsHouseMrPsychicReceivedTM29Text::
_SaffronGymSabrinaReceivedTM46Text::
_FuchsiaGymKogaReceivedTM06Text::
_WardensHouseWardenReceivedHM04Text::
_SafariZoneSecretHouseFishingGuruReceivedHM03Text::
_CinnabarGymBlaineReceivedTM38Text::
_CinnabarLabMetronomeRoomScientist1ReceivedTM35Text::
_ViridianCityFisherReceivedTM42Text::
_ViridianGymGiovanniReceivedTM27Text::
_Route12Gate2FBrunetteGirlReceivedTM39Text::
	text "<PLAYER> received @"
	text_ram_stringbuffer
	text "!@"
	text_end

; PureRGBnote: CHANGED: he is now a tutor
;_CeladonCityGramps3TM41ExplanationText::
;	text "<TM>41 teaches"
;	line "MEDITATE!"

;	para "It raises ATTACK,"
;	line "SPECIAL and SPEED"
;	cont "all by one stage!"

;	para "Your #MON will"
;	line "be unstoppable!"
;	done

;_CeladonCityGramps3TM41NoRoomText::
_GenericPackIsFullOfItemsText::
	text "Oh, your pack is full of items!"
	done

_CeladonCityFisherText::
	text "This is my trusted pal, Poliwrath!"
	para "It evolved from Poliwhirl when I used Water Stone!"
	done

_CeladonCityFisher2Text::
	text "Want to see some of its moves?"
	done

_PoliwrathLearnsetText::
	text "Ready, @"
	text_ram_namebuffer
	text "?"
	prompt

_CeladonCityPoliwrathText::
	text "Poliwrath: Ribi ribit!@"
	text_end

_CeladonCityRocket1Text::
	text "What are you staring at?"
	done

_CeladonCityRocket2Text::
	text "Keep out of <TEAM><ROCKET>'s way!"
	done

_CeladonCityTrainerTips1Text::
	text "<TIPS>"
	para "X Accuracy boosts the accuracy of techniques!"
	para "Dire Hit jacks up the likelihood of critical hits!"
	; fall through
_GetYourItemsAtDeptStore::
	para "Get your items at Celadon Dept. Store!"
	done

_CeladonCitySignText::
	text "Celadon City"
	para "The City of Rainbow Dreams"
	done

_CeladonCityGymSignText::
	text "Celadon City <Pokemon> Gym Leader: Erika"
	para "The Nature Loving Princess!"
	done

_CeladonCityMansionSignText::
	text "Celadon Mansion"
	done

_CeladonCityDeptStoreSignText::
	text "Find what you need at Celadon Dept. Store!"
	done

_CeladonCityTrainerTips2Text::
	text "<TIPS>"
	para "Guard Spec. protects <Pokemon> against status moves like Leer or Sand-Attack!@"
	text_jump _GetYourItemsAtDeptStore

_CeladonCityPrizeExchangeSignText::
	text "Coins exchanged for prizes!"
	para "Prize Exchange"
	done

_CeladonCityGameCornerSignText::
	text "<ROCKET> Game Corner"
	para "The playground for grown-ups!"
	done

_CeladonCityText19::
	text "<TIPS>"
	para "Open the START menu and scroll down to the SAVE option."
	para "Then press SELECT to change <PC> Boxes whenever you like!"
	done
