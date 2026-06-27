_AIBattleWithdrawText::
	text_ram wTrainerName
	text " with-"
	line "drew @"
	text_ram wEnemyMonNick
	text "!"
	prompt

_AIBattleUseItemText::
	text_ram wTrainerName
	text_start
	line "used @"
	text_ram_namebuffer
	text_start
	cont "on @"
	text_ram wEnemyMonNick
	text "!"
	prompt

_TradeWentToText::
	text_ram_stringbuffer
	text " went"
	line "to @"
	text_ram wLinkEnemyTrainerName
	text "."
	done

_TradeForText::
	text "For <PLAYER>'s"
	line "@"
	text_ram_stringbuffer
	text ","
	done

_TradeSendsText::
	text_ram wLinkEnemyTrainerName
	text " sends"
	line "@"
	text_ram_namebuffer
	text "."
	done

_TradeWavesFarewellText::
	text_ram wLinkEnemyTrainerName
	text " waves"
	line "farewell as"
	done

_TradeTransferredText::
	text_ram_namebuffer
	text " is"
	line "transferred."
	done

_TradeTakeCareText::
	text "Take good care of"
	line "@"
	text_ram_namebuffer
	text "."
	done

_TradeWillTradeText::
	text_ram wLinkEnemyTrainerName
	text " will"
	line "trade @"
	text_ram_namebuffer
	text_start
	done

_TradeforText::
	text "for <PLAYER>'s"
	line "@"
	text_ram_stringbuffer
	text "."
	done

_PlaySlotMachineText::
	text "A slot machine!"
	line "Want to play?"
	done

_OutOfCoinsSlotMachineText::
	text "Darn!"
	line "Ran out of coins!"
	done

_BetHowManySlotMachineText::
	text "Bet how many"
	line "coins?"
	done

_StartSlotMachineText::
	text "Start!"
	done

_NotEnoughCoinsSlotMachineText::
	text "Not enough"
	line "coins!"
	prompt

_OneMoreGoSlotMachineText::
	text "One more"
	line "go?"
	done

_LinedUpText::
	text " lined up!"
	line "Scored @"
	text_ram_stringbuffer
	text " coins!"
	done

_NotThisTimeText::
	text "Not this time!"
	prompt

_YeahText::
	text "Yeah!@"
	text_end

_DexSeenOwnedText::
	text "<poke>dex   Seen:@"
	text_decimal wDexRatingNumMonsSeen, 1, 3
	text_start
	line "         Owned:@"
	text_decimal wDexRatingNumMonsOwned, 1, 3
	text_end

_DexRatingText::
	text "<poke>dex Rating<COLON>"
	done

_GymStatueText::
	text_ram_stringbuffer
	text_start
	line "<Pokemon> Gym"
	cont "Leader: @"
	text_ram_namebuffer
	text_start

	para "Winning Trainers:@"
	text_end

_GymStatueRival::
	text "<LINE><RIVAL>"
	done

_GymStatueRivalPlayer::
	text "<LINE><RIVAL>"
	cont "<PLAYER>"
	done

_ViridianCityPokecenterGuyText::
	text "<Pokemon> Centers"
	line "heal your tired,"
	cont "hurt or fainted"
	cont "<Pokemon>!"
	done

_PewterCityPokecenterGuyText::
	text "Yawn!"

	para "When Jigglypuff"
	line "sings, <Pokemon>"
	cont "get drowsy<...>"

	para "<...>Me too<...>"
	line "Snore<...>"
	done

_CeruleanPokecenterGuyText::
	text "Bill has lots of"
	line "<Pokemon>!"

	para "He collects rare"
	line "ones too!"
	done

_LavenderPokecenterGuyText::
	text "Cubones wear"
	line "skulls, right?"

	para "People will pay a"
	line "lot for one!"
	done

_MtMoonPokecenterBenchGuyText::
	text "If you have too"
	line "many <Pokemon>, you"
	cont "should store them"
	cont "via <PC>!"
	done

_RockTunnelPokecenterGuyText::
	text "I heard that"
	line "Ghosts haunt"
	cont "Lavender Town!"
	done

_SafariZoneTiredGuyText::
	text "I'm tired from"
	line "all the fun<...>"
	done

;_UnusedBenchGuyText3::
;	text "SILPH's manager"
;	line "is hiding in the"
;	cont "SAFARI ZONE."
;	done

_VermilionPokecenterGuyText::
	text "It is true that a"
	line "higher level"
	cont "<Pokemon> will be"
	cont "more powerful<...>"

	para "But, all <Pokemon>"
	line "will have weak"
	cont "points against"
	cont "specific types."

	para "So, there is no"
	line "universally"
	cont "strong <Pokemon>."
	done

_CeladonCityPokecenterGuyText::
	text "If I had a bike,"
	line "I would go to"
	cont "Cycling Road!"
	done

_FuchsiaCityPokecenterGuyText::
	text "If you're studying"
	line "<Pokemon>, visit"
	cont "the Safari Zone."

	para "It has all sorts"
	line "of rare <Pokemon>."
	done

_CinnabarPokecenterGuyText::
	text "<Pokemon> can still"
	line "learn techniques"
	cont "after canceling"
	cont "evolution."

	para "Evolution can wait"
	line "until new moves"
	cont "have been learned."
	done

_SaffronCityPokecenterGuyText1::
	text "It would be great"
	line "if the Elite Four"
	cont "came and stomped"
	cont "<TEAM><ROCKET>!"
	done

_SaffronCityPokecenterGuyText2::
	text "<TEAM><ROCKET> took"
	line "off! We can go"
	cont "out safely again!"
	cont "That's great!"
	done

_CeladonCityHotelText::
	text "My sis brought me"
	line "on this vacation!"
	done

_NewBicycleText::
	text "A shiny new"
	line "Bicycle!"
	done

_PushStartText::
	text "Push START to"
	line "open the menu!"
	done

_SaveOptionText::
	text "The SAVE option is"
	line "on the menu"
	cont "screen."
	done

_StrengthsAndWeaknessesText::
	text "All <Pokemon> types"
	line "have strong and"
	cont "weak points"
	cont "against others."
	done

_TimesUpText::
	text "PA: Ding-dong!"

	para "Time's up!"
	prompt

_GameOverText::
	text "PA: Your Safari"
	line "Game is over!"
	done

_RangerHuntSuccessText::
	text "PA: <PLAYER>"
	line "has defeated all"
	cont "5 Rangers!!"

	para "Congratulations!"
	done

_CinnabarGymQuizStartText::
	text "<Pokemon> Quiz!"
	line "Here we go!"
	prompt

_CinnabarGymQuizIntroText::
	text "<Pokemon> Quiz!"

	para "Get it right and"
	line "the door opens to"
	cont "the next room!"

	para "Get it wrong and"
	line "face a trainer!"

	para "If you want to"
	line "conserve your"
	cont "<Pokemon> for the"
	cont "Gym Leader<...>"

	para "Then get it right!"
	line "Here we go!"
	prompt

_CinnabarQuizQuestionsText1::
	text "Metapod evolves"
	line "into Butterfree?"
	prompt

_CinnabarQuizQuestionsText2::
	text "Are there 9"
	line "certified <Pokemon>"
	cont "League Badges?"
	prompt

_CinnabarQuizQuestionsText3::
	text "Does Poliwag"
	line "evolve 3 times?"
	prompt

_CinnabarQuizQuestionsText4::
	text "Are electric"
	line "moves effective"
	cont "against ground-"
	cont "type <Pokemon>?"
	prompt

_CinnabarQuizQuestionsText5::
	text "Are <Pokemon> of the"
	line "same species and"
	cont "level identical?"
	prompt

_CinnabarQuizQuestionsText6::
	text "<TM>28 contains"
	line "Tombstoner?"
	prompt

_CinnabarGymQuizCorrectText::
	text "You're absolutely"
	line "correct!"

	para "Go on through!@"
	text_end

_CinnabarGymQuizIncorrectText::
	text "Sorry! Bad call!"
	prompt

_MagazinesText::
	text "<Pokemon> magazines!"

	para "<Pokemon> notebooks!"

	para "<Pokemon> graphs!"
	done

_BillsHouseMonitorText::
	text "Teleporter is"
	line "displayed on the"
	cont "<PC> monitor."
	done

_BillsHouseInitiatedText::
	text "<PLAYER> initiated"
	line "Teleporter's Cell"
	cont "Separator!@"
	text_end

_BillsHousePokemonListText1::
	text "Bill's favorite"
	line "<Pokemon> list!"
	prompt

_BillsHousePokemonListText2::
	text "Which <Pokemon> do"
	line "you want info on?"
	done

_EmailHereText::
	text "There's an e-mail"
	line "message here!"
	para "<...>@"
	text_end

_OakLabEmailText::
	text "<PARA>Calling all"
	line "<Pokemon> trainers!"

	para "The elite trainers"
	line "of <Pokemon> League"
	cont "are ready to take"
	cont "on all comers!"

	para "Bring your best"
	line "<Pokemon> and see"
	cont "how you rate as a"
	cont "trainer!"

	para "<Pokemon> League HQ"
	line "Indigo Plateau"

	para "PS: Prof. Oak,"
	line "please visit us!"
	cont "<...>"
	done

_GameCornerCoinCaseText::
	text "A Coin Case is"
	line "required!"
	done

_GameCornerNoCoinsText::
	text "You don't have"
	line "any coins!"
	done

_GameCornerOutOfOrderText::
	text "Out of Order"
	line "This is broken."
	done

_GameCornerOutToLunchText::
	text "Out to Lunch"
	line "This is reserved."
	done

_GameCornerSomeonesKeysText::
	text "Someone's keys!"
	line "They'll be back."
	done

_JustAMomentText::
	text "Just a moment."
	done

TMNotebookText::
	text "It's a pamphlet"
	line "on <TM>s."

	para "<...>"

	para "There are 50 <TM>s"
	line "in all."

	para "There are also 5"
	line "HMs that can be"
	cont "used repeatedly."

	para "Silph Co.@"
	text_end

_TurnPageText::
	text "Turn the page?"
	done

_ViridianSchoolNotebookText5::
	text "Girl" ; fall through
_ViridianSchoolHeyDontLookAtNotes::
	db ": Hey! Don't"
	line "look at my notes!@"
	text_end

_ViridianSchoolNotebookTextGus::
	text "Gus@"
	text_jump _ViridianSchoolHeyDontLookAtNotes

_ViridianSchoolNotebookText1::
	text "Looked at the"
	line "notebook!"

	para "First page<...>"

	para "<poke> Balls are"
	line "used to catch"
	cont "<Pokemon>."

	para "Up to 6 <Pokemon>"
	line "can be carried."

	para "People who raise"
	line "and make <Pokemon>"
	cont "fight are called"
	cont "<Pokemon> trainers."
	prompt

_ViridianSchoolNotebookText2::
	text "Second page<...>"

	para "A healthy <Pokemon>"
	line "may be hard to"
	cont "catch, so weaken"
	cont "it first!"

	para "Poison, burns and"
	line "other damage are"
	cont "effective!"
	prompt

_ViridianSchoolNotebookText3::
	text "Third page<...>"

	para "<Pokemon> trainers"
	line "seek others to"
	cont "engage in <Pokemon>"
	cont "fights."

	para "Battles are"
	line "constantly fought"
	cont "at <Pokemon> GYMs."
	prompt

_ViridianSchoolNotebookText4::
	text "Fourth page<...>"

	para "The goal for"
	line "<Pokemon> trainers"
	cont "is to beat the"
	cont "top 8 <Pokemon>"
	cont "Gym Leaders."

	para "Do so to earn the"
	line "right to face<...>"

	para "The Elite Four of"
	line "<Pokemon> League!"
	prompt

; Sunsette: the two functionless Fighting Dojo side scrolls were repurposed into crit-hit lessons; their
; text moved to data/text/sunsette_dojo_text.asm (_FightingDojoCritFightingText / _FightingDojoCritSpeedText).

_FightingDojoText::
	text "Fighting Dojo"
	done

_RedBedroomSNESText::
	text "<PLAYER> is"
	line "playing the SNES!"
	cont "<...>Okay!"
	cont "It's time to go!"
	done

_Route15UpstairsBinocularsText::
	text "A large, shining"
	line "bird is flying"
	cont "toward the sea."
	prompt

_AerodactylKabutopsFossilText::
	text "@"
	text_ram wNameBuffer
	text " Fossil"
	line "A primitive and"
	cont "rare <Pokemon>."
	done

_LinkCableHelpText1::
	text "<TIPS>"

	para "Using a Game Link"
	line "Cable"
	prompt

_LinkCableHelpText2::
	text "Which heading do"
	line "you want to read?"
	done

_LinkCableInfoText1::
	text "When you have"
	line "linked your Game"
	cont "Boy with another"
	cont "Game Boy, talk to"
	cont "the attendant on"
	cont "the right in any"
	cont "<Pokemon> CENTER."
	prompt

_LinkCableInfoText2::
	text "Colosseum lets"
	line "you play against"
	cont "a friend."
	prompt

_LinkCableInfoText3::
	text "Trade Center is"
	line "used for trading"
	cont "<Pokemon>."
	prompt

_ViridianSchoolBlackboardText1::
	text "The blackboard"
	line "describes <Pokemon>"
	cont "status changes"
	cont "during battles."
	prompt

_ViridianSchoolBlackboardText2::
	text "Which heading do"
	line "you want to read?"
	done

; _ViridianBlackboardSleepText moved to data/text/sunsette_blackboard_text.asm (Text 3 was full).

_ViridianBlackboardPoisonText::
	text "When poisoned, a"
	line "<Pokemon>'s health"
	cont "steadily drops."

	para "Poison lingers"
	line "after battles."
	cont "Ghost and Poison"
	cont "are immune."

	para "Use an Antidote"
	line "to cure poison!"
	prompt

_ViridianBlackboardPrlzText::
	text "Paralysis could"
	line "make <Pokemon>"
	cont "moves misfire!"

	para "It cuts Speed"
	line "stat as well."

	para "Paralysis remains"
	line "after battles."

	para "Electric types"
	line "ignore paralysis."

	para "Use Parlyz Heal"
	line "for treatment!"
	prompt

_ViridianBlackboardBurnText::
	text "A burn reduces"
	line "the Attack stat."
	cont "It also causes"
	cont "ongoing damage."

	para "Fire and Water"
	line "types are immune."

	para "Burns remain"
	line "after battles."

	para "Use Burn Heal to"
	line "cure a burn!"
	prompt

_ViridianBlackboardFrozenText::
	text "If frozen, a"
	line "<Pokemon> can still"
	cont "act, but its"
	cont "Special and Speed"
	cont "are cut in half!"

	para "It stays frozen"
	line "even after the"
	cont "battle ends."

	para "Use Ice Heal to"
	line "thaw out <Pokemon>!"

	para "In battle, using a"
	line "burning or absorb"
	cont "move thaws it!"
	cont "Fire and Ice are"
	cont "immune."
	prompt

_VermilionGymTrashText::
	text "Nope, there's"
	line "only trash here."
	done

_VermilionGymTrashSuccessText1::
	text "Hey! There's a"
	line "switch under the"
	cont "trash!@"
	text_jump _VermilionGymTurnItOn

_VermilionGymTurnItOn::
	cont "Turn it on!"
	done

_VermilionGym1stElectricLock::
	text "The 1st@"
	text_jump _VermilionTheElectricLockOpened

_VermilionGym2ndElectricLock::
	text "The 2nd@"
	text_jump _VermilionTheElectricLockOpened

_VermilionTheElectricLockOpened::
	db " electric"
	line "lock opened!"
	done

_VermilionGymTrashSuccessText2::
	text "Hey! There's"
	line "another switch"
	cont "under the trash!@"
	text_jump _VermilionGymTurnItOn

_VermilionGymTrashSuccessText3::
	text "The motorized door"
	line "opened!"
	done

;_VermilionGymTrashFailText::
;	text "Nope! There's"
;	line "only trash here."
;	cont "Hey! The electric"
;	cont "locks were reset!@"
;	text_end

_FoundHiddenItemText::
	text "<PLAYER> found"
	line "@"
	text_ram_namebuffer
	text "!@"
	text_end

_FoundHiddenItemMultiText::
	text "<PLAYER> found"
	line "@"
	text_ram_namebuffer
	text " ×@"
	text_ram wTempStore1
	text "!@"
	text_end

_HiddenItemBagFullText::
	text "But, <PLAYER> has"
	line "no more room for"
	cont "other items!"
	done

_FoundHiddenCoinsText::
	text "<PLAYER> found"
	line "@"
	text_bcd hCoins, 2 | LEADING_ZEROES | LEFT_ALIGN
	text " coins!@"
	text_end

_FoundHiddenCoins2Text::
	text "<PLAYER> found"
	line "@"
	text_bcd hCoins, 2 | LEADING_ZEROES | LEFT_ALIGN
	text " coins!@"
	text_end

_DroppedHiddenCoinsText::
	text_start
	para "Oops! Dropped"
	line "some coins!"
	done

_IndigoPlateauStatuesText1::
	text "Indigo Plateau"
	prompt

_IndigoPlateauStatuesText2::
	text "The ultimate goal"
	line "of trainers!"
	cont "<Pokemon> League HQ"
	done

_IndigoPlateauStatuesText3::
	text "The highest"
	line "<Pokemon> authority"
	cont "<Pokemon> League HQ"
	done

_BookcaseText::
_PokemonBooksText::
	text "Crammed full of"
	line "<Pokemon> books!"
	done

_DiglettSculptureText::
	text "It's a sculpture"
	line "of Diglett."
	done

_ElevatorText::
	text "This is an"
	line "elevator."
	done

_TownMapText::
	text "A Town Map.@"
	text_end

_PokemonStuffText::
	text "Wow! Tons of"
	line "<Pokemon> stuff!"
	done

_OutOfSafariBallsText::
	text "PA: Ding-dong!"

	para "You are out of"
	line "Safari Balls!"
	prompt

_WildRanText::
	text "Wild @"
	text_ram wEnemyMonNick
	text_start
	line "ran!"
	prompt

_EnemyRanText::
	text "Enemy @"
	text_ram wEnemyMonNick
	text_start
	line "ran!"
	prompt

_HurtByPoisonText::
	text "<USER>'s"
	line "hurt by poison!"
	prompt

_HurtByBurnText::
	text "<USER>'s"
	line "hurt by the burn!"
	prompt

_HurtByLeechSeedText::
	text "Leech Seed saps"
	line "<USER>!"
	prompt

_EnemyMonFaintedText::
	text "Enemy @"
	text_ram wEnemyMonNick
	text_start
	line "fainted!"
	prompt

_MoneyForWinningText::
	text "<PLAYER> got ¥@"
	text_bcd wAmountMoneyWon, 3 | LEADING_ZEROES | LEFT_ALIGN
	text_start
	line "for winning!"
	prompt

_TrainerDefeatedText::
	text "<PLAYER> defeated"
	line "@"
	text_ram wTrainerName
	text "!"
	prompt

_PlayerMonFaintedText::
	text_ram wBattleMonNick
	text_start
	line "fainted!"
	prompt

_UseNextMonText::
	text "Use next <Pokemon>?"
	done

_Rival1WinText::
	text "Yeah! Am"
	line "I great or what?"
	prompt

_PlayerBlackedOutText2::
	text "<PLAYER> is out of"
	line "useable <Pokemon>!"

	para "<PLAYER> blacked"
	line "out!"
	prompt

_LinkBattleLostText::
	text "<PLAYER> lost to"
	line "@"
	text_ram wTrainerName
	text "!"
	prompt

_TrainerAboutToUseText::
	text_ram wTrainerName
	text " is"
	line "about to use"
	cont "@"
	text_ram wEnemyMonNick
	text "!"

	para "Will <PLAYER>"
	line "change <Pokemon>?"
	done

_TrainerSentOutText::
	text_ram wTrainerName
	text " sent"
	line "out @"
	text_ram wEnemyMonNick
	text "!"
	done

_NoWillText::
	text "There's no will"
	line "to fight!"
	prompt

_CantEscapeText::
	text "Can't escape!"
	prompt

_NoRunningText::
	text "No! There's no"
	line "running from a"
	cont "trainer battle!"
	prompt

_GotAwayText::
	text "Got away safely!"
	prompt

_ItemsCantBeUsedHereText::
	text "Items can't be"
	line "used here."
	prompt

_AlreadyOutText::
	text_ram wBattleMonNick
	text " is"
	line "already out!"
	prompt

_MoveNoPPText::
	text "No PP left for"
	line "this move!"
	prompt

_MoveDisabledText::
	text "The move is"
	line "disabled!"
	prompt

_NoMovesLeftText::
	text_ram wBattleMonNick
	text " has no"
	line "moves left!"
	done

_MultiHitText::
	text "Hit the enemy"
	line "@"
	text_decimal wPlayerNumHits, 1, 1
	text " times!"
	prompt

_ScaredText::
	text_ram wBattleMonNick
	text " is too"
	line "scared to move!"
	prompt

_GetOutText::
	text "Ghost: Get out<...>"
	line "Get out<...>"
	prompt

_FastAsleepText::
	text "<USER>"
	line "is fast asleep!"
	prompt

_WokeUpText::
	text "<USER>"
	line "woke up!"
	prompt

; Sunsette: woken by being hit (printed on the attacker's turn, so name the TARGET, not the USER)
_SleepHitWokeUpText::
	text "<TARGET>"
	line "woke up!"
	prompt

_IsFrozenText::
	text "<USER>"
	line "is frozen solid!"
	prompt

_FullyParalyzedText::
	text "<USER>'s"
	line "fully paralyzed!"
	prompt

_FlinchedText::
	text "<USER>"
	line "flinched!"
	prompt

_MustRechargeText::
	text "<USER>"
	line "must recharge!"
	prompt

_DisabledNoMoreText::
	text "<USER>'s"
	line "disabled no more!"
	prompt

_IsConfusedText::
	text "<USER>"
	line "is confused!"
	prompt

_HurtItselfText::
	text "It hurt itself in"
	line "its confusion!"
	prompt

_ConfusedNoMoreText::
	text "<USER>'s"
	line "confused no more!"
	prompt

;_SavingEnergyText::
;	text "<USER>"
;	line "is saving energy!"
;	prompt

;_UnleashedEnergyText::
;	text "<USER>"
;	line "unleashed energy!"
;	prompt

_ThrashingAboutText::
	text "<USER>'s"
	line "thrashing about!"
	done

_AttackContinuesText::
	text "<USER>'s"
	line "attack continues!"
	done

_CantMoveText::
	text "<USER>"
	line "can't move!"
	prompt

_MoveIsDisabledText::
	text "<USER>'s"
	line "@"
	text_ram_namebuffer
	text " is"
	cont "disabled!"
	prompt

_ActorNameText::
	text "<USER>@"
	text_end

_UsedMoveText::
	text_start
	line "used @"
	text_end

_UsedInsteadText::
	text "instead,"
	cont "@"
	text_end

_MoveNameText::
	text_ram_stringbuffer
	text "@"

_ExclamationPointText::
	text "!"
	done

_AttackMissedText::
	text "<USER>'s"
	line "attack missed!"
	prompt

_KeptGoingAndCrashedText::
	text "<USER>"
	line "kept going and"
	cont "crashed!"
	prompt

_UnaffectedText::
	text "<TARGET>'s"
	line "unaffected!"
	prompt

_DoesntAffectMonText::
	text "It doesn't affect"
	line "<TARGET>!"
	prompt

_CriticalHitText::
	text "Critical hit!"
	prompt

_OHKOText::
	text "One-hit KO!"
	prompt

_LoafingAroundText::
	text_ram wBattleMonNick
	text " is"
	line "loafing around."
	prompt

_BeganToNapText::
	text_ram wBattleMonNick
	text " began"
	line "to nap!"
	prompt

_WontObeyText::
	text_ram wBattleMonNick
	text " won't"
	line "obey!"
	prompt

_TurnedAwayText::
	text_ram wBattleMonNick
	text " turned"
	line "away!"
	prompt

_IgnoredOrdersText::
	text_ram wBattleMonNick
	text_start
	line "ignored orders!"
	prompt

_SubstituteTookDamageText::
	text "The Substitute"
	line "took damage for"
	cont "<TARGET>!"
	prompt

_SubstituteBrokeText::
	text "<TARGET>'s"
	line "Substitute broke!"
	prompt

;_BuildingRageText::
;	text "<USER>'s"
;	line "RAGE is building!"
;	prompt

_MirrorMoveFailedText::
	text "The Mirror Move"
	next "failed!"
	prompt

_HitXTimesText::
	text "Hit @"
	text_decimal wEnemyNumHits, 1, 1
	text " times!"
	prompt

_GainedText::
	text_ram_namebuffer
	text " gained"
	line "@"
	text_end

_WithExpAllText::
	text "with EXP.ALL,"
	cont "@"
	text_end

_BoostedText::
	text "a boosted"
	cont "@"
	text_end

_ExpPointsText::
	text_decimal wExpAmountGained, 2, 4
	text " EXP. Points!"
	prompt

_TeamGainedText::
	text "Your team received"
	line "@"
	text_end

_TeamExpText::
	text_decimal wExpAmountGained, 2, 4
	text " EXP.!"
	prompt

_GrewLevelText::
	text_ram_namebuffer
	text " grew"
	line "to level @"
	text_decimal wCurEnemyLevel, 1, 3
	text "!@"
	text_end

_WildMonAppearedText::
	text "Wild @"
	text_ram wEnemyMonNick
	text_start
	line "appeared!"
	prompt

_HookedMonAttackedText::
	text "The hooked"
_WildMonAppearedTextEnd::
	line "@"
	text_ram wEnemyMonNick
	text_start
	cont "attacked!"
	prompt

_EnemyAppearedText::
	text_ram wEnemyMonNick
	text_start
	line "appeared!"
	prompt

_TrainerWantsToFightText::
	text_ram wTrainerName
	text " wants"
	line "to fight!"
	prompt

_UnveiledGhostText::
	text "Silph Scope"
	line "unveiled the"
	cont "ghost's identity!"
	prompt

_GhostCantBeIDdText::
	text "Darn! The ghost"
	line "can't be ID'd!"
	prompt

_GoText::
	text "Go! @"
	text_end

_DoItText::
	text "Do it! @"
	text_end

_GetmText::
	text "Get'm! @"
	text_end

_EnemysWeakText::
	text "The enemy's weak!"
	line "Get'm! @"
	text_end

_PlayerMon1Text::
	text_ram wBattleMonNick
	text "!"
	done

_PlayerMon2Text::
	text_ram wBattleMonNick
	text " @"
	text_end

_EnoughText::
	text "enough!@"
	text_end

_OKExclamationText::
	text "OK!@"
	text_end

_GoodText::
	text "good!@"
	text_end

_ComeBackText::
	text_start
	line "Come back!"
	done

_SuperEffectiveText::
	text "It's super"
	line "effective!"
	prompt

_NotVeryEffectiveText::
	text "It's not very"
	line "effective<...>"
	prompt

_SafariZoneEatingText::
	text "Wild @"
	text_ram wEnemyMonNick
	text_start
	line "is eating!"
	prompt

_SafariZoneAngryText::
	text "Wild @"
	text_ram wEnemyMonNick
	text_start
	line "is angry!"
	prompt

; money related
_PickUpPayDayMoneyText::
	text "<PLAYER> picked up"
	line "¥@"
	text_bcd wTotalPayDayMoney, 3 | LEADING_ZEROES | LEFT_ALIGN
	text "!"
	prompt

_ClearSaveDataText::
	text "Clear all saved"
	line "data?"
	done

_WhichFloorText::
	text "Which floor do"
	line "you want?"
	done

_AlreadyOnThatFloor::
	text "Already on that"
	line "floor."
	prompt

_PartyMenuNormalText::
	text "Choose a <Pokemon>."
	done

_PartyMenuItemUseText::
	text "Use item on which"
	line "<Pokemon>?"
	done

_PartyMenuBattleText::
	text "Bring out which"
	line "<Pokemon>?"
	done

_PartyMenuUseTMText::
	text "Use <TM> on which"
	line "<Pokemon>?"
	done

_PartyMenuSwapMonText::
	text "Move <Pokemon>"
	line "where?"
	done

_PartyMenuEmptyText::
	text " "
	done

_PotionText::
	text_ram_namebuffer
	text_start
	line "recovered by @"
	text_decimal wHPBarHPDifference, 2, 3
	text "!"
	done

_AntidoteText::
	text_ram_namebuffer
	text " was"
	line "cured of poison!"
	done

_ParlyzHealText::
	text_ram_namebuffer
	text "'s"
	line "rid of paralysis!"
	done

_BurnHealText::
	text_ram_namebuffer
	text "'s"
	line "burn was healed!"
	done

_IceHealText::
	text_ram_namebuffer
	text " was"
	line "defrosted!"
	done

_AwakeningText::
	text_ram_namebuffer
	text_start
	line "woke up!"
	done

_FullHealText::
	text_ram_namebuffer
	text "'s"
	line "health returned!"
	done

_ReviveText::
	text_ram_namebuffer
	text_start
	line "is revitalized!"
	done

_RareCandyText::
	text_ram_namebuffer
	text " grew"
	line "to level @"
	text_decimal wCurEnemyLevel, 1, 3
	text "!@"
	text_end

_TurnedOnPC1Text::
	text "<PLAYER> turned on"
	line "the <PC>."
	prompt

_AccessedBillsPCText::
	text "Accessed Bill's"
	line "<PC>."
	; fall through
_AccessedMonStorageSystemText::
	para "Accessed <Pokemon>"
	line "Storage System."
	prompt

_AccessedSomeonesPCText::
	text "Accessed someone's"
	line "<PC>.@"
	text_jump _AccessedMonStorageSystemText

_AccessedMyPCText::
	text "Accessed my <PC>."

	para "Accessed Item"
	line "Storage System."
	prompt

_TurnedOnPC2Text::
	text "<PLAYER> turned on"
	line "the <PC>."
	prompt

_WhatDoYouWantText::
	text "What do you want"
	line "to do?"
	done

_WhatToDepositText::
	text "What do you want"
	line "to deposit?"
	done

_WantToDepositText::
	text "Deposit to <PC>?"
	done

_DepositHowManyToPCText::
	text "Deposit how many"
	line "to <PC>?"
	done

_DepositHowManyText::
	text "How many?"
	done

_ItemWasStoredText::
	text_ram_namebuffer
	text " was"
	line "stored via <PC>."
	prompt

_NothingToDepositText::
	text "You have nothing"
	line "to deposit."
	prompt

_NoRoomToStoreText::
	text "No room left to"
	line "store items."
	prompt

_WhatToWithdrawText::
	text "What do you want"
	line "to withdraw?"
	done

_WithdrawHowManyText::
	text "How many?"
	done

_WithdrewItemText::
	text "Withdrew @"
	text_ram_line wNameBuffer
	text "."
	prompt

_NothingStoredText::
	text "There is nothing"
	line "stored."
	prompt

_PokemartItemBagFullText::
_CantCarryMoreText::
	text "You can't carry"
	line "any more items."
	prompt

_WhatToTossText::
	text "What do you want"
	line "to toss away?"
	done

_TossHowManyText::
	text "How many?"
	done

_AccessedHoFPCText::
	text "Accessed <Pokemon>"
	line "League's site."

	para "Accessed the Hall"
	line "of Fame List."
	prompt

_SwitchOnText::
	text "Switch on!"
	prompt

_WhatText::
	text "What?"
	done

_ViewModeText::
	text "Box viewer"
	line "mode active."
	done

_DepositWhichMonText::
	text "Deposit which"
	line "<Pokemon>?"
	done

_MonWasStoredText::
	text_ram_stringbuffer
	text " was"
	line "stored in Box @"
	text_ram wBoxNumString
	text "."
	prompt

_CantDepositLastMonText::
	text "You can't deposit"
	line "the last <Pokemon>!"
	prompt

_BoxFullText::
	text "Oops! This Box is"
	line "full of <Pokemon>."
	prompt

_MonIsTakenOutText::
	text_ram_stringbuffer
	text " is"
	line "taken out."
	cont "Got @"
	text_ram_stringbuffer
	text "."
	prompt

_NoMonText::
	text "What? There are"
	line "no <Pokemon> here!"
	prompt

_CantTakeMonText::
	text "You can't take"
	line "any more <Pokemon>."

	para "Deposit <Pokemon>"
	line "first."
	prompt

_ReleaseWhichMonText::
	text "Release which"
	line "<Pokemon>?"
	done

_OnceReleasedText::
	text "Once released,"
	line "@"
	text_ram_stringbuffer
	text " is"
	cont "gone forever. OK?"
	prompt

_MonWasReleasedText::
	text_ram_stringbuffer
	text " was"
	line "released outside."
	cont "Bye @"
	text_ram_stringbuffer
	text "!"
	prompt

_PressStartToReleaseText::
	text "Press START to"
	line "confirm release.@"
	text_end

_RequireCoinCaseText::
	text "A Coin Case is"
	line "required!@"
	text_end

_ExchangeCoinsForPrizesText::
	text "We exchange your"
	line "coins for prizes."
	prompt

_WhichPrizeText::
	text "Which prize do"
	line "you want?"
	done

_HereYouGoText::
	text "Here you go!"
	done

_GoodChoice::
	text "Good choice!"
	done

_SoYouWantPrizeText::
	text "So, you want"
	line "@"
	text_ram_namebuffer
	text "?"
	done

_SorryNeedMoreCoinsText::
	text "Sorry, you need"
	line "more coins.@"
	text_end

_OopsYouDontHaveEnoughRoomText::
	text "Oops! You don't"
	line "have enough room.@"
	text_end

_OhFineThenText::
	text "Oh, fine then.@"
	text_end

_GetDexRatedText::
	text "Want to get your"
	line "<poke>dex rated?"
	done

_ClosedOaksPCText::
	text "Closed link to"
	line "Prof. Oak's <PC>.@"
	text_end

_AccessedOaksPCText::
	text "Accessed Prof."
	line "Oak's <PC>."

	para "Accessed <poke>dex"
	line "Rating System."
	prompt

_WhereWouldYouLikeText::
	text "Where would you"
	line "like to go?"
	done

_PleaseWaitText::
	text "OK, please wait"
	line "just a moment."
	done

_LinkCanceledText::
	text "The link was"
	line "canceled."
	done

_OakSpeechText1::
	text "Hello there!"
	line "Welcome to the"
	cont "world of <Pokemon>!"

	para "My name is Oak!"
	line "People call me"
	cont "the <Pokemon> Prof!"
	prompt

_OakSpeechText2A::
	text "This world is"
	line "inhabited by"
	cont "creatures called"
	cont "<Pokemon>!@"
	text_end

_OakSpeechText2B::
	text "For some people,"
	line "<Pokemon> are"
	cont "pets. Others use"
	cont "them for fights."

	para "Myself<...>"

	para "I study <Pokemon>"
	line "as a profession."
	prompt

_IntroducePlayerText::
	text "First, what is"
	line "your name?"
	prompt

_IntroduceRivalText::
	text "This is my grand-"
	line "son. He's been"
	cont "your rival since"
	cont "you were a baby."

	para "<...>Erm, what is"
	line "his name again?"
	prompt

_OakSpeechText3::
	text "<PLAYER>!"

	para "Your very own"
	line "<Pokemon> legend is"
	cont "about to unfold!"

	para "A world of dreams"
	line "and adventures"
	cont "with <Pokemon>"
	cont "awaits! Let's go!"
	done

_DoYouWantToNicknameText::
	text "Do you want to"
	line "give a nickname"
	cont "to @"
	text_ram_namebuffer
	text "?"
	done

_YourNameIsText::
	text "Right! So your"
	line "name is <PLAYER>!"
	prompt

_HisNameIsText::
	text "That's right! I"
	line "remember now! His"
	cont "name is <RIVAL>!"
	prompt

_WillBeTradedText::
	text_ram wNameOfPlayerMonToBeTraded
	text " and"
	line "@"
	text_ram_namebuffer
	text " will"
	cont "be traded."
	done

;_TextIDErrorText::
;	text_decimal hTextID, 1, 2
;	text " ERROR."
;	done

_ContCharText::
	text "<_CONT>@"
	text_end

_CantDepositSSTicketText::
	text "You need that"
	line "ticket while"
	cont "on the S.S. Anne!"
	prompt

_CantDepositBikeText::
	text "You're riding it!"
	line "Can't deposit now!"
	prompt

_SpiritAppearedNextLine::
	text_end
	text " spirit@"
	text_jump _WildMonAppearedTextEnd

_SpiritAppeared::
	text_end
	text " spirit"
	line "@"
	text_ram wEnemyMonNick
	text " attacked!"
	prompt

_TorchedAppeared::
	text "Blazing@"
	text_jump _SpiritAppeared

_ChunkyAppeared::
	text "Hungry@"
	text_jump _SpiritAppeared

_PainlessAppeared::
	text "Injured@"
	text_jump _SpiritAppearedNextLine

_IrradiatedAppeared::
	text "Nuclear@"
	text_jump _SpiritAppearedNextLine

_TheMawAppeared::
	text "Dark@"
	text_jump _SpiritAppeared

_SaveFileUpdateText::
	text "This save file"
	line "seems to be from"
	cont "an older build"
	cont "of the game."
	prompt

_SaveFileUpdateText2::
	text "Which older build"
	line "did it come from?"
	done

_SaveFileUpdateTextConfirm::
	text "Press START to"
	line "confirm."
	done

_SaveFileUpdating::
	text "Updating<...>"
	line "Please wait<...>"
	done

_SaveFileUpdateCompleteText::
	text "Your save file has"
	line "been updated."
	done

_SaveFileUpdateWarpText::
	text "If you warp to"
	line "Pallet Town, it"
	cont "will reduce bugs"
	cont "from changing"
	cont "to a new version."
	para "Warp to Pallet?"
	done
