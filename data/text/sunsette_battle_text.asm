; Sunsette: per-location battle-effect flavor lines, in their own floating text section so the
; near-full numbered text banks don't overflow. Referenced via text_far (bank-agnostic).

; Per-gym enemy-trainer mon buff lines (printed in place of the default "X's STAT rose!")
_PewterGymBuffText::
	text "The ROCKS here"
	line "are SPECIAL!"
	prompt

_VermilionGymBuffText::
	text "The enemy likes"
	line "close combat!"
	prompt

; Sunsette: FUCHSIA arena - the invisible-wall maze confuses the player's lead mon
_FuchsiaGymBuffText::
	text "Invisible walls"
	line "make it dizzy!"
	prompt

_FightingDojoBuffText::
	text "The enemy is"
	line "TOUGH!"
	prompt

; Sunsette: SAFFRON arena - a psychic barrier seals the PACK shut (shown when you try to use an item)
_SaffronGymBuffText::
	text "A mind barrier"
	line "seals your items!"
	prompt

_CinnabarGymBuffText::
	text "They have SPECIAL"
	line "knowledge!"
	prompt

; Sunsette: VIRIDIAN arena - the vicious trainers (and Giovanni) crit twice as often; this telegraphs it
_ViridianGymBuffText::
	text "These #MON aim"
	line "for weak spots!"
	prompt

; Sunsette: CERULEAN arena - the pool gives WATER mons (both sides) +1 SPEED
_CeruleanGymBuffText::
	text "WATER #MON swim"
	line "faster here!"
	prompt

; Sunsette: AGATHA arena - +1 SPECIAL to each of her mons
_AgathaRoomBuffText::
	text "Her soul is"
	line "powerful!"
	prompt

; Sunsette: LANCE arena - +1 SPEED and +1 ACCURACY to each of his mons
_LanceRoomBuffText::
	text "This trainer"
	line "is intense!"
	prompt

; Sunsette: BRUNO arena - his mons cannot be critically hit; shown as each one comes out
_BrunoRoomBuffText::
	text "You can't spot"
	line "any weak point!"
	prompt

; Sunsette: CHAMPION's room - the final rival crits twice as often; this telegraphs it
_ChampionRivalBuffText::
	text "Your rival holds"
	line "nothing back!"
	prompt

; Sunsette: LORELEI arena - the frigid air freezes the player's lead mon
_LoreleiRoomFreezeText::
	text "The frigid air"
	line "freezes it solid!"
	prompt

_CeladonGymBuffText::
	text "The air is full"
	line "of spores!"
	prompt

_LavenderTowerMistText::
	text "Black mist chokes"
	line "the air!"
	prompt

_SurfSpeedText::
	text "It's hard to move"
	line "in the water!"
	prompt

_SilphSpeedText::
	text "There's no room"
	line "to move!"
	prompt

_SilphSpecialText::
	text "There's nothing"
	line "natural here!"
	prompt

_TooDarkToSeeText::
	text "It's too dark"
	line "to see!"
	prompt

_ABitDarkToSeeText::
	text "It's a little dark"
	line "in here..."
	prompt

_FlashAttractsText::
	text "The FLASH drew out"
	line "a wild #MON!"
	prompt

_MysticFieldText::
	text "Rare #MON are"
	line "drawn out here!"
	prompt

_UsedFlamethrowerText::
	text "The area went up"
	line "in flames!"
	prompt

; Sunsette: SAND ATTACK / MIST / HAZE / SMOKESCREEN field move (repel-like hiding)
_StartHidingText::
	text "You stirred up"
	line "cover! Wild"
	cont "#MON lose your"
	cont "trail!"
	prompt

_StoppedHidingText::
	text "The cover settled"
	line "and faded away..."
	prompt

_KeepHidingText::
	text "Keep hiding?"
	done

; Sunsette: FLASH-in-cave run-out (FlashWoreOffPrompt). The fade line always shows; "use again?" follows
; only if a party mon still knows FLASH.
_FlashFadedText::
	text "Your FLASH"
	line "flickered out,"
	cont "and the dark"
	cont "swallowed you!"
	prompt

_FlashUseAgainText::
	text "Use FLASH again?"
	done

; Sunsette: WATERIFY_EFFECT (Water Gun / Hydro Pump retype the target to WATER)
_WaterifiedText::
	text "Drenched! It is"
	line "now a WATER type!"
	prompt

; Sunsette: CONVERSION retypes the user to match the move it just copied (Mimic + retype)
_ConvertedTypeText::
	text "Its body adapted"
	line "to the new move!"
	prompt

; Sunsette: SKITTERMIND (PSYWAVE) blanks the target's mind - retypes it to BUG (gray palette)
_MindwipedText::
	text "Its mind went"
	line "blank! It is now"
	cont "a BUG type!"
	prompt

; Sunsette: MOCKINGBIRD (was MIRROR MOVE) copies all the foe's stat-stage changes onto the user
_MockingbirdText::
	text "Mimicked the foe's"
	line "stat changes!"
	prompt

; Sunsette: CALM MIND (AMNESIA) snaps the user out of its own confusion
_CalmMindCalmedText::
	text "A calm focus"
	line "cleared its mind!"
	prompt

; Sunsette: ENERGY FLUX - the capacitor setup turn (type2->FLOATING, SPECIAL +2, ENERGIZED armed)
_EnergyFluxChargeText::
	text "It crackled with"
	line "stored energy!"
	prompt

; Sunsette: ENERGY FLUX - the charge bursts when the user lands a special-typed hit (types + stats reset)
_EnergyFluxDischargeText::
	text "The stored charge"
	line "burst free!"
	prompt

; Sunsette: UNLEASH RAGE burns off the user's own status/confusion on a damaging hit
_UnleashRageClearText::
	text "The fury burned"
	line "away its ailments!"
	prompt

; Sunsette: STRENGTH recoil when a lighter user heaves a heavier foe
_StrengthTooHeavyText::
	text "But the foe was"
	line "too heavy!"
	prompt

; Sunsette: SHORYUKEN strips a FLYING/FLOATING target's air type (grounds it)
_TempestGroundText::
	text "The foe crashed"
	line "down to earth!"
	prompt

; Sunsette: a frozen mon thaws itself by using a burn-inflicting (heat) move
_SelfThawedText::
	text "The heat melted"
	line "the ice away!"
	prompt

; Sunsette: a WATER move washes the burn off whoever used it or got hit by it
_WaterWashedBurnText::
	text "The water washed"
	line "the burn away!"
	prompt

; Sunsette: SolarBeam's non-fire charge turn (Mega-Drain-like; arms the release)
_SolarBeamChargeText::
	text "It took in"
	line "energy!"
	prompt

; Sunsette: SolarBeam's reworked charge turn (no damage; +1 SPECIAL + FLOURISH; classic charge anim)
_SolarBeamSunlightText::
	text "It took in"
	line "sunlight!"
	prompt

; Sunsette: SHELL GAME (WITHDRAW) - the player's Switch? Yes/No question
_ShellGameSwitchPromptText::
	text "Slip away and"
	line "switch out?"
	done

; Sunsette: SHELL GAME - the "No" branch: the user takes REFLECT instead of switching
_ShellGameReflectText::
	text "It tucked into"
	line "its shell!"
	prompt

; Sunsette: SHADOW GAME (HAZE) - the toxic fog that poisons + obscures both sides after the stat reset
_BlackHazeFogText::
	text "A toxic black fog"
	line "blankets all!"
	prompt

; Sunsette: EMETIC PURGE - one-sided revenge stat clear (+ poison). Neutral "its/it" both ways.
_MiasmaScatterText::
	text "The purge voided"
	line "its gathered"
	cont "power!"
	prompt

_MiasmaPoisonedText::
	text "It was left"
	line "poisoned and ill!"
	prompt

; Sunsette: PSYCHO SHIFT - the user casts its own ailments onto the foe. Neutral "its" both ways.
_PsychoShiftText::
	text "Its afflictions"
	line "were cast onto"
	cont "the foe!"
	prompt

; Sunsette: SENBONZAKURA (PETAL_DANCE) - the petal storm resets the user's own stats, then a lingering bloom
_SenbonzakuraText::
	text "Petals scatter,"
	line "wiping the slate"
	cont "to a fresh bloom!"
	prompt

; Sunsette: AQUA RING (ACID_ARMOR) - the water veil that grants doubled FLOURISH regen
_AquaRingText::
	text "A veil of water"
	line "envelops it!"
	prompt

; Sunsette: CLAY ARMOR (FISSURE) - type-gated dual screens; GROUND users also heal half their HP
_ClayArmorText::
	text "A shell of clay"
	line "hardens over it!"
	prompt

_ClayArmorHealText::
	text "The good earth"
	line "mends its wounds!"
	prompt

; Sunsette: AURORA MIST (ETHEREAL) - the icy veil that grants Mist immunity + clears both mons' status
_AuroraMistText::
	text "An icy mist"
	line "purges all status!"
	prompt

; Sunsette: AURORA MIST - a non-ICE user freezes over and becomes an ICE type (cyan coat)
_AuroraMistFrozenText::
	text "Frostbitten! It is"
	line "now an ICE type!"
	prompt

; Sunsette: AURORA MIST - an ICE user raises both Reflect and Light Screen
_AuroraMistScreenText::
	text "Glittering walls"
	line "of frost arise!"
	prompt

; Sunsette: OROCLASM (EXPLOSION) - a ROCK user breaks its shell, sheds ROCK, and surges to +6 SPEED
_MetamorphicText::
	text "The shell broke!"
	line "SPEED unleashed!"
	prompt

; Sunsette: SUPERNOVA (SELFDESTRUCT) - a FIRE user burns out, shedding its FIRE type (no recoil)
_SupernovaCoolText::
	text "Spent! Its fire"
	line "has burned out!"
	prompt

; Sunsette: SUPERNOVA - a non-FIRE user is scorched by its own blast
_SupernovaBurnText::
	text "The backblast"
	line "left it burned!"
	prompt

; Sunsette: SHELL GAME - the player fled a wild battle
_ShellGameFledText::
	text "Got away in the"
	line "shuffle!"
	prompt

; Sunsette: "Signature Move!" - flashed right after "X used Y!" when Y is a species-specific
; signature on a NORMAL move for the user X (Beedrill/Golem/Wigglytuff/etc.). Driven by
; wSignatureMoveActive set in CheckRemapMoveData; printed by that routine's wrapper.
_SignatureMoveText::
	text "Signature Move!"
	prompt

; Sunsette: shown when DOUBLESLAP ("wake-up slap") hits a SNORLAX - it always gets the asleep-target
; damage bonus because SNORLAX is perpetually drowsy (and the hit never wakes it). See DoubleSlapModifier.
_AlwaysDrowsyText::
	text "It's always"
	line "drowsy!"
	prompt

; Sunsette: PSYDUCK's hidden psychic-headache recoil (see CheckPsyduckHeadache). Stands in for the
; "Signature Move!" line, but PSYDUCK is not a RemappableMoves entry so it never shows in the MOVE MYSTIC.
_PsyduckHeadacheText::
	text "Oh no! It has a"
	line "headache!"
	prompt

; Sunsette: _TangelaMoveMysticText removed - VENOM LASH (CONSTRICT) is no longer a TANGELA signature.

; Sunsette: the legendary-bird MOVE MYSTIC info/flavor texts were removed - the birds' effects now
; live on their own dedicated moves (PHOENIX DIVE / STORM DRILL / WINTER GALE), so they're no longer
; MOVE MYSTIC signature mons.

; Sunsette: KRABBY/KINGLER MOVE MYSTIC texts removed - CRABHAMMER is a flat 100-BP move now, no longer their signature.

; Sunsette: GOLDEEN / GYARADOS MOVE MYSTIC flavor (here because MoveMystic.asm's Text 3 bank is full). Their
; signature info uses the shared _MoveMysticRiptideText below (RIPTIDE always raises SPEED).
_GoldeenMoveMysticText::
	text_start
	line "graceful goldfish."
	prompt

_GyaradosMoveMysticText::
	text_start
	line "raging whirlpool."
	prompt

_SnorlaxMoveMysticText::
	text_start
	line "slumbering giant."
	prompt

_MoveMysticSnorlaxText::
	text "Its deep slumber"
	line "is restorative!"

	para "After a REST it"
	line "munches leftovers"
	cont "and gets a SPEED"
	cont "boost!"
	done

; Sunsette: KANGASKHAN's CLOBBERCLOCK signature (90 BP, up from 70) - uses the generic power-increase info path
_KangaskhanMoveMysticText::
	text_start
	line "maternal mauler."
	prompt

; Sunsette: WEEZING's SLUDGE BOMB signature is now a BURN (special-cased info text below), not a power bump.
_WeezingMoveMysticText::
	text_start
	line "noxious nuisance."
	prompt

; Sunsette: PIKACHU / RAICHU - SURF WATERIFIES the target once the player has surfed at the Beach House.
_PikachuMoveMysticText::
	text_start
	line "pint-size surfer."
	prompt

_RaichuMoveMysticText::
	text_start
	line "shock surfer."
	prompt

_MoveMysticSurfSigText::
	text "It learned to ride"
	line "with the DUDE!"

	para "Its SURF now soaks"
	line "the foe, turning"
	cont "them to WATER!"
	done

; Sunsette: CLEFAIRY/CLEFABLE - METRONOME also raises one of the user's stats at random. Shared epithet
; (_ClefairyMoveMysticText) + detailed info (_MoveMysticClefairyText).
_ClefairyMoveMysticText::
	text_start
	line "lucky charmer."
	prompt

_MoveMysticClefairyText::
	text "Its METRONOME is"
	line "charmed with luck!"

	para "Each use also"
	line "raises one of its"
	cont "stats at random!"
	done

; Sunsette: FARFETCH'D - a GRASS type whose critical hits keep the old NORMAL-type punch (2x, not 1.5x).
; Shared epithet (_FarfetchdMoveMysticText) + detailed info (_MoveMysticFarfetchdText).
_FarfetchdMoveMysticText::
	text_start
	line "wily leek fencer."
	prompt

_MoveMysticFarfetchdText::
	text "It wields its leek"
	line "like a born"
	cont "swordsman!"

	para "It may be a GRASS"
	line "type, but it finds"
	cont "the vital points."

	para "Its critical hits"
	line "strike for DOUBLE,"
	cont "like a NORMAL"
	cont "#MON's blows!"
	done

; Sunsette: SEAKING (and the GOLDEEN/GYARADOS line) - RIPTIDE always raises the user's SPEED.
_MoveMysticRiptideText::
	text "It rides the ocean"
	line "currents like no"
	cont "other!"

	para "Its RIPTIDE always"
	line "raises its own"
	cont "SPEED!"
	done

; Sunsette: WEEZING - its signature FLAMETHROWER gets STAB (1.5x) even though Weezing is POISON, not FIRE.
_MoveMysticWeezingFlamethrowerText::
	text "Its toxic gases"
	line "ignite with ease!"

	para "Its FLAMETHROWER"
	line "blazes with"
	cont "borrowed power!"

	para "It strikes as if"
	line "WEEZING were a"
	cont "FIRE-type itself!"
	done

; Sunsette: shared by EKANS + ARBOK (the line's FOCUS ENERGY coil-and-heal signature).
_MoveMysticArbokText::
	text "Its FOCUS ENERGY"
	line "is no mere coil!"

	para "It mends a"
	line "quarter of its"
	cont "health as it"
	cont "coils to strike."
	done
