; PureRGBnote: ADDED: text pointers for the descriptions that show up in the movedex.

_PoundDexEntry::
	text "A swift jolt of"
	next "electricity that"
	next "always strikes"
	next "first."

	bage "50% chance to"
	next "raise the user's"
	cont "EVASION by 1."
	dex

_GenericNoAdditionalEffectText::
	bage "No additional"
	next "effect"
	dex

_Generic30PercentLowerEvasionText:: ; Sunsette: shared by the SWIFT_EFFECT auto-hit moves
	bage "30% chance to"
	next "lower the foe's"
	next "EVASION"
	dex

_KarateChopDexEntry::
	text "A martial arts"
	next "vertical chop"
	next "with hand or paw."
	; fall through
_GenericOftenLandsCriticalHitsText::
	bage "Often lands"
	next "critical hits"
	dex

_DoubleslapDexEntry::
	text "Repeatedly slaps"
	next "the <opponent> with"
	next "two hands."

	bage "Power doubles if"
	next "foe is asleep, but"
	next "foe will wake up."
	; fall through
_Generic2To5HitsText::
	bage "Hits 2-5 times in"
	next "succession."
	next "2 hits → 37.5%"

	bage "3 hits → 37.5%"
	next "4 hits → 12.5%"
	next "5 hits → 12.5%@"
	text_end

_CometPunchDexEntry::
	text "Delivers a"
	next "lightning speed"
	next "punch."
	; fall through
_GenericAlwaysGoesFirstText::
	bage "Always goes"
	next "first"
	dex

_MegaPunchDexEntry::
	text "A titanic punch"
	next "that can stun"
	next "the <opponent>.@"
	text_call _Generic10PercentFlinchText
	bage "Flinch chance goes"
	next "up to 30% if used"
	next "by FIGHTING-types"
	dex

_PayDayDexEntry::
	text "Throws many coins"
	next "at the foe."
	next "Picking the coins"

	bage "up after battle"
	next "will earn you"
	next "some extra money"
	dex

_FirePunchDexEntry::
	text "Punches the foe"
	next "with a burning"
	next "fist."

	bage "Hits with the"
	next "user's higher of"
	cont "ATTACK or SPECIAL."
	dex

_Generic10PercentBurnText::
	bage "10% chance of"
	next "burning the foe"
	dex

_IcePunchDexEntry::
	text "Punches the foe"
	next "with a freezing"
	next "fist."

	bage "Hits with the"
	next "user's higher of"
	cont "ATTACK or SPECIAL."
	dex

_ThunderPunchDexEntry::
	text "Zaps the foe with"
	next "an electrically"
	next "charged fist."

	bage "Hits with the"
	next "user's higher of"
	cont "ATTACK or SPECIAL."
	dex

_Generic10PercentParalysisText::
	bage "10% chance of"
	next "paralyzing the"
	next "<opponent>"
	dex

_ScratchDexEntry::
	text "Scratches the foe"
	next "with claws or"
	next "barbs.@"

	text_jump _GenericNoAdditionalEffectText

_VicegripDexEntry::
	text "An inescapable"
	next "bite that never"
	next "misses.@"
	text_jump _Generic30PercentLowerEvasionText

_Generic30PercentParalysisText::
	bage "30% chance of"
	next "paralyzing the"
	next "<opponent>"
	dex

_GuillotineDexEntry::
	text "Giant claws"
	next "violently crush"
	next "the <opponent>.@"

	bage "A brutal hit that"
	next "lands critical"
	next "hits very often,"

	bage "though its aim"
	next "is poor."
	dex

_GenericOHKOText::
	bage "Always KOs the"
	next "<opponent>, but"
	next "misses a lot."

	bage "Doesn't work on"
	next "<opponent>s with"
	next "higher SPEED"
	dex

_RazorWindDexEntry::
	text "The <user> lands"
	next "to rest, healing"
	next "half its HP."

	bage "It sheds FLYING /"
	next "FLOATING for the"
	cont "turn, and snaps"
	cont "back to its true"
	cont "TYPE."
	dex

_GenericHealsHalfText::
	bage "Heals half of"
	next "<user>'s max HP"
	dex

_SwordsDanceDexEntry::
	text "A frenetic dance"
	next "to raise fighting"
	next "spirit."

	bage "Sharply raises"
	next "the <user>'s"
	next "ATTACK. (+2)"
	dex

_CutDexEntry::
	text "Slices the foe"
	next "with a claw, barb"
	next "tooth, wing, etc."

	bage "Also DISABLEs the"
	next "foe's last move!"

	bage "Usable outside"
	next "battle to cut down"
	next "shrubs or clear"
	
	bage "patches of tall"
	next "grass"
	dex

_GustDexEntry::
	text "Kicks up a gust"
	next "of wind towards"
	next "the <opponent>.@"

	bage "30% chance to"
	next "lower the foe's"
	next "ACCURACY."
	dex

_WingAttackDexEntry::
	text "Strikes and slaps"
	next "the foe with"
	next "wings.@"
	text_jump _Generic30PercentFlinchText

_WhirlwindDexEntry::
	text "A massive tornado"
	next "is summoned and"
	next "hurled at foe."
	; fall through
_Generic30PercentConfusionText::
	bage "Causes confusion"
	next "30% of the time"
	dex

_FlyDexEntry::
	text "The #MON flies"
	next "up high and then"
	next "dive-bombs foe."

	bage "Flying up raises"
	next "EVASION and dodges"
	next "most attacks."

	bage "Usable outside"
	next "battle to fly to"
	next "other places"
	dex

_BindDexEntry::
	text "Entraps the foe"
	next "in a rock-hard"
	next "grip.@"

	text_jump _GenericTrappingMoveText

_SlamDexEntry::
	text "Wastes the foe"
	next "with a dirty tail"
	next "leg, arm, etc. "

	bage "Power rises to 130"
	next "if the foe is"
	next "poisoned."

	bage "Also DISABLEs the"
	next "foe's last move!"
	dex


_VineWhipDexEntry::
	text "Whips the foe"
	next "with a plant"
	next "vine.@"

	text_call _GenericAlwaysGoesFirstText

	bage "Lowers the foe's"
	next "DEFENSE 30% of"
	next "the time"
	dex

_StompDexEntry::
	text "Stomps on the foe"
	next "with feet/hooves."
	; fall through
_Generic30PercentFlinchText::
	bage "Causes <opponent>"
	next "to flinch 30% of"
	next "the time"
	dex

_DoubleKickDexEntry::
	text "Delivers two"
	next "kicks in quick"
	next "succession."
	; fall through
_GenericHitsTwiceText::
	bage "Hits twice"
	dex

_MegaKickDexEntry::
	text "A gigantic kick"
	next "usually with both"
	next "legs, and a huge"

	bage "weight behind it.@"

	text_jump _Generic30PercentParalysisText

_JumpKickDexEntry::
	text "Jumps through the"
	next "air to deliver a"
	next "big kick."
	; fall through
_GenericKeptGoingCrashedText::
	bage "Does damage to"
	next "<user> on missing."

	bage "25% of the damage"
	next "it would have"
	next "done to the foe"
	dex

_RollingKickDexEntry::
	text "Rolls like a"
	next "stone for a kick"
	next "that never"
	next "misses.@"

	text_jump _Generic30PercentLowerEvasionText

_SandAttackDexEntry::
	text "Blinds the foe"
	next "with a spray of"
	next "sand.@"

	text_call _GenericLowerAccuracyText

	bage "FLYING #MON's"
	next "keen eyes are"
	next "unaffected."
	text_jump _HidingFieldText ; Sunsette: out-of-battle repel-like hiding
_GenericLowerAccuracyText::
	bage "Lowers the foe's"
	next "ACCURACY."
	next "(-1 ACCURACY)"
	dex

_HeadbuttDexEntry::
	text "Rams the foe"
	next "with the <user>'s"
	next "big head.@"

	text_jump _Generic30PercentFlinchText

_HornAttackDexEntry::
	text "Jabs the foe with"
	next "a rock-hard horn.@"

	text_jump _GenericNoAdditionalEffectText

_FuryAttackDexEntry::
	text "Angrily jabs the"
	next "foe with beak or"
	next "horn twice.@"

	_Generic33PercentLowerSpeedText::
	bage "33% chance to"
	next "lower foe's SPEED."
	next "(-1 SPEED)"
	dex

_HornDrillDexEntry::
	text "A vicious spinning"
	next "drill wreathed in"
	next "toxic energy."

	bage "Often lands"
	next "critical hits and"
	next "has a 40% chance"

	bage "to poison the foe."
	dex

_TackleDexEntry::
	text "Charges the foe"
	next "with a full-body"
	next "tackle.@"

	text_jump _GenericNoAdditionalEffectText

_BodySlamDexEntry::
	text "The <user>'s full"
	next "body weight is"
	next "slammed on foe.@"

	text_jump _Generic30PercentParalysisText

_WrapDexEntry::
	text "Wraps around foe"
	next "with a long"
	next "appendage/body."
	; fall through
_GenericTrappingMoveText::
	bage "The foe can't"
	next "move for 2-3"
	next "turns"
	dex

_TakeDownDexEntry::
	text "Tackles the foe"
	next "in a blazing"
	next "rush of speed."

	bage "Always raises the"
	next "<user>'s SPEED by"
	next "one stage."
	dex

_ThrashDexEntry::
	text "Angrily flails"
	next "around hitting"
	next "anything nearby."
	; fall through
_GenericThrashEffectText::
	bage "Lasts 2-3 turns."
	next "Causes confusion"
	next "to <user> after"
	dex

_DoubleEdgeDexEntry::
	text "A life-risking"
	next "tackle that hurts"
	next "the <user> as well."
	; fall through
_Generic25PercentRecoilText::
	bage "User takes 25%"
	next "of damage done"
	next "to foe as recoil"
	dex

_TailWhipDexEntry::
	text "The <user> whips its"
	next "tail around cutely"
	next "to trick the foe"

	bage "into lowering its"
	next "guard."
	; fall through
_GenericLowersDefense1StageText::
	bage "Lowers foe's"
	next "DEFENSE."
	next "(-1 DEFENSE)"
	dex

_PoisonStingDexEntry::
	text "Jabs the foe with"
	next "a small poison-"
	next "tipped barb."
	; fall through
_Generic40PercentPoisonText::
	bage "40% chance of"
	next "poisoning the"
	next "foe"
	dex

_TwineedleDexEntry::
	text "Jabs the foe with"
	next "two barbs, claws,"
	next "beaks, or spikes.@"

	text_call _GenericHitsTwiceText
	; fall through
_Generic20PercentPoisonText::
	bage "20% chance of"
	next "poisoning the"
	next "foe"
	dex

_PinMissileDexEntry::
	text "A rapid barrage of"
	next "pins or needles"
	next "flurry the foe.@"
	
	text_call _Generic2To5HitsText
	text_end
	text_jump _GenericAlwaysGoesFirstText

_LeerDexEntry::
	text "The <user> glowers"
	next "at the foe to"
	next "intimidate it.@"

	text_jump _GenericLowersDefense1StageText

_BiteDexEntry::
	text "Bites the foe"
	next "with sharp teeth."
	; fall through
_Generic10PercentFlinchText::
	bage "Causes <opponent>"
	next "to flinch 10% of"
	next "the time"
	dex

_GrowlDexEntry::
	text "Growls cutely,"
	next "causing the foe"
	next "to be less wary."

	bage "Lowers <opponent>'s"
	next "ATTACK."
	next "(-1 ATTACK)"
	dex

_RoarDexEntry::
	text "A loud scary"
	next "bellow or bark"
	next "that hurts ears."
	; fall through
_Generic33PercentLowerAttackText::
	bage "33% chance to"
	next "lower foe's ATTACK."
	next "(-1 ATTACK)"
	dex

_SingDexEntry::
	text "A soothing song"
	next "lulls the foe"
	next "into deep sleep."
	; fall through
_GenericPutsFoeAsleepText::
	bage "Puts the foe to"
	next "sleep if it"
	next "works"
	dex

_SupersonicDexEntry::
	text "High frequency"
	next "waves are emitted"
	next "that may confuse."

	bage "Causes confusion"
	next "if it works"
	dex

_SonicboomDexEntry::
	text "A foul ghostly"
	next "gust rushes the"
	next "foe in a flash."

	bage "Always goes first"
	next "and has a 10%"
	next "chance to make the"

	bage "foe flinch."
	dex

_DisableDexEntry::
	text "The <user> mentally"
	next "disables one of"
	next "the foe's moves."

	bage "Disables the last"
	next "move used by foe"
	next "for 2-8 turns,"

	bage "or a random move"
	next "if the foe didn't"
	next "use any yet"
	dex

_AcidDexEntry::
	text "A spray of acid"
	next "is unleashed on"
	next "the <opponent>."

	bage "Always lowers"
	next "either foe's"
	next "ATTACK or DEFENSE"
	dex

_EmberDexEntry::
	text "Sparks ignite"
	next "small flames to"
	next "scorch the foe.@"

	text_jump _Generic10PercentBurnText

_FlamethrowerDexEntry::
	text "A jet of searing"
	next "flame is blown"
	next "at the <opponent>."

	bage "A famous and"
	next "beloved FIRE move"
	next "for its power."

	bage "Out of battle it"
	next "burns away tall"
	next "grass and trees!"

	bage "30% chance of"
	next "burning the foe"
	dex

_MistDexEntry::
	text "The <user> releases"
	next "sparkling white"
	next "mist composed of"

	bage "ice crystals,"
	next "enshrouding it in"
	next "ethereal vapor."

	bage "The <user> becomes"
	next "ethereal; immune"
	next "to NORMAL and"

	bage "FIGHTING-type"
	next "moves until it"
	next "switches out."

	bage "Prevents stats"
	next "from decreasing"
	next "from moves such"

	bage "as GROWL, SCREECH"
	next "SMOKESCREEN, etc."
	next "as well"
	text_jump _HidingFieldText ; Sunsette: out-of-battle repel-like hiding

_WaterGunDexEntry::
	text "Shoots a small"
	next "pressurized jet"
	next "of water at foe.@"

	text_jump _WaterifyDexText

_HydroPumpDexEntry::
	text "A huge column of"
	next "superpressurized"
	next "water is blasted"

	bage "at the <opponent>.@"

	text_jump _WaterifyDexText


_SurfDexEntry::
	text "The whole area"
	next "is flooded. This"
	next "can't miss."

	bage "30% chance to"
	next "lower the foe's"
	next "EVASION."

	bage "Usable outside"
	next "battle to travel"
	next "over water"
	dex

_IceBeamDexEntry::
	text "A frigid beam"
	next "of glacial ice"
	next "is shot at the"

	bage "<opponent>."
	next "30% chance of"
	next "freezing the foe"
	dex

_BlizzardDexEntry::
	text "The <user> whips up"
	next "a powerful winter"
	next "storm that"

	bage "batters the foe"
	next "and cannot miss.@"

	text_jump _Generic30PercentLowerEvasionText

_PsybeamDexEntry::
	text "Psychic power"
	next "of the <user> is"
	next "focused into a"

	bage "strange beam."
	; fall through
_Generic10PercentConfusionText::
	bage "Causes confusion"
	next "10% of the time"
	dex

_BubblebeamDexEntry::
	text "A jet of bubbles"
	next "is fired at the"
	next "foe."
	; fall through
	text_jump _Generic30PercentConfusionText

_AuroraBeamDexEntry::
	text "A beautiful"
	next "multicolored beam"
	next "of light is shot"

	bage "at the <opponent>.@"

	text_jump _Generic30PercentConfusionText

_HyperBeamDexEntry::
	text "A powerful beam;"
	next "the pure essence"
	next "of destruction"

	bage "is fired mightily"
	next "at the foe."
	next "Uses SPECIAL."

	bage "After usage,"
	next "the <user> rests"
	next "the next turn."

	bage "If the <opponent>"
	next "faints, confused"
	next "instead."
	dex

_PeckDexEntry::
	text "The <user> pecks"
	next "the foe with"
	next "a beak or horn.@"

	text_jump _GenericNoAdditionalEffectText

_DrillPeckDexEntry::
	text "A spinning drill"
	next "pecking attack"
	next "with a beak/horn.@"

	bage "Also DISABLEs the"
	next "foe's last move!"
	dex

_SubmissionDexEntry::
	text "The <user> puts"
	next "the foe in a"
	next "grappling hold."

	bage "Also DISABLEs the"
	next "foe's last move!"
	dex

_GenericRaisesAttack1StageText::
	bage "Raises the <user>'s"
	next "ATTACK."
	next "(+1 ATTACK)"
	dex

_LowKickDexEntry::
	text "A low kick that"
	next "hits harder the"
	next "heavier the foe.@"

	text_jump _Generic30PercentFlinchText

_CounterDexEntry::
	text "A secret fighting"
	next "technique that"
	next "drains energy"

	bage "from the foe's"
	next "fighting spirit."
	; fall through
_GenericAbsorbMoveText::
	bage "Restores 50% of"
	next "inflicted damage"
	next "to the <user>'s HP"
	dex

_SeismicTossDexEntry::
	text "The <user> suplexes"
	next "the foe in a"
	next "dramatic spinning"

	bage "air drop aided"
	next "by the power of"
	next "gravity."

	bage "Does damage equal"
	next "to the current"
	next "level of <user>"
	dex

_StrengthDexEntry::
	text "Slugs the foe"
	next "with a massive"
	next "built up power.@"
	text_call _GenericRaisesAttack1StageText

	bage "Usable outside of"
	next "battle to push"
	next "heavy objects"
	dex

_AbsorbDexEntry::
	text "Drains nutrients"
	next "from the foe.@"

	text_jump _GenericAbsorbMoveText

_MegaDrainDexEntry::
	text "Rapidly drains"
	next "many nutrients"
	next "from the foe.@"

	text_jump _GenericAbsorbMoveText

_LeechSeedDexEntry::
	text "Drops seeds that"
	next "sprout and slowly"
	next "drain energy."

	bage "Saps health from"
	next "the <opponent> each"
	next "of their turns."

	bage "Restores 50% of"
	next "inflicted damage"
	next "to the <user>'s HP."

	bage "The seeds stay"
	next "until the foe"
	next "faints/switches."

	bage "Seed damage goes"
	next "up if the foe is"
	next "weak to GRASS."

	bage "RESIST: 1/16 HP"
	next "NORMAL:  1/8 HP"
	next "WEAK:   3/16 HP"

	bage "Doesn't work on"
	next "GRASS-type"
	next "#MON"
	dex

_GrowthDexEntry::
	text "The <user> grows"
	next "larger or heals"
	next "its body,"

	bage "usually with"
	next "photosynthesis."

	bage "Heals 1/3 of max"
	next "HP at once, then"
	next "1/16 each turn"

	bage "until the <user>"
	next "leaves battle."

	bage "Out of battle,"
	next "rare #MON are"
	next "drawn out"

	bage "until you leave"
	next "the area!"
	dex

_RazorLeafDexEntry::
	text "A flurry of razor"
	next "sharp leaves are"
	next "hurled at foe.@"

	text_jump _GenericOftenLandsCriticalHitsText

_SolarbeamDexEntry::
	text "Soaks up light,"
	next "then fires it as"
	next "a searing beam."

	bage "The 2nd use in a"
	next "row hits double"
	next "and may BURN."

	bage "FIRE types fire"
	next "now: weaker, and"
	next "it recoils."
	dex

_PoisonPowderDexEntry::
	text "A poisonous dust"
	next "cloud is spread"
	next "around the foe."

	bage "Poisons the foe"
	next "if it works."

	bage "Doesn't work on"
	next "POISON-type"
	next "#MON"
	dex

_StunSporeDexEntry::
	text "A numbing powder"
	next "cloud is spread"
	next "around the foe."

	bage "Paralyzes the foe"
	next "if it works"
	dex

_SleepPowderDexEntry::
	text "A big cloud of"
	next "sleep-inducing"
	next "dust is spread.@"

	text_jump _GenericPutsFoeAsleepText


_PetalDanceDexEntry::
	text "The <user> attacks"
	next "by spreading"
	next "petals all over."

	bage "Foes become"
	next "fixated on this"
	next "flowery dance.@"

	text_jump _Generic30PercentConfusionText

_StringShotDexEntry::
	text "Fires thick"
	next "sticky ropes of"
	next "silk at the foe."

	bage "Lowers foe's"
	next "SPEED stat."
	next "(-1 SPEED)"
	dex

_DragonRageDexEntry::
	text "The foe is hit"
	next "by a shockwave of"
	next "draconic rage.@"
	text_jump _Generic33PercentLowerSpecialText
	dex

_FireSpinDexEntry::
	text "A swirling pillar"
	next "of fire surrounds"
	next "the <opponent>.@"

	text_jump _GenericTrappingMoveText

_ThundershockDexEntry::
	text "A basic electric"
	next "shock move.@"

	text_jump _Generic10PercentParalysisText

_ThunderboltDexEntry::
	text "Unleashes over"
	next "100,000 volts of"
	next "electricity."

	bage "A move with many"
	next "fans due to its"
	next "power/flashiness.@"

	text_jump _Generic30PercentParalysisText

_ThunderWaveDexEntry::
	text "Discharges an"
	next "electromagnetic"
	next "wave that rapidly"

	bage "paralyzes the"
	next "<opponent>."

	bage "Useful due to its"
	next "great accuracy"
	dex

_ThunderDexEntry::
	text "A thunderstorm"
	next "drops a titanic"
	next "lightning bolt"

	bage "on the foe.@"

	text_jump _Generic10PercentParalysisText

_RockThrowDexEntry::
	text "Rocks are dropped"
	next "on the foe.@"

	text_jump _GenericNoAdditionalEffectText

_EarthquakeDexEntry::
	text "The <user> sets"
	next "off a quake that"
	next "can't miss."

	bage "Commonly referred"
	next "to by trainers as"
	next "“Old Reliable”@"

	text_jump _Generic30PercentLowerEvasionText

_FissureDexEntry::
	text "The <user> creates"
	next "a wide split in"
	next "the earth's crust"

	bage "that swallows the"
	next "foe completely.@"

	text_jump _GenericOHKOText

_DigDexEntry::
	text "Digs underground"
	next "for 1 turn, then"
	next "suddenly emerges"

	bage "to strike the foe"
	next "the next turn."

	bage "Digging down also"
	next "raises EVASION; the"
	next "<user> cannot be"
	next "hit while under."

	bage "Usable outside"
	next "battle to dig out"
	next "of caves"
	dex

_ToxicDexEntry::
	text "Excessive amounts"
	next "of poison are"
	next "sprayed all over."

	bage "Badly poisons the"
	next "foe if it hits."

	bage "The damage poison"
	next "does to the foe"
	next "grows each turn."

	bage "Accuracy increases"
	next "to 100% when used"
	next "by POISON #MON"
	dex

_ConfusionDexEntry::
	text "Uses psychic"
	next "powers to confuse"
	next "the foe's mind.@"

	text_jump _Generic10PercentConfusionText

_PsychicDexEntry::
	text "Telekinetic power"
	next "is unleashed,"
	next "striking the foe."

	bage "Few foes resist"
	next "this fantastic"
	next "psychic move.@"

	text_jump _Generic33PercentLowerSpecialText

_HypnosisDexEntry::
	text "The foe is hypno-"
	next "tized into a deep"
	next "sleep.@"

	text_jump _GenericPutsFoeAsleepText

_MeditateDexEntry::
	text "Assuming a pose"
	next "meant for deep"
	next "contemplation,"

	bage "the <user> steels"
	next "mind and body."

	bage "Raises a LIGHT"
	next "SCREEN and ATTACK."
	next "(+1 ATTACK)"

	bage "This move"
	next "always goes"
	next "first."
	dex

_AgilityDexEntry::
	text "A burst of"
	next "adrenaline enters"
	next "the <user>'s system"

	bage "letting it move"
	next "with a newfound"
	next "blinding speed."

	bage "Greatly raises"
	next "<user>'s SPEED."
	next "(+2 SPEED)"
	dex

_QuickAttackDexEntry::
	text "A fast lunge that"
	next "can't miss.@"

	text_jump _GenericAlwaysGoesFirstText

_RageDexEntry::
	text "The <user> releases"
	next "pent up anger on"
	next "the foe.@"

	text_jump _GenericRaisesAttack1StageText

_TeleportDexEntry::
	text "The <user> teleports"
	next "away from battle."

	bage "Wild #MON can"
	next "run from battle"
	next "by using it."

	bage "In trainer battles"
	next "the <user> switches"
	next "and heals 25% HP."

	bage "Fails if there are"
	next "no #MON left to"
	next "switch with."

	bage "Usable outside of"
	next "battle to travel"
	next "back to the last"

	bage "#MON CENTER"
	dex

_NightShadeDexEntry::
	text "A pervasive dark"
	next "engulfs the foe,"
	next "scaring them.@"

	text_jump _Generic30PercentParalysisText

_MimicDexEntry::
	text "The <user> mimics"
	next "one of the foe's"
	next "moves."

	bage "The move can be"
	next "chosen, and is"
	next "learned for the"

	bage "rest of the"
	next "battle."

	bage "It is used right"
	next "away after being"
	next "mimicked"
	dex

_ScreechDexEntry::
	text "A loud screeching"
	next "noise is emitted"
	next "by the <user>."

	bage "Greatly lowers"
	next "foe's DEFENSE."
	next "(-2 DEFENSE)"

	bage "This weird screech"
	next "will echo for the"
	next "rest of battle."

	bage "These echoes wake"
	next "all #MON from"
	next "sleep."

	bage "This move is auto-"
	next "used if the <user>"
	next "is put to sleep."

	bage "Never misses"
	dex

_DoubleTeamDexEntry::
	text "The <user> creates"
	next "many afterimages"
	next "of itself to"

	bage "decrease chances"
	next "of being hit and"
	next "tricks the foe."
	; fall through
_GenericRaisesEvasion1StageText::	
	bage "Raises <user>'s"
	next "EVASION."
	next "(+1 EVASION)"
	dex

_RecoverDexEntry::
	text "Regenerates"
	next "cells to heal"
	next "<user>'s damage.@"
	; fall through
	text_jump _GenericHealsHalfText

_HardenDexEntry::
	text "The exterior of"
	next "the <user> gets"
	next "harder."

	bage "Raises <user>'s"
	next "DEFENSE."
	next "(+1 DEFENSE)"
	dex

_MinimizeDexEntry::
	text "The <user> shrinks"
	next "to a tiny size to"
	next "avoid being hit."

	bage "Raises <user>'s"
	next "EVASION sharply."
	next "(+2 EVASION)"
	dex

_SmokescreenDexEntry::
	text "Black smoke is"
	next "shot everywhere,"
	next "blinding the foe.@"

	text_call _GenericLowerAccuracyText

	bage "POISON types are"
	next "used to noxious"
	next "clouds; unfazed."
	text_jump _HidingFieldText ; Sunsette: out-of-battle repel-like hiding

_ConfuseRayDexEntry::
	text "Strange rays of"
	next "light confuse the"
	next "<opponent>."

	bage "Causes confusion"

	bage "Out of battle,"
	next "lures the next"
	next "wild #MON here"

	bage "in a strange"
	next "color!"
	dex

_WithdrawDexEntry::
	text "The <user> hides in"
	next "its shell/cover"
	next "of any kind."

	bage "Heals 33% of max"
	next "HP and raises"
	next "DEFENSE. (+1)"

	bage "Does nothing if"
	next "at full HP"
	dex

_DefenseCurlDexEntry::
	text "Curls up into a"
	next "ball that raises"
	next "defensibility."

	bage "The <user> won't take"
	next "super effective"
	next "hits from moves"
	dex

_BarrierDexEntry::
	text "A sturdy energy"
	next "barrier is raised"
	next "by the <user>."

	bage "Greatly raises"
	next "<user>'s DEFENSE."
	next "(+2 DEFENSE)"
	dex

_LightScreenDexEntry::
	text "A wondrous wall"
	next "of light is risen"
	next "by the <user>."

	bage "Cuts SPECIAL"
	next "attack damage in"
	next "half, even crits."
	; fall through
_GenericThisEffectOnlyAppliesToOriginalUser::
	bage "Frees the <user>"
	next "from CONFUSION,"
	next "LEECH SEED, and"
	cont "DISABLE; eases"
	cont "TOXIC."

	bage "This effect only"
	next "applies to the"
	next "original <user>"
	dex

_HazeDexEntry::
	text "Black haze that"
	next "disrupts psychic"
	next "powers is spread"

	bage "all over."
	next "The <user> becomes"
	next "immune to PSYCHIC"

	bage "-type moves until"
	next "it switches out."

	bage "Resets all stat"
	next "changes and cures"
	next "confusion."

	bage "Also resets these"
	next "effects: MIST,"
	next "FOCUS ENERGY,"
	
	bage "LEECH SEED,"
	next "DISABLE, DIRE HIT"
	next "GUARD SPEC"

	bage "Now strikes first"
	next "with a 30% chance"
	next "to flinch."
	text_jump _HidingFieldText ; Sunsette: out-of-battle repel-like hiding

_ReflectDexEntry::
	text "A reflective wall"
	next "of light is risen"
	next "by the <user>."

	bage "Cuts physical"
	next "attack damage in"
	next "half, even crits.@"
	text_jump _GenericThisEffectOnlyAppliesToOriginalUser

_FocusEnergyDexEntry::
	text "The <user> takes a"
	next "deep breath and"
	next "focuses, raising"

	bage "its fighting"
	next "spirit with sheer"
	next "power of will."

	bage "Raises chance of"
	next "landing critical"
	next "hits by 4×"
	dex

_BideDexEntry::
	text "The <user> steels"
	next "itself, raising"
	next "physical prowess."

	bage "Raises ATTACK"
	next "and DEFENSE."
	next "(+1 Each)"
	dex

_MetronomeDexEntry::
	text "The <user> waves"
	next "a finger, and"
	next "otherworldly"

	bage "magic causes a"
	next "random attack to"
	next "suddenly occur"
	dex

_MirrorMoveDexEntry::
	text "The <user> mimics"
	next "the foe, copying"
	next "all its stat"

	bage "changes onto"
	next "itself.@"

	text_call _GenericAlwaysGoesFirstText

	bage "Then lowers the"
	next "foe's SPECIAL"
	next "by one stage."
	dex

_SelfdestructDexEntry::
	text "The <user> explodes"
	next "in a giant fiery"
	next "fulmination."
	; fall through
_GenericExplodeDexEntry::
	bage "Does heavy recoil"
	next "damage to the"
	next "<user>;"

	bage "half the damage"
	next "inflicted. If it"
	next "misses, the <user>"

	bage "will still take"
	next "1/4 of it's full"
	next "HP in damage."

	bage "If the <user> has"
	next "less than 1/3 of"
	next "it's HP left,"

	bage "the explosion will"
	next "become extremely"
	next "powerful;"

	bage "power increases"
	next "to 500! But <user>"
	next "always faints"
	dex

_EggBombDexEntry::
	text "A bomb in an"
	next "egg or an egg-"
	next "shaped bomb is"

	bage "hurled at the"
	next "<opponent>, causing"
	next "an explosion.@"

	text_jump _Generic30PercentConfusionText

_LickDexEntry::
	text "The <user> licks"
	next "the <opponent> with"
	next "a long tongue.@"

	text_jump _Generic10PercentParalysisText

_SmogDexEntry::
	text "A puff of thick"
	next "toxic smog wafts"
	next "toward the foe.@"

	text_jump _Generic40PercentPoisonText

_SludgeDexEntry::
	text "Corrosive toxic"
	next "sludge covers the"
	next "foe's body."

	bage "Its acidity can"
	next "melt surfaces"
	next "easily.@"

	text_jump _Generic40PercentPoisonText

_BoneClubDexEntry::
	text "A bone is used"
	next "to club the"
	next "<opponent>.@"

	text_jump _Generic10PercentFlinchText

_FireBlastDexEntry::
	text "An intense blast"
	next "of all-consuming"
	next "fire engulfs the"

	bage "<opponent>."
	next "30% chance to"
	next "burn the foe"
	dex

_WaterfallDexEntry::
	text "A charge powered"
	next "up by rushing"
	next "water."

	bage "Has enough power"
	next "behind it to"
	next "climb waterfalls.@"

	text_jump _Generic30PercentFlinchText

_ClampDexEntry::
	text "Clamps the foe"
	next "with a valved"
	next "shell, jaws,"

	bage "or powerful"
	next "magnetism.@"

	text_jump _GenericTrappingMoveText


_SwiftDexEntry::
	text "Flings a barrage"
	next "of tiny stars"
	next "that never miss"

	bage "and strike vital"
	next "spots often."

	bage "May also lower"
	next "the foe's EVASION."
	dex

_SkullBashDexEntry::
	text "Charges like a"
	next "rocket and slams"
	next "the foe with a"

	bage "rock-hard skull.@"

	text_call _GenericKeptGoingCrashedText
	
	bage "Accuracy increases"
	next "to 100% when used"
	next "by ROCK #MON"
	dex

_SpikeCannonDexEntry::
	text "Rock-hard spikes"
	next "are fired at a"
	next "high velocity."

	bage "Hits 2 or 3 times."
	next "50% chance of"
	next "each outcome"
	dex

_ConstrictDexEntry::
	text "The foe is snared"
	next "and crushed by a"
	next "choking vine.@"

	text_jump _Generic30PercentParalysisText

_AmnesiaDexEntry::
	text "The <user> empties"
	next "its mind to"
	next "forget concerns."

	bage "Raises the"
	next "<user>'s SPECIAL."
	next "(+1 SPECIAL)"
	dex

_KinesisDexEntry::
	text "A shimmering heat"
	next "haze bewilders the"
	next "foe, leaving it"

	bage "confused. Has no"
	next "effect at all on"
	next "FIRE-types."

	bage "Burns the foe"
	next "instead if it is"
	next "already confused,"

	bage "or if the user is"
	next "a FIRE-type. Deals"
	next "no damage."
	dex

_SoftboiledDexEntry::
	text "A delicious egg"
	next "heals the <user>."

	bage "Heals half of"
	next "<user>'s max HP."

	bage "Usable outside"
	next "battle to heal"
	next "other #MON"
	dex

_HiJumpKickDexEntry::
	text "The <user> jumps"
	next "high in the air"
	next "to deliver a"

	bage "world-shattering"
	next "hyper-kick.@"

	text_jump _GenericKeptGoingCrashedText

_GlareDexEntry::
	text "The <opponent> is"
	next "transfixed by"
	next "terrifying eyes,"

	bage "scaring it into"
	next "being unable"
	next "to move."

	bage "Paralyzes the"
	next "<opponent>"
	dex

_DreamEaterDexEntry::
	text "Drains life from"
	next "a weakened foe to"
	next "regain HP."

	bage "Heals only if the"
	next "foe has a status"
	next "or is confused."
	dex

_PoisonGasDexEntry::
	text "Releases a cloud"
	next "of corrosive"
	next "choking gas."

	bage "Always goes first"
	next "and has a 30%"
	next "chance to make the"

	bage "foe flinch."
	dex

_BarrageDexEntry::
	text "Hurls a sinister"
	next "blob of ghostly"
	next "energy.@"

	text_jump _Generic33PercentLowerSpecialText

_LeechLifeDexEntry::
	text "Bites and sucks"
	next "energy from the"
	next "foe's life force.@"

	text_jump _GenericAbsorbMoveText

_LovelyKissDexEntry::
	text "A magic kiss is"
	next "bestowed on the"
	next "foe, lulling it"

	bage "into a deep sleep"
	next "if it works"
	dex

_SkyAttackDexEntry::
	text "A supersonic"
	next "speed attack"
	next "in which the <user>"

	bage "flies into the"
	next "stratosphere in"
	next "seconds for the"

	bage "ultimate glowing"
	next "meteor dive-bomb.@"

	text_jump _Generic25PercentRecoilText

_TransformDexEntry::
	text "Transforms into"
	next "the <opponent>"
	next "#MON."

	bage "All stats and"
	next "moves are copied."
	next "(Except HP)"

	bage "Lasts until the"
	next "end of battle.@"

	text_jump _GenericAlwaysGoesFirstText

_BubbleDexEntry::
	text "Blows a bubble"
	next "that bursts in"
	next "the foe's face.@"

	text_jump _Generic30PercentConfusionText

_DizzyPunchDexEntry::
	text "A rhythmic punch"
	next "that leaves the"
	next "foe reeling.@"

	text_jump _Generic30PercentConfusionText

_SporeDexEntry::
	text "Potent mushroom"
	next "spores densely"
	next "fill the air,"

	bage "tranquilizing"
	next "the <opponent>."

	bage "Causes the foe"
	next "to fall asleep"
	dex

_FlashDexEntry::
	text "An instantaneous"
	next "flash blinds the"
	next "foe."

	bage "Usually caused"
	next "by a powerful"
	next "electric arc."

	bage "Out of battle it"
	next "lights dark"
	next "caves... and"

	bage "elsewhere, draws"
	next "out a wild #MON"
	next "to battle!"

	bage "Always goes"
	next "first and deals"
	next "no damage."

	bage "Sharply lowers"
	next "the foe's"
	next "EVASION; may"

	bage "flinch the foe"
	next "30% of the time."
	dex

_PsywaveDexEntry::
	text "A psychic pulse"
	next "that blanks the"
	next "foe's mind."

	bage "No damage. Resets"
	next "the foe to the"
	next "BUG type and"
	cont "lowers its"
	cont "ACCURACY."
	dex

_Generic33PercentLowerSpecialText::
	bage "33% chance to"
	next "lower SPECIAL."
	next "(-1 SPECIAL)"
	dex

_SplashDexEntry::
	text "The <user> flops"
	next "around"
	next "pointlessly."

	bage "No effect at all"
	dex

_AcidArmorDexEntry::
	text "The <user> alters"
	next "its cellular"
	next "structure causing"

	bage "it to liquefy for"
	next "additional"
	next "protection."

	bage "Cuts all damage"
	next "in half, even"
	next "from crits."
	dex
	
_CrabhammerDexEntry::
	text "The <user> hammers"
	next "down mercilessly"
	next "on the <opponent>"

	bage "with a pincer,"
	next "fist, or blunt"
	next "edge.@"

	text_jump _GenericOftenLandsCriticalHitsText

_ExplosionDexEntry::
	text "The <user> explodes"
	next "like a giant bomb"
	next "that sends rocky"

	bage "shrapnel out at"
	next "supersonic speed.@"
	text_jump _GenericExplodeDexEntry

_FurySwipesDexEntry::
	text "Scratches the foe"
	next "with mud-caked"
	next "claws.@"

	text_jump _GenericNoAdditionalEffectText

_BonemerangDexEntry::
	text "Throws a bone"
	next "like a boomerang"
	next "to strike the foe"

	bage "2 times in quick"
	next "succession. Unlike"
	next "other GROUND-type"

	bage "moves, it can hit"
	next "#MON that are"
	next "FLYING-type.@"

	text_jump _Generic33PercentLowerSpeedText

_RestDexEntry::
	text "The <user> falls"
	next "asleep, healing"
	next "all damage."

	bage "Heals to full"
	next "HP and heals all"
	next "status ailments."

	bage "The <user> sleeps"
	next "for exactly 2"
	next "turns"
	dex

_RockSlideDexEntry::
	text "An avalanche of"
	next "rocks rain on"
	next "top of the foe.@"

	text_jump _Generic30PercentFlinchText

_HyperFangDexEntry::
	text "Giant teeth gnash"
	next "the <opponent>.@"

	text_jump _Generic30PercentFlinchText

_SharpenDexEntry::
	text "The <user> sharpens"
	next "its claws or"
	next "edges."

	bage "Raises ATTACK"
	next "and ACCURACY."
	next "(+1 Each)"
	dex

_ConversionDexEntry::
	text "The <user> copies"
	next "one of the foe's"
	next "moves and uses"

	bage "it at once, just"
	next "like MIMIC."

	bage "The <user> also"
	next "takes on that"
	next "move's type,"

	bage "so the copied"
	next "move is boosted"
	next "by STAB."
	dex

_TriAttackDexEntry::
	text "Shoots triangles"
	next "with properties"
	next "of 3 elements:"

	bage "Fire, ice, and"
	next "electricity."

	bage "10% chance each"
	next "of burn, freeze"
	next "or paralysis"
	dex

_SuperFangDexEntry::
	text "The <user> chomps"
	next "hard on the"
	next "foe with razor"

	bage "-sharp front"
	next "fangs."

	bage "Always does 2/3"
	next "of the <opponent>'s"
	next "current HP"
	dex

_SlashDexEntry::
	text "User heavily"
	next "slashes the foe"
	next "with claws or"

	bage "anything sharp.@"

	text_jump _GenericOftenLandsCriticalHitsText

_SubstituteDexEntry::
	text "Sacrifices 1/4"
	next "of <user>'s HP to"
	next "make a decoy doll"

	bage "that takes damage"
	next "instead of the"
	next "<user>"
	dex

_StruggleDexEntry::
	text "A last ditch"
	next "move only usable"
	next "when all moves"

	bage "have 0 PP left."
	next "Does heavy recoil"
	next "to the <user>"
	dex

; Sunsette: shared field-effect tail for SAND-ATTACK / MIST / HAZE / SMOKESCREEN, which double as
; Repel-like field moves out of battle (jumped to from each of those four entries).
_HidingFieldText::
	bage "Out of battle,"
	next "wild #MON lose"
	next "your trail like"
	bage "a REPEL, until it"
	next "fades away!"
	dex

; Sunsette: shared tail for WATER GUN / HYDRO PUMP (their WATERIFY_EFFECT retype).
_WaterifyDexText::
	bage "It also drenches"
	next "the foe, making"
	next "it a pure WATER"
	bage "type until it"
	next "leaves battle!"
	dex
