SECTION "bank1", ROMX
; PureRGBnote: MOVED: mew's base stats file was moved, and unused_names.asm was removed completely
INCLUDE "data/sprites/facings.asm"
INCLUDE "engine/events/black_out.asm"
INCLUDE "engine/battle/safari_zone.asm"
INCLUDE "engine/movie/title3.asm"
INCLUDE "engine/pokemon/load_mon_data.asm"
INCLUDE "engine/items/get_prices.asm"
INCLUDE "data/items/names.asm"
INCLUDE "engine/gfx/sprite_oam.asm"
INCLUDE "engine/gfx/oam_dma.asm"
INCLUDE "engine/link/print_waiting_text.asm"
INCLUDE "engine/overworld/sprite_collisions.asm"
INCLUDE "engine/debug/debug_menu.asm"
INCLUDE "engine/events/pick_up_item.asm"
INCLUDE "engine/overworld/movement.asm"
INCLUDE "engine/link/cable_club.asm"
INCLUDE "engine/menus/main_menu.asm"
INCLUDE "engine/movie/oak_speech/oak_speech.asm"
INCLUDE "engine/overworld/special_warps.asm"
INCLUDE "engine/debug/debug_party.asm"
INCLUDE "engine/menus/naming_screen.asm"
INCLUDE "engine/movie/oak_speech/oak_speech2.asm"
INCLUDE "engine/items/subtract_paid_money.asm"
INCLUDE "engine/menus/swap_items.asm"
INCLUDE "engine/events/pokemart.asm"
INCLUDE "engine/pokemon/learn_move.asm"
INCLUDE "engine/events/set_blackout_map.asm"
INCLUDE "engine/menus/display_text_id_init.asm"
INCLUDE "engine/menus/draw_start_menu.asm"
INCLUDE "engine/link/cable_club_npc.asm"
INCLUDE "engine/menus/text_box.asm"
INCLUDE "engine/menus/players_pc.asm"
INCLUDE "engine/pokemon/remove_mon.asm"
INCLUDE "engine/events/display_pokedex.asm"
INCLUDE "engine/menus/menu_list_tm_name_loader.asm" ; PureRGBnote: ADDED: code for showing TM names in list menus
INCLUDE "engine/menus/wrap_list_menu.asm" ; PureRGBnote: ADDED: code for wrapping to the bottom and top of lists by pressing dpad left
INCLUDE "engine/menus/custom_list_menu.asm"
INCLUDE "engine/gfx/flip_sprite_oam.asm"
INCLUDE "engine/items/get_item_name.asm"


SECTION "bank3", ROMX
; PureRGBnote: MOVED: wild_mons.asm was moved out of this bank
INCLUDE "engine/joypad.asm"
INCLUDE "data/maps/songs.asm"
INCLUDE "data/maps/map_header_banks.asm"
INCLUDE "engine/overworld/clear_variables.asm"
INCLUDE "engine/overworld/player_state.asm"
INCLUDE "engine/events/poison.asm"
INCLUDE "engine/overworld/tilesets.asm"
INCLUDE "data/maps/toggleable_objects.asm"
INCLUDE "engine/overworld/field_move_messages.asm"
INCLUDE "engine/items/inventory.asm"
INCLUDE "engine/items/item_effects.asm"
INCLUDE "engine/overworld/update_map.asm"
INCLUDE "engine/overworld/cut.asm"
INCLUDE "engine/overworld/toggleable_objects.asm"
INCLUDE "engine/overworld/push_boulder.asm"
INCLUDE "engine/pokemon/add_mon.asm"
INCLUDE "engine/pokemon/happiness.asm" ; Sunsette: happiness/affection system
INCLUDE "engine/events/heal_party.asm"
INCLUDE "engine/math/bcd.asm"
INCLUDE "engine/movie/oak_speech/init_player_data.asm"
INCLUDE "engine/items/get_bag_item_quantity.asm"
INCLUDE "engine/overworld/pathfinding.asm"
INCLUDE "engine/gfx/hp_bar.asm"
INCLUDE "engine/events/hidden_events/bookshelves.asm"
INCLUDE "engine/events/hidden_events/indigo_plateau_statues.asm"
INCLUDE "engine/events/hidden_events/book_or_sculpture.asm"
INCLUDE "engine/events/hidden_events/elevator.asm"
INCLUDE "engine/events/hidden_events/town_map.asm"
INCLUDE "engine/events/hidden_events/pokemon_stuff.asm"
INCLUDE "engine/events/tutor.asm"


SECTION "Font Graphics", ROMX

INCLUDE "gfx/font.asm"


SECTION "Battle Engine 1", ROMX

INCLUDE "engine/overworld/is_player_just_outside_map.asm"
INCLUDE "engine/pokemon/status_screen.asm"
INCLUDE "engine/menus/party_menu.asm"
INCLUDE "engine/overworld/turn_sprite.asm"
INCLUDE "engine/menus/start_sub_menus.asm"
INCLUDE "engine/items/tms.asm"
; INCLUDE "engine/battle/end_of_battle.asm" ; moved to newCode2
INCLUDE "engine/battle/wild_encounters.asm"
; INCLUDE "engine/battle/move_effects/recoil.asm" ; moved to battle engine 9
INCLUDE "engine/math/random.asm"
INCLUDE "engine/pokemon/read_tm_learnsets.asm"


SECTION "Player Pics", ROMX

INCLUDE "gfx/player.asm"


SECTION "Battle Engine 2", ROMX

INCLUDE "engine/gfx/load_pokedex_tiles.asm"
INCLUDE "engine/overworld/map_sprites.asm"
INCLUDE "engine/overworld/emotion_bubbles.asm"
INCLUDE "engine/events/evolve_trade.asm"
INCLUDE "engine/battle/move_effects/substitute.asm"
INCLUDE "engine/menus/pc.asm"


SECTION "Play Time", ROMX

INCLUDE "engine/play_time.asm"


SECTION "Doors and Ledges", ROMX

INCLUDE "engine/overworld/auto_movement.asm"
INCLUDE "engine/overworld/doors.asm"
INCLUDE "engine/overworld/ledges.asm"


SECTION "Pokémon Names", ROMX ; PureRGBnote: MOVED: this section was assigned to a later bank

INCLUDE "engine/pokemon/get_mon_name.asm"
INCLUDE "engine/movie/oak_speech/clear_save.asm"
INCLUDE "engine/events/elevator.asm"


SECTION "Hidden Events 1", ROMX

INCLUDE "engine/menus/oaks_pc.asm"
INCLUDE "engine/events/hidden_events/safari_game.asm"


;SECTION "Bill's PC", ROMX ; PureRGBnote: MOVED: bills pc code was moved to movedCode section

SECTION "Battle Engine 3", ROMX

INCLUDE "engine/battle/print_type.asm"
INCLUDE "engine/battle/save_trainer_name.asm"
INCLUDE "engine/battle/move_effects/focus_energy.asm"


SECTION "Battle Engine 4", ROMX

INCLUDE "engine/battle/move_effects/leech_seed.asm"


SECTION "Battle Engine 5", ROMX

INCLUDE "engine/battle/display_effectiveness.asm"
INCLUDE "gfx/trainer_card.asm"
INCLUDE "engine/items/tmhm.asm"
INCLUDE "engine/battle/scale_sprites.asm"
INCLUDE "engine/battle/move_effects/pay_day.asm"


SECTION "Battle Engine 6", ROMX

INCLUDE "engine/battle/move_effects/mist.asm"
INCLUDE "engine/battle/move_effects/one_hit_ko.asm"


SECTION "Battle Engine 7", ROMX

INCLUDE "data/moves/moves.asm"
INCLUDE "data/pokemon/cries.asm"
INCLUDE "engine/battle/stats_functions.asm"
INCLUDE "engine/battle/scroll_draw_trainer_pic.asm"
INCLUDE "engine/battle/trainer_ai.asm"
INCLUDE "engine/battle/draw_hud_pokeball_gfx.asm"
INCLUDE "engine/battle/trainers2.asm" ; PureRGBnote: MOVED: moved from home bank
INCLUDE "engine/battle/move_effects/check_defrost_move.asm" ; PureRGBnote: ADDED: new code for bugfix
INCLUDE "engine/battle/move_effects/haze.asm" ; PureRGBnote: MOVED: moved from battle engine 1
INCLUDE "engine/battle/decrement_pp.asm" ; PureRGBnote: MOVED: moved from battle engine 11
INCLUDE "engine/battle/link_battle_versus_text.asm"
INCLUDE "engine/battle/move_effects/heal.asm"
INCLUDE "engine/battle/move_effects/teleport.asm"
INCLUDE "engine/battle/move_effects/transform.asm"
INCLUDE "engine/battle/move_effects/reflect_light_screen.asm"
INCLUDE "engine/battle/move_effects/tri_attack.asm" ; PureRGBnote: ADDED: new tri attack effect code
INCLUDE "engine/battle/move_effects/drain_hp.asm" ; PureRGBnote: MOVED: from bank 1


SECTION "Slot Machines", ROMX

INCLUDE "engine/movie/title2.asm"
INCLUDE "engine/slots/slot_machine.asm"
INCLUDE "engine/events/pewter_guys.asm"
INCLUDE "engine/math/multiply_divide.asm"
INCLUDE "engine/slots/game_corner_slots.asm"

SECTION "Predefs", ROMX

INCLUDE "engine/events/give_pokemon.asm"
INCLUDE "engine/predefs.asm"


SECTION "Battle Core", ROMX

INCLUDE "engine/battle/core.asm"
INCLUDE "engine/battle/effects.asm"

INCLUDE "engine/battle/growth_regen.asm"


SECTION "bank10", ROMX

INCLUDE "engine/menus/pokedex.asm"
INCLUDE "engine/movie/trade.asm"
INCLUDE "engine/movie/intro.asm"
INCLUDE "engine/movie/trade2.asm"
;;;;;;;;;; PureRGBnote: ADDED: new code for the movedex and learnsets
INCLUDE "engine/menus/movedex.asm"
INCLUDE "data/moves/movedex_type_palettes.asm"
INCLUDE "engine/menus/learnsets.asm"
;;;;;;;;;;

SECTION "Pokédex Rating", ROMX

INCLUDE "engine/events/pokedex_rating.asm"


SECTION "Hidden Events Core", ROMX

INCLUDE "engine/overworld/hidden_events.asm"


SECTION "Screen Effects", ROMX

INCLUDE "engine/gfx/screen_effects.asm"

SECTION "Battle Engine 8", ROMX

INCLUDE "engine/battle/init_battle_variables.asm"
INCLUDE "engine/battle/move_effects/paralyze.asm"
INCLUDE "engine/battle/move_effects/burn.asm" ; PureRGBnote: ADDED: new burn effect code

SECTION "Hidden Events 2", ROMX

INCLUDE "engine/events/card_key.asm"
INCLUDE "engine/events/prize_menu.asm"


SECTION "Battle Engine 9", ROMX

INCLUDE "engine/battle/experience.asm"
INCLUDE "engine/battle/move_effects/recoil.asm" ; PureRGBnote: MOVED: moved from battle engine 1
INCLUDE "engine/battle/moved_battle_code.asm"

SECTION "Diploma", ROMX

INCLUDE "engine/events/diploma.asm"


SECTION "Trainer Sight", ROMX

INCLUDE "engine/overworld/trainer_sight.asm"


SECTION "Battle Engine 10", ROMX

INCLUDE "engine/battle/common_text.asm"
INCLUDE "engine/pokemon/experience.asm"
INCLUDE "engine/events/oaks_aide.asm"


SECTION "Saffron Guards", ROMX

INCLUDE "engine/events/saffron_guards.asm"


SECTION "Starter Dex", ROMX

INCLUDE "engine/events/starter_dex.asm"


SECTION "Hidden Events 3", ROMX

INCLUDE "engine/pokemon/set_types.asm"

SECTION "Cinnabar Lab Fossils", ROMX

INCLUDE "engine/events/cinnabar_lab.asm"

SECTION "Hidden Events 4", ROMX

INCLUDE "engine/events/hidden_events/gym_statues.asm"
INCLUDE "engine/events/hidden_events/pokecenter_pc.asm"


SECTION "Version Graphics", ROMX

INCLUDE "gfx/version.asm"

SECTION "bank1C", ROMX
; PureRGBnote: MOVED: splash.asm, ghost_marowak_anim.asm, healing_machine.asm, and hall_of_fame.asm were moved
INCLUDE "engine/overworld/player_animations.asm"
INCLUDE "engine/battle/battle_transitions.asm"
INCLUDE "engine/items/town_map.asm"
INCLUDE "engine/gfx/mon_icons.asm"
INCLUDE "engine/events/in_game_trades.asm"
INCLUDE "engine/gfx/palettes.asm"
INCLUDE "engine/menus/save.asm"


SECTION "Itemfinder 1", ROMX

INCLUDE "engine/movie/credits.asm"
INCLUDE "engine/pokemon/status_ailments.asm"
INCLUDE "engine/items/itemfinder.asm"


SECTION "Vending Machine", ROMX

INCLUDE "engine/events/vending_machine.asm"


SECTION "Itemfinder 2", ROMX

INCLUDE "engine/menus/league_pc.asm"
INCLUDE "engine/events/hidden_items.asm"
; PureRGBnote: MOVED: moved these from bank 1E
INCLUDE "engine/overworld/elevator.asm"
INCLUDE "engine/movie/evolution.asm"
INCLUDE "gfx/fishing.asm"
INCLUDE "engine/overworld/cut2.asm"
INCLUDE "engine/overworld/dust_smoke.asm"

SECTION "bank1E", ROMX

INCLUDE "engine/battle/animations.asm"
INCLUDE "data/moves/animations.asm"
INCLUDE "data/battle_anims/subanimations.asm"
INCLUDE "data/battle_anims/frame_blocks.asm"

SECTION "Wild Mons", ROMX
; PureRGBnote: MOVED: moved from bank3
INCLUDE "engine/overworld/wild_mons.asm"
; PureRGBnote: ADDED: new code
INCLUDE "engine/overworld/wild_mon_alt_palettes.asm"

SECTION "Evos Moves", ROMX
INCLUDE "engine/pokemon/get_mon_header.asm"
; PureRGBnote: MOVED: moved from battle engine 7
INCLUDE "engine/pokemon/evos_moves.asm"
INCLUDE "data/pokemon/base_stats.asm"
INCLUDE "engine/pokemon/read_level_up_learnsets.asm"
INCLUDE "engine/pokemon/get_move_name.asm"

SECTION "Splash Animation", ROMX
; PureRGBnote: MOVED: moved from bank1C
INCLUDE "engine/movie/splash.asm"
INCLUDE "engine/movie/hall_of_fame.asm"

; Sunsette: relocated out of bank3 (player_state.asm) to free room for the BEACH_HOUSE tileset header.
; Floating ROMX (not pinned in layout.link) so the linker drops it in any bank with room. Both callers
; of IsPlayerStandingOnDoorTileOrWarpTile already use callfar/farcall, so its bank is irrelevant.
SECTION "Sunsette Warp Tile Lookup", ROMX
INCLUDE "engine/overworld/standing_on_warp_tile.asm"
INCLUDE "data/tilesets/warp_tile_ids.asm"

SECTION "movedCode", ROMX
; moved from home bank
INCLUDE "data/tilesets/collision_tile_ids.asm"
; moved from bank 8 (audio engine 2 bank)
INCLUDE "engine/pokemon/bills_pc.asm"
; moved from bank1e
INCLUDE "engine/overworld/healing_machine.asm"
INCLUDE "engine/battle/ghost_marowak_anim.asm"
; moved from home bank
INCLUDE "audio/fade_audio.asm"
INCLUDE "engine/gfx/animated_tiles_code.asm"
; moved from bank1C
INCLUDE "engine/overworld/fly_animation.asm"
; moved from audio home code
INCLUDE "audio/check_bike_surf_music.asm"
; moved from bank1
INCLUDE "engine/events/pokecenter.asm"
; moved from bank3
INCLUDE "engine/menus/draw_badges.asm"
; moved from battle core
INCLUDE "engine/battle/move_effects/sleep.asm"
; moved from home bank
INCLUDE "engine/menus/load_font.asm"
INCLUDE "engine/overworld/check_boulder_coords.asm"
INCLUDE "engine/pokemon/calc_stat.asm"
INCLUDE "engine/pokemon/draw_hp_bar.asm"

SECTION "Party Sprites", ROMX, BANK[$34]
; PureRGBnote: ADDED: new menu sprite icons raw data
; NOTE: these are dual-purpose. Besides the (legacy) type-grouped party icons,
; several event scripts (Power Plant, Silph, Vermilion Dock, Cinnabar Volcano,
; Cerulean Cave, the Dig minigame, town map) copy specific tile offsets out of
; these blobs for overworld statues / minigame sprites. Do NOT repoint or resize
; them. The live per-species party-menu icons live in DexPartyIcons1/2 below.
PartyMonSprites1:: INCBIN "gfx/icons/menusprites1.2bpp"
PartyMonSprites2:: INCBIN "gfx/icons/menusprites2.2bpp"

; Sunsette: ADDED: per-species party-menu icons (pokecrystal mini-icons), stored
; in National Dex order (slot N = dex #N; slot 0 = Missingno/egg). Each icon is
; 8 tiles ($80 bytes) = two 16x16 frames side by side. Slots 0..127 fill bank $3E
; exactly; slots 128..151 live in bank $3F. Addressed in PreparePartyMonSpriteCopy.
; Built by tools/build_dex_menu_icons.py from gfx/pokemon/icons/*.png.
SECTION "Dex Party Icons 1", ROMX, BANK[$3E]
DexPartyIcons1:: INCBIN "gfx/pokemon/icons/dex_icons1.2bpp"

SECTION "Dex Party Icons 2", ROMX, BANK[$3F]
DexPartyIcons2:: INCBIN "gfx/pokemon/icons/dex_icons2.2bpp"

SECTION "GBC Mode Code", ROMX

; shinpokerednote: gbcnote: include the bgmap files from pokemon yellow
INCLUDE "data/gbc/bg_map_attributes.asm"
INCLUDE "engine/gbc/bg_map_attributes.asm"
INCLUDE "engine/gfx/scroll_gfx_horizontally.asm"

SECTION "Trade Graphics", ROMX

INCLUDE "gfx/trade.asm"

SECTION "Move Animation Tiles", ROMX

INCLUDE "engine/battle/animations/move_animation_tiles.asm"

SECTION "Save File Updater", ROMX

INCLUDE "engine/menus/save_file_updater.asm"

SECTION "newCode", ROMX
; PureRGBnote: ADDED: new code
INCLUDE "engine/gfx/front_sprite_toggler.asm"
INCLUDE "engine/menus/options_menu.asm" ; PureRGBnote: MOVED: used to be part of main_menu.asm but moved out of there for space.
INCLUDE "engine/menus/options_menu2.asm"
; Sunsette: removed options pages 3 (battle) & 4 (sprite) and the front-sprite sub-pages;
; kept the shared generic option helpers that used to live in battle_options.asm
INCLUDE "engine/menus/generic_options.asm"
INCLUDE "engine/menus/options_menu3.asm"
INCLUDE "engine/gfx/mon_icons2.asm"
INCLUDE "engine/overworld/select_button_functionality.asm"
INCLUDE "engine/overworld/use_another_repel.asm"
INCLUDE "engine/items/last_two_fishing_gurus_script.asm"
INCLUDE "engine/overworld/check_map_connections.asm"
INCLUDE "engine/pokemon/missingno_item_duplication.asm"
INCLUDE "engine/pokemon/pikablu.asm"
INCLUDE "engine/gfx/set_attack_animation_palette.asm"
INCLUDE "engine/battle/exp_bar_print.asm"
INCLUDE "engine/overworld/strength.asm"
INCLUDE "engine/overworld/surf_strength_tracker.asm"
INCLUDE "engine/battle/store_pkmn_levels.asm"
INCLUDE "engine/gfx/remap_overworld_sprites.asm"
INCLUDE "engine/battle/animations/tri_attack.asm"
INCLUDE "engine/menus/text_multi_button_prompt.asm"
INCLUDE "engine/menus/multi_choice_menu.asm"
INCLUDE "engine/menus/map_pokemon_areas.asm"
INCLUDE "engine/gfx/save_screen_area_to_buffer3.asm"
INCLUDE "engine/overworld/autosurf.asm"
INCLUDE "audio/remap_armored_mewtwo_cry.asm"
INCLUDE "engine/pokemon/change_mon_species.asm"
INCLUDE "engine/menus/super_softlock_checker.asm"
INCLUDE "engine/pokemon/remap_typings.asm"
INCLUDE "engine/gbc/gbc_cpu_speed.asm"
INCLUDE "engine/gbc/gbc_fade.asm"
INCLUDE "engine/menus/dig.asm"
INCLUDE "engine/battle/pp_tracker.asm"
INCLUDE "engine/menus/world_options.asm"
INCLUDE "engine/battle/volcano_battle_init.asm"
INCLUDE "engine/gfx/enter_map_replace_tiles_check.asm"
INCLUDE "engine/battle/remap_move_data.asm"
INCLUDE "engine/battle/move_effects/conversion.asm"
INCLUDE "engine/overworld/overworld_animation.asm"
INCLUDE "engine/overworld/flamethrower_field.asm" ; Sunsette: ADDED: FLAMETHROWER field move (burn grass + trees)
INCLUDE "engine/overworld/surf_exhaustion.asm" ; Sunsette: ADDED: surf HP-drain (every 12 steps) + eased blue pulse
INCLUDE "engine/battle/play_side_anim.asm" ; Sunsette: ADDED: affection/Pressure overlay cues (moved out of full Battle Core)
INCLUDE "engine/battle/move_effects/waterify.asm" ; Sunsette: ADDED: WATERIFY_EFFECT (Water Gun / Hydro Pump retype target to WATER)
INCLUDE "engine/battle/freeze_penalty.asm" ; Sunsette: ADDED: FREEZE halves Special + Speed instead of skipping the turn
INCLUDE "engine/overworld/daycare_exp.asm" ; Sunsette: moved out of full bank3 - time-based daycare reward (callfar'd, bank-agnostic)

INCLUDE "engine/battle/splash.asm" ; Sunsette: SPLASH MAGIKARP-signature comedy handler + its own message bank (self-contained SECTION)
INCLUDE "engine/battle/critical_hit.asm" ; Sunsette: CriticalHitTest + helpers + high-crit table, floated out of the full Battle Core bank (self-contained SECTION); adds auto-crit-vs-status
INCLUDE "engine/battle/sleep_hit_reduction.asm" ; Sunsette: hitting a sleeping target wears down its sleep (1 round per hit, 2 per crit), applied after the turn (self-contained SECTION)
INCLUDE "engine/battle/black_haze.asm" ; Sunsette: SHADOW GAME field effect - badly poison + EVASION +2 both sides after the Haze reset (self-contained floating SECTION; newCode is full)
INCLUDE "data/trainers/custom_movesets.asm" ; Sunsette: floated out of full newCode into its own SECTION (callfar'd, self-contained function + data); the GymKogaMoveset addition tipped newCode over

; Sunsette: ADDED: Pokemon nature reactions (sprite-pop + cry + personality line on field moves,
; story beats, notable wins, and evolution). Self-contained floating SECTION: logic + tables +
; the line text live together so rst _PrintText reads each line from this bank directly. All
; callers reach it via farcall, so the bank is irrelevant.
SECTION "Sunsette Nature Reactions", ROMX
INCLUDE "engine/overworld/nature_reactions.asm"
INCLUDE "data/pokemon/nature_table.asm"
INCLUDE "data/pokemon/nature_reactions_data.asm"

; Sunsette: the reaction line STRINGS live in their own floating section (the code+pools section
; outgrew one bank); the pools reference them via text_far stubs. tools/split_nature_text.py.
SECTION "Sunsette Nature Reaction Text", ROMX
INCLUDE "data/pokemon/nature_reactions_text.asm"

; Sunsette: status-screen PAGE 3 (battle effects / eagerness / personality reaction). Self-contained
; floating SECTION: renderer + tables + PlaceString text together, callfar'd from both status loops.
SECTION "Sunsette Status Page 3", ROMX
INCLUDE "engine/pokemon/status_page3.asm"

; Sunsette: last-mon trainer cut-ins (trainer pic scrolls in + a character line before they send
; their final mon). Self-contained: logic + dispatch + line text together, callfar'd from EnemySendOut.
SECTION "Sunsette Last Mon Cutin", ROMX
INCLUDE "engine/battle/last_mon_cutin.asm"

; Sunsette: PSYDUCK's hidden psychic-headache recoil (callfar'd from CheckRemapMoveData; newCode is full).
SECTION "Sunsette Psyduck Headache", ROMX
INCLUDE "engine/battle/psyduck_headache.asm"

; Sunsette: GHOST flinch immunity + SLOWPOKE/SLOWBRO confusion immunity, floated out of the full Battle
; Core bank (declares its own SECTION; reached via jpfar/callfar from effects.asm).
INCLUDE "engine/battle/status_type_immunities.asm"

; Sunsette: the comeback / desperation-stage engine shared by the comeback move family (self-contained SECTION).
INCLUDE "engine/battle/comeback.asm"

; Sunsette: ROCK ON's escalating defensive effect, floated out of the full newCode bank (self-contained SECTION).
INCLUDE "engine/battle/move_effects/defense_curl_effect.asm"

SECTION "newCode2", ROMX

INCLUDE "engine/overworld/learnset_scripts.asm"
INCLUDE "engine/overworld/make_pokemon_appear.asm"
INCLUDE "data/pokemon/metric_measurements.asm"
INCLUDE "engine/battle/end_of_battle.asm" ; moved from battle engine 1
INCLUDE "engine/menus/item_menu_count_box.asm"
INCLUDE "engine/battle/get_fitness_trainer_party.asm"
INCLUDE "engine/battle/animations/custom_send_out_mon_ball_poof_animations.asm"
INCLUDE "engine/menus/ball_customization_menu.asm"
INCLUDE "engine/events/camera.asm"
INCLUDE "engine/battle/accuracy_down.asm"
INCLUDE "engine/events/get_badge_name.asm"
INCLUDE "engine/events/get_floor_name.asm"
INCLUDE "engine/items/get_machine_name.asm"
INCLUDE "engine/battle/get_trainer_name.asm"
INCLUDE "engine/battle/move_effects/siphon_snag.asm"
INCLUDE "engine/menus/map_wild_data.asm"
INCLUDE "engine/battle/move_effects/screech.asm"
INCLUDE "engine/menus/preview_front_sprite.asm"
INCLUDE "engine/menus/change_box_menu.asm"

SECTION "newCode3", ROMX

INCLUDE "engine/movie/title.asm"
INCLUDE "audio/pause_resume_music.asm"
INCLUDE "engine/battle/prevent_invalid_encounters.asm"
INCLUDE "engine/items/sort_items.asm"
INCLUDE "engine/events/move_relearner.asm" ; Sunsette: ADDED: Viridian schoolhouse Move Relearner (movedex + 2 badges)
INCLUDE "engine/events/museum_exhibit_bonus.asm" ; Sunsette: ADDED: Pewter Museum exhibit "feel smarter" Special stat-EXP bonus
INCLUDE "engine/events/family_badge_comments.asm" ; Sunsette: MOM/DAISY non-item badge acknowledgments (callfar'd from their full map banks)
INCLUDE "engine/events/oak_legendary_comments.asm" ; Sunsette: OAK's one-time legendary remarks (callfar'd from OaksLab)
INCLUDE "engine/battle/arbok_signature.asm" ; Sunsette: ARBOK FOCUS ENERGY (+2 SPEED) / WRAP (+2 trap turns) bonuses (callfar'd; Battle Core + newCode are full)
INCLUDE "engine/battle/strength_rage_moves.asm" ; Sunsette: STRENGTH weight/Fighting power + UNLEASH RAGE post-hit (callfar'd; newCode is full)
INCLUDE "engine/events/locked_area_lockout.asm" ; Sunsette: morale lockout - confirm before leaving a gym/Silph 2F+/Rocket pre-boss (callfar'd; moved out of full newCode)

SECTION "Silph Card Key Scripts", ROMX

INCLUDE "engine/events/silph_card_key_scripts.asm"

; PureRGBnote: ADDED: the Surfing Pikachu minigame ported from pokeyellow (Summer
; Beach House on Route 19). Code + its animated-object engine live in one floating
; bank; the graphics file declares its own section.
SECTION "Surfing Pikachu Minigame", ROMX

INCLUDE "engine/gfx/animated_objects.asm"
INCLUDE "engine/minigame/surfing_pikachu.asm"
INCLUDE "engine/minigame/surfing_pikachu_hiscore.asm"

INCLUDE "gfx/surfing_pikachu.asm"
