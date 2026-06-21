; PureRGBnote: ADDED: text pointers for the descriptions that show up in the movedex.

_PoundDexEntry::
	text "A leap of current"
	next "that crackles into"
	next "the foe."

	bage "30% chance to"
	next "paralyze the foe."
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

_DemolishDexEntry::
	text "Shatters the foe's"
	next "REFLECT and LIGHT"
	next "SCREEN, then hits."
	; fall through
_GenericOftenLandsCriticalHitsText::
	bage "Often lands"
	next "critical hits"
	dex

_DoubleslapDexEntry::
	text "Slaps the foe 2-5"
	next "times in a row."

	bage "Power doubles on a"
	next "sleeping foe, but"
	next "wakes it up."
	dex

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
	text "A rising uppercut"
	next "that strikes even"
	next "airborne foes."

	bage "It knocks away the"
	next "foe's FLYING or"
	next "FLOATING type."
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
	text "Bites down harder"
	next "the more cornered"
	next "the user is."

	bage "May confuse the"
	next "foe, and always"
	next "when desperate."
	dex

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
	text "Slices the foe,"
	next "also DISABLING its"
	next "last move!"

	bage "Out of battle, it"
	next "cuts down shrubs"
	next "and clears grass."
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

	bage "Strikes foes that"
	next "are flying high."
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
	text "A relentless,"
	next "crushing hold on"
	next "the foe."

	bage "30% to FLINCH,"
	next "and always cuts"
	next "the foe's SPEED."
	dex

_SlamDexEntry::
	text "A fierce twister"
	next "that batters even"
	next "airborne foes.@"
	text_jump _Generic30PercentFlinchText


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
	text "Soars up high then"
	next "dives at the foe"
	next "with great force."
	; fall through
_GenericKeptGoingCrashedText::
	bage "Does damage to"
	next "<user> on missing."

	bage "25% of the damage"
	next "it would have"
	next "done to the foe"
	dex

_RollingKickDexEntry::
	text "Rolls like a stone"
	next "into a sweeping"
	next "kick."

	bage "Lowers the foe's"
	next "SPEED and EVASION."
	next "(-1 each)"
	dex

_SandAttackDexEntry::
	text "Blinds the foe"
	next "with a spray of"
	next "sand.@"

	text_call _GenericLowerAccuracyText

	bage "FLYING #MON's"
	next "keen eyes are"
	next "unaffected."
	dex ; Sunsette: SAND-ATTACK no longer has a field move
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
	text "Hurls a ball of"
	next "mud at the foe."

	bage "May cut the foe's"
	next "ACCURACY with the"
	next "splattering muck."
	dex

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

	bage "30% to FLINCH,"
	next "and always cuts"
	next "the foe's SPEED."
	dex

; Sunsette: unused now (trapping replaced by flinch + riders); kept so text-bank offsets don't shift
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
	next "into deep sleep.@"
	text_jump _SleepAndDrawRareTail

; Sunsette: shared tail for SING / HYPNOSIS - "puts foe to sleep" then the invert-rarity field line.
_SleepAndDrawRareTail::
	bage "Puts the foe to"
	next "sleep if it"
	next "works."
	; fall through
; Sunsette: shared invert-wild-encounter-rarity field line for METRONOME / SING / HYPNOSIS
; (the effect formerly on GROWTH/FLOURISH).
_DrawRareFieldText::
	bage "Out of battle, it"
	next "draws rare #MON"
	next "out to the area."
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

	bage "Strikes first."
	next "Locks the last"
	next "move 2 to 8 turns."

	bage "Fails if the foe"
	next "has yet to move."
	dex

_AcidDexEntry::
	text "A spray of acid"
	next "is unleashed on"
	next "the <opponent>."

	bage "Has a chance to"
	next "lower the foe's"
	next "DEFENSE."
	dex

_EmberDexEntry::
	text "Sparks ignite"
	next "small flames to"
	next "scorch the foe.@"

	text_jump _Generic10PercentBurnText

_FlamethrowerDexEntry::
	text "A jet of searing"
	next "flame. 30% chance"
	next "to BURN the foe."

	bage "Out of battle it"
	next "burns away tall"
	next "grass and trees!"
	dex

_MistDexEntry::
	text "An icy aurora"
	next "settles over the"
	next "battlefield."

	bage "Clears status from"
	next "BOTH mons; the"
	next "user's stats can't"

	bage "be lowered. An ICE"
	next "user raises both"
	next "screens; others"

	bage "turn to ICE and"
	next "take a cyan coat."
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

	text_jump _GenericNoAdditionalEffectText


_SurfDexEntry::
	text "Floods the area."
	next "Can't miss, and"
	next "hits DIG users."

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
	next "storm."

	bage "Hits FLY users,"
	next "with a 30% chance"
	next "to FREEZE the foe."
	dex

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
	text "A ring of pulsing"
	next "water slams into"
	next "the foe."
	; fall through
	text_jump _Generic30PercentConfusionText

_AuroraBeamDexEntry::
	text "A beautiful"
	next "multicolored beam"
	next "of light is shot"

	bage "at the <opponent>.@"

	text_jump _Generic33PercentLowerAttackText

_HyperBeamDexEntry::
	text "A beam of pure"
	next "destruction, worse"
	next "the more dire."

	bage "Uses SPECIAL. Must"
	next "rest next turn, or"
	next "confuse on a KO."

	bage "Shatters screens"
	next "when desperate."
	dex

_PeckDexEntry::
	text "The <user> pecks"
	next "the foe with"
	next "a beak or horn.@"

	text_jump _GenericNoAdditionalEffectText

_DrillPeckDexEntry::
	text "Strikes from the"
	next "air with vicious"
	next "precision, using"

	bage "a wicked, sharp"
	next "weapon."

	bage "Also DISABLEs the"
	next "foe's last move!"
	dex

_SubmissionDexEntry::
	text "Breaks the foe's"
	next "rhythm, DISABLING"
	next "its last move."

	bage "Always goes first,"
	next "but is wildly off"
	next "while healthy."
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

	text_jump _GenericNoAdditionalEffectText

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

	bage "Always crits a"
	next "foe that has a"
	next "status problem."
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
	text "Hurls the foe with"
	next "raw power."

	page "30% chance to"
	next "raise the user's"
	next "ATTACK. (+1)"

	page "A lighter user"
	next "recoils off a"
	next "heavier foe.@"

	bage "Usable outside of"
	next "battle to push"
	next "heavy objects."
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
	text "Plants seeds that"
	next "sap the foe's HP"
	next "each turn."

	bage "Half the loss"
	next "heals you. Fails"
	next "on GRASS #MON."

	bage "Affected by the"
	next "foe's weakness"
	next "and resistance."
	dex

_GrowthDexEntry::
	text "The user adapts"
	next "and cures its"
	next "status, then"

	bage "halves later hits"
	next "of the SPECIAL or"
	next "GHOST type it took"

	bage "Heals 1/16 a turn."
	next "Fails if it has"
	next "not been hit."
	dex

_RazorLeafDexEntry::
	text "A flurry of razor"
	next "sharp leaves are"
	next "hurled at foe.@"

	text_jump _GenericOftenLandsCriticalHitsText

_SolarbeamDexEntry::
	text "1st turn gathers"
	next "light, raising"
	next "SPECIAL. (+1)"

	bage "2nd turn fires a"
	next "searing beam, may"
	next "BURN, drops SPC."

	bage "FIRE types skip"
	next "the charge: full"
	next "power + recoil."
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
	text_jump _HidingFieldText ; Sunsette: out-of-battle repel-like hiding

_StunSporeDexEntry::
	text "A numbing powder"
	next "cloud is spread"
	next "around the foe."

	bage "Paralyzes the foe"
	next "if it works"
	text_jump _HidingFieldText ; Sunsette: out-of-battle repel-like hiding

_SleepPowderDexEntry::
	text "A big cloud of"
	next "sleep-inducing"
	next "dust is spread."

	bage "Puts the foe to"
	next "sleep if it"
	next "works."
	text_jump _HidingFieldText ; Sunsette: out-of-battle repel-like hiding


_PetalDanceDexEntry::
	text "A storm of a"
	next "thousand blades,"
	next "fiercer when dire."

	bage "Heals over time,"
	next "and doubly so when"
	next "near defeat."
	dex

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
	next "the <opponent>."

	bage "30% to FLINCH,"
	next "and a 30% chance"
	next "to BURN the foe."
	dex

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

	bage "on the foe. Hits"
	next "FLY users, too.@"

	text_jump _Generic10PercentParalysisText

_RockThrowDexEntry::
	text "Rocks are dropped"
	next "on the foe.@"

	text_jump _GenericNoAdditionalEffectText

_EarthquakeDexEntry::
	text "Sets off a quake"
	next "that can't miss"
	next "and hits DIG foes."

	bage "Commonly referred"
	next "to by trainers as"
	next "“Old Reliable”@"

	text_jump _Generic30PercentLowerEvasionText

_FissureDexEntry::
	text "The <user> packs"
	next "earthen plates"
	next "over its body."

	bage "Earthbound types"
	next "raise REFLECT and"
	next "LIGHT SCREEN."

	bage "GROUND users also"
	next "heal half their"
	next "HP. Fails if a"

	bage "screen is up, or"
	next "the user is"
	next "airborne."
	dex

_DigDexEntry::
	text "Burrows down for a"
	next "turn, then erupts"
	next "to strike the foe."

	bage "While underground"
	next "it can't be hit"
	next "and gains EVASION."

	bage "Usable outside"
	next "battle to dig out"
	next "of caves"
	dex

_ToxicDexEntry::
	text "Sprays a torrent"
	next "of vicious poison."

	bage "Badly poisons the"
	next "foe, dealing more"
	next "damage each turn."

	bage "Always hits when"
	next "used by a POISON"
	next "#MON."
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

	text_jump _SleepAndDrawRareTail ; Sunsette: asleep tail + invert-rarity field line

_MeditateDexEntry::
	text "Steels the user's"
	next "mind and body."

	bage "Raises a LIGHT"
	next "SCREEN and ATTACK."
	next "(+1 ATTACK)"

	bage "Always goes first."
	dex

_AgilityDexEntry::
	text "A burst of"
	next "adrenaline lets"
	next "the <user> move"
	next "blindingly fast."

	bage "Greatly raises"
	next "SPEED. (+2)"

	bage "Halves GROUND-type"
	next "damage; works"
	next "differently for"
	next "airborne #MON."
	dex

_BlitzStrikeDexEntry::
	text "A blinding lunge"
	next "that always goes"
	next "first."

	bage "Hits harder and"
	next "never misses when"
	next "near defeat."
	dex

_RageDexEntry::
	text "A reckless charge"
	next "fueled by pain."

	bage "Raises ATTACK"
	next "more the worse off"
	next "the user is."

	bage "When desperate, it"
	next "also sheds its own"
	next "afflictions."
	dex

_TeleportDexEntry::
	text "Flees a wild"
	next "battle in a flash."

	bage "In trainer fights,"
	next "the user switches"
	next "out, healing 25%."

	bage "Out of battle, it"
	next "returns you to a"
	next "#MON CENTER"
	dex

_NightShadeDexEntry::
	text "A pervasive dark"
	next "engulfs the foe,"
	next "scaring them.@"

	text_jump _Generic30PercentParalysisText

_MimicDexEntry::
	text "Copies one of the"
	next "foe's moves and"
	next "uses it at once."

	bage "The move is kept"
	next "for the rest of"
	next "the battle."
	dex

_ScreechDexEntry::
	text "Never misses. Cuts"
	next "the foe's DEFENSE"
	next "sharply. (-2 DEF)"

	bage "Echoes all battle,"
	next "waking any #MON"
	next "that are asleep."

	bage "Auto-fires if the"
	next "user is put to"
	next "sleep."
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
	next "foe."

	bage "Out of battle, it"
	next "lures out an oddly"
	next "colored #MON!"
	dex

_WithdrawDexEntry::
	text "A shell shuffle:"
	next "soaks the foe to"
	next "WATER type,"

	bage "then you pick:"
	next "switch out (flee"
	next "if wild),"

	bage "or stay and gain"
	next "REFLECT instead."
	dex

_DefenseCurlDexEntry::
	text "Resets its stats,"
	next "then braces the"
	next "foe's last type."

	bage "When hurt, raises"
	next "DEFENSE and stops"
	next "all sleep."

	bage "When dire, raises"
	next "SPECIAL and heals."
	dex

_BarrierDexEntry::
	text "A sturdy energy"
	next "barrier is raised"
	next "by the <user>."

	bage "Greatly raises"
	next "DEFENSE (+2) and"
	next "halves NORMAL-type"
	next "damage taken."
	dex

_LightScreenDexEntry::
	text "Halves SPECIAL"
	next "damage taken, even"
	next "from crits."
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
	text "A shadow game that"
	next "resets all stat"
	next "changes."

	bage "Major status like"
	next "sleep or burn is"
	next "left untouched."

	bage "Then badly poisons"
	next "both, and raises"
	next "their EVASION.@"
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
	next "hits by 4×."

	bage "Also raises the"
	next "user's DEFENSE."
	next "(+1)"
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
	text_jump _DrawRareFieldText ; Sunsette: invert-rarity field line

_MirrorMoveDexEntry::
	text "The <user> mimics"
	next "the foe, copying"
	next "all its stat"

	bage "changes onto"
	next "itself.@"

	bage "Then leaves the"
	next "foe confused."
	dex

_SelfdestructDexEntry::
	text "The <user> ignites"
	next "in a searing"
	next "stellar blast."

	bage "A FIRE user pays"
	next "no recoil, sheds"
	next "its FIRE type."

	bage "Anyone else takes"
	next "heavy recoil and"
	next "is left burned."
	dex

; Sunsette: dead label kept for stability (EXPLOSION/SELFDESTRUCT now have their own standalone entries).
_GenericExplodeDexEntry::
	bage "The user takes"
	next "recoil: half the"
	next "damage it deals."

	bage "A miss still costs"
	next "1/4 max HP."

	bage "Below 1/3 HP, its"
	next "power hits 500;"
	next "it always faints!"
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
	next "toward the foe."

	bage "40% chance of"
	next "poisoning the"
	next "foe."
	text_jump _HidingFieldText ; Sunsette: out-of-battle repel-like hiding

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
	text "A surging ocean"
	next "current drags the"
	next "foe under."

	bage "The undertow may"
	next "raise the user's"
	next "SPEED. (50%)"
	dex

_ClampDexEntry::
	text "Clamps the foe"
	next "with a valved"
	next "shell, jaws,"

	bage "or powerful"
	next "magnetism."

	bage "30% to FLINCH;"
	next "raises the"
	next "user's DEFENSE."
	dex


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
	text "A venom-soaked"
	next "lash snares the"
	next "foe."

	bage "DISABLEs the foe's"
	next "last move."
	dex

_AmnesiaDexEntry::
	text "The <user> empties"
	next "its mind to"
	next "forget concerns."

	bage "Raises SPECIAL by"
	next "1, and ends the"
	next "user's CONFUSION."
	dex

_KinesisDexEntry::
	text "A heat haze that"
	next "saps the foe's"
	next "SPECIAL and BURNS"

	bage "it, through any"
	next "status. No drop if"
	next "already burned."

	bage "FIRE is immune;"
	next "ROCK shrugs off"
	next "the burn. No DMG."
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

_VanillaExplosionDexEntry::
	text "The user bursts"
	next "in a colossal"
	next "blast, fainting"
	next "itself."

	bage "Halves the foe's"
	next "DEFENSE for huge"
	next "NORMAL damage."
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
	text "Forces the foe to"
	next "violently purge"
	next "its stomach."

	bage "Always goes first"
	next "and voids the"
	next "foe's stat boosts."

	bage "Then poisons it."
	next "POISON and GHOST"
	next "are immune."
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
	text "A dizzying flurry"
	next "of rhythmic jabs"
	next "that rattle the"
	next "foe's senses.@"

	text_jump _Generic30PercentConfusionText

_SporeDexEntry::
	text "Potent mushroom"
	next "spores densely"
	next "fill the air,"

	bage "tranquilizing"
	next "the <opponent>."

	bage "Causes the foe"
	next "to fall asleep"
	text_jump _HidingFieldText ; Sunsette: out-of-battle repel-like hiding

_FlashDexEntry::
	text "A blinding flash"
	next "that dazzles the"
	next "foe."

	bage "Lights dark caves,"
	next "and attracts wild"
	next "#MON elsewhere."

	bage "Resets the foe's"
	next "stat changes, then"
	next "sharply lowers its"
	next "ACCURACY."
	dex

_PsywaveDexEntry::
	text "A psychic pulse"
	next "that blanks the"
	next "foe's mind."

	bage "No damage. Resets"
	next "the foe to the"
	next "BUG type and"
	cont "confuses it."
	dex

_Generic33PercentLowerSpecialText::
	bage "33% chance to"
	next "lower SPECIAL."
	next "(-1 SPECIAL)"
	dex

_SplashDexEntry::
	text "Well, it might"
	next "help if you were"
	next "very, very heavy."

	bage "...like a kaiju"
	next "splashing around."
	next "THAT would hurt!"
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
	text "The <user> bursts"
	next "its stony shell in"
	next "a painful rebirth."

	bage "Heavy recoil: half"
	next "the damage dealt."

	bage "A ROCK user sheds"
	next "ROCK, surges to +6"
	next "SPEED, and glows."
	dex

_FurySwipesDexEntry::
	text "Scratches the foe"
	next "with mud-caked"
	next "claws.@"

	bage "30% chance to"
	next "lower the foe's"
	next "ACCURACY."
	dex

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
	text "Copies a foe's"
	next "move and uses it"
	next "at once, as MIMIC."

	bage "The user becomes"
	next "that move's type,"
	next "so it gets STAB."
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

; Sunsette: legendary-bird signature moves (ARTICUNO / ZAPDOS / MOLTRES). Effects mirror the moves
; they were cloned from, plus each bird's species bonus (SpeciesMoveBonus): freeze / paralyze / burn.
_WinterGaleDexEntry::
	text "A howling icy"
	next "cyclone tears"
	next "into the foe."

	bage "May confuse, and"
	next "ARTICUNO's gale"
	next "can FREEZE solid!"
	dex

_StormDrillDexEntry::
	text "A spinning bolt"
	next "drills the foe"
	next "at close range."

	bage "DISABLEs the last"
	next "move, and ZAPDOS'"
	next "drill can PARALYZE!"
	dex

_PhoenixDiveDexEntry::
	text "A blazing dive"
	next "from on high that"
	next "recoils the <user>."

	bage "MOLTRES' flames"
	next "may BURN the foe"
	next "and renew itself!"
	dex

_MaximizeDexEntry:: ; Sunsette: MAXIMIZE
	text "The user swells"
	next "to its utmost,"
	next "trading agility"
	next "for raw power."

	bage "Maxes the user's"
	next "ATTACK, but cuts"
	next "its SPEED and"
	cont "EVASION sharply."
	dex

_CrystallizeDexEntry::
	text "The user encases"
	next "itself in mineral"
	next "crystal."

	bage "Sharply raises"
	next "DEFENSE, and turns"
	next "type 1 to CRYSTAL"
	cont "(Rock) or ROCK."
	dex

_QuickAttackDexEntry::
	text "A fast strike that"
	next "always goes first."

	bage "Hits harder the"
	next "more desperate the"
	next "user is, and never"
	cont "misses when dire."
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

; Sunsette: shared tail for SUPER SOAK (WATER GUN) - its WATERIFY_EFFECT retype.
_WaterifyDexText::
	bage "It also drenches"
	next "the foe, making"
	next "it a pure WATER"
	bage "type until it"
	next "leaves battle!"
	dex
