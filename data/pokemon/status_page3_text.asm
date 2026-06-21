; Sunsette: data + text for status-screen PAGE 3 (see engine/pokemon/status_page3.asm).
; All reaction strings are PlaceString format (plain text, end with @) and kept to <= 18 tiles
; so they fit the reaction box (interior 18 wide). Drafted as a first pass; revise freely.

; ============================ tables ============================

; battle-effects stat labels, in MOD_ order (Attack, Defense, Speed, Special, Accuracy, Evasion)
SP3_StatNames:
	dw SP3_StatAttack
	dw SP3_StatDefense
	dw SP3_StatSpeed
	dw SP3_StatSpecial
	dw SP3_StatAccuracy
	dw SP3_StatEvasion

; eagerness grid: index = affection bucket * SP3_NUM_HEALTH + health state
; health column order: BAD, HURT, GOOD, FAINTED
SP3_EagernessLines:
	dw SP3_EagLowBad,  SP3_EagLowHurt,  SP3_EagLowGood,  SP3_EagLowFnt
	dw SP3_EagMidBad,  SP3_EagMidHurt,  SP3_EagMidGood,  SP3_EagMidFnt
	dw SP3_EagHighBad, SP3_EagHighHurt, SP3_EagHighGood, SP3_EagHighFnt

; out-of-battle fainted line, by affection bucket (LOW, MID, HIGH)
SP3_FaintedLines:
	dw SP3_FntLow, SP3_FntMid, SP3_FntHigh

; nature-keyed pools (16 entries, nature const order)
SP3_HurtNatureLines:
	dw SP3_HurtScrappy, SP3_HurtArrogant, SP3_HurtGentle, SP3_HurtPlayful
	dw SP3_HurtConsiderate, SP3_HurtLazy, SP3_HurtDitz, SP3_HurtMorose
	dw SP3_HurtCautious, SP3_HurtGlutton, SP3_HurtCalculating, SP3_HurtHyper
	dw SP3_HurtStolid, SP3_HurtRage, SP3_HurtCruel, SP3_HurtWise

SP3_StatusNatureLines:
	dw SP3_StatScrappy, SP3_StatArrogant, SP3_StatGentle, SP3_StatPlayful
	dw SP3_StatConsiderate, SP3_StatLazy, SP3_StatDitz, SP3_StatMorose
	dw SP3_StatCautious, SP3_StatGlutton, SP3_StatCalculating, SP3_StatHyper
	dw SP3_StatStolid, SP3_StatRage, SP3_StatCruel, SP3_StatWise

; scene -> 16-entry nature table (scene const order). City/Route share Outdoor; House/Building
; share Indoor. The five themed scenes have their own sets.
SP3_SceneLineTables:
	dw SP3_SeaLines      ; SP3_SCENE_SEA
	dw SP3_ForestLines   ; SP3_SCENE_FOREST
	dw SP3_TowerLines    ; SP3_SCENE_TOWER
	dw SP3_SeafoamLines  ; SP3_SCENE_SEAFOAM
	dw SP3_VolcanoLines  ; SP3_SCENE_VOLCANO
	dw SP3_OutdoorLines  ; SP3_SCENE_CITY
	dw SP3_OutdoorLines  ; SP3_SCENE_ROUTE
	dw SP3_CaveLines     ; SP3_SCENE_CAVE
	dw SP3_IndoorLines   ; SP3_SCENE_HOUSE
	dw SP3_IndoorLines   ; SP3_SCENE_BUILDING

; themed-scene type reactions (only the first five scenes have these)
SP3_TypeReactionTables:
	dw SP3_SeaTypes      ; SP3_SCENE_SEA
	dw SP3_ForestTypes   ; SP3_SCENE_FOREST
	dw SP3_TowerTypes    ; SP3_SCENE_TOWER
	dw SP3_SeafoamTypes  ; SP3_SCENE_SEAFOAM
	dw SP3_VolcanoTypes  ; SP3_SCENE_VOLCANO

SP3_SeaTypes:
	db WATER
	dw SP3_TRSeaWater
	db FIRE
	dw SP3_TRSeaFire
	db ROCK
	dw SP3_TRSeaRock
	db GROUND
	dw SP3_TRSeaGround
	db SP3_TYPE_END

SP3_ForestTypes:
	db GRASS
	dw SP3_TRForestGrass
	db FLYING
	dw SP3_TRForestFly
	db NORMAL
	dw SP3_TRForestNormal
	db SP3_TYPE_END

SP3_TowerTypes:
	db GHOST
	dw SP3_TRTowerGhost
	db PSYCHIC_TYPE
	dw SP3_TRTowerPsychic
	db SP3_TYPE_WILDCARD
	dw SP3_TRTowerScared
	db SP3_TYPE_END

SP3_SeafoamTypes:
	db ICE
	dw SP3_TRSeafoamIce
	db SP3_TYPE_END

SP3_VolcanoTypes:
	db FIRE
	dw SP3_TRVolcanoFire
	db ROCK
	dw SP3_TRVolcanoRock
	db GROUND
	dw SP3_TRVolcanoGround
	db WATER
	dw SP3_TRVolcanoWater
	db SP3_TYPE_END

SP3_OutdoorLines:
	dw SP3_OutScrappy, SP3_OutArrogant, SP3_OutGentle, SP3_OutPlayful
	dw SP3_OutConsiderate, SP3_OutLazy, SP3_OutDitz, SP3_OutMorose
	dw SP3_OutCautious, SP3_OutGlutton, SP3_OutCalculating, SP3_OutHyper
	dw SP3_OutStolid, SP3_OutRage, SP3_OutCruel, SP3_OutWise

SP3_IndoorLines:
	dw SP3_InScrappy, SP3_InArrogant, SP3_InGentle, SP3_InPlayful
	dw SP3_InConsiderate, SP3_InLazy, SP3_InDitz, SP3_InMorose
	dw SP3_InCautious, SP3_InGlutton, SP3_InCalculating, SP3_InHyper
	dw SP3_InStolid, SP3_InRage, SP3_InCruel, SP3_InWise

SP3_CaveLines:
	dw SP3_CaveScrappy, SP3_CaveArrogant, SP3_CaveGentle, SP3_CavePlayful
	dw SP3_CaveConsiderate, SP3_CaveLazy, SP3_CaveDitz, SP3_CaveMorose
	dw SP3_CaveCautious, SP3_CaveGlutton, SP3_CaveCalculating, SP3_CaveHyper
	dw SP3_CaveStolid, SP3_CaveRage, SP3_CaveCruel, SP3_CaveWise

SP3_SeaLines:
	dw SP3_SeaScrappy, SP3_SeaArrogant, SP3_SeaGentle, SP3_SeaPlayful
	dw SP3_SeaConsiderate, SP3_SeaLazy, SP3_SeaDitz, SP3_SeaMorose
	dw SP3_SeaCautious, SP3_SeaGlutton, SP3_SeaCalculating, SP3_SeaHyper
	dw SP3_SeaStolid, SP3_SeaRage, SP3_SeaCruel, SP3_SeaWise

SP3_ForestLines:
	dw SP3_ForScrappy, SP3_ForArrogant, SP3_ForGentle, SP3_ForPlayful
	dw SP3_ForConsiderate, SP3_ForLazy, SP3_ForDitz, SP3_ForMorose
	dw SP3_ForCautious, SP3_ForGlutton, SP3_ForCalculating, SP3_ForHyper
	dw SP3_ForStolid, SP3_ForRage, SP3_ForCruel, SP3_ForWise

SP3_TowerLines:
	dw SP3_TowScrappy, SP3_TowArrogant, SP3_TowGentle, SP3_TowPlayful
	dw SP3_TowConsiderate, SP3_TowLazy, SP3_TowDitz, SP3_TowMorose
	dw SP3_TowCautious, SP3_TowGlutton, SP3_TowCalculating, SP3_TowHyper
	dw SP3_TowStolid, SP3_TowRage, SP3_TowCruel, SP3_TowWise

SP3_SeafoamLines:
	dw SP3_SfScrappy, SP3_SfArrogant, SP3_SfGentle, SP3_SfPlayful
	dw SP3_SfConsiderate, SP3_SfLazy, SP3_SfDitz, SP3_SfMorose
	dw SP3_SfCautious, SP3_SfGlutton, SP3_SfCalculating, SP3_SfHyper
	dw SP3_SfStolid, SP3_SfRage, SP3_SfCruel, SP3_SfWise

SP3_VolcanoLines:
	dw SP3_VolScrappy, SP3_VolArrogant, SP3_VolGentle, SP3_VolPlayful
	dw SP3_VolConsiderate, SP3_VolLazy, SP3_VolDitz, SP3_VolMorose
	dw SP3_VolCautious, SP3_VolGlutton, SP3_VolCalculating, SP3_VolHyper
	dw SP3_VolStolid, SP3_VolRage, SP3_VolCruel, SP3_VolWise

; ============================ strings ============================

; battle-effects labels
SP3_BattleStateHeader: db "BATTLE STATE@"
SP3_ScreenedStr:  db "SCREENED@"
SP3_WalledStr:    db "WALLED@"
SP3_LeechedStr:   db "LEECHED@"
SP3_FlourishStr:  db "FLOURISH@"
SP3_FlourishX2Str: db "FLOURISH x2@"
SP3_ConfusedStr:  db "CONFUSED@"
SP3_AsleepStr:    db "ASLEEP@"
SP3_AdaptedStr:   db "ADAPTED:@" ; Sunsette: ADAPTATION - followed by the resisted type name at col 10
SP3_NoEffectsStr: db "The battle is on!@"

SP3_StatAttack:   db "ATTACK@"
SP3_StatDefense:  db "DEFENSE@"
SP3_StatSpeed:    db "SPEED@"
SP3_StatSpecial:  db "SPECIAL@"
SP3_StatAccuracy: db "ACCURACY@"
SP3_StatEvasion:  db "EVASION@"

; eagerness
SP3_EagLowBad:   db "Won't risk this.@"
SP3_EagLowHurt:  db "Hangs back, wary.@"
SP3_EagLowGood:  db "Cool, but ready.@"
SP3_EagLowFnt:   db "Down. It tried.@"
SP3_EagMidBad:   db "Hurt, but willing.@"
SP3_EagMidHurt:  db "Worn, yet willing.@"
SP3_EagMidGood:  db "Ready and steady.@"
SP3_EagMidFnt:   db "Down. Gave plenty.@"
SP3_EagHighBad:  db "Battered, defiant!@"
SP3_EagHighHurt: db "Hurt, won't quit!@"
SP3_EagHighGood: db "Burning to fight!@"
SP3_EagHighFnt:  db "Fainted, for you.@"

; out-of-battle fainted
SP3_FntLow:  db "Down. It tried.@"
SP3_FntMid:  db "Fainted. Rest now.@"
SP3_FntHigh: db "Out cold, for you.@"

; hurt (HP medium or worse)
SP3_HurtScrappy:     db "Tough! Keep going.@"
SP3_HurtArrogant:    db "A mere scratch.@"
SP3_HurtGentle:      db "Hurts, but smiles.@"
SP3_HurtPlayful:     db "Owie... still fun?@"
SP3_HurtConsiderate: db "Don't fret for it.@"
SP3_HurtLazy:        db "Time to rest now.@"
SP3_HurtDitz:        db "Why's it sore?@"
SP3_HurtMorose:      db "Pain, as expected.@"
SP3_HurtCautious:    db "Should pull back.@"
SP3_HurtGlutton:     db "Food would help.@"
SP3_HurtCalculating: db "Logs the damage.@"
SP3_HurtHyper:       db "Walk it off! Go!@"
SP3_HurtStolid:      db "It bears the pain.@"
SP3_HurtRage:        db "The pain feeds it!@"
SP3_HurtCruel:       db "Wants to hit back.@"
SP3_HurtWise:        db "Heal, then return.@"

; status condition
SP3_StatScrappy:     db "Won't let it win.@"
SP3_StatArrogant:    db "How undignified.@"
SP3_StatGentle:      db "Bears it gently.@"
SP3_StatPlayful:     db "Feels real funny.@"
SP3_StatConsiderate: db "Hides its hurt.@"
SP3_StatLazy:        db "Slows it down more.@"
SP3_StatDitz:        db "Feels weird, hm?@"
SP3_StatMorose:      db "Typical luck.@"
SP3_StatCautious:    db "Needs a remedy.@"
SP3_StatGlutton:     db "Off its appetite.@"
SP3_StatCalculating: db "Notes the effect.@"
SP3_StatHyper:       db "Shake it off! Go!@"
SP3_StatStolid:      db "Pushes through it.@"
SP3_StatRage:        db "Furious at itself.@"
SP3_StatCruel:       db "Sour and snappish.@"
SP3_StatWise:        db "This too will pass.@"

; outdoor (city / route)
SP3_OutScrappy:     db "Itching to brawl.@"
SP3_OutArrogant:    db "Let them stare.@"
SP3_OutGentle:      db "Kind, open air.@"
SP3_OutPlayful:     db "So much to chase!@"
SP3_OutConsiderate: db "Keeps near you.@"
SP3_OutLazy:        db "Good spot to nap.@"
SP3_OutDitz:        db "Ooh, which way?@"
SP3_OutMorose:      db "The road drags on.@"
SP3_OutCautious:    db "Scanning corners.@"
SP3_OutGlutton:     db "Smells food close.@"
SP3_OutCalculating: db "Marking the exits.@"
SP3_OutHyper:       db "Go go, let's move!@"
SP3_OutStolid:      db "Walks on, unmoved.@"
SP3_OutRage:        db "Glares ahead.@"
SP3_OutCruel:       db "Hunts easy prey.@"
SP3_OutWise:        db "Reads the sky.@"

; indoor (house / building)
SP3_InScrappy:     db "Cooped up inside.@"
SP3_InArrogant:    db "Hardly impressed.@"
SP3_InGentle:      db "Cozy and calm.@"
SP3_InPlayful:     db "Pokes at it all.@"
SP3_InConsiderate: db "Minds its manners.@"
SP3_InLazy:        db "Curls up indoors.@"
SP3_InDitz:        db "Where are we now?@"
SP3_InMorose:      db "Walls closing in.@"
SP3_InCautious:    db "Notes every door.@"
SP3_InGlutton:     db "Sniffs for snacks.@"
SP3_InCalculating: db "Counts the rooms.@"
SP3_InHyper:       db "Off the walls!@"
SP3_InStolid:      db "Waits by the wall.@"
SP3_InRage:        db "Penned and angry.@"
SP3_InCruel:       db "Eyes weaker ones.@"
SP3_InWise:        db "Quiet, watchful.@"

; cave
SP3_CaveScrappy:     db "Bring on the dark!@"
SP3_CaveArrogant:    db "Filthy down here.@"
SP3_CaveGentle:      db "Hugs your light.@"
SP3_CavePlayful:     db "Echoes! Echoes!@"
SP3_CaveConsiderate: db "Guides your step.@"
SP3_CaveLazy:        db "Dark. Why move?@"
SP3_CaveDitz:        db "Which way was out?@"
SP3_CaveMorose:      db "A fitting gloom.@"
SP3_CaveCautious:    db "Listens for drips.@"
SP3_CaveGlutton:     db "Smells damp moss.@"
SP3_CaveCalculating: db "Maps the tunnels.@"
SP3_CaveHyper:       db "Spelunk, spelunk!@"
SP3_CaveStolid:      db "The dark is fine.@"
SP3_CaveRage:        db "Hates this murk.@"
SP3_CaveCruel:       db "Loves the shadows.@"
SP3_CaveWise:        db "The stone is old.@"

; sea (nature fallback)
SP3_SeaScrappy:     db "Dares the waves.@"
SP3_SeaArrogant:    db "The sea suits it.@"
SP3_SeaGentle:      db "Loves the tide.@"
SP3_SeaPlayful:     db "Splash! Splash!@"
SP3_SeaConsiderate: db "Minds the current.@"
SP3_SeaLazy:        db "Floats lazily.@"
SP3_SeaDitz:        db "So much... blue!@"
SP3_SeaMorose:      db "The grey horizon.@"
SP3_SeaCautious:    db "Wary of the deep.@"
SP3_SeaGlutton:     db "Smells fresh fish.@"
SP3_SeaCalculating: db "Reads the tides.@"
SP3_SeaHyper:       db "Wave after wave!@"
SP3_SeaStolid:      db "Calm as the shore.@"
SP3_SeaRage:        db "Churns like surf.@"
SP3_SeaCruel:       db "Cold as the deep.@"
SP3_SeaWise:        db "The deep knows.@"

; forest (nature fallback)
SP3_ForScrappy:     db "Crashes the brush.@"
SP3_ForArrogant:    db "King of the trees.@"
SP3_ForGentle:      db "At peace in green.@"
SP3_ForPlayful:     db "Hide and seek!@"
SP3_ForConsiderate: db "Steps softly here.@"
SP3_ForLazy:        db "Shade for a nap.@"
SP3_ForDitz:        db "So many trees!@"
SP3_ForMorose:      db "Lost among trees.@"
SP3_ForCautious:    db "Hears each rustle.@"
SP3_ForGlutton:     db "Berries somewhere?@"
SP3_ForCalculating: db "Marks each trail.@"
SP3_ForHyper:       db "Tag, you're it!@"
SP3_ForStolid:      db "Rooted and calm.@"
SP3_ForRage:        db "Rips at the vines.@"
SP3_ForCruel:       db "Stalks the ferns.@"
SP3_ForWise:        db "The old wood hums.@"

; tower (nature fallback)
SP3_TowScrappy:     db "Spooks? Bring it.@"
SP3_TowArrogant:    db "Even spirits bow.@"
SP3_TowGentle:      db "Mourns the lost.@"
SP3_TowPlayful:     db "Spooky, hehe!@"
SP3_TowConsiderate: db "Pays its respects.@"
SP3_TowLazy:        db "Too tired to fear.@"
SP3_TowDitz:        db "Was that a ghost?@"
SP3_TowMorose:      db "It feels at home.@"
SP3_TowCautious:    db "Hairs on end here.@"
SP3_TowGlutton:     db "Even here, hungry.@"
SP3_TowCalculating: db "Counts the graves.@"
SP3_TowHyper:       db "Boo! Boo! Boo!@"
SP3_TowStolid:      db "Unmoved by ghosts.@"
SP3_TowRage:        db "Dares the dead.@"
SP3_TowCruel:       db "Grins at graves.@"
SP3_TowWise:        db "Honors the dead.@"

; seafoam (nature fallback)
SP3_SfScrappy:     db "Cold? So what.@"
SP3_SfArrogant:    db "Ice befits it.@"
SP3_SfGentle:      db "Shivers near you.@"
SP3_SfPlayful:     db "Slip and slide!@"
SP3_SfConsiderate: db "Warms up to you.@"
SP3_SfLazy:        db "Too cold to move.@"
SP3_SfDitz:        db "Brr, so sparkly!@"
SP3_SfMorose:      db "Cold as it feels.@"
SP3_SfCautious:    db "Tests the ice.@"
SP3_SfGlutton:     db "Snow looks tasty.@"
SP3_SfCalculating: db "Tracks the ice.@"
SP3_SfHyper:       db "Slide and slide!@"
SP3_SfStolid:      db "The chill is fine.@"
SP3_SfRage:        db "Smashes the ice.@"
SP3_SfCruel:       db "Cold to the bone.@"
SP3_SfWise:        db "Patient as ice.@"

; volcano (nature fallback)
SP3_VolScrappy:     db "Heat fires it up!@"
SP3_VolArrogant:    db "A throne of flame.@"
SP3_VolGentle:      db "Wary of the heat.@"
SP3_VolPlayful:     db "Hot hot hot!@"
SP3_VolConsiderate: db "Guards the edge.@"
SP3_VolLazy:        db "Too hot to bother.@"
SP3_VolDitz:        db "Ooh, glowy rocks!@"
SP3_VolMorose:      db "Ash and embers.@"
SP3_VolCautious:    db "Minds each ledge.@"
SP3_VolGlutton:     db "Smells like roast.@"
SP3_VolCalculating: db "Times the bursts.@"
SP3_VolHyper:       db "Lava! So cool!@"
SP3_VolStolid:      db "Heat means little.@"
SP3_VolRage:        db "Hot as its temper.@"
SP3_VolCruel:       db "Savors the heat.@"
SP3_VolWise:        db "The peak breathes.@"

; type reactions
SP3_TRSeaWater:      db "Home in the waves!@"
SP3_TRSeaFire:       db "Loathes the spray.@"
SP3_TRSeaRock:       db "Wants dry land.@"
SP3_TRSeaGround:     db "Detests the water.@"
SP3_TRForestGrass:   db "Right at home here.@"
SP3_TRForestFly:     db "Loves the canopy.@"
SP3_TRForestNormal:  db "At home in green.@"
SP3_TRTowerGhost:    db "Right at home.@"
SP3_TRTowerPsychic:  db "Guards its mind.@"
SP3_TRTowerScared:   db "Spooked stiff!@"
SP3_TRSeafoamIce:    db "Loves the cold!@"
SP3_TRVolcanoFire:   db "Loves the heat!@"
SP3_TRVolcanoRock:   db "At home in heat.@"
SP3_TRVolcanoGround: db "At ease in ash.@"
SP3_TRVolcanoWater:  db "Wilts in the heat.@"
