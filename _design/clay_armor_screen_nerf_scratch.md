# SCRATCH: Clay Armor rework + general screen nerf (BUILT 2026-06-24, 4 ROMs clean, NEEDS PLAYTEST)

**BUILT 2026-06-24** — all five items implemented, all 4 ROMs compile clean. NEEDS PLAYTEST.
Two implementation notes vs the spec below:
  - EXTERMINATE "moved second": shipped with the **option-B proxy** (FINISHER_INTERRUPTED = "the user was HIT
    first this turn"), NOT the full moved-second flag (option A). Reason discovered at build: Battle Core (which
    includes effects.asm) had only ~85 bytes free and the rest of the pass nearly filled it; option B is zero
    new state / zero Battle Core cost. Difference from A: Exterminate does NOT get high-crit when the foe led
    with a status move or whiffed (only when it actually took a hit). Upgrade to true moved-second later if
    wanted (needs a wBattleFunctionalFlags bit 4 + turn-loop set/clear).
  - Aurora Mist ward LIFETIME: the UNUSED_6 ward + Mist last until the mon switches out (BattleStatus2 is
    cleared on switch-in), exactly like Mist - no timer. Ward checks added at PoisonEffect /
    FreezeBurnParalyzeEffect / _SleepEffect (Disable is volatile, correctly NOT warded). REST self-sleep still
    works (HEAL_EFFECT, not _SleepEffect). Ward survives Shadow Game's Haze (intended: hard-counters the toxic).

Status as of 2026-06-24. FIVE sections below were **GREEN-LIT** and built as a SINGLE PASS:
  1. Clay Armor rework (go-last + recharge + heal-all, drop the stat-down)
  2. General screen nerf (physical non-Ghost crit cracks BOTH screens post-damage)
  3. Oroclasm rework (go-last 110/90 anti-barrier finisher, pre-damage screen-clear, no status)
  4. Aurora Mist rework ("Cleansing Aurora": cleanse + status-ward both, Mist immunity, Ice/Normal user +1 Spd)
  5. Bug passive swap (the relentless swarm: x1.5 acc + ignore Substitute + ignore screens; drop red-HP
     priority) + companion EXTERMINATE de-stack (high-crit only if it moved second)
They all share the screen/dual-screen-move story, hence one pass (Bug's screen-ignore half rides along, sharing
the screen code). This is the wider "rethink the dual-screen moves" pass. (Aurora Mist's WIDE-DISTRIBUTION compat
list is a SEPARATE later pass - see its caveat.)

## Why (design principle behind all of it)

Slow Pokemon are doubly punished in this engine: Speed sets turn order AND drives crit rate (the quadratic
crit-from-base-Speed curve). So slow mons are behind on both initiative and damage. They need carrots, and the
preferred way to give them one is a **speed-denominated cost**: a downside paid only by the fast, which slow mons
shrug off. This favors slow mons granularly WITHOUT Trick Room (no binary, timed, whole-field flip). Keep this
lens when tuning the other moves in this pass.

## Clay Armor rework (GREEN-LIT direction)

Current: GROUND 0-BP, earthbound-gated (FIGHT/POISON/GROUND/ROCK/BUG, non-airborne), raises BOTH Reflect +
Light Screen, GROUND user heals 1/2 HP, fails if a screen is already up, user takes -2 Speed / -2 Evasion.
Handler = `ClayArmorEffect_` (engine/battle/black_haze.asm).

Changes:
1. **Heal is for EVERYONE**, not GROUND-only. Drop the type gate on the heal (keep the earthbound gate on the
   whole move). Cleaner; the recharge below is what actually holds the power now, not the heal's distribution.
2. **Add a recharge turn after use, like Hyper Beam.** Set `NEEDS_TO_RECHARGE` (BattleStatus2 bit 5, the existing
   Hyper Beam bit, so NO new bit) on the user when Clay Armor resolves. This is the real cost now: a TEMPO cost,
   which is the one thing a slow wall can't shrug off (unlike the speed/evasion drop). Hands the foe a guaranteed
   free turn.
3. **DROP the -2 Speed / -2 Evasion entirely.** Replace it with: **the move always goes LAST on the use turn**
   (Focus-Punch-style negative priority). This is the new fast-mon lockout, and a strictly better one:
   - Turn-math: go-last forces the foe to hit BEFORE the screens come up, so a speedster eats an UNBUFFED hit
     on the use turn; turn 2 (recharge) it eats a buffed hit and still makes no offensive progress. Two ceded
     turns, only one protected. A slow wall was going to move last on turn 1 anyway, so that half is INVISIBLE
     to it = pure speed-denominated cost, dead-on the design lens.
   - Why it beats the stat-drop: -2 Eva made a WALL easier to hit (fought its own screens); -2 Spd slowed the
     slow user further (not "free to the slow"). Go-last fights neither. It also lets us DELETE ClayArmorDrop2
     and the speed-recompute / ApplyBurnAndParalysisPenalties save-restore plumbing.
   - Not redundant with the recharge: they cede initiative on DIFFERENT turns (go-last = turn 1, recharge =
     turn 2). Fast mon loses both; slow mon only "loses" the recharge turn.
   - Subtlety (name it in playtest): go-last is free for the wall vs FASTER foes, but mildly costly vs SLOWER
     ones (the wall can no longer outspeed-and-shield a slow attacker the same turn; it eats that hit first).
     Fair, consistent "the setup turn always cedes initiative" rule.
   - IMPLEMENTATION: the mechanism ALREADY EXISTS. core.asm ~line 393 has the go-last (negative-priority)
     path for FINISHER / SAPPING_COLD / OROCLASM. Add CLAY_ARMOR to it = repeat the existing pattern: a
     `cp CLAY_ARMOR / jr z, .playerGoesLast` in the player-select dispatch + the matching CLAY_ARMOR guards in
     the two enemy-side checks (.playerGoesLast and .playerNotGoLast blocks). No new bit, no new plumbing.
4. Net framing (the pitch): **2 turns (use + recharge) to get 3 effects (Reflect + Light Screen + heal).**
   Front-loads protection (both screens up turn 1) and back-loads risk (recharge + you moved last). Reads
   cleanly as "armor up (both screens) + heal, but you move last now and recharge next."
5. Keep: the earthbound type-gate, the "fails if a screen is already up" guard.

**Boss-fight feel (lean into this):** a recharge move makes Giovanni's Clay Armor a telegraphed phase shift, the
boss armors up + heals, then is stuck recharging = the player's burst window. Self-limiting for the AI (can't
spam it). Want the AI to use it while reasonably healthy so the recharge window isn't instantly lethal; the
`NEEDS_TO_RECHARGE` plumbing handles "loses next turn" automatically.

Code touchpoints: `ClayArmorEffect_` (black_haze.asm) sets `NEEDS_TO_RECHARGE` on the user + drops the GROUND
gate on the heal branch (heal all earthbound users). DELETE the -2 Spd/Eva: remove `ClayArmorDrop2` and the
speed-recompute / `ApplyBurnAndParalysisPenalties` save-restore it needed. ADD `CLAY_ARMOR` to the go-last path
in core.asm (~line 393, alongside FINISHER/SAPPING_COLD/OROCLASM; 3 insertion points). Update the movedex
(_FissureDexEntry) + the moves.asm comment to reflect the new spec (no stat-down, moves last, recharge).

## General screen nerf (GREEN-LIT direction): physical crits crack screens

A **physical-type critical hit (but NOT Ghost)** BREAKS the screen, but does NOT bypass it for its own damage.
So the crit is still mitigated by the screen, then the screen shatters for everything after. This is distinct
from Demolish / Hyper Beam, which break the screen BEFORE damage (full-power hit + break).

Three-tier counterplay gradient (the point of the design):
- **Demolish / Hyper Beam / Oroclasm** = sledgehammer: break the screen pre-damage, hit at full power, leave it
  down. (Oroclasm is the ROCK entry in this tier — see its section below.)
- **Physical crit (non-Ghost)** = a crack: crit is STILL reduced by the screen, but shatters it for next time.
- Everything else: bounces off the screen as normal.

Answers screen-STALL (a critting physical attacker can dismantle a wall) without making any single crit a
screen-ignoring nuke. Pairs with the new Clay Armor: dual screens become strong but not oppressive.

Caveats / open decisions:
- It's **crit-RANDOM**, so treat it as a BONUS counterplay layer, not the primary one. Reliable breakers
  (Demolish, Hyper Beam, Shadow Game's reset) must still carry the main load; the crit-break is the "sometimes
  the wall gives" spice. Do NOT let a staller be reliably broken by it.
- **DECIDED (2026-06-24): BOTH screens break on a crit.** One "the barrier shattered!" line, no per-screen
  bookkeeping, more legible/dramatic. (Reflect-only was the rejected alternative.)
- **Ghost crits do NOTHING to screens** (Ghost is dynamic-category here, not cleanly "physical", so excluding it
  keeps the rule honest and stops Ghost being the universal screen-breaker).
- Reuses the existing crit+screen code path (core.asm GetDamageVars crit branches / `DoubleDefenseForScreen`;
  pre-damage breakers live in `DemolishBreakScreens`, critical_hit.asm). NO new bit.

## Oroclasm rework (GREEN-LIT direction): the anti-barrier finisher

Part of the same screen story (it's the ROCK sledgehammer-tier breaker). The current move is a go-last ROCK
COUNTER-PUNCHER (70 BP / 140 if the user took a physical-typed hit this turn, via OroclasmPowerModifier ->
OroclasmPowerImpl, reading FINISHER_INTERRUPTED, with the fiddly "GHOST counts as physical when defending"
edge). Verdict: too clever / reads as a tech move, not an ultimate. Simplify.

New spec (FINAL):
1. **Goes last** (Focus-Punch-style). ALREADY IN PLACE - OROCLASM is already in the core.asm go-last list
   (FINISHER / SAPPING_COLD / OROCLASM). Nothing to add for this part.
2. **110 BP, 90% accuracy, ROCK.**
3. **Clears the FOE's screens PRE-DAMAGE** (sledgehammer tier, like Demolish / Hyper Beam) - so the 110 lands at
   full power. Reuse the pre-damage break path (`DemolishBreakScreens`); add an OROCLASM move-id gate to it.
4. **NO paralysis, NO status.** (Decided 2026-06-24: dropped entirely. 110 BP + 30% para would have outclassed
   Body Slam/Thunderbolt's stat line AND, since go-last is near-free for the slow ROCK walls this is built for,
   handed them a no-downside premium. The screen-shatter IS the rider; the move doesn't need a status to feel
   ultimate.)

Why it's coherent (NOT "too clever" anymore): go-last + screen-clear INTERLOCK into one idea. Because Oroclasm
moves last, a foe who raises a screen THIS turn (Clay Armor, Aurora Mist, manual) gets it shattered before
Oroclasm's damage. Identity = **"go ahead and raise your barrier, I'll let you, then break it and hit you
anyway."** The perfect anti-setup capstone, and a clean power line (one priority property + one signature
utility), not a do-everything button.

Cost framing (design lens): go-last is the whole cost - free for the slow ROCK users it's meant for, a real
initiative sacrifice for the rare fast user. The TM is widely distributed (Charizard, Dugtrio, etc.), but
go-last self-selects for slow users (a fast mon hates ceding its turn order), so distribution stays fine.

Loose ends to clean during the build (NOT now):
- Retire `OroclasmPowerModifier` / `OroclasmPowerImpl` + its ModifierFuncs slot 19 in remap_move_data.asm. KEEP
  the `FINISHER_INTERRUPTED` flag itself (FINISHER still uses it).
- Verify/strip the dead `MetamorphicEffect_` path (METAMORPHIC_EFFECT const $73; move is already
  NO_ADDITIONAL_EFFECT so it's likely orphaned - confirm the volcano_battle_init.asm callfar is dead).
- Pick the new effect byte: a move-id-gated screen-break (mirroring Demolish) with no side-effect, since para is
  gone. Update moves.asm line (110/90, drop the counter-puncher comment), movedex (_OroclasmDexEntry), names.
- Animation: currently SUBANIM_1_SELFDESTRUCT (explosion-themed) - wants a rethink now it's a barrier-shatter,
  not a blast. (User refines anims himself - placeholder only.)

## Aurora Mist rework (GREEN-LIT direction): "Cleansing Aurora", the white mirror of Shadow Game

Design brief: a tricky-but-white-mage move, the thematic OPPOSITE of Shadow Game (light fog vs toxic fog) that
fulfills a SIMILAR role (deploy-a-fog-and-outlast), is OK on a LOT of mons, and favors ICE a little. The current
move's dual screens are the overloaded part being removed.

What makes Shadow Game tick (the skeleton to mirror): symmetric-on-paper, asymmetric-via-type. It poisons BOTH +
raises BOTH evasion; the only reason it's a win-con not a wash is the user's type (Poison/Ghost) negates the
shared harm. Aurora Mist keeps that skeleton but FLIPS the polarity from harm->ward.

New spec (FINAL):
1. ICE typed, 0 BP. Reached via the Haze trampoline (as now). Handler = `AuroraMistEffect_` (black_haze.asm:720).
2. Haze-reset both sides' stat stages + volatile statuses (permanent status preserved) - same "fog rolls in"
   neutralizer as Shadow Game.
3. **Cure status on both + set a persistent "warded" flag on BOTH sides** using the freed
   **BATTLESTATUS2_UNUSED_6** bit (old dead NORMAL_DRAGON_IMMUNITY, reclaimed 2026-06-24). While the ward holds,
   NO new non-volatile status can land. This is the literal inversion of Shadow Game's "badly-poison both" =
   "anti-toxin both". Needs immunity checks at the status chokepoints + (decide) a duration/clear condition.
4. Keep the **Mist STAT_DOWN_IMMUNITY on both** (the shared defensive buff; mirrors Shadow Game's shared +2 EVA).
5. **The asymmetric tilt: an ICE or NORMAL user gets +1 SPEED.** (Raise, not drop, so NO conflict with the Mist
   ward; the bump is then protected by the user's own Mist.) Why Normal too: +1 Speed is innocuous for the scary
   stall Normals (Snorlax 30 / Chansey 50 shrug it off, don't want speed) but a real tempo nudge for the mediocre
   mid-speed everymons (Raticate/Kangaskhan/Farfetch'd/Pidgeot...) - rewards the weak end of a huge group without
   buffing the dangerous end. Still "favors ICE" (Ice keeps the thematic home), just extends a smaller carrot to
   a broad group, which helps the "OK on a lot of mons" goal.

Role parity: both moves are "deploy a fog and outlast", opposite mechanisms - Shadow Game = offensive attrition
(toxic ticks the foe down), Aurora Mist = defensive safety (you can't be statused/stat-dropped, set up freely).
It even hard-counters Shadow Game (can't be toxic'd under the aurora). The "trick"/cost that keeps it fair and
widely distributable: the ward is SYMMETRIC - you immunize the FOE too - so only the type tilt (Ice/Normal +1
Spd) makes it net-yours.

Rejected alternatives: (a) +1 EVASION rider - evasion-stacking is the frustrating stall-y advantage and leans
the SAME way as Shadow Game's evasion instead of opposing it; +1 Speed is cleaner and self-balancing. (b) "Frost
Veil" = freeze-both / Ice-immune (the status-INFLICT mirror) - reads black-mage not white, freeze is a harder
lock than toxic (would need to be a chance), and FIRE also dodges freeze so it isn't Ice-exclusive.

DISTRIBUTION CAVEAT (for the later wide-compat pass, NOT the move itself): the +1 Speed is the SAFE part. The
real stall risk is the cleanse + ward + Mist package on BULKY NORMALS (Chansey / Snorlax / Clefable) =
status-immune walling / Rest-stall enabler - the SAME mons Shadow Game deliberately EXCLUDED. Flag those when
picking Aurora Mist's compat list.

Code touchpoints: rework `AuroraMistEffect_` (black_haze.asm:720) - DROP the Ice-raises-screens + non-Ice-retype
branches; ADD the UNUSED_6 ward set on both + the ICE/NORMAL-user +1 Speed branch (keep the existing
STAT_DOWN_IMMUNITY + both-side cleanse). Add the ward-immunity check at the status chokepoints (near
`PoisonEffect` / the FreezeBurnParalyze / sleep paths). Decide ward duration/clear. Update the movedex + the
moves.asm comment (drop "Ice raises screens, non-Ice retypes").

## Bug passive swap (GREEN-LIT direction): "the relentless swarm"

REPLACES the current Bug passive (red-HP priority - a BUG-type move from a red-HP-bar user gets +1 priority via
`CheckBugRedHpPriority`). That was a cornered-only initiative blip; the swarm is an ALWAYS-ON identity instead.

Gate (all three facets): the **user is a BUG-type AND the move is BUG-type** (a STAB-style gate, stateless, no
new bit - same shape as the other type passives, a check at an existing chokepoint).

The three facets = "nothing you put up stops the swarm":
1. **x1.5 accuracy** (Compound Eyes - canon Butterfree). The ALWAYS-FELT core: turns every sub-100 Bug move
   effectively reliable (85 -> cap; the planned 90% Bug-SPORE for Butterfree/Parasect -> cap = reliable
   Bug-typed sleep, the intended combo) and punches clean through a stage or two of evasion (it's the numerator
   in acc/eva, so it subsumes most of an "ignore evasion" - that's why we did NOT also add ignore-evasion).
   100%-base moves are unaffected (already capped). Slots into `CalcHitChance`: scale base accuracy x1.5 (x3/2)
   BEFORE the existing cap clamp.
2. **Ignores the target's SUBSTITUTE** (status AND damage go through the decoy). The disruptor's edge - Sub is
   the main thing that saves an AI mon from confuse/powder/SpecialDown, so the swarm bypassing it is the marquee
   single-player niche. Touch the sub-redirect handler in core (the same guard BugOff/PoisonFang special-case).
3. **Ignores the target's SCREENS** (pass-through: full damage, does NOT break the screen for other moves -
   distinct from the sledgehammer break + the crit-crack). RIDES ALONG THE SCREEN PASS - share the
   `DoubleDefenseForScreen` site (item 2): skip the screen-doubling when attacker is BUG + move is BUG.

Why accuracy carries it (single-player lens): vs a non-switching AI that rarely throws screens/Subs, facets 2-3
are spike-y (swing specific fights) but quiet turn-to-turn; facet 1 is felt on EVERY Bug move clicked, so it's
what makes the passive read as always-on. Roster-safe: Bug's offensive movepool is weak/utility (Pin Missile,
Twineedle, Leech Life, BUG OFF, Bug-Spore), so reliable+unblockable raises Bug's FLOOR without a power-ceiling
problem. (Spot-check the strongest Bug move at build for an unblockable-nuke edge case; almost certainly fine.)

Cleanup: rip out `CheckBugRedHpPriority` (status_type_immunities.asm ~539) + the `d`/side threading added for it
at the THREE `CheckPriority` call sites in core.asm + `FarCheckPriority` (trainer_ai.asm). Mind: the go-last
turn-order code also reads side state - don't break it; only the Bug-priority fallback comes out. Update the
per-gym Bug type-explainer NPC text to state the new identity in one plain line.

### Companion fix in the same batch: EXTERMINATE de-stacked (the Bug passive made it too much)

EXTERMINATE ([moves.asm:27](data/moves/moves.asm:27)) is 100 BP / 80 acc / high-crit BUG (ex-OHKO slot). Under
the new Bug passive it became 100 BP, ~100% acc (x1.5 -> capped), ignore screens + Sub, AND high-crit on top of
the quadratic base-Speed crit curve = a reliable, unblockable crit machine on fast Bugs (Beedrill 135). Three
reliability multipliers on one button.

FIX (GREEN-LIT): keep **100 BP / 80% acc**, but the **high-crit ratio applies ONLY if the user MOVED SECOND
this turn.** Not a flat nerf - a redistribution along the slow-mon axis:
- Fast Bug moves FIRST -> no high-crit -> still crits off its Speed term, but the x4 stack is gone (caps the
  runaway exactly where it happened).
- Slow Bug moves SECOND -> gets high-crit -> but its base-Speed crit term is LOW, so x4 only lifts it to
  moderate; and slow Bugs have poor natural crit AND are the mons the project favors.
Passive reliability/unblockability stay; only the crit is earned by ceding initiative. Flavor: the coiled swarm
hits hardest when it lets you commit first (relentless AND patient).

Implementation: gate is ONE branch at `.HighCritical` in `CriticalHitTest` (critical_hit.asm:129) - if move ==
EXTERMINATE and NOT moved-second, fall through to the normal x1.5 path instead of x2/x4. Detect moved-second via
(A, CHOSEN) a transient "first mover has acted this turn" flag (set when move #1 resolves, cleared at turn
start; precedent = `ALREADY_ACTED` at core.asm:7446, which tracks AI-acted but is switch/item-only so not
directly reusable) - faithful "moved second" (slow / para'd / foe led with status or whiffed all count).
Rejected alt (B): reuse `FINISHER_INTERRUPTED` ("if it was HIT first") = zero new state but narrower (misses
status-first/miss cases) and overlaps Oroclasm's counter DNA.
