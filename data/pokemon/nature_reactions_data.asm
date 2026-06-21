; Sunsette: ADDED: nature-reaction line pools + the text itself, kept in the SAME floating
; section as the reaction logic so rst _PrintText reads each line straight out of the loaded
; bank (no text_far stubs needed). Each pool is: db count, then count * dw text-pointer.
; The sprite pop makes the speaker obvious, so most lines are voice/narration and skip the
; nickname (avoids variable-width name overflow). All lines end in `prompt` because more
; script always runs after a reaction. No dashes (project rule).

; ============================ FIELD MOVE ============================
; Per-event 16-nature pools (indexed by NREVT_*). ShowMonReaction overlays the type roll.
FieldEventPools::
	dw FE_Cut, FE_Surf, FE_Strength, FE_Flash, FE_Flame, FE_Confuse, FE_Mystic, FE_Hiding, FE_Soft

FE_Cut:
	dw FE_Cut_S, FE_Cut_A, FE_Cut_G, FE_Cut_P, FE_Cut_C, FE_Cut_Z, FE_Cut_D, FE_Cut_M, FE_Cut_U, FE_Cut_B, FE_Cut_K, FE_Cut_H, FE_Cut_O, FE_Cut_R, FE_Cut_X, FE_Cut_W
FE_Cut_S:
	db 1
	dw FE_Cut_S_T
FE_Cut_A:
	db 1
	dw FE_Cut_A_T
FE_Cut_G:
	db 1
	dw FE_Cut_G_T
FE_Cut_P:
	db 1
	dw FE_Cut_P_T
FE_Cut_C:
	db 1
	dw FE_Cut_C_T
FE_Cut_Z:
	db 1
	dw FE_Cut_Z_T
FE_Cut_D:
	db 1
	dw FE_Cut_D_T
FE_Cut_M:
	db 1
	dw FE_Cut_M_T
FE_Cut_U:
	db 1
	dw FE_Cut_U_T
FE_Cut_B:
	db 1
	dw FE_Cut_B_T
FE_Cut_K:
	db 1
	dw FE_Cut_K_T
FE_Cut_H:
	db 1
	dw FE_Cut_H_T
FE_Cut_O:
	db 1
	dw FE_Cut_O_T
FE_Cut_R:
	db 1
	dw FE_Cut_R_T
FE_Cut_X:
	db 1
	dw FE_Cut_X_T
FE_Cut_W:
	db 1
	dw FE_Cut_W_T
FE_Surf:
	dw FE_Surf_S, FE_Surf_A, FE_Surf_G, FE_Surf_P, FE_Surf_C, FE_Surf_Z, FE_Surf_D, FE_Surf_M, FE_Surf_U, FE_Surf_B, FE_Surf_K, FE_Surf_H, FE_Surf_O, FE_Surf_R, FE_Surf_X, FE_Surf_W
FE_Surf_S:
	db 1
	dw FE_Surf_S_T
FE_Surf_A:
	db 1
	dw FE_Surf_A_T
FE_Surf_G:
	db 1
	dw FE_Surf_G_T
FE_Surf_P:
	db 1
	dw FE_Surf_P_T
FE_Surf_C:
	db 1
	dw FE_Surf_C_T
FE_Surf_Z:
	db 1
	dw FE_Surf_Z_T
FE_Surf_D:
	db 1
	dw FE_Surf_D_T
FE_Surf_M:
	db 1
	dw FE_Surf_M_T
FE_Surf_U:
	db 1
	dw FE_Surf_U_T
FE_Surf_B:
	db 1
	dw FE_Surf_B_T
FE_Surf_K:
	db 1
	dw FE_Surf_K_T
FE_Surf_H:
	db 1
	dw FE_Surf_H_T
FE_Surf_O:
	db 1
	dw FE_Surf_O_T
FE_Surf_R:
	db 1
	dw FE_Surf_R_T
FE_Surf_X:
	db 1
	dw FE_Surf_X_T
FE_Surf_W:
	db 1
	dw FE_Surf_W_T
FE_Strength:
	dw FE_Strength_S, FE_Strength_A, FE_Strength_G, FE_Strength_P, FE_Strength_C, FE_Strength_Z, FE_Strength_D, FE_Strength_M, FE_Strength_U, FE_Strength_B, FE_Strength_K, FE_Strength_H, FE_Strength_O, FE_Strength_R, FE_Strength_X, FE_Strength_W
FE_Strength_S:
	db 1
	dw FE_Strength_S_T
FE_Strength_A:
	db 1
	dw FE_Strength_A_T
FE_Strength_G:
	db 1
	dw FE_Strength_G_T
FE_Strength_P:
	db 1
	dw FE_Strength_P_T
FE_Strength_C:
	db 1
	dw FE_Strength_C_T
FE_Strength_Z:
	db 1
	dw FE_Strength_Z_T
FE_Strength_D:
	db 1
	dw FE_Strength_D_T
FE_Strength_M:
	db 1
	dw FE_Strength_M_T
FE_Strength_U:
	db 1
	dw FE_Strength_U_T
FE_Strength_B:
	db 1
	dw FE_Strength_B_T
FE_Strength_K:
	db 1
	dw FE_Strength_K_T
FE_Strength_H:
	db 1
	dw FE_Strength_H_T
FE_Strength_O:
	db 1
	dw FE_Strength_O_T
FE_Strength_R:
	db 1
	dw FE_Strength_R_T
FE_Strength_X:
	db 1
	dw FE_Strength_X_T
FE_Strength_W:
	db 1
	dw FE_Strength_W_T
FE_Flash:
	dw FE_Flash_S, FE_Flash_A, FE_Flash_G, FE_Flash_P, FE_Flash_C, FE_Flash_Z, FE_Flash_D, FE_Flash_M, FE_Flash_U, FE_Flash_B, FE_Flash_K, FE_Flash_H, FE_Flash_O, FE_Flash_R, FE_Flash_X, FE_Flash_W
FE_Flash_S:
	db 1
	dw FE_Flash_S_T
FE_Flash_A:
	db 1
	dw FE_Flash_A_T
FE_Flash_G:
	db 1
	dw FE_Flash_G_T
FE_Flash_P:
	db 1
	dw FE_Flash_P_T
FE_Flash_C:
	db 1
	dw FE_Flash_C_T
FE_Flash_Z:
	db 1
	dw FE_Flash_Z_T
FE_Flash_D:
	db 1
	dw FE_Flash_D_T
FE_Flash_M:
	db 1
	dw FE_Flash_M_T
FE_Flash_U:
	db 1
	dw FE_Flash_U_T
FE_Flash_B:
	db 1
	dw FE_Flash_B_T
FE_Flash_K:
	db 1
	dw FE_Flash_K_T
FE_Flash_H:
	db 1
	dw FE_Flash_H_T
FE_Flash_O:
	db 1
	dw FE_Flash_O_T
FE_Flash_R:
	db 1
	dw FE_Flash_R_T
FE_Flash_X:
	db 1
	dw FE_Flash_X_T
FE_Flash_W:
	db 1
	dw FE_Flash_W_T
FE_Flame:
	dw FE_Flame_S, FE_Flame_A, FE_Flame_G, FE_Flame_P, FE_Flame_C, FE_Flame_Z, FE_Flame_D, FE_Flame_M, FE_Flame_U, FE_Flame_B, FE_Flame_K, FE_Flame_H, FE_Flame_O, FE_Flame_R, FE_Flame_X, FE_Flame_W
FE_Flame_S:
	db 1
	dw FE_Flame_S_T
FE_Flame_A:
	db 1
	dw FE_Flame_A_T
FE_Flame_G:
	db 1
	dw FE_Flame_G_T
FE_Flame_P:
	db 1
	dw FE_Flame_P_T
FE_Flame_C:
	db 1
	dw FE_Flame_C_T
FE_Flame_Z:
	db 1
	dw FE_Flame_Z_T
FE_Flame_D:
	db 1
	dw FE_Flame_D_T
FE_Flame_M:
	db 1
	dw FE_Flame_M_T
FE_Flame_U:
	db 1
	dw FE_Flame_U_T
FE_Flame_B:
	db 1
	dw FE_Flame_B_T
FE_Flame_K:
	db 1
	dw FE_Flame_K_T
FE_Flame_H:
	db 1
	dw FE_Flame_H_T
FE_Flame_O:
	db 1
	dw FE_Flame_O_T
FE_Flame_R:
	db 1
	dw FE_Flame_R_T
FE_Flame_X:
	db 1
	dw FE_Flame_X_T
FE_Flame_W:
	db 1
	dw FE_Flame_W_T
FE_Confuse:
	dw FE_Confuse_S, FE_Confuse_A, FE_Confuse_G, FE_Confuse_P, FE_Confuse_C, FE_Confuse_Z, FE_Confuse_D, FE_Confuse_M, FE_Confuse_U, FE_Confuse_B, FE_Confuse_K, FE_Confuse_H, FE_Confuse_O, FE_Confuse_R, FE_Confuse_X, FE_Confuse_W
FE_Confuse_S:
	db 1
	dw FE_Confuse_S_T
FE_Confuse_A:
	db 1
	dw FE_Confuse_A_T
FE_Confuse_G:
	db 1
	dw FE_Confuse_G_T
FE_Confuse_P:
	db 1
	dw FE_Confuse_P_T
FE_Confuse_C:
	db 1
	dw FE_Confuse_C_T
FE_Confuse_Z:
	db 1
	dw FE_Confuse_Z_T
FE_Confuse_D:
	db 1
	dw FE_Confuse_D_T
FE_Confuse_M:
	db 1
	dw FE_Confuse_M_T
FE_Confuse_U:
	db 1
	dw FE_Confuse_U_T
FE_Confuse_B:
	db 1
	dw FE_Confuse_B_T
FE_Confuse_K:
	db 1
	dw FE_Confuse_K_T
FE_Confuse_H:
	db 1
	dw FE_Confuse_H_T
FE_Confuse_O:
	db 1
	dw FE_Confuse_O_T
FE_Confuse_R:
	db 1
	dw FE_Confuse_R_T
FE_Confuse_X:
	db 1
	dw FE_Confuse_X_T
FE_Confuse_W:
	db 1
	dw FE_Confuse_W_T
FE_Mystic:
	dw FE_Mystic_S, FE_Mystic_A, FE_Mystic_G, FE_Mystic_P, FE_Mystic_C, FE_Mystic_Z, FE_Mystic_D, FE_Mystic_M, FE_Mystic_U, FE_Mystic_B, FE_Mystic_K, FE_Mystic_H, FE_Mystic_O, FE_Mystic_R, FE_Mystic_X, FE_Mystic_W
FE_Mystic_S:
	db 1
	dw FE_Mystic_S_T
FE_Mystic_A:
	db 1
	dw FE_Mystic_A_T
FE_Mystic_G:
	db 1
	dw FE_Mystic_G_T
FE_Mystic_P:
	db 1
	dw FE_Mystic_P_T
FE_Mystic_C:
	db 1
	dw FE_Mystic_C_T
FE_Mystic_Z:
	db 1
	dw FE_Mystic_Z_T
FE_Mystic_D:
	db 1
	dw FE_Mystic_D_T
FE_Mystic_M:
	db 1
	dw FE_Mystic_M_T
FE_Mystic_U:
	db 1
	dw FE_Mystic_U_T
FE_Mystic_B:
	db 1
	dw FE_Mystic_B_T
FE_Mystic_K:
	db 1
	dw FE_Mystic_K_T
FE_Mystic_H:
	db 1
	dw FE_Mystic_H_T
FE_Mystic_O:
	db 1
	dw FE_Mystic_O_T
FE_Mystic_R:
	db 1
	dw FE_Mystic_R_T
FE_Mystic_X:
	db 1
	dw FE_Mystic_X_T
FE_Mystic_W:
	db 1
	dw FE_Mystic_W_T
FE_Hiding:
	dw FE_Hiding_S, FE_Hiding_A, FE_Hiding_G, FE_Hiding_P, FE_Hiding_C, FE_Hiding_Z, FE_Hiding_D, FE_Hiding_M, FE_Hiding_U, FE_Hiding_B, FE_Hiding_K, FE_Hiding_H, FE_Hiding_O, FE_Hiding_R, FE_Hiding_X, FE_Hiding_W
FE_Hiding_S:
	db 1
	dw FE_Hiding_S_T
FE_Hiding_A:
	db 1
	dw FE_Hiding_A_T
FE_Hiding_G:
	db 1
	dw FE_Hiding_G_T
FE_Hiding_P:
	db 1
	dw FE_Hiding_P_T
FE_Hiding_C:
	db 1
	dw FE_Hiding_C_T
FE_Hiding_Z:
	db 1
	dw FE_Hiding_Z_T
FE_Hiding_D:
	db 1
	dw FE_Hiding_D_T
FE_Hiding_M:
	db 1
	dw FE_Hiding_M_T
FE_Hiding_U:
	db 1
	dw FE_Hiding_U_T
FE_Hiding_B:
	db 1
	dw FE_Hiding_B_T
FE_Hiding_K:
	db 1
	dw FE_Hiding_K_T
FE_Hiding_H:
	db 1
	dw FE_Hiding_H_T
FE_Hiding_O:
	db 1
	dw FE_Hiding_O_T
FE_Hiding_R:
	db 1
	dw FE_Hiding_R_T
FE_Hiding_X:
	db 1
	dw FE_Hiding_X_T
FE_Hiding_W:
	db 1
	dw FE_Hiding_W_T
FE_Soft:
	dw FE_Soft_S, FE_Soft_A, FE_Soft_G, FE_Soft_P, FE_Soft_C, FE_Soft_Z, FE_Soft_D, FE_Soft_M, FE_Soft_U, FE_Soft_B, FE_Soft_K, FE_Soft_H, FE_Soft_O, FE_Soft_R, FE_Soft_X, FE_Soft_W
FE_Soft_S:
	db 1
	dw FE_Soft_S_T
FE_Soft_A:
	db 1
	dw FE_Soft_A_T
FE_Soft_G:
	db 1
	dw FE_Soft_G_T
FE_Soft_P:
	db 1
	dw FE_Soft_P_T
FE_Soft_C:
	db 1
	dw FE_Soft_C_T
FE_Soft_Z:
	db 1
	dw FE_Soft_Z_T
FE_Soft_D:
	db 1
	dw FE_Soft_D_T
FE_Soft_M:
	db 1
	dw FE_Soft_M_T
FE_Soft_U:
	db 1
	dw FE_Soft_U_T
FE_Soft_B:
	db 1
	dw FE_Soft_B_T
FE_Soft_K:
	db 1
	dw FE_Soft_K_T
FE_Soft_H:
	db 1
	dw FE_Soft_H_T
FE_Soft_O:
	db 1
	dw FE_Soft_O_T
FE_Soft_R:
	db 1
	dw FE_Soft_R_T
FE_Soft_X:
	db 1
	dw FE_Soft_X_T
FE_Soft_W:
	db 1
	dw FE_Soft_W_T

; ====================== DEFERRED (FLY/DIG/TELEPORT) ======================
DeferredEventPools::
	dw DEF_Fly, DEF_Dig, DEF_Teleport

DEF_Fly:
	dw DEF_Fly_S, DEF_Fly_A, DEF_Fly_G, DEF_Fly_P, DEF_Fly_C, DEF_Fly_Z, DEF_Fly_D, DEF_Fly_M, DEF_Fly_U, DEF_Fly_B, DEF_Fly_K, DEF_Fly_H, DEF_Fly_O, DEF_Fly_R, DEF_Fly_X, DEF_Fly_W
DEF_Fly_S:
	db 1
	dw DEF_Fly_S_T
DEF_Fly_A:
	db 1
	dw DEF_Fly_A_T
DEF_Fly_G:
	db 1
	dw DEF_Fly_G_T
DEF_Fly_P:
	db 1
	dw DEF_Fly_P_T
DEF_Fly_C:
	db 1
	dw DEF_Fly_C_T
DEF_Fly_Z:
	db 1
	dw DEF_Fly_Z_T
DEF_Fly_D:
	db 1
	dw DEF_Fly_D_T
DEF_Fly_M:
	db 1
	dw DEF_Fly_M_T
DEF_Fly_U:
	db 1
	dw DEF_Fly_U_T
DEF_Fly_B:
	db 1
	dw DEF_Fly_B_T
DEF_Fly_K:
	db 1
	dw DEF_Fly_K_T
DEF_Fly_H:
	db 1
	dw DEF_Fly_H_T
DEF_Fly_O:
	db 1
	dw DEF_Fly_O_T
DEF_Fly_R:
	db 1
	dw DEF_Fly_R_T
DEF_Fly_X:
	db 1
	dw DEF_Fly_X_T
DEF_Fly_W:
	db 1
	dw DEF_Fly_W_T
DEF_Dig:
	dw DEF_Dig_S, DEF_Dig_A, DEF_Dig_G, DEF_Dig_P, DEF_Dig_C, DEF_Dig_Z, DEF_Dig_D, DEF_Dig_M, DEF_Dig_U, DEF_Dig_B, DEF_Dig_K, DEF_Dig_H, DEF_Dig_O, DEF_Dig_R, DEF_Dig_X, DEF_Dig_W
DEF_Dig_S:
	db 1
	dw DEF_Dig_S_T
DEF_Dig_A:
	db 1
	dw DEF_Dig_A_T
DEF_Dig_G:
	db 1
	dw DEF_Dig_G_T
DEF_Dig_P:
	db 1
	dw DEF_Dig_P_T
DEF_Dig_C:
	db 1
	dw DEF_Dig_C_T
DEF_Dig_Z:
	db 1
	dw DEF_Dig_Z_T
DEF_Dig_D:
	db 1
	dw DEF_Dig_D_T
DEF_Dig_M:
	db 1
	dw DEF_Dig_M_T
DEF_Dig_U:
	db 1
	dw DEF_Dig_U_T
DEF_Dig_B:
	db 1
	dw DEF_Dig_B_T
DEF_Dig_K:
	db 1
	dw DEF_Dig_K_T
DEF_Dig_H:
	db 1
	dw DEF_Dig_H_T
DEF_Dig_O:
	db 1
	dw DEF_Dig_O_T
DEF_Dig_R:
	db 1
	dw DEF_Dig_R_T
DEF_Dig_X:
	db 1
	dw DEF_Dig_X_T
DEF_Dig_W:
	db 1
	dw DEF_Dig_W_T
DEF_Teleport:
	dw DEF_Teleport_S, DEF_Teleport_A, DEF_Teleport_G, DEF_Teleport_P, DEF_Teleport_C, DEF_Teleport_Z, DEF_Teleport_D, DEF_Teleport_M, DEF_Teleport_U, DEF_Teleport_B, DEF_Teleport_K, DEF_Teleport_H, DEF_Teleport_O, DEF_Teleport_R, DEF_Teleport_X, DEF_Teleport_W
DEF_Teleport_S:
	db 1
	dw DEF_Teleport_S_T
DEF_Teleport_A:
	db 1
	dw DEF_Teleport_A_T
DEF_Teleport_G:
	db 1
	dw DEF_Teleport_G_T
DEF_Teleport_P:
	db 1
	dw DEF_Teleport_P_T
DEF_Teleport_C:
	db 1
	dw DEF_Teleport_C_T
DEF_Teleport_Z:
	db 1
	dw DEF_Teleport_Z_T
DEF_Teleport_D:
	db 1
	dw DEF_Teleport_D_T
DEF_Teleport_M:
	db 1
	dw DEF_Teleport_M_T
DEF_Teleport_U:
	db 1
	dw DEF_Teleport_U_T
DEF_Teleport_B:
	db 1
	dw DEF_Teleport_B_T
DEF_Teleport_K:
	db 1
	dw DEF_Teleport_K_T
DEF_Teleport_H:
	db 1
	dw DEF_Teleport_H_T
DEF_Teleport_O:
	db 1
	dw DEF_Teleport_O_T
DEF_Teleport_R:
	db 1
	dw DEF_Teleport_R_T
DEF_Teleport_X:
	db 1
	dw DEF_Teleport_X_T
DEF_Teleport_W:
	db 1
	dw DEF_Teleport_W_T

; ============================ BATTLE WIN (per-fight) ============================
; NotableFightTable: db map, class($ff=any), trainerNo($ff=any); dw descriptor. Descriptor =
; db mode, dw ptrA, dw ptrB. Health = wPlayerHPBarColor (0 green, else hurt). Text only.

BattleTellNaturePool:
	dw BattleTellNaturePool_S, BattleTellNaturePool_A, BattleTellNaturePool_G, BattleTellNaturePool_P, BattleTellNaturePool_C, BattleTellNaturePool_Z, BattleTellNaturePool_D, BattleTellNaturePool_M, BattleTellNaturePool_U, BattleTellNaturePool_B, BattleTellNaturePool_K, BattleTellNaturePool_H, BattleTellNaturePool_O, BattleTellNaturePool_R, BattleTellNaturePool_X, BattleTellNaturePool_W
BattleTellNaturePool_S:
	db 1
	dw BattleTellNaturePool_S_T
BattleTellNaturePool_A:
	db 1
	dw BattleTellNaturePool_A_T
BattleTellNaturePool_G:
	db 1
	dw BattleTellNaturePool_G_T
BattleTellNaturePool_P:
	db 1
	dw BattleTellNaturePool_P_T
BattleTellNaturePool_C:
	db 1
	dw BattleTellNaturePool_C_T
BattleTellNaturePool_Z:
	db 1
	dw BattleTellNaturePool_Z_T
BattleTellNaturePool_D:
	db 1
	dw BattleTellNaturePool_D_T
BattleTellNaturePool_M:
	db 1
	dw BattleTellNaturePool_M_T
BattleTellNaturePool_U:
	db 1
	dw BattleTellNaturePool_U_T
BattleTellNaturePool_B:
	db 1
	dw BattleTellNaturePool_B_T
BattleTellNaturePool_K:
	db 1
	dw BattleTellNaturePool_K_T
BattleTellNaturePool_H:
	db 1
	dw BattleTellNaturePool_H_T
BattleTellNaturePool_O:
	db 1
	dw BattleTellNaturePool_O_T
BattleTellNaturePool_R:
	db 1
	dw BattleTellNaturePool_R_T
BattleTellNaturePool_X:
	db 1
	dw BattleTellNaturePool_X_T
BattleTellNaturePool_W:
	db 1
	dw BattleTellNaturePool_W_T

NotableFightTable::
	db OAKS_LAB, RIVAL1, $ff
	dw FR_Rival1Lab
	db ROUTE_22, RIVAL1, $ff
	dw FR_RivalR22
	db ROUTE_24, ROCKET, $ff
	dw FR_RocketNugget
	db PEWTER_GYM, BROCK, $ff
	dw FR_Brock
	db VERMILION_GYM, LT_SURGE, $ff
	dw FR_Surge
	db POKEMON_TOWER_2F, RIVAL2, $ff
	dw FR_RivalLavender
	db POKEMON_TOWER_7F, ROCKET, $ff
	dw FR_FujiGrunt
	db SAFFRON_GYM, SABRINA, $ff
	dw FR_Sabrina
	db ROCKET_HIDEOUT_B4F, GIOVANNI, $ff
	dw FR_GiovanniHideout
	db SILPH_CO_7F, RIVAL2, $ff
	dw FR_RivalSilph
	db CHAMP_ARENA, $ff, $ff
	dw FR_ChampArena
	db CERULEAN_GYM, MISTY, $ff
	dw FR_Misty
	db CELADON_GYM, ERIKA, $ff
	dw FR_Erika
	db SS_ANNE_2F, RIVAL2, $ff
	dw FR_RivalSSAnne
	db LORELEIS_ROOM, LORELEI, $ff
	dw FR_Lorelei
	db FIGHTING_DOJO, BLACKBELT, 1
	dw FR_Dojo
	db FUCHSIA_GYM, KOGA, $ff
	dw FR_Koga
	db CINNABAR_GYM, BLAINE, $ff
	dw FR_Blaine
	db SILPH_CO_11F, GIOVANNI, $ff
	dw FR_GiovanniSilph
	db VIRIDIAN_GYM, GIOVANNI, $ff
	dw FR_GiovanniGym
	db BRUNOS_ROOM, BRUNO, $ff
	dw FR_Bruno
	db AGATHAS_ROOM, AGATHA, $ff
	dw FR_Agatha
	db LANCES_ROOM, LANCE, $ff
	dw FR_Lance
	db CHAMPIONS_ROOM, RIVAL3, $ff
	dw FR_RivalChamp
	db CERULEAN_CAVE_2F, PROF_OAK, $ff
	dw FR_Oak
	db SILPH_CO_6F, ROCKET_QUEEN, $ff
	dw FR_Queen
	db SILPH_CO_7F, ROCKET_QUEEN, $ff
	dw FR_Queen
	db SILPH_CO_8F, ROCKET_QUEEN, $ff
	dw FR_Queen
	db SILPH_CO_9F, ROCKET_QUEEN, $ff
	dw FR_Queen
	db -1

FR_Rival1Lab:
	db NRM_STD
	dw FR_Rival1Lab_G, FR_Rival1Lab_H
FR_RivalR22:
	db NRM_STD
	dw FR_RivalR22_G, FR_RivalR22_H
FR_RocketNugget:
	db NRM_STD
	dw FR_RocketNugget_G, FR_RocketNugget_H
FR_Brock:
	db NRM_STD
	dw FR_Brock_G, FR_Brock_H
FR_Surge:
	db NRM_STD
	dw FR_Surge_G, FR_Surge_H
FR_RivalLavender:
	db NRM_STD
	dw FR_RivalLavender_G, FR_RivalLavender_H
FR_FujiGrunt:
	db NRM_STD
	dw FR_FujiGrunt_G, FR_FujiGrunt_H
FR_Sabrina:
	db NRM_STD
	dw FR_Sabrina_G, FR_Sabrina_H
FR_GiovanniHideout:
	db NRM_STD
	dw FR_GiovanniHideout_G, FR_GiovanniHideout_H
FR_RivalSilph:
	db NRM_STD
	dw FR_RivalSilph_G, FR_RivalSilph_H
FR_ChampArena:
	db NRM_STD
	dw FR_ChampArena_G, FR_ChampArena_H
FR_Misty:
	db NRM_TYPE_HEALTH
	dw FR_Misty_TG, FR_Misty_TH
FR_Erika:
	db NRM_TYPE_HEALTH
	dw FR_Erika_TG, FR_Erika_TH
FR_RivalSSAnne:
	db NRM_TYPE
	dw FR_RivalSSAnne_T, 0
FR_Lorelei:
	db NRM_TYPE
	dw FR_Lorelei_T, 0
FR_Dojo:
	db NRM_NATURE_HEALTH
	dw FR_Dojo_NG, FR_Dojo_NH
FR_Koga:
	db NRM_NATURE_HEALTH
	dw FR_Koga_NG, FR_Koga_NH
FR_Blaine:
	db NRM_NATURE_HEALTH
	dw FR_Blaine_NG, FR_Blaine_NH
FR_GiovanniSilph:
	db NRM_NATURE
	dw FR_GiovanniSilph_N, 0
FR_GiovanniGym:
	db NRM_NATURE
	dw FR_GiovanniGym_N, 0
FR_Bruno:
	db NRM_NATURE
	dw FR_Bruno_N, 0
FR_Agatha:
	db NRM_NATURE
	dw FR_Agatha_N, 0
FR_Lance:
	db NRM_NATURE
	dw FR_Lance_N, 0
FR_RivalChamp:
	db NRM_NATURE
	dw FR_RivalChamp_N, 0
FR_Oak:
	db NRM_NATURE
	dw FR_Oak_N, 0

FR_Rival1Lab_G:
	db 1
	dw FR_Rival1Lab_G_T
FR_Rival1Lab_H:
	db 1
	dw FR_Rival1Lab_H_T
FR_RivalR22_G:
	db 1
	dw FR_RivalR22_G_T
FR_RivalR22_H:
	db 1
	dw FR_RivalR22_H_T
FR_RocketNugget_G:
	db 1
	dw FR_RocketNugget_G_T
FR_RocketNugget_H:
	db 1
	dw FR_RocketNugget_H_T
FR_Brock_G:
	db 1
	dw FR_Brock_G_T
FR_Brock_H:
	db 1
	dw FR_Brock_H_T
FR_Surge_G:
	db 1
	dw FR_Surge_G_T
FR_Surge_H:
	db 1
	dw FR_Surge_H_T
FR_RivalLavender_G:
	db 1
	dw FR_RivalLavender_G_T
FR_RivalLavender_H:
	db 1
	dw FR_RivalLavender_H_T
FR_FujiGrunt_G:
	db 1
	dw FR_FujiGrunt_G_T
FR_FujiGrunt_H:
	db 1
	dw FR_FujiGrunt_H_T
FR_Sabrina_G:
	db 1
	dw FR_Sabrina_G_T
FR_Sabrina_H:
	db 1
	dw FR_Sabrina_H_T
FR_GiovanniHideout_G:
	db 1
	dw FR_GiovanniHideout_G_T
FR_GiovanniHideout_H:
	db 1
	dw FR_GiovanniHideout_H_T
FR_RivalSilph_G:
	db 1
	dw FR_RivalSilph_G_T
FR_RivalSilph_H:
	db 1
	dw FR_RivalSilph_H_T
FR_ChampArena_G:
	db 1
	dw FR_ChampArena_G_T
FR_ChampArena_H:
	db 1
	dw FR_ChampArena_H_T
FR_Misty_TG:
	dbw WATER, FR_Misty_TG_WATER
	dbw FIRE, FR_Misty_TG_FIRE
	dbw ROCK, FR_Misty_TG_ROCK
	dbw ELECTRIC, FR_Misty_TG_ELECTRIC
	dbw NR_TYPE_WILDCARD, FR_Misty_TG_DEF
	db -1
FR_Misty_TG_WATER:
	db 1
	dw FR_Misty_TG_WATER_T
FR_Misty_TG_FIRE:
	db 1
	dw FR_Misty_TG_FIRE_T
FR_Misty_TG_ROCK:
	db 1
	dw FR_Misty_TG_ROCK_T
FR_Misty_TG_ELECTRIC:
	db 1
	dw FR_Misty_TG_ELECTRIC_T
FR_Misty_TG_DEF:
	db 1
	dw FR_Misty_TG_DEF_T
FR_Misty_TH:
	dbw WATER, FR_Misty_TH_WATER
	dbw FIRE, FR_Misty_TH_FIRE
	dbw NR_TYPE_WILDCARD, FR_Misty_TH_DEF
	db -1
FR_Misty_TH_WATER:
	db 1
	dw FR_Misty_TH_WATER_T
FR_Misty_TH_FIRE:
	db 1
	dw FR_Misty_TH_FIRE_T
FR_Misty_TH_DEF:
	db 1
	dw FR_Misty_TH_DEF_T
FR_Erika_TG:
	dbw GRASS, FR_Erika_TG_GRASS
	dbw POISON, FR_Erika_TG_POISON
	dbw GHOST, FR_Erika_TG_GHOST
	dbw NR_TYPE_WILDCARD, FR_Erika_TG_DEF
	db -1
FR_Erika_TG_GRASS:
	db 1
	dw FR_Erika_TG_GRASS_T
FR_Erika_TG_POISON:
	db 1
	dw FR_Erika_TG_POISON_T
FR_Erika_TG_GHOST:
	db 1
	dw FR_Erika_TG_GHOST_T
FR_Erika_TG_DEF:
	db 1
	dw FR_Erika_TG_DEF_T
FR_Erika_TH:
	dbw GRASS, FR_Erika_TH_GRASS
	dbw NR_TYPE_WILDCARD, FR_Erika_TH_DEF
	db -1
FR_Erika_TH_GRASS:
	db 1
	dw FR_Erika_TH_GRASS_T
FR_Erika_TH_DEF:
	db 1
	dw FR_Erika_TH_DEF_T
FR_RivalSSAnne_T:
	dbw WATER, FR_RivalSSAnne_T_WATER
	dbw FLYING, FR_RivalSSAnne_T_FLYING
	dbw FLOATING, FR_RivalSSAnne_T_FLOATING
	dbw BUG, FR_RivalSSAnne_T_BUG
	dbw GROUND, FR_RivalSSAnne_T_GROUND
	dbw ROCK, FR_RivalSSAnne_T_ROCK
	dbw FIRE, FR_RivalSSAnne_T_FIRE
	dbw NR_TYPE_WILDCARD, FR_RivalSSAnne_T_DEF
	db -1
FR_RivalSSAnne_T_WATER:
	db 1
	dw FR_RivalSSAnne_T_WATER_T
FR_RivalSSAnne_T_FLYING:
	db 1
	dw FR_RivalSSAnne_T_FLYING_T
FR_RivalSSAnne_T_FLOATING:
	db 1
	dw FR_RivalSSAnne_T_FLOATING_T
FR_RivalSSAnne_T_BUG:
	db 1
	dw FR_RivalSSAnne_T_BUG_T
FR_RivalSSAnne_T_GROUND:
	db 1
	dw FR_RivalSSAnne_T_GROUND_T
FR_RivalSSAnne_T_ROCK:
	db 1
	dw FR_RivalSSAnne_T_ROCK_T
FR_RivalSSAnne_T_FIRE:
	db 1
	dw FR_RivalSSAnne_T_FIRE_T
FR_RivalSSAnne_T_DEF:
	db 1
	dw FR_RivalSSAnne_T_DEF_T
FR_Lorelei_T:
	dbw WATER, FR_Lorelei_T_WATER
	dbw ICE, FR_Lorelei_T_ICE
	dbw FIRE, FR_Lorelei_T_FIRE
	dbw ROCK, FR_Lorelei_T_ROCK
	dbw DRAGON, FR_Lorelei_T_DRAGON
	dbw NR_TYPE_WILDCARD, FR_Lorelei_T_DEF
	db -1
FR_Lorelei_T_WATER:
	db 1
	dw FR_Lorelei_T_WATER_T
FR_Lorelei_T_ICE:
	db 1
	dw FR_Lorelei_T_ICE_T
FR_Lorelei_T_FIRE:
	db 1
	dw FR_Lorelei_T_FIRE_T
FR_Lorelei_T_ROCK:
	db 1
	dw FR_Lorelei_T_ROCK_T
FR_Lorelei_T_DRAGON:
	db 1
	dw FR_Lorelei_T_DRAGON_T
FR_Lorelei_T_DEF:
	db 1
	dw FR_Lorelei_T_DEF_T
FR_Dojo_NG:
	dw FR_Dojo_NG_S, FR_Dojo_NG_A, FR_Dojo_NG_G, FR_Dojo_NG_P, FR_Dojo_NG_C, FR_Dojo_NG_Z, FR_Dojo_NG_D, FR_Dojo_NG_M, FR_Dojo_NG_U, FR_Dojo_NG_B, FR_Dojo_NG_K, FR_Dojo_NG_H, FR_Dojo_NG_O, FR_Dojo_NG_R, FR_Dojo_NG_X, FR_Dojo_NG_W
FR_Dojo_NG_S:
	db 1
	dw FR_Dojo_NG_S_T
FR_Dojo_NG_A:
	db 1
	dw FR_Dojo_NG_A_T
FR_Dojo_NG_G:
	db 1
	dw FR_Dojo_NG_G_T
FR_Dojo_NG_P:
	db 1
	dw FR_Dojo_NG_P_T
FR_Dojo_NG_C:
	db 1
	dw FR_Dojo_NG_C_T
FR_Dojo_NG_Z:
	db 1
	dw FR_Dojo_NG_Z_T
FR_Dojo_NG_D:
	db 1
	dw FR_Dojo_NG_D_T
FR_Dojo_NG_M:
	db 1
	dw FR_Dojo_NG_M_T
FR_Dojo_NG_U:
	db 1
	dw FR_Dojo_NG_U_T
FR_Dojo_NG_B:
	db 1
	dw FR_Dojo_NG_B_T
FR_Dojo_NG_K:
	db 1
	dw FR_Dojo_NG_K_T
FR_Dojo_NG_H:
	db 1
	dw FR_Dojo_NG_H_T
FR_Dojo_NG_O:
	db 1
	dw FR_Dojo_NG_O_T
FR_Dojo_NG_R:
	db 1
	dw FR_Dojo_NG_R_T
FR_Dojo_NG_X:
	db 1
	dw FR_Dojo_NG_X_T
FR_Dojo_NG_W:
	db 1
	dw FR_Dojo_NG_W_T
FR_Dojo_NH:
	dw FR_Dojo_NH_S, FR_Dojo_NH_A, FR_Dojo_NH_G, FR_Dojo_NH_P, FR_Dojo_NH_C, FR_Dojo_NH_Z, FR_Dojo_NH_D, FR_Dojo_NH_M, FR_Dojo_NH_U, FR_Dojo_NH_B, FR_Dojo_NH_K, FR_Dojo_NH_H, FR_Dojo_NH_O, FR_Dojo_NH_R, FR_Dojo_NH_X, FR_Dojo_NH_W
FR_Dojo_NH_S:
	db 1
	dw FR_Dojo_NH_S_T
FR_Dojo_NH_A:
	db 1
	dw FR_Dojo_NH_A_T
FR_Dojo_NH_G:
	db 1
	dw FR_Dojo_NH_G_T
FR_Dojo_NH_P:
	db 1
	dw FR_Dojo_NH_P_T
FR_Dojo_NH_C:
	db 1
	dw FR_Dojo_NH_C_T
FR_Dojo_NH_Z:
	db 1
	dw FR_Dojo_NH_Z_T
FR_Dojo_NH_D:
	db 1
	dw FR_Dojo_NH_D_T
FR_Dojo_NH_M:
	db 1
	dw FR_Dojo_NH_M_T
FR_Dojo_NH_U:
	db 1
	dw FR_Dojo_NH_U_T
FR_Dojo_NH_B:
	db 1
	dw FR_Dojo_NH_B_T
FR_Dojo_NH_K:
	db 1
	dw FR_Dojo_NH_K_T
FR_Dojo_NH_H:
	db 1
	dw FR_Dojo_NH_H_T
FR_Dojo_NH_O:
	db 1
	dw FR_Dojo_NH_O_T
FR_Dojo_NH_R:
	db 1
	dw FR_Dojo_NH_R_T
FR_Dojo_NH_X:
	db 1
	dw FR_Dojo_NH_X_T
FR_Dojo_NH_W:
	db 1
	dw FR_Dojo_NH_W_T
FR_Koga_NG:
	dw FR_Koga_NG_S, FR_Koga_NG_A, FR_Koga_NG_G, FR_Koga_NG_P, FR_Koga_NG_C, FR_Koga_NG_Z, FR_Koga_NG_D, FR_Koga_NG_M, FR_Koga_NG_U, FR_Koga_NG_B, FR_Koga_NG_K, FR_Koga_NG_H, FR_Koga_NG_O, FR_Koga_NG_R, FR_Koga_NG_X, FR_Koga_NG_W
FR_Koga_NG_S:
	db 1
	dw FR_Koga_NG_S_T
FR_Koga_NG_A:
	db 1
	dw FR_Koga_NG_A_T
FR_Koga_NG_G:
	db 1
	dw FR_Koga_NG_G_T
FR_Koga_NG_P:
	db 1
	dw FR_Koga_NG_P_T
FR_Koga_NG_C:
	db 1
	dw FR_Koga_NG_C_T
FR_Koga_NG_Z:
	db 1
	dw FR_Koga_NG_Z_T
FR_Koga_NG_D:
	db 1
	dw FR_Koga_NG_D_T
FR_Koga_NG_M:
	db 1
	dw FR_Koga_NG_M_T
FR_Koga_NG_U:
	db 1
	dw FR_Koga_NG_U_T
FR_Koga_NG_B:
	db 1
	dw FR_Koga_NG_B_T
FR_Koga_NG_K:
	db 1
	dw FR_Koga_NG_K_T
FR_Koga_NG_H:
	db 1
	dw FR_Koga_NG_H_T
FR_Koga_NG_O:
	db 1
	dw FR_Koga_NG_O_T
FR_Koga_NG_R:
	db 1
	dw FR_Koga_NG_R_T
FR_Koga_NG_X:
	db 1
	dw FR_Koga_NG_X_T
FR_Koga_NG_W:
	db 1
	dw FR_Koga_NG_W_T
FR_Koga_NH:
	dw FR_Koga_NH_S, FR_Koga_NH_A, FR_Koga_NH_G, FR_Koga_NH_P, FR_Koga_NH_C, FR_Koga_NH_Z, FR_Koga_NH_D, FR_Koga_NH_M, FR_Koga_NH_U, FR_Koga_NH_B, FR_Koga_NH_K, FR_Koga_NH_H, FR_Koga_NH_O, FR_Koga_NH_R, FR_Koga_NH_X, FR_Koga_NH_W
FR_Koga_NH_S:
	db 1
	dw FR_Koga_NH_S_T
FR_Koga_NH_A:
	db 1
	dw FR_Koga_NH_A_T
FR_Koga_NH_G:
	db 1
	dw FR_Koga_NH_G_T
FR_Koga_NH_P:
	db 1
	dw FR_Koga_NH_P_T
FR_Koga_NH_C:
	db 1
	dw FR_Koga_NH_C_T
FR_Koga_NH_Z:
	db 1
	dw FR_Koga_NH_Z_T
FR_Koga_NH_D:
	db 1
	dw FR_Koga_NH_D_T
FR_Koga_NH_M:
	db 1
	dw FR_Koga_NH_M_T
FR_Koga_NH_U:
	db 1
	dw FR_Koga_NH_U_T
FR_Koga_NH_B:
	db 1
	dw FR_Koga_NH_B_T
FR_Koga_NH_K:
	db 1
	dw FR_Koga_NH_K_T
FR_Koga_NH_H:
	db 1
	dw FR_Koga_NH_H_T
FR_Koga_NH_O:
	db 1
	dw FR_Koga_NH_O_T
FR_Koga_NH_R:
	db 1
	dw FR_Koga_NH_R_T
FR_Koga_NH_X:
	db 1
	dw FR_Koga_NH_X_T
FR_Koga_NH_W:
	db 1
	dw FR_Koga_NH_W_T
FR_Blaine_NG:
	dw FR_Blaine_NG_S, FR_Blaine_NG_A, FR_Blaine_NG_G, FR_Blaine_NG_P, FR_Blaine_NG_C, FR_Blaine_NG_Z, FR_Blaine_NG_D, FR_Blaine_NG_M, FR_Blaine_NG_U, FR_Blaine_NG_B, FR_Blaine_NG_K, FR_Blaine_NG_H, FR_Blaine_NG_O, FR_Blaine_NG_R, FR_Blaine_NG_X, FR_Blaine_NG_W
FR_Blaine_NG_S:
	db 1
	dw FR_Blaine_NG_S_T
FR_Blaine_NG_A:
	db 1
	dw FR_Blaine_NG_A_T
FR_Blaine_NG_G:
	db 1
	dw FR_Blaine_NG_G_T
FR_Blaine_NG_P:
	db 1
	dw FR_Blaine_NG_P_T
FR_Blaine_NG_C:
	db 1
	dw FR_Blaine_NG_C_T
FR_Blaine_NG_Z:
	db 1
	dw FR_Blaine_NG_Z_T
FR_Blaine_NG_D:
	db 1
	dw FR_Blaine_NG_D_T
FR_Blaine_NG_M:
	db 1
	dw FR_Blaine_NG_M_T
FR_Blaine_NG_U:
	db 1
	dw FR_Blaine_NG_U_T
FR_Blaine_NG_B:
	db 1
	dw FR_Blaine_NG_B_T
FR_Blaine_NG_K:
	db 1
	dw FR_Blaine_NG_K_T
FR_Blaine_NG_H:
	db 1
	dw FR_Blaine_NG_H_T
FR_Blaine_NG_O:
	db 1
	dw FR_Blaine_NG_O_T
FR_Blaine_NG_R:
	db 1
	dw FR_Blaine_NG_R_T
FR_Blaine_NG_X:
	db 1
	dw FR_Blaine_NG_X_T
FR_Blaine_NG_W:
	db 1
	dw FR_Blaine_NG_W_T
FR_Blaine_NH:
	dw FR_Blaine_NH_S, FR_Blaine_NH_A, FR_Blaine_NH_G, FR_Blaine_NH_P, FR_Blaine_NH_C, FR_Blaine_NH_Z, FR_Blaine_NH_D, FR_Blaine_NH_M, FR_Blaine_NH_U, FR_Blaine_NH_B, FR_Blaine_NH_K, FR_Blaine_NH_H, FR_Blaine_NH_O, FR_Blaine_NH_R, FR_Blaine_NH_X, FR_Blaine_NH_W
FR_Blaine_NH_S:
	db 1
	dw FR_Blaine_NH_S_T
FR_Blaine_NH_A:
	db 1
	dw FR_Blaine_NH_A_T
FR_Blaine_NH_G:
	db 1
	dw FR_Blaine_NH_G_T
FR_Blaine_NH_P:
	db 1
	dw FR_Blaine_NH_P_T
FR_Blaine_NH_C:
	db 1
	dw FR_Blaine_NH_C_T
FR_Blaine_NH_Z:
	db 1
	dw FR_Blaine_NH_Z_T
FR_Blaine_NH_D:
	db 1
	dw FR_Blaine_NH_D_T
FR_Blaine_NH_M:
	db 1
	dw FR_Blaine_NH_M_T
FR_Blaine_NH_U:
	db 1
	dw FR_Blaine_NH_U_T
FR_Blaine_NH_B:
	db 1
	dw FR_Blaine_NH_B_T
FR_Blaine_NH_K:
	db 1
	dw FR_Blaine_NH_K_T
FR_Blaine_NH_H:
	db 1
	dw FR_Blaine_NH_H_T
FR_Blaine_NH_O:
	db 1
	dw FR_Blaine_NH_O_T
FR_Blaine_NH_R:
	db 1
	dw FR_Blaine_NH_R_T
FR_Blaine_NH_X:
	db 1
	dw FR_Blaine_NH_X_T
FR_Blaine_NH_W:
	db 1
	dw FR_Blaine_NH_W_T
FR_GiovanniSilph_N:
	dw FR_GiovanniSilph_N_S, FR_GiovanniSilph_N_A, FR_GiovanniSilph_N_G, FR_GiovanniSilph_N_P, FR_GiovanniSilph_N_C, FR_GiovanniSilph_N_Z, FR_GiovanniSilph_N_D, FR_GiovanniSilph_N_M, FR_GiovanniSilph_N_U, FR_GiovanniSilph_N_B, FR_GiovanniSilph_N_K, FR_GiovanniSilph_N_H, FR_GiovanniSilph_N_O, FR_GiovanniSilph_N_R, FR_GiovanniSilph_N_X, FR_GiovanniSilph_N_W
FR_GiovanniSilph_N_S:
	db 1
	dw FR_GiovanniSilph_N_S_T
FR_GiovanniSilph_N_A:
	db 1
	dw FR_GiovanniSilph_N_A_T
FR_GiovanniSilph_N_G:
	db 1
	dw FR_GiovanniSilph_N_G_T
FR_GiovanniSilph_N_P:
	db 1
	dw FR_GiovanniSilph_N_P_T
FR_GiovanniSilph_N_C:
	db 1
	dw FR_GiovanniSilph_N_C_T
FR_GiovanniSilph_N_Z:
	db 1
	dw FR_GiovanniSilph_N_Z_T
FR_GiovanniSilph_N_D:
	db 1
	dw FR_GiovanniSilph_N_D_T
FR_GiovanniSilph_N_M:
	db 1
	dw FR_GiovanniSilph_N_M_T
FR_GiovanniSilph_N_U:
	db 1
	dw FR_GiovanniSilph_N_U_T
FR_GiovanniSilph_N_B:
	db 1
	dw FR_GiovanniSilph_N_B_T
FR_GiovanniSilph_N_K:
	db 1
	dw FR_GiovanniSilph_N_K_T
FR_GiovanniSilph_N_H:
	db 1
	dw FR_GiovanniSilph_N_H_T
FR_GiovanniSilph_N_O:
	db 1
	dw FR_GiovanniSilph_N_O_T
FR_GiovanniSilph_N_R:
	db 1
	dw FR_GiovanniSilph_N_R_T
FR_GiovanniSilph_N_X:
	db 1
	dw FR_GiovanniSilph_N_X_T
FR_GiovanniSilph_N_W:
	db 1
	dw FR_GiovanniSilph_N_W_T
FR_GiovanniGym_N:
	dw FR_GiovanniGym_N_S, FR_GiovanniGym_N_A, FR_GiovanniGym_N_G, FR_GiovanniGym_N_P, FR_GiovanniGym_N_C, FR_GiovanniGym_N_Z, FR_GiovanniGym_N_D, FR_GiovanniGym_N_M, FR_GiovanniGym_N_U, FR_GiovanniGym_N_B, FR_GiovanniGym_N_K, FR_GiovanniGym_N_H, FR_GiovanniGym_N_O, FR_GiovanniGym_N_R, FR_GiovanniGym_N_X, FR_GiovanniGym_N_W
FR_GiovanniGym_N_S:
	db 1
	dw FR_GiovanniGym_N_S_T
FR_GiovanniGym_N_A:
	db 1
	dw FR_GiovanniGym_N_A_T
FR_GiovanniGym_N_G:
	db 1
	dw FR_GiovanniGym_N_G_T
FR_GiovanniGym_N_P:
	db 1
	dw FR_GiovanniGym_N_P_T
FR_GiovanniGym_N_C:
	db 1
	dw FR_GiovanniGym_N_C_T
FR_GiovanniGym_N_Z:
	db 1
	dw FR_GiovanniGym_N_Z_T
FR_GiovanniGym_N_D:
	db 1
	dw FR_GiovanniGym_N_D_T
FR_GiovanniGym_N_M:
	db 1
	dw FR_GiovanniGym_N_M_T
FR_GiovanniGym_N_U:
	db 1
	dw FR_GiovanniGym_N_U_T
FR_GiovanniGym_N_B:
	db 1
	dw FR_GiovanniGym_N_B_T
FR_GiovanniGym_N_K:
	db 1
	dw FR_GiovanniGym_N_K_T
FR_GiovanniGym_N_H:
	db 1
	dw FR_GiovanniGym_N_H_T
FR_GiovanniGym_N_O:
	db 1
	dw FR_GiovanniGym_N_O_T
FR_GiovanniGym_N_R:
	db 1
	dw FR_GiovanniGym_N_R_T
FR_GiovanniGym_N_X:
	db 1
	dw FR_GiovanniGym_N_X_T
FR_GiovanniGym_N_W:
	db 1
	dw FR_GiovanniGym_N_W_T
FR_Bruno_N:
	dw FR_Bruno_N_S, FR_Bruno_N_A, FR_Bruno_N_G, FR_Bruno_N_P, FR_Bruno_N_C, FR_Bruno_N_Z, FR_Bruno_N_D, FR_Bruno_N_M, FR_Bruno_N_U, FR_Bruno_N_B, FR_Bruno_N_K, FR_Bruno_N_H, FR_Bruno_N_O, FR_Bruno_N_R, FR_Bruno_N_X, FR_Bruno_N_W
FR_Bruno_N_S:
	db 1
	dw FR_Bruno_N_S_T
FR_Bruno_N_A:
	db 1
	dw FR_Bruno_N_A_T
FR_Bruno_N_G:
	db 1
	dw FR_Bruno_N_G_T
FR_Bruno_N_P:
	db 1
	dw FR_Bruno_N_P_T
FR_Bruno_N_C:
	db 1
	dw FR_Bruno_N_C_T
FR_Bruno_N_Z:
	db 1
	dw FR_Bruno_N_Z_T
FR_Bruno_N_D:
	db 1
	dw FR_Bruno_N_D_T
FR_Bruno_N_M:
	db 1
	dw FR_Bruno_N_M_T
FR_Bruno_N_U:
	db 1
	dw FR_Bruno_N_U_T
FR_Bruno_N_B:
	db 1
	dw FR_Bruno_N_B_T
FR_Bruno_N_K:
	db 1
	dw FR_Bruno_N_K_T
FR_Bruno_N_H:
	db 1
	dw FR_Bruno_N_H_T
FR_Bruno_N_O:
	db 1
	dw FR_Bruno_N_O_T
FR_Bruno_N_R:
	db 1
	dw FR_Bruno_N_R_T
FR_Bruno_N_X:
	db 1
	dw FR_Bruno_N_X_T
FR_Bruno_N_W:
	db 1
	dw FR_Bruno_N_W_T
FR_Agatha_N:
	dw FR_Agatha_N_S, FR_Agatha_N_A, FR_Agatha_N_G, FR_Agatha_N_P, FR_Agatha_N_C, FR_Agatha_N_Z, FR_Agatha_N_D, FR_Agatha_N_M, FR_Agatha_N_U, FR_Agatha_N_B, FR_Agatha_N_K, FR_Agatha_N_H, FR_Agatha_N_O, FR_Agatha_N_R, FR_Agatha_N_X, FR_Agatha_N_W
FR_Agatha_N_S:
	db 1
	dw FR_Agatha_N_S_T
FR_Agatha_N_A:
	db 1
	dw FR_Agatha_N_A_T
FR_Agatha_N_G:
	db 1
	dw FR_Agatha_N_G_T
FR_Agatha_N_P:
	db 1
	dw FR_Agatha_N_P_T
FR_Agatha_N_C:
	db 1
	dw FR_Agatha_N_C_T
FR_Agatha_N_Z:
	db 1
	dw FR_Agatha_N_Z_T
FR_Agatha_N_D:
	db 1
	dw FR_Agatha_N_D_T
FR_Agatha_N_M:
	db 1
	dw FR_Agatha_N_M_T
FR_Agatha_N_U:
	db 1
	dw FR_Agatha_N_U_T
FR_Agatha_N_B:
	db 1
	dw FR_Agatha_N_B_T
FR_Agatha_N_K:
	db 1
	dw FR_Agatha_N_K_T
FR_Agatha_N_H:
	db 1
	dw FR_Agatha_N_H_T
FR_Agatha_N_O:
	db 1
	dw FR_Agatha_N_O_T
FR_Agatha_N_R:
	db 1
	dw FR_Agatha_N_R_T
FR_Agatha_N_X:
	db 1
	dw FR_Agatha_N_X_T
FR_Agatha_N_W:
	db 1
	dw FR_Agatha_N_W_T
FR_Lance_N:
	dw FR_Lance_N_S, FR_Lance_N_A, FR_Lance_N_G, FR_Lance_N_P, FR_Lance_N_C, FR_Lance_N_Z, FR_Lance_N_D, FR_Lance_N_M, FR_Lance_N_U, FR_Lance_N_B, FR_Lance_N_K, FR_Lance_N_H, FR_Lance_N_O, FR_Lance_N_R, FR_Lance_N_X, FR_Lance_N_W
FR_Lance_N_S:
	db 1
	dw FR_Lance_N_S_T
FR_Lance_N_A:
	db 1
	dw FR_Lance_N_A_T
FR_Lance_N_G:
	db 1
	dw FR_Lance_N_G_T
FR_Lance_N_P:
	db 1
	dw FR_Lance_N_P_T
FR_Lance_N_C:
	db 1
	dw FR_Lance_N_C_T
FR_Lance_N_Z:
	db 1
	dw FR_Lance_N_Z_T
FR_Lance_N_D:
	db 1
	dw FR_Lance_N_D_T
FR_Lance_N_M:
	db 1
	dw FR_Lance_N_M_T
FR_Lance_N_U:
	db 1
	dw FR_Lance_N_U_T
FR_Lance_N_B:
	db 1
	dw FR_Lance_N_B_T
FR_Lance_N_K:
	db 1
	dw FR_Lance_N_K_T
FR_Lance_N_H:
	db 1
	dw FR_Lance_N_H_T
FR_Lance_N_O:
	db 1
	dw FR_Lance_N_O_T
FR_Lance_N_R:
	db 1
	dw FR_Lance_N_R_T
FR_Lance_N_X:
	db 1
	dw FR_Lance_N_X_T
FR_Lance_N_W:
	db 1
	dw FR_Lance_N_W_T
FR_RivalChamp_N:
	dw FR_RivalChamp_N_S, FR_RivalChamp_N_A, FR_RivalChamp_N_G, FR_RivalChamp_N_P, FR_RivalChamp_N_C, FR_RivalChamp_N_Z, FR_RivalChamp_N_D, FR_RivalChamp_N_M, FR_RivalChamp_N_U, FR_RivalChamp_N_B, FR_RivalChamp_N_K, FR_RivalChamp_N_H, FR_RivalChamp_N_O, FR_RivalChamp_N_R, FR_RivalChamp_N_X, FR_RivalChamp_N_W
FR_RivalChamp_N_S:
	db 1
	dw FR_RivalChamp_N_S_T
FR_RivalChamp_N_A:
	db 1
	dw FR_RivalChamp_N_A_T
FR_RivalChamp_N_G:
	db 1
	dw FR_RivalChamp_N_G_T
FR_RivalChamp_N_P:
	db 1
	dw FR_RivalChamp_N_P_T
FR_RivalChamp_N_C:
	db 1
	dw FR_RivalChamp_N_C_T
FR_RivalChamp_N_Z:
	db 1
	dw FR_RivalChamp_N_Z_T
FR_RivalChamp_N_D:
	db 1
	dw FR_RivalChamp_N_D_T
FR_RivalChamp_N_M:
	db 1
	dw FR_RivalChamp_N_M_T
FR_RivalChamp_N_U:
	db 1
	dw FR_RivalChamp_N_U_T
FR_RivalChamp_N_B:
	db 1
	dw FR_RivalChamp_N_B_T
FR_RivalChamp_N_K:
	db 1
	dw FR_RivalChamp_N_K_T
FR_RivalChamp_N_H:
	db 1
	dw FR_RivalChamp_N_H_T
FR_RivalChamp_N_O:
	db 1
	dw FR_RivalChamp_N_O_T
FR_RivalChamp_N_R:
	db 1
	dw FR_RivalChamp_N_R_T
FR_RivalChamp_N_X:
	db 1
	dw FR_RivalChamp_N_X_T
FR_RivalChamp_N_W:
	db 1
	dw FR_RivalChamp_N_W_T
FR_Oak_N:
	dw FR_Oak_N_S, FR_Oak_N_A, FR_Oak_N_G, FR_Oak_N_P, FR_Oak_N_C, FR_Oak_N_Z, FR_Oak_N_D, FR_Oak_N_M, FR_Oak_N_U, FR_Oak_N_B, FR_Oak_N_K, FR_Oak_N_H, FR_Oak_N_O, FR_Oak_N_R, FR_Oak_N_X, FR_Oak_N_W
FR_Oak_N_S:
	db 1
	dw FR_Oak_N_S_T
FR_Oak_N_A:
	db 1
	dw FR_Oak_N_A_T
FR_Oak_N_G:
	db 1
	dw FR_Oak_N_G_T
FR_Oak_N_P:
	db 1
	dw FR_Oak_N_P_T
FR_Oak_N_C:
	db 1
	dw FR_Oak_N_C_T
FR_Oak_N_Z:
	db 1
	dw FR_Oak_N_Z_T
FR_Oak_N_D:
	db 1
	dw FR_Oak_N_D_T
FR_Oak_N_M:
	db 1
	dw FR_Oak_N_M_T
FR_Oak_N_U:
	db 1
	dw FR_Oak_N_U_T
FR_Oak_N_B:
	db 1
	dw FR_Oak_N_B_T
FR_Oak_N_K:
	db 1
	dw FR_Oak_N_K_T
FR_Oak_N_H:
	db 1
	dw FR_Oak_N_H_T
FR_Oak_N_O:
	db 1
	dw FR_Oak_N_O_T
FR_Oak_N_R:
	db 1
	dw FR_Oak_N_R_T
FR_Oak_N_X:
	db 1
	dw FR_Oak_N_X_T
FR_Oak_N_W:
	db 1
	dw FR_Oak_N_W_T

FR_Queen:
	db NRM_NONE
FR_QueenText:: text_far _NR_FR_QueenText
	text_end

; ============================ LEGENDARY ============================
; LegendData: db type1, type2; dw awePool; dw exhaustedPool. Indexed by NRLEG_*.
LegendData::
	db ICE, FLYING
	dw LegAweArt, LegExhArt
	db ELECTRIC, FLYING
	dw LegAweZap, LegExhZap
	db FIRE, FLYING
	dw LegAweMol, LegExhMol
	db PSYCHIC_TYPE, PSYCHIC_TYPE
	dw LegAweMewtwo, LegExhMewtwo
	db NORMAL, NORMAL
	dw LegAweArt, LegExhArt ; Mew row unused (nature branch)

LegAweArt:
	db 1
	dw LegAweArt_T
LegExhArt:
	db 1
	dw LegExhArt_T
LegAweZap:
	db 1
	dw LegAweZap_T
LegExhZap:
	db 1
	dw LegExhZap_T
LegAweMol:
	db 1
	dw LegAweMol_T
LegExhMol:
	db 1
	dw LegExhMol_T
LegAweMewtwo:
	db 1
	dw LegAweMewtwo_T
LegExhMewtwo:
	db 1
	dw LegExhMewtwo_T
LegMewtwoUnimpressedPool:
	db 1
	dw LegMewtwoUnimpressedPool_T
LegMewtwoHatredPool:
	db 1
	dw LegMewtwoHatredPool_T
LegMewPlayfulPool:
	db 1
	dw LegMewPlayfulPool_T
LegMewSorrowPool:
	db 1
	dw LegMewSorrowPool_T

MewWonderNaturePool:
	dw MewWonderNaturePool_S, MewWonderNaturePool_A, MewWonderNaturePool_G, MewWonderNaturePool_P, MewWonderNaturePool_C, MewWonderNaturePool_Z, MewWonderNaturePool_D, MewWonderNaturePool_M, MewWonderNaturePool_U, MewWonderNaturePool_B, MewWonderNaturePool_K, MewWonderNaturePool_H, MewWonderNaturePool_O, MewWonderNaturePool_R, MewWonderNaturePool_X, MewWonderNaturePool_W
MewWonderNaturePool_S:
	db 1
	dw MewWonderNaturePool_S_T
MewWonderNaturePool_A:
	db 1
	dw MewWonderNaturePool_A_T
MewWonderNaturePool_G:
	db 1
	dw MewWonderNaturePool_G_T
MewWonderNaturePool_P:
	db 1
	dw MewWonderNaturePool_P_T
MewWonderNaturePool_C:
	db 1
	dw MewWonderNaturePool_C_T
MewWonderNaturePool_Z:
	db 1
	dw MewWonderNaturePool_Z_T
MewWonderNaturePool_D:
	db 1
	dw MewWonderNaturePool_D_T
MewWonderNaturePool_M:
	db 1
	dw MewWonderNaturePool_M_T
MewWonderNaturePool_U:
	db 1
	dw MewWonderNaturePool_U_T
MewWonderNaturePool_B:
	db 1
	dw MewWonderNaturePool_B_T
MewWonderNaturePool_K:
	db 1
	dw MewWonderNaturePool_K_T
MewWonderNaturePool_H:
	db 1
	dw MewWonderNaturePool_H_T
MewWonderNaturePool_O:
	db 1
	dw MewWonderNaturePool_O_T
MewWonderNaturePool_R:
	db 1
	dw MewWonderNaturePool_R_T
MewWonderNaturePool_X:
	db 1
	dw MewWonderNaturePool_X_T
MewWonderNaturePool_W:
	db 1
	dw MewWonderNaturePool_W_T
; ============================ EVOLUTION ============================
; Per freshly-evolved species (wEvoNewSpecies): a 4-line pool, one picked at random.
EvolutionReactionLines::
	dbw IVYSAUR, EvoPool_IVYSAUR
	dbw VENUSAUR, EvoPool_VENUSAUR
	dbw CHARMELEON, EvoPool_CHARMELEON
	dbw CHARIZARD, EvoPool_CHARIZARD
	dbw WARTORTLE, EvoPool_WARTORTLE
	dbw BLASTOISE, EvoPool_BLASTOISE
	dbw METAPOD, EvoPool_METAPOD
	dbw BUTTERFREE, EvoPool_BUTTERFREE
	dbw KAKUNA, EvoPool_KAKUNA
	dbw BEEDRILL, EvoPool_BEEDRILL
	dbw PIDGEOTTO, EvoPool_PIDGEOTTO
	dbw PIDGEOT, EvoPool_PIDGEOT
	dbw RATICATE, EvoPool_RATICATE
	dbw FEAROW, EvoPool_FEAROW
	dbw ARBOK, EvoPool_ARBOK
	dbw RAICHU, EvoPool_RAICHU
	dbw SANDSLASH, EvoPool_SANDSLASH
	dbw NIDORINA, EvoPool_NIDORINA
	dbw NIDOQUEEN, EvoPool_NIDOQUEEN
	dbw NIDORINO, EvoPool_NIDORINO
	dbw NIDOKING, EvoPool_NIDOKING
	dbw CLEFABLE, EvoPool_CLEFABLE
	dbw NINETALES, EvoPool_NINETALES
	dbw WIGGLYTUFF, EvoPool_WIGGLYTUFF
	dbw GOLBAT, EvoPool_GOLBAT
	dbw GLOOM, EvoPool_GLOOM
	dbw VILEPLUME, EvoPool_VILEPLUME
	dbw PARASECT, EvoPool_PARASECT
	dbw VENOMOTH, EvoPool_VENOMOTH
	dbw DUGTRIO, EvoPool_DUGTRIO
	dbw PERSIAN, EvoPool_PERSIAN
	dbw GOLDUCK, EvoPool_GOLDUCK
	dbw PRIMEAPE, EvoPool_PRIMEAPE
	dbw ARCANINE, EvoPool_ARCANINE
	dbw POLIWHIRL, EvoPool_POLIWHIRL
	dbw POLIWRATH, EvoPool_POLIWRATH
	dbw KADABRA, EvoPool_KADABRA
	dbw ALAKAZAM, EvoPool_ALAKAZAM
	dbw MACHOKE, EvoPool_MACHOKE
	dbw MACHAMP, EvoPool_MACHAMP
	dbw WEEPINBELL, EvoPool_WEEPINBELL
	dbw VICTREEBEL, EvoPool_VICTREEBEL
	dbw TENTACRUEL, EvoPool_TENTACRUEL
	dbw GRAVELER, EvoPool_GRAVELER
	dbw GOLEM, EvoPool_GOLEM
	dbw RAPIDASH, EvoPool_RAPIDASH
	dbw SLOWBRO, EvoPool_SLOWBRO
	dbw MAGNETON, EvoPool_MAGNETON
	dbw DODRIO, EvoPool_DODRIO
	dbw DEWGONG, EvoPool_DEWGONG
	dbw MUK, EvoPool_MUK
	dbw CLOYSTER, EvoPool_CLOYSTER
	dbw HAUNTER, EvoPool_HAUNTER
	dbw GENGAR, EvoPool_GENGAR
	dbw HYPNO, EvoPool_HYPNO
	dbw KINGLER, EvoPool_KINGLER
	dbw ELECTRODE, EvoPool_ELECTRODE
	dbw EXEGGUTOR, EvoPool_EXEGGUTOR
	dbw MAROWAK, EvoPool_MAROWAK
	dbw WEEZING, EvoPool_WEEZING
	dbw RHYDON, EvoPool_RHYDON
	dbw SEADRA, EvoPool_SEADRA
	dbw SEAKING, EvoPool_SEAKING
	dbw STARMIE, EvoPool_STARMIE
	dbw GYARADOS, EvoPool_GYARADOS
	dbw VAPOREON, EvoPool_VAPOREON
	dbw JOLTEON, EvoPool_JOLTEON
	dbw FLAREON, EvoPool_FLAREON
	dbw OMASTAR, EvoPool_OMASTAR
	dbw KABUTOPS, EvoPool_KABUTOPS
	dbw DRAGONAIR, EvoPool_DRAGONAIR
	dbw DRAGONITE, EvoPool_DRAGONITE
	db -1

EvolutionReactionFallbackText:: text_far _NR_EvolutionReactionFallbackText
	text_end

EvoPool_IVYSAUR:
	db 4
	dw EvoLn_IVYSAUR_1, EvoLn_IVYSAUR_2, EvoLn_IVYSAUR_3, EvoLn_IVYSAUR_4
EvoPool_VENUSAUR:
	db 4
	dw EvoLn_VENUSAUR_1, EvoLn_VENUSAUR_2, EvoLn_VENUSAUR_3, EvoLn_VENUSAUR_4
EvoPool_CHARMELEON:
	db 4
	dw EvoLn_CHARMELEON_1, EvoLn_CHARMELEON_2, EvoLn_CHARMELEON_3, EvoLn_CHARMELEON_4
EvoPool_CHARIZARD:
	db 4
	dw EvoLn_CHARIZARD_1, EvoLn_CHARIZARD_2, EvoLn_CHARIZARD_3, EvoLn_CHARIZARD_4
EvoPool_WARTORTLE:
	db 4
	dw EvoLn_WARTORTLE_1, EvoLn_WARTORTLE_2, EvoLn_WARTORTLE_3, EvoLn_WARTORTLE_4
EvoPool_BLASTOISE:
	db 4
	dw EvoLn_BLASTOISE_1, EvoLn_BLASTOISE_2, EvoLn_BLASTOISE_3, EvoLn_BLASTOISE_4
EvoPool_METAPOD:
	db 4
	dw EvoLn_METAPOD_1, EvoLn_METAPOD_2, EvoLn_METAPOD_3, EvoLn_METAPOD_4
EvoPool_BUTTERFREE:
	db 4
	dw EvoLn_BUTTERFREE_1, EvoLn_BUTTERFREE_2, EvoLn_BUTTERFREE_3, EvoLn_BUTTERFREE_4
EvoPool_KAKUNA:
	db 4
	dw EvoLn_KAKUNA_1, EvoLn_KAKUNA_2, EvoLn_KAKUNA_3, EvoLn_KAKUNA_4
EvoPool_BEEDRILL:
	db 4
	dw EvoLn_BEEDRILL_1, EvoLn_BEEDRILL_2, EvoLn_BEEDRILL_3, EvoLn_BEEDRILL_4
EvoPool_PIDGEOTTO:
	db 4
	dw EvoLn_PIDGEOTTO_1, EvoLn_PIDGEOTTO_2, EvoLn_PIDGEOTTO_3, EvoLn_PIDGEOTTO_4
EvoPool_PIDGEOT:
	db 4
	dw EvoLn_PIDGEOT_1, EvoLn_PIDGEOT_2, EvoLn_PIDGEOT_3, EvoLn_PIDGEOT_4
EvoPool_RATICATE:
	db 4
	dw EvoLn_RATICATE_1, EvoLn_RATICATE_2, EvoLn_RATICATE_3, EvoLn_RATICATE_4
EvoPool_FEAROW:
	db 4
	dw EvoLn_FEAROW_1, EvoLn_FEAROW_2, EvoLn_FEAROW_3, EvoLn_FEAROW_4
EvoPool_ARBOK:
	db 4
	dw EvoLn_ARBOK_1, EvoLn_ARBOK_2, EvoLn_ARBOK_3, EvoLn_ARBOK_4
EvoPool_RAICHU:
	db 4
	dw EvoLn_RAICHU_1, EvoLn_RAICHU_2, EvoLn_RAICHU_3, EvoLn_RAICHU_4
EvoPool_SANDSLASH:
	db 4
	dw EvoLn_SANDSLASH_1, EvoLn_SANDSLASH_2, EvoLn_SANDSLASH_3, EvoLn_SANDSLASH_4
EvoPool_NIDORINA:
	db 4
	dw EvoLn_NIDORINA_1, EvoLn_NIDORINA_2, EvoLn_NIDORINA_3, EvoLn_NIDORINA_4
EvoPool_NIDOQUEEN:
	db 4
	dw EvoLn_NIDOQUEEN_1, EvoLn_NIDOQUEEN_2, EvoLn_NIDOQUEEN_3, EvoLn_NIDOQUEEN_4
EvoPool_NIDORINO:
	db 4
	dw EvoLn_NIDORINO_1, EvoLn_NIDORINO_2, EvoLn_NIDORINO_3, EvoLn_NIDORINO_4
EvoPool_NIDOKING:
	db 4
	dw EvoLn_NIDOKING_1, EvoLn_NIDOKING_2, EvoLn_NIDOKING_3, EvoLn_NIDOKING_4
EvoPool_CLEFABLE:
	db 4
	dw EvoLn_CLEFABLE_1, EvoLn_CLEFABLE_2, EvoLn_CLEFABLE_3, EvoLn_CLEFABLE_4
EvoPool_NINETALES:
	db 4
	dw EvoLn_NINETALES_1, EvoLn_NINETALES_2, EvoLn_NINETALES_3, EvoLn_NINETALES_4
EvoPool_WIGGLYTUFF:
	db 4
	dw EvoLn_WIGGLYTUFF_1, EvoLn_WIGGLYTUFF_2, EvoLn_WIGGLYTUFF_3, EvoLn_WIGGLYTUFF_4
EvoPool_GOLBAT:
	db 4
	dw EvoLn_GOLBAT_1, EvoLn_GOLBAT_2, EvoLn_GOLBAT_3, EvoLn_GOLBAT_4
EvoPool_GLOOM:
	db 4
	dw EvoLn_GLOOM_1, EvoLn_GLOOM_2, EvoLn_GLOOM_3, EvoLn_GLOOM_4
EvoPool_VILEPLUME:
	db 4
	dw EvoLn_VILEPLUME_1, EvoLn_VILEPLUME_2, EvoLn_VILEPLUME_3, EvoLn_VILEPLUME_4
EvoPool_PARASECT:
	db 4
	dw EvoLn_PARASECT_1, EvoLn_PARASECT_2, EvoLn_PARASECT_3, EvoLn_PARASECT_4
EvoPool_VENOMOTH:
	db 4
	dw EvoLn_VENOMOTH_1, EvoLn_VENOMOTH_2, EvoLn_VENOMOTH_3, EvoLn_VENOMOTH_4
EvoPool_DUGTRIO:
	db 4
	dw EvoLn_DUGTRIO_1, EvoLn_DUGTRIO_2, EvoLn_DUGTRIO_3, EvoLn_DUGTRIO_4
EvoPool_PERSIAN:
	db 4
	dw EvoLn_PERSIAN_1, EvoLn_PERSIAN_2, EvoLn_PERSIAN_3, EvoLn_PERSIAN_4
EvoPool_GOLDUCK:
	db 4
	dw EvoLn_GOLDUCK_1, EvoLn_GOLDUCK_2, EvoLn_GOLDUCK_3, EvoLn_GOLDUCK_4
EvoPool_PRIMEAPE:
	db 4
	dw EvoLn_PRIMEAPE_1, EvoLn_PRIMEAPE_2, EvoLn_PRIMEAPE_3, EvoLn_PRIMEAPE_4
EvoPool_ARCANINE:
	db 4
	dw EvoLn_ARCANINE_1, EvoLn_ARCANINE_2, EvoLn_ARCANINE_3, EvoLn_ARCANINE_4
EvoPool_POLIWHIRL:
	db 4
	dw EvoLn_POLIWHIRL_1, EvoLn_POLIWHIRL_2, EvoLn_POLIWHIRL_3, EvoLn_POLIWHIRL_4
EvoPool_POLIWRATH:
	db 4
	dw EvoLn_POLIWRATH_1, EvoLn_POLIWRATH_2, EvoLn_POLIWRATH_3, EvoLn_POLIWRATH_4
EvoPool_KADABRA:
	db 4
	dw EvoLn_KADABRA_1, EvoLn_KADABRA_2, EvoLn_KADABRA_3, EvoLn_KADABRA_4
EvoPool_ALAKAZAM:
	db 4
	dw EvoLn_ALAKAZAM_1, EvoLn_ALAKAZAM_2, EvoLn_ALAKAZAM_3, EvoLn_ALAKAZAM_4
EvoPool_MACHOKE:
	db 4
	dw EvoLn_MACHOKE_1, EvoLn_MACHOKE_2, EvoLn_MACHOKE_3, EvoLn_MACHOKE_4
EvoPool_MACHAMP:
	db 4
	dw EvoLn_MACHAMP_1, EvoLn_MACHAMP_2, EvoLn_MACHAMP_3, EvoLn_MACHAMP_4
EvoPool_WEEPINBELL:
	db 4
	dw EvoLn_WEEPINBELL_1, EvoLn_WEEPINBELL_2, EvoLn_WEEPINBELL_3, EvoLn_WEEPINBELL_4
EvoPool_VICTREEBEL:
	db 4
	dw EvoLn_VICTREEBEL_1, EvoLn_VICTREEBEL_2, EvoLn_VICTREEBEL_3, EvoLn_VICTREEBEL_4
EvoPool_TENTACRUEL:
	db 4
	dw EvoLn_TENTACRUEL_1, EvoLn_TENTACRUEL_2, EvoLn_TENTACRUEL_3, EvoLn_TENTACRUEL_4
EvoPool_GRAVELER:
	db 4
	dw EvoLn_GRAVELER_1, EvoLn_GRAVELER_2, EvoLn_GRAVELER_3, EvoLn_GRAVELER_4
EvoPool_GOLEM:
	db 4
	dw EvoLn_GOLEM_1, EvoLn_GOLEM_2, EvoLn_GOLEM_3, EvoLn_GOLEM_4
EvoPool_RAPIDASH:
	db 4
	dw EvoLn_RAPIDASH_1, EvoLn_RAPIDASH_2, EvoLn_RAPIDASH_3, EvoLn_RAPIDASH_4
EvoPool_SLOWBRO:
	db 4
	dw EvoLn_SLOWBRO_1, EvoLn_SLOWBRO_2, EvoLn_SLOWBRO_3, EvoLn_SLOWBRO_4
EvoPool_MAGNETON:
	db 4
	dw EvoLn_MAGNETON_1, EvoLn_MAGNETON_2, EvoLn_MAGNETON_3, EvoLn_MAGNETON_4
EvoPool_DODRIO:
	db 4
	dw EvoLn_DODRIO_1, EvoLn_DODRIO_2, EvoLn_DODRIO_3, EvoLn_DODRIO_4
EvoPool_DEWGONG:
	db 4
	dw EvoLn_DEWGONG_1, EvoLn_DEWGONG_2, EvoLn_DEWGONG_3, EvoLn_DEWGONG_4
EvoPool_MUK:
	db 4
	dw EvoLn_MUK_1, EvoLn_MUK_2, EvoLn_MUK_3, EvoLn_MUK_4
EvoPool_CLOYSTER:
	db 4
	dw EvoLn_CLOYSTER_1, EvoLn_CLOYSTER_2, EvoLn_CLOYSTER_3, EvoLn_CLOYSTER_4
EvoPool_HAUNTER:
	db 4
	dw EvoLn_HAUNTER_1, EvoLn_HAUNTER_2, EvoLn_HAUNTER_3, EvoLn_HAUNTER_4
EvoPool_GENGAR:
	db 4
	dw EvoLn_GENGAR_1, EvoLn_GENGAR_2, EvoLn_GENGAR_3, EvoLn_GENGAR_4
EvoPool_HYPNO:
	db 4
	dw EvoLn_HYPNO_1, EvoLn_HYPNO_2, EvoLn_HYPNO_3, EvoLn_HYPNO_4
EvoPool_KINGLER:
	db 4
	dw EvoLn_KINGLER_1, EvoLn_KINGLER_2, EvoLn_KINGLER_3, EvoLn_KINGLER_4
EvoPool_ELECTRODE:
	db 4
	dw EvoLn_ELECTRODE_1, EvoLn_ELECTRODE_2, EvoLn_ELECTRODE_3, EvoLn_ELECTRODE_4
EvoPool_EXEGGUTOR:
	db 4
	dw EvoLn_EXEGGUTOR_1, EvoLn_EXEGGUTOR_2, EvoLn_EXEGGUTOR_3, EvoLn_EXEGGUTOR_4
EvoPool_MAROWAK:
	db 4
	dw EvoLn_MAROWAK_1, EvoLn_MAROWAK_2, EvoLn_MAROWAK_3, EvoLn_MAROWAK_4
EvoPool_WEEZING:
	db 4
	dw EvoLn_WEEZING_1, EvoLn_WEEZING_2, EvoLn_WEEZING_3, EvoLn_WEEZING_4
EvoPool_RHYDON:
	db 4
	dw EvoLn_RHYDON_1, EvoLn_RHYDON_2, EvoLn_RHYDON_3, EvoLn_RHYDON_4
EvoPool_SEADRA:
	db 4
	dw EvoLn_SEADRA_1, EvoLn_SEADRA_2, EvoLn_SEADRA_3, EvoLn_SEADRA_4
EvoPool_SEAKING:
	db 4
	dw EvoLn_SEAKING_1, EvoLn_SEAKING_2, EvoLn_SEAKING_3, EvoLn_SEAKING_4
EvoPool_STARMIE:
	db 4
	dw EvoLn_STARMIE_1, EvoLn_STARMIE_2, EvoLn_STARMIE_3, EvoLn_STARMIE_4
EvoPool_GYARADOS:
	db 4
	dw EvoLn_GYARADOS_1, EvoLn_GYARADOS_2, EvoLn_GYARADOS_3, EvoLn_GYARADOS_4
EvoPool_VAPOREON:
	db 4
	dw EvoLn_VAPOREON_1, EvoLn_VAPOREON_2, EvoLn_VAPOREON_3, EvoLn_VAPOREON_4
EvoPool_JOLTEON:
	db 4
	dw EvoLn_JOLTEON_1, EvoLn_JOLTEON_2, EvoLn_JOLTEON_3, EvoLn_JOLTEON_4
EvoPool_FLAREON:
	db 4
	dw EvoLn_FLAREON_1, EvoLn_FLAREON_2, EvoLn_FLAREON_3, EvoLn_FLAREON_4
EvoPool_OMASTAR:
	db 4
	dw EvoLn_OMASTAR_1, EvoLn_OMASTAR_2, EvoLn_OMASTAR_3, EvoLn_OMASTAR_4
EvoPool_KABUTOPS:
	db 4
	dw EvoLn_KABUTOPS_1, EvoLn_KABUTOPS_2, EvoLn_KABUTOPS_3, EvoLn_KABUTOPS_4
EvoPool_DRAGONAIR:
	db 4
	dw EvoLn_DRAGONAIR_1, EvoLn_DRAGONAIR_2, EvoLn_DRAGONAIR_3, EvoLn_DRAGONAIR_4
EvoPool_DRAGONITE:
	db 4
	dw EvoLn_DRAGONITE_1, EvoLn_DRAGONITE_2, EvoLn_DRAGONITE_3, EvoLn_DRAGONITE_4

EvoLn_IVYSAUR_1:: text_far _NR_EvoLn_IVYSAUR_1
	text_end
EvoLn_IVYSAUR_2:: text_far _NR_EvoLn_IVYSAUR_2
	text_end
EvoLn_IVYSAUR_3:: text_far _NR_EvoLn_IVYSAUR_3
	text_end
EvoLn_IVYSAUR_4:: text_far _NR_EvoLn_IVYSAUR_4
	text_end
EvoLn_VENUSAUR_1:: text_far _NR_EvoLn_VENUSAUR_1
	text_end
EvoLn_VENUSAUR_2:: text_far _NR_EvoLn_VENUSAUR_2
	text_end
EvoLn_VENUSAUR_3:: text_far _NR_EvoLn_VENUSAUR_3
	text_end
EvoLn_VENUSAUR_4:: text_far _NR_EvoLn_VENUSAUR_4
	text_end
EvoLn_CHARMELEON_1:: text_far _NR_EvoLn_CHARMELEON_1
	text_end
EvoLn_CHARMELEON_2:: text_far _NR_EvoLn_CHARMELEON_2
	text_end
EvoLn_CHARMELEON_3:: text_far _NR_EvoLn_CHARMELEON_3
	text_end
EvoLn_CHARMELEON_4:: text_far _NR_EvoLn_CHARMELEON_4
	text_end
EvoLn_CHARIZARD_1:: text_far _NR_EvoLn_CHARIZARD_1
	text_end
EvoLn_CHARIZARD_2:: text_far _NR_EvoLn_CHARIZARD_2
	text_end
EvoLn_CHARIZARD_3:: text_far _NR_EvoLn_CHARIZARD_3
	text_end
EvoLn_CHARIZARD_4:: text_far _NR_EvoLn_CHARIZARD_4
	text_end
EvoLn_WARTORTLE_1:: text_far _NR_EvoLn_WARTORTLE_1
	text_end
EvoLn_WARTORTLE_2:: text_far _NR_EvoLn_WARTORTLE_2
	text_end
EvoLn_WARTORTLE_3:: text_far _NR_EvoLn_WARTORTLE_3
	text_end
EvoLn_WARTORTLE_4:: text_far _NR_EvoLn_WARTORTLE_4
	text_end
EvoLn_BLASTOISE_1:: text_far _NR_EvoLn_BLASTOISE_1
	text_end
EvoLn_BLASTOISE_2:: text_far _NR_EvoLn_BLASTOISE_2
	text_end
EvoLn_BLASTOISE_3:: text_far _NR_EvoLn_BLASTOISE_3
	text_end
EvoLn_BLASTOISE_4:: text_far _NR_EvoLn_BLASTOISE_4
	text_end
EvoLn_METAPOD_1:: text_far _NR_EvoLn_METAPOD_1
	text_end
EvoLn_METAPOD_2:: text_far _NR_EvoLn_METAPOD_2
	text_end
EvoLn_METAPOD_3:: text_far _NR_EvoLn_METAPOD_3
	text_end
EvoLn_METAPOD_4:: text_far _NR_EvoLn_METAPOD_4
	text_end
EvoLn_BUTTERFREE_1:: text_far _NR_EvoLn_BUTTERFREE_1
	text_end
EvoLn_BUTTERFREE_2:: text_far _NR_EvoLn_BUTTERFREE_2
	text_end
EvoLn_BUTTERFREE_3:: text_far _NR_EvoLn_BUTTERFREE_3
	text_end
EvoLn_BUTTERFREE_4:: text_far _NR_EvoLn_BUTTERFREE_4
	text_end
EvoLn_KAKUNA_1:: text_far _NR_EvoLn_KAKUNA_1
	text_end
EvoLn_KAKUNA_2:: text_far _NR_EvoLn_KAKUNA_2
	text_end
EvoLn_KAKUNA_3:: text_far _NR_EvoLn_KAKUNA_3
	text_end
EvoLn_KAKUNA_4:: text_far _NR_EvoLn_KAKUNA_4
	text_end
EvoLn_BEEDRILL_1:: text_far _NR_EvoLn_BEEDRILL_1
	text_end
EvoLn_BEEDRILL_2:: text_far _NR_EvoLn_BEEDRILL_2
	text_end
EvoLn_BEEDRILL_3:: text_far _NR_EvoLn_BEEDRILL_3
	text_end
EvoLn_BEEDRILL_4:: text_far _NR_EvoLn_BEEDRILL_4
	text_end
EvoLn_PIDGEOTTO_1:: text_far _NR_EvoLn_PIDGEOTTO_1
	text_end
EvoLn_PIDGEOTTO_2:: text_far _NR_EvoLn_PIDGEOTTO_2
	text_end
EvoLn_PIDGEOTTO_3:: text_far _NR_EvoLn_PIDGEOTTO_3
	text_end
EvoLn_PIDGEOTTO_4:: text_far _NR_EvoLn_PIDGEOTTO_4
	text_end
EvoLn_PIDGEOT_1:: text_far _NR_EvoLn_PIDGEOT_1
	text_end
EvoLn_PIDGEOT_2:: text_far _NR_EvoLn_PIDGEOT_2
	text_end
EvoLn_PIDGEOT_3:: text_far _NR_EvoLn_PIDGEOT_3
	text_end
EvoLn_PIDGEOT_4:: text_far _NR_EvoLn_PIDGEOT_4
	text_end
EvoLn_RATICATE_1:: text_far _NR_EvoLn_RATICATE_1
	text_end
EvoLn_RATICATE_2:: text_far _NR_EvoLn_RATICATE_2
	text_end
EvoLn_RATICATE_3:: text_far _NR_EvoLn_RATICATE_3
	text_end
EvoLn_RATICATE_4:: text_far _NR_EvoLn_RATICATE_4
	text_end
EvoLn_FEAROW_1:: text_far _NR_EvoLn_FEAROW_1
	text_end
EvoLn_FEAROW_2:: text_far _NR_EvoLn_FEAROW_2
	text_end
EvoLn_FEAROW_3:: text_far _NR_EvoLn_FEAROW_3
	text_end
EvoLn_FEAROW_4:: text_far _NR_EvoLn_FEAROW_4
	text_end
EvoLn_ARBOK_1:: text_far _NR_EvoLn_ARBOK_1
	text_end
EvoLn_ARBOK_2:: text_far _NR_EvoLn_ARBOK_2
	text_end
EvoLn_ARBOK_3:: text_far _NR_EvoLn_ARBOK_3
	text_end
EvoLn_ARBOK_4:: text_far _NR_EvoLn_ARBOK_4
	text_end
EvoLn_RAICHU_1:: text_far _NR_EvoLn_RAICHU_1
	text_end
EvoLn_RAICHU_2:: text_far _NR_EvoLn_RAICHU_2
	text_end
EvoLn_RAICHU_3:: text_far _NR_EvoLn_RAICHU_3
	text_end
EvoLn_RAICHU_4:: text_far _NR_EvoLn_RAICHU_4
	text_end
EvoLn_SANDSLASH_1:: text_far _NR_EvoLn_SANDSLASH_1
	text_end
EvoLn_SANDSLASH_2:: text_far _NR_EvoLn_SANDSLASH_2
	text_end
EvoLn_SANDSLASH_3:: text_far _NR_EvoLn_SANDSLASH_3
	text_end
EvoLn_SANDSLASH_4:: text_far _NR_EvoLn_SANDSLASH_4
	text_end
EvoLn_NIDORINA_1:: text_far _NR_EvoLn_NIDORINA_1
	text_end
EvoLn_NIDORINA_2:: text_far _NR_EvoLn_NIDORINA_2
	text_end
EvoLn_NIDORINA_3:: text_far _NR_EvoLn_NIDORINA_3
	text_end
EvoLn_NIDORINA_4:: text_far _NR_EvoLn_NIDORINA_4
	text_end
EvoLn_NIDOQUEEN_1:: text_far _NR_EvoLn_NIDOQUEEN_1
	text_end
EvoLn_NIDOQUEEN_2:: text_far _NR_EvoLn_NIDOQUEEN_2
	text_end
EvoLn_NIDOQUEEN_3:: text_far _NR_EvoLn_NIDOQUEEN_3
	text_end
EvoLn_NIDOQUEEN_4:: text_far _NR_EvoLn_NIDOQUEEN_4
	text_end
EvoLn_NIDORINO_1:: text_far _NR_EvoLn_NIDORINO_1
	text_end
EvoLn_NIDORINO_2:: text_far _NR_EvoLn_NIDORINO_2
	text_end
EvoLn_NIDORINO_3:: text_far _NR_EvoLn_NIDORINO_3
	text_end
EvoLn_NIDORINO_4:: text_far _NR_EvoLn_NIDORINO_4
	text_end
EvoLn_NIDOKING_1:: text_far _NR_EvoLn_NIDOKING_1
	text_end
EvoLn_NIDOKING_2:: text_far _NR_EvoLn_NIDOKING_2
	text_end
EvoLn_NIDOKING_3:: text_far _NR_EvoLn_NIDOKING_3
	text_end
EvoLn_NIDOKING_4:: text_far _NR_EvoLn_NIDOKING_4
	text_end
EvoLn_CLEFABLE_1:: text_far _NR_EvoLn_CLEFABLE_1
	text_end
EvoLn_CLEFABLE_2:: text_far _NR_EvoLn_CLEFABLE_2
	text_end
EvoLn_CLEFABLE_3:: text_far _NR_EvoLn_CLEFABLE_3
	text_end
EvoLn_CLEFABLE_4:: text_far _NR_EvoLn_CLEFABLE_4
	text_end
EvoLn_NINETALES_1:: text_far _NR_EvoLn_NINETALES_1
	text_end
EvoLn_NINETALES_2:: text_far _NR_EvoLn_NINETALES_2
	text_end
EvoLn_NINETALES_3:: text_far _NR_EvoLn_NINETALES_3
	text_end
EvoLn_NINETALES_4:: text_far _NR_EvoLn_NINETALES_4
	text_end
EvoLn_WIGGLYTUFF_1:: text_far _NR_EvoLn_WIGGLYTUFF_1
	text_end
EvoLn_WIGGLYTUFF_2:: text_far _NR_EvoLn_WIGGLYTUFF_2
	text_end
EvoLn_WIGGLYTUFF_3:: text_far _NR_EvoLn_WIGGLYTUFF_3
	text_end
EvoLn_WIGGLYTUFF_4:: text_far _NR_EvoLn_WIGGLYTUFF_4
	text_end
EvoLn_GOLBAT_1:: text_far _NR_EvoLn_GOLBAT_1
	text_end
EvoLn_GOLBAT_2:: text_far _NR_EvoLn_GOLBAT_2
	text_end
EvoLn_GOLBAT_3:: text_far _NR_EvoLn_GOLBAT_3
	text_end
EvoLn_GOLBAT_4:: text_far _NR_EvoLn_GOLBAT_4
	text_end
EvoLn_GLOOM_1:: text_far _NR_EvoLn_GLOOM_1
	text_end
EvoLn_GLOOM_2:: text_far _NR_EvoLn_GLOOM_2
	text_end
EvoLn_GLOOM_3:: text_far _NR_EvoLn_GLOOM_3
	text_end
EvoLn_GLOOM_4:: text_far _NR_EvoLn_GLOOM_4
	text_end
EvoLn_VILEPLUME_1:: text_far _NR_EvoLn_VILEPLUME_1
	text_end
EvoLn_VILEPLUME_2:: text_far _NR_EvoLn_VILEPLUME_2
	text_end
EvoLn_VILEPLUME_3:: text_far _NR_EvoLn_VILEPLUME_3
	text_end
EvoLn_VILEPLUME_4:: text_far _NR_EvoLn_VILEPLUME_4
	text_end
EvoLn_PARASECT_1:: text_far _NR_EvoLn_PARASECT_1
	text_end
EvoLn_PARASECT_2:: text_far _NR_EvoLn_PARASECT_2
	text_end
EvoLn_PARASECT_3:: text_far _NR_EvoLn_PARASECT_3
	text_end
EvoLn_PARASECT_4:: text_far _NR_EvoLn_PARASECT_4
	text_end
EvoLn_VENOMOTH_1:: text_far _NR_EvoLn_VENOMOTH_1
	text_end
EvoLn_VENOMOTH_2:: text_far _NR_EvoLn_VENOMOTH_2
	text_end
EvoLn_VENOMOTH_3:: text_far _NR_EvoLn_VENOMOTH_3
	text_end
EvoLn_VENOMOTH_4:: text_far _NR_EvoLn_VENOMOTH_4
	text_end
EvoLn_DUGTRIO_1:: text_far _NR_EvoLn_DUGTRIO_1
	text_end
EvoLn_DUGTRIO_2:: text_far _NR_EvoLn_DUGTRIO_2
	text_end
EvoLn_DUGTRIO_3:: text_far _NR_EvoLn_DUGTRIO_3
	text_end
EvoLn_DUGTRIO_4:: text_far _NR_EvoLn_DUGTRIO_4
	text_end
EvoLn_PERSIAN_1:: text_far _NR_EvoLn_PERSIAN_1
	text_end
EvoLn_PERSIAN_2:: text_far _NR_EvoLn_PERSIAN_2
	text_end
EvoLn_PERSIAN_3:: text_far _NR_EvoLn_PERSIAN_3
	text_end
EvoLn_PERSIAN_4:: text_far _NR_EvoLn_PERSIAN_4
	text_end
EvoLn_GOLDUCK_1:: text_far _NR_EvoLn_GOLDUCK_1
	text_end
EvoLn_GOLDUCK_2:: text_far _NR_EvoLn_GOLDUCK_2
	text_end
EvoLn_GOLDUCK_3:: text_far _NR_EvoLn_GOLDUCK_3
	text_end
EvoLn_GOLDUCK_4:: text_far _NR_EvoLn_GOLDUCK_4
	text_end
EvoLn_PRIMEAPE_1:: text_far _NR_EvoLn_PRIMEAPE_1
	text_end
EvoLn_PRIMEAPE_2:: text_far _NR_EvoLn_PRIMEAPE_2
	text_end
EvoLn_PRIMEAPE_3:: text_far _NR_EvoLn_PRIMEAPE_3
	text_end
EvoLn_PRIMEAPE_4:: text_far _NR_EvoLn_PRIMEAPE_4
	text_end
EvoLn_ARCANINE_1:: text_far _NR_EvoLn_ARCANINE_1
	text_end
EvoLn_ARCANINE_2:: text_far _NR_EvoLn_ARCANINE_2
	text_end
EvoLn_ARCANINE_3:: text_far _NR_EvoLn_ARCANINE_3
	text_end
EvoLn_ARCANINE_4:: text_far _NR_EvoLn_ARCANINE_4
	text_end
EvoLn_POLIWHIRL_1:: text_far _NR_EvoLn_POLIWHIRL_1
	text_end
EvoLn_POLIWHIRL_2:: text_far _NR_EvoLn_POLIWHIRL_2
	text_end
EvoLn_POLIWHIRL_3:: text_far _NR_EvoLn_POLIWHIRL_3
	text_end
EvoLn_POLIWHIRL_4:: text_far _NR_EvoLn_POLIWHIRL_4
	text_end
EvoLn_POLIWRATH_1:: text_far _NR_EvoLn_POLIWRATH_1
	text_end
EvoLn_POLIWRATH_2:: text_far _NR_EvoLn_POLIWRATH_2
	text_end
EvoLn_POLIWRATH_3:: text_far _NR_EvoLn_POLIWRATH_3
	text_end
EvoLn_POLIWRATH_4:: text_far _NR_EvoLn_POLIWRATH_4
	text_end
EvoLn_KADABRA_1:: text_far _NR_EvoLn_KADABRA_1
	text_end
EvoLn_KADABRA_2:: text_far _NR_EvoLn_KADABRA_2
	text_end
EvoLn_KADABRA_3:: text_far _NR_EvoLn_KADABRA_3
	text_end
EvoLn_KADABRA_4:: text_far _NR_EvoLn_KADABRA_4
	text_end
EvoLn_ALAKAZAM_1:: text_far _NR_EvoLn_ALAKAZAM_1
	text_end
EvoLn_ALAKAZAM_2:: text_far _NR_EvoLn_ALAKAZAM_2
	text_end
EvoLn_ALAKAZAM_3:: text_far _NR_EvoLn_ALAKAZAM_3
	text_end
EvoLn_ALAKAZAM_4:: text_far _NR_EvoLn_ALAKAZAM_4
	text_end
EvoLn_MACHOKE_1:: text_far _NR_EvoLn_MACHOKE_1
	text_end
EvoLn_MACHOKE_2:: text_far _NR_EvoLn_MACHOKE_2
	text_end
EvoLn_MACHOKE_3:: text_far _NR_EvoLn_MACHOKE_3
	text_end
EvoLn_MACHOKE_4:: text_far _NR_EvoLn_MACHOKE_4
	text_end
EvoLn_MACHAMP_1:: text_far _NR_EvoLn_MACHAMP_1
	text_end
EvoLn_MACHAMP_2:: text_far _NR_EvoLn_MACHAMP_2
	text_end
EvoLn_MACHAMP_3:: text_far _NR_EvoLn_MACHAMP_3
	text_end
EvoLn_MACHAMP_4:: text_far _NR_EvoLn_MACHAMP_4
	text_end
EvoLn_WEEPINBELL_1:: text_far _NR_EvoLn_WEEPINBELL_1
	text_end
EvoLn_WEEPINBELL_2:: text_far _NR_EvoLn_WEEPINBELL_2
	text_end
EvoLn_WEEPINBELL_3:: text_far _NR_EvoLn_WEEPINBELL_3
	text_end
EvoLn_WEEPINBELL_4:: text_far _NR_EvoLn_WEEPINBELL_4
	text_end
EvoLn_VICTREEBEL_1:: text_far _NR_EvoLn_VICTREEBEL_1
	text_end
EvoLn_VICTREEBEL_2:: text_far _NR_EvoLn_VICTREEBEL_2
	text_end
EvoLn_VICTREEBEL_3:: text_far _NR_EvoLn_VICTREEBEL_3
	text_end
EvoLn_VICTREEBEL_4:: text_far _NR_EvoLn_VICTREEBEL_4
	text_end
EvoLn_TENTACRUEL_1:: text_far _NR_EvoLn_TENTACRUEL_1
	text_end
EvoLn_TENTACRUEL_2:: text_far _NR_EvoLn_TENTACRUEL_2
	text_end
EvoLn_TENTACRUEL_3:: text_far _NR_EvoLn_TENTACRUEL_3
	text_end
EvoLn_TENTACRUEL_4:: text_far _NR_EvoLn_TENTACRUEL_4
	text_end
EvoLn_GRAVELER_1:: text_far _NR_EvoLn_GRAVELER_1
	text_end
EvoLn_GRAVELER_2:: text_far _NR_EvoLn_GRAVELER_2
	text_end
EvoLn_GRAVELER_3:: text_far _NR_EvoLn_GRAVELER_3
	text_end
EvoLn_GRAVELER_4:: text_far _NR_EvoLn_GRAVELER_4
	text_end
EvoLn_GOLEM_1:: text_far _NR_EvoLn_GOLEM_1
	text_end
EvoLn_GOLEM_2:: text_far _NR_EvoLn_GOLEM_2
	text_end
EvoLn_GOLEM_3:: text_far _NR_EvoLn_GOLEM_3
	text_end
EvoLn_GOLEM_4:: text_far _NR_EvoLn_GOLEM_4
	text_end
EvoLn_RAPIDASH_1:: text_far _NR_EvoLn_RAPIDASH_1
	text_end
EvoLn_RAPIDASH_2:: text_far _NR_EvoLn_RAPIDASH_2
	text_end
EvoLn_RAPIDASH_3:: text_far _NR_EvoLn_RAPIDASH_3
	text_end
EvoLn_RAPIDASH_4:: text_far _NR_EvoLn_RAPIDASH_4
	text_end
EvoLn_SLOWBRO_1:: text_far _NR_EvoLn_SLOWBRO_1
	text_end
EvoLn_SLOWBRO_2:: text_far _NR_EvoLn_SLOWBRO_2
	text_end
EvoLn_SLOWBRO_3:: text_far _NR_EvoLn_SLOWBRO_3
	text_end
EvoLn_SLOWBRO_4:: text_far _NR_EvoLn_SLOWBRO_4
	text_end
EvoLn_MAGNETON_1:: text_far _NR_EvoLn_MAGNETON_1
	text_end
EvoLn_MAGNETON_2:: text_far _NR_EvoLn_MAGNETON_2
	text_end
EvoLn_MAGNETON_3:: text_far _NR_EvoLn_MAGNETON_3
	text_end
EvoLn_MAGNETON_4:: text_far _NR_EvoLn_MAGNETON_4
	text_end
EvoLn_DODRIO_1:: text_far _NR_EvoLn_DODRIO_1
	text_end
EvoLn_DODRIO_2:: text_far _NR_EvoLn_DODRIO_2
	text_end
EvoLn_DODRIO_3:: text_far _NR_EvoLn_DODRIO_3
	text_end
EvoLn_DODRIO_4:: text_far _NR_EvoLn_DODRIO_4
	text_end
EvoLn_DEWGONG_1:: text_far _NR_EvoLn_DEWGONG_1
	text_end
EvoLn_DEWGONG_2:: text_far _NR_EvoLn_DEWGONG_2
	text_end
EvoLn_DEWGONG_3:: text_far _NR_EvoLn_DEWGONG_3
	text_end
EvoLn_DEWGONG_4:: text_far _NR_EvoLn_DEWGONG_4
	text_end
EvoLn_MUK_1:: text_far _NR_EvoLn_MUK_1
	text_end
EvoLn_MUK_2:: text_far _NR_EvoLn_MUK_2
	text_end
EvoLn_MUK_3:: text_far _NR_EvoLn_MUK_3
	text_end
EvoLn_MUK_4:: text_far _NR_EvoLn_MUK_4
	text_end
EvoLn_CLOYSTER_1:: text_far _NR_EvoLn_CLOYSTER_1
	text_end
EvoLn_CLOYSTER_2:: text_far _NR_EvoLn_CLOYSTER_2
	text_end
EvoLn_CLOYSTER_3:: text_far _NR_EvoLn_CLOYSTER_3
	text_end
EvoLn_CLOYSTER_4:: text_far _NR_EvoLn_CLOYSTER_4
	text_end
EvoLn_HAUNTER_1:: text_far _NR_EvoLn_HAUNTER_1
	text_end
EvoLn_HAUNTER_2:: text_far _NR_EvoLn_HAUNTER_2
	text_end
EvoLn_HAUNTER_3:: text_far _NR_EvoLn_HAUNTER_3
	text_end
EvoLn_HAUNTER_4:: text_far _NR_EvoLn_HAUNTER_4
	text_end
EvoLn_GENGAR_1:: text_far _NR_EvoLn_GENGAR_1
	text_end
EvoLn_GENGAR_2:: text_far _NR_EvoLn_GENGAR_2
	text_end
EvoLn_GENGAR_3:: text_far _NR_EvoLn_GENGAR_3
	text_end
EvoLn_GENGAR_4:: text_far _NR_EvoLn_GENGAR_4
	text_end
EvoLn_HYPNO_1:: text_far _NR_EvoLn_HYPNO_1
	text_end
EvoLn_HYPNO_2:: text_far _NR_EvoLn_HYPNO_2
	text_end
EvoLn_HYPNO_3:: text_far _NR_EvoLn_HYPNO_3
	text_end
EvoLn_HYPNO_4:: text_far _NR_EvoLn_HYPNO_4
	text_end
EvoLn_KINGLER_1:: text_far _NR_EvoLn_KINGLER_1
	text_end
EvoLn_KINGLER_2:: text_far _NR_EvoLn_KINGLER_2
	text_end
EvoLn_KINGLER_3:: text_far _NR_EvoLn_KINGLER_3
	text_end
EvoLn_KINGLER_4:: text_far _NR_EvoLn_KINGLER_4
	text_end
EvoLn_ELECTRODE_1:: text_far _NR_EvoLn_ELECTRODE_1
	text_end
EvoLn_ELECTRODE_2:: text_far _NR_EvoLn_ELECTRODE_2
	text_end
EvoLn_ELECTRODE_3:: text_far _NR_EvoLn_ELECTRODE_3
	text_end
EvoLn_ELECTRODE_4:: text_far _NR_EvoLn_ELECTRODE_4
	text_end
EvoLn_EXEGGUTOR_1:: text_far _NR_EvoLn_EXEGGUTOR_1
	text_end
EvoLn_EXEGGUTOR_2:: text_far _NR_EvoLn_EXEGGUTOR_2
	text_end
EvoLn_EXEGGUTOR_3:: text_far _NR_EvoLn_EXEGGUTOR_3
	text_end
EvoLn_EXEGGUTOR_4:: text_far _NR_EvoLn_EXEGGUTOR_4
	text_end
EvoLn_MAROWAK_1:: text_far _NR_EvoLn_MAROWAK_1
	text_end
EvoLn_MAROWAK_2:: text_far _NR_EvoLn_MAROWAK_2
	text_end
EvoLn_MAROWAK_3:: text_far _NR_EvoLn_MAROWAK_3
	text_end
EvoLn_MAROWAK_4:: text_far _NR_EvoLn_MAROWAK_4
	text_end
EvoLn_WEEZING_1:: text_far _NR_EvoLn_WEEZING_1
	text_end
EvoLn_WEEZING_2:: text_far _NR_EvoLn_WEEZING_2
	text_end
EvoLn_WEEZING_3:: text_far _NR_EvoLn_WEEZING_3
	text_end
EvoLn_WEEZING_4:: text_far _NR_EvoLn_WEEZING_4
	text_end
EvoLn_RHYDON_1:: text_far _NR_EvoLn_RHYDON_1
	text_end
EvoLn_RHYDON_2:: text_far _NR_EvoLn_RHYDON_2
	text_end
EvoLn_RHYDON_3:: text_far _NR_EvoLn_RHYDON_3
	text_end
EvoLn_RHYDON_4:: text_far _NR_EvoLn_RHYDON_4
	text_end
EvoLn_SEADRA_1:: text_far _NR_EvoLn_SEADRA_1
	text_end
EvoLn_SEADRA_2:: text_far _NR_EvoLn_SEADRA_2
	text_end
EvoLn_SEADRA_3:: text_far _NR_EvoLn_SEADRA_3
	text_end
EvoLn_SEADRA_4:: text_far _NR_EvoLn_SEADRA_4
	text_end
EvoLn_SEAKING_1:: text_far _NR_EvoLn_SEAKING_1
	text_end
EvoLn_SEAKING_2:: text_far _NR_EvoLn_SEAKING_2
	text_end
EvoLn_SEAKING_3:: text_far _NR_EvoLn_SEAKING_3
	text_end
EvoLn_SEAKING_4:: text_far _NR_EvoLn_SEAKING_4
	text_end
EvoLn_STARMIE_1:: text_far _NR_EvoLn_STARMIE_1
	text_end
EvoLn_STARMIE_2:: text_far _NR_EvoLn_STARMIE_2
	text_end
EvoLn_STARMIE_3:: text_far _NR_EvoLn_STARMIE_3
	text_end
EvoLn_STARMIE_4:: text_far _NR_EvoLn_STARMIE_4
	text_end
EvoLn_GYARADOS_1:: text_far _NR_EvoLn_GYARADOS_1
	text_end
EvoLn_GYARADOS_2:: text_far _NR_EvoLn_GYARADOS_2
	text_end
EvoLn_GYARADOS_3:: text_far _NR_EvoLn_GYARADOS_3
	text_end
EvoLn_GYARADOS_4:: text_far _NR_EvoLn_GYARADOS_4
	text_end
EvoLn_VAPOREON_1:: text_far _NR_EvoLn_VAPOREON_1
	text_end
EvoLn_VAPOREON_2:: text_far _NR_EvoLn_VAPOREON_2
	text_end
EvoLn_VAPOREON_3:: text_far _NR_EvoLn_VAPOREON_3
	text_end
EvoLn_VAPOREON_4:: text_far _NR_EvoLn_VAPOREON_4
	text_end
EvoLn_JOLTEON_1:: text_far _NR_EvoLn_JOLTEON_1
	text_end
EvoLn_JOLTEON_2:: text_far _NR_EvoLn_JOLTEON_2
	text_end
EvoLn_JOLTEON_3:: text_far _NR_EvoLn_JOLTEON_3
	text_end
EvoLn_JOLTEON_4:: text_far _NR_EvoLn_JOLTEON_4
	text_end
EvoLn_FLAREON_1:: text_far _NR_EvoLn_FLAREON_1
	text_end
EvoLn_FLAREON_2:: text_far _NR_EvoLn_FLAREON_2
	text_end
EvoLn_FLAREON_3:: text_far _NR_EvoLn_FLAREON_3
	text_end
EvoLn_FLAREON_4:: text_far _NR_EvoLn_FLAREON_4
	text_end
EvoLn_OMASTAR_1:: text_far _NR_EvoLn_OMASTAR_1
	text_end
EvoLn_OMASTAR_2:: text_far _NR_EvoLn_OMASTAR_2
	text_end
EvoLn_OMASTAR_3:: text_far _NR_EvoLn_OMASTAR_3
	text_end
EvoLn_OMASTAR_4:: text_far _NR_EvoLn_OMASTAR_4
	text_end
EvoLn_KABUTOPS_1:: text_far _NR_EvoLn_KABUTOPS_1
	text_end
EvoLn_KABUTOPS_2:: text_far _NR_EvoLn_KABUTOPS_2
	text_end
EvoLn_KABUTOPS_3:: text_far _NR_EvoLn_KABUTOPS_3
	text_end
EvoLn_KABUTOPS_4:: text_far _NR_EvoLn_KABUTOPS_4
	text_end
EvoLn_DRAGONAIR_1:: text_far _NR_EvoLn_DRAGONAIR_1
	text_end
EvoLn_DRAGONAIR_2:: text_far _NR_EvoLn_DRAGONAIR_2
	text_end
EvoLn_DRAGONAIR_3:: text_far _NR_EvoLn_DRAGONAIR_3
	text_end
EvoLn_DRAGONAIR_4:: text_far _NR_EvoLn_DRAGONAIR_4
	text_end
EvoLn_DRAGONITE_1:: text_far _NR_EvoLn_DRAGONITE_1
	text_end
EvoLn_DRAGONITE_2:: text_far _NR_EvoLn_DRAGONITE_2
	text_end
EvoLn_DRAGONITE_3:: text_far _NR_EvoLn_DRAGONITE_3
	text_end
EvoLn_DRAGONITE_4:: text_far _NR_EvoLn_DRAGONITE_4
	text_end

; ============================ TYPE TELLS ============================
; ~44% of reactions show one of these instead of a nature line (one of the mon's types).
TypeReactionPools::
	dbw FIRE, TP_FIRE
	dbw WATER, TP_WATER
	dbw GRASS, TP_GRASS
	dbw ELECTRIC, TP_ELECTRIC
	dbw FLYING, TP_FLYING
	dbw GHOST, TP_GHOST
	dbw PSYCHIC_TYPE, TP_PSYCHIC_TYPE
	dbw FLOATING, TP_FLOATING
	dbw ICE, TP_ICE
	dbw ROCK, TP_ROCK
	dbw GROUND, TP_GROUND
	dbw FIGHTING, TP_FIGHTING
	dbw POISON, TP_POISON
	dbw BUG, TP_BUG
	dbw DRAGON, TP_DRAGON
	dbw MAGMA, TP_FIRE
	db -1
TP_FIRE:
	db 2
	dw TP_FIRE_1, TP_FIRE_2
TP_WATER:
	db 2
	dw TP_WATER_1, TP_WATER_2
TP_GRASS:
	db 2
	dw TP_GRASS_1, TP_GRASS_2
TP_ELECTRIC:
	db 2
	dw TP_ELECTRIC_1, TP_ELECTRIC_2
TP_FLYING:
	db 2
	dw TP_FLYING_1, TP_FLYING_2
TP_GHOST:
	db 2
	dw TP_GHOST_1, TP_GHOST_2
TP_PSYCHIC_TYPE:
	db 2
	dw TP_PSYCHIC_TYPE_1, TP_PSYCHIC_TYPE_2
TP_FLOATING:
	db 2
	dw TP_FLOATING_1, TP_FLOATING_2
TP_ICE:
	db 2
	dw TP_ICE_1, TP_ICE_2
TP_ROCK:
	db 2
	dw TP_ROCK_1, TP_ROCK_2
TP_GROUND:
	db 2
	dw TP_GROUND_1, TP_GROUND_2
TP_FIGHTING:
	db 2
	dw TP_FIGHTING_1, TP_FIGHTING_2
TP_POISON:
	db 2
	dw TP_POISON_1, TP_POISON_2
TP_BUG:
	db 2
	dw TP_BUG_1, TP_BUG_2
TP_DRAGON:
	db 2
	dw TP_DRAGON_1, TP_DRAGON_2

; ============================ POKE CENTER HEAL ============================
HealReactionPools:
	dw HealReactionPools_S, HealReactionPools_A, HealReactionPools_G, HealReactionPools_P, HealReactionPools_C, HealReactionPools_Z, HealReactionPools_D, HealReactionPools_M, HealReactionPools_U, HealReactionPools_B, HealReactionPools_K, HealReactionPools_H, HealReactionPools_O, HealReactionPools_R, HealReactionPools_X, HealReactionPools_W
HealReactionPools_S:
	db 1
	dw HealReactionPools_S_T
HealReactionPools_A:
	db 1
	dw HealReactionPools_A_T
HealReactionPools_G:
	db 1
	dw HealReactionPools_G_T
HealReactionPools_P:
	db 1
	dw HealReactionPools_P_T
HealReactionPools_C:
	db 1
	dw HealReactionPools_C_T
HealReactionPools_Z:
	db 1
	dw HealReactionPools_Z_T
HealReactionPools_D:
	db 1
	dw HealReactionPools_D_T
HealReactionPools_M:
	db 1
	dw HealReactionPools_M_T
HealReactionPools_U:
	db 1
	dw HealReactionPools_U_T
HealReactionPools_B:
	db 1
	dw HealReactionPools_B_T
HealReactionPools_K:
	db 1
	dw HealReactionPools_K_T
HealReactionPools_H:
	db 1
	dw HealReactionPools_H_T
HealReactionPools_O:
	db 1
	dw HealReactionPools_O_T
HealReactionPools_R:
	db 1
	dw HealReactionPools_R_T
HealReactionPools_X:
	db 1
	dw HealReactionPools_X_T
HealReactionPools_W:
	db 1
	dw HealReactionPools_W_T

; ============================ OVERWORLD ============================
; One-time slot-1 nature reactions (ShowOverworldNature) + special-logic variants.
OverworldEventPools::
	dw OW_Forest, OW_MtMoon, OW_Lavender, OW_GameFreak, OW_Tall
	dw OW_Crowded, OW_Safari, OW_CardKey, OW_Route14

OW_Forest:
	dw OW_Forest_S, OW_Forest_A, OW_Forest_G, OW_Forest_P, OW_Forest_C, OW_Forest_Z, OW_Forest_D, OW_Forest_M, OW_Forest_U, OW_Forest_B, OW_Forest_K, OW_Forest_H, OW_Forest_O, OW_Forest_R, OW_Forest_X, OW_Forest_W
OW_Forest_S:
	db 1
	dw OW_Forest_S_T
OW_Forest_A:
	db 1
	dw OW_Forest_A_T
OW_Forest_G:
	db 1
	dw OW_Forest_G_T
OW_Forest_P:
	db 1
	dw OW_Forest_P_T
OW_Forest_C:
	db 1
	dw OW_Forest_C_T
OW_Forest_Z:
	db 1
	dw OW_Forest_Z_T
OW_Forest_D:
	db 1
	dw OW_Forest_D_T
OW_Forest_M:
	db 1
	dw OW_Forest_M_T
OW_Forest_U:
	db 1
	dw OW_Forest_U_T
OW_Forest_B:
	db 1
	dw OW_Forest_B_T
OW_Forest_K:
	db 1
	dw OW_Forest_K_T
OW_Forest_H:
	db 1
	dw OW_Forest_H_T
OW_Forest_O:
	db 1
	dw OW_Forest_O_T
OW_Forest_R:
	db 1
	dw OW_Forest_R_T
OW_Forest_X:
	db 1
	dw OW_Forest_X_T
OW_Forest_W:
	db 1
	dw OW_Forest_W_T
OW_MtMoon:
	dw OW_MtMoon_S, OW_MtMoon_A, OW_MtMoon_G, OW_MtMoon_P, OW_MtMoon_C, OW_MtMoon_Z, OW_MtMoon_D, OW_MtMoon_M, OW_MtMoon_U, OW_MtMoon_B, OW_MtMoon_K, OW_MtMoon_H, OW_MtMoon_O, OW_MtMoon_R, OW_MtMoon_X, OW_MtMoon_W
OW_MtMoon_S:
	db 1
	dw OW_MtMoon_S_T
OW_MtMoon_A:
	db 1
	dw OW_MtMoon_A_T
OW_MtMoon_G:
	db 1
	dw OW_MtMoon_G_T
OW_MtMoon_P:
	db 1
	dw OW_MtMoon_P_T
OW_MtMoon_C:
	db 1
	dw OW_MtMoon_C_T
OW_MtMoon_Z:
	db 1
	dw OW_MtMoon_Z_T
OW_MtMoon_D:
	db 1
	dw OW_MtMoon_D_T
OW_MtMoon_M:
	db 1
	dw OW_MtMoon_M_T
OW_MtMoon_U:
	db 1
	dw OW_MtMoon_U_T
OW_MtMoon_B:
	db 1
	dw OW_MtMoon_B_T
OW_MtMoon_K:
	db 1
	dw OW_MtMoon_K_T
OW_MtMoon_H:
	db 1
	dw OW_MtMoon_H_T
OW_MtMoon_O:
	db 1
	dw OW_MtMoon_O_T
OW_MtMoon_R:
	db 1
	dw OW_MtMoon_R_T
OW_MtMoon_X:
	db 1
	dw OW_MtMoon_X_T
OW_MtMoon_W:
	db 1
	dw OW_MtMoon_W_T
OW_Lavender:
	dw OW_Lavender_S, OW_Lavender_A, OW_Lavender_G, OW_Lavender_P, OW_Lavender_C, OW_Lavender_Z, OW_Lavender_D, OW_Lavender_M, OW_Lavender_U, OW_Lavender_B, OW_Lavender_K, OW_Lavender_H, OW_Lavender_O, OW_Lavender_R, OW_Lavender_X, OW_Lavender_W
OW_Lavender_S:
	db 1
	dw OW_Lavender_S_T
OW_Lavender_A:
	db 1
	dw OW_Lavender_A_T
OW_Lavender_G:
	db 1
	dw OW_Lavender_G_T
OW_Lavender_P:
	db 1
	dw OW_Lavender_P_T
OW_Lavender_C:
	db 1
	dw OW_Lavender_C_T
OW_Lavender_Z:
	db 1
	dw OW_Lavender_Z_T
OW_Lavender_D:
	db 1
	dw OW_Lavender_D_T
OW_Lavender_M:
	db 1
	dw OW_Lavender_M_T
OW_Lavender_U:
	db 1
	dw OW_Lavender_U_T
OW_Lavender_B:
	db 1
	dw OW_Lavender_B_T
OW_Lavender_K:
	db 1
	dw OW_Lavender_K_T
OW_Lavender_H:
	db 1
	dw OW_Lavender_H_T
OW_Lavender_O:
	db 1
	dw OW_Lavender_O_T
OW_Lavender_R:
	db 1
	dw OW_Lavender_R_T
OW_Lavender_X:
	db 1
	dw OW_Lavender_X_T
OW_Lavender_W:
	db 1
	dw OW_Lavender_W_T
OW_GameFreak:
	dw OW_GameFreak_S, OW_GameFreak_A, OW_GameFreak_G, OW_GameFreak_P, OW_GameFreak_C, OW_GameFreak_Z, OW_GameFreak_D, OW_GameFreak_M, OW_GameFreak_U, OW_GameFreak_B, OW_GameFreak_K, OW_GameFreak_H, OW_GameFreak_O, OW_GameFreak_R, OW_GameFreak_X, OW_GameFreak_W
OW_GameFreak_S:
	db 1
	dw OW_GameFreak_S_T
OW_GameFreak_A:
	db 1
	dw OW_GameFreak_A_T
OW_GameFreak_G:
	db 1
	dw OW_GameFreak_G_T
OW_GameFreak_P:
	db 1
	dw OW_GameFreak_P_T
OW_GameFreak_C:
	db 1
	dw OW_GameFreak_C_T
OW_GameFreak_Z:
	db 1
	dw OW_GameFreak_Z_T
OW_GameFreak_D:
	db 1
	dw OW_GameFreak_D_T
OW_GameFreak_M:
	db 1
	dw OW_GameFreak_M_T
OW_GameFreak_U:
	db 1
	dw OW_GameFreak_U_T
OW_GameFreak_B:
	db 1
	dw OW_GameFreak_B_T
OW_GameFreak_K:
	db 1
	dw OW_GameFreak_K_T
OW_GameFreak_H:
	db 1
	dw OW_GameFreak_H_T
OW_GameFreak_O:
	db 1
	dw OW_GameFreak_O_T
OW_GameFreak_R:
	db 1
	dw OW_GameFreak_R_T
OW_GameFreak_X:
	db 1
	dw OW_GameFreak_X_T
OW_GameFreak_W:
	db 1
	dw OW_GameFreak_W_T
OW_Tall:
	dw OW_Tall_S, OW_Tall_A, OW_Tall_G, OW_Tall_P, OW_Tall_C, OW_Tall_Z, OW_Tall_D, OW_Tall_M, OW_Tall_U, OW_Tall_B, OW_Tall_K, OW_Tall_H, OW_Tall_O, OW_Tall_R, OW_Tall_X, OW_Tall_W
OW_Tall_S:
	db 1
	dw OW_Tall_S_T
OW_Tall_A:
	db 1
	dw OW_Tall_A_T
OW_Tall_G:
	db 1
	dw OW_Tall_G_T
OW_Tall_P:
	db 1
	dw OW_Tall_P_T
OW_Tall_C:
	db 1
	dw OW_Tall_C_T
OW_Tall_Z:
	db 1
	dw OW_Tall_Z_T
OW_Tall_D:
	db 1
	dw OW_Tall_D_T
OW_Tall_M:
	db 1
	dw OW_Tall_M_T
OW_Tall_U:
	db 1
	dw OW_Tall_U_T
OW_Tall_B:
	db 1
	dw OW_Tall_B_T
OW_Tall_K:
	db 1
	dw OW_Tall_K_T
OW_Tall_H:
	db 1
	dw OW_Tall_H_T
OW_Tall_O:
	db 1
	dw OW_Tall_O_T
OW_Tall_R:
	db 1
	dw OW_Tall_R_T
OW_Tall_X:
	db 1
	dw OW_Tall_X_T
OW_Tall_W:
	db 1
	dw OW_Tall_W_T
OW_Crowded:
	dw OW_Crowded_S, OW_Crowded_A, OW_Crowded_G, OW_Crowded_P, OW_Crowded_C, OW_Crowded_Z, OW_Crowded_D, OW_Crowded_M, OW_Crowded_U, OW_Crowded_B, OW_Crowded_K, OW_Crowded_H, OW_Crowded_O, OW_Crowded_R, OW_Crowded_X, OW_Crowded_W
OW_Crowded_S:
	db 1
	dw OW_Crowded_S_T
OW_Crowded_A:
	db 1
	dw OW_Crowded_A_T
OW_Crowded_G:
	db 1
	dw OW_Crowded_G_T
OW_Crowded_P:
	db 1
	dw OW_Crowded_P_T
OW_Crowded_C:
	db 1
	dw OW_Crowded_C_T
OW_Crowded_Z:
	db 1
	dw OW_Crowded_Z_T
OW_Crowded_D:
	db 1
	dw OW_Crowded_D_T
OW_Crowded_M:
	db 1
	dw OW_Crowded_M_T
OW_Crowded_U:
	db 1
	dw OW_Crowded_U_T
OW_Crowded_B:
	db 1
	dw OW_Crowded_B_T
OW_Crowded_K:
	db 1
	dw OW_Crowded_K_T
OW_Crowded_H:
	db 1
	dw OW_Crowded_H_T
OW_Crowded_O:
	db 1
	dw OW_Crowded_O_T
OW_Crowded_R:
	db 1
	dw OW_Crowded_R_T
OW_Crowded_X:
	db 1
	dw OW_Crowded_X_T
OW_Crowded_W:
	db 1
	dw OW_Crowded_W_T
OW_Safari:
	dw OW_Safari_S, OW_Safari_A, OW_Safari_G, OW_Safari_P, OW_Safari_C, OW_Safari_Z, OW_Safari_D, OW_Safari_M, OW_Safari_U, OW_Safari_B, OW_Safari_K, OW_Safari_H, OW_Safari_O, OW_Safari_R, OW_Safari_X, OW_Safari_W
OW_Safari_S:
	db 1
	dw OW_Safari_S_T
OW_Safari_A:
	db 1
	dw OW_Safari_A_T
OW_Safari_G:
	db 1
	dw OW_Safari_G_T
OW_Safari_P:
	db 1
	dw OW_Safari_P_T
OW_Safari_C:
	db 1
	dw OW_Safari_C_T
OW_Safari_Z:
	db 1
	dw OW_Safari_Z_T
OW_Safari_D:
	db 1
	dw OW_Safari_D_T
OW_Safari_M:
	db 1
	dw OW_Safari_M_T
OW_Safari_U:
	db 1
	dw OW_Safari_U_T
OW_Safari_B:
	db 1
	dw OW_Safari_B_T
OW_Safari_K:
	db 1
	dw OW_Safari_K_T
OW_Safari_H:
	db 1
	dw OW_Safari_H_T
OW_Safari_O:
	db 1
	dw OW_Safari_O_T
OW_Safari_R:
	db 1
	dw OW_Safari_R_T
OW_Safari_X:
	db 1
	dw OW_Safari_X_T
OW_Safari_W:
	db 1
	dw OW_Safari_W_T
OW_CardKey:
	dw OW_CardKey_S, OW_CardKey_A, OW_CardKey_G, OW_CardKey_P, OW_CardKey_C, OW_CardKey_Z, OW_CardKey_D, OW_CardKey_M, OW_CardKey_U, OW_CardKey_B, OW_CardKey_K, OW_CardKey_H, OW_CardKey_O, OW_CardKey_R, OW_CardKey_X, OW_CardKey_W
OW_CardKey_S:
	db 1
	dw OW_CardKey_S_T
OW_CardKey_A:
	db 1
	dw OW_CardKey_A_T
OW_CardKey_G:
	db 1
	dw OW_CardKey_G_T
OW_CardKey_P:
	db 1
	dw OW_CardKey_P_T
OW_CardKey_C:
	db 1
	dw OW_CardKey_C_T
OW_CardKey_Z:
	db 1
	dw OW_CardKey_Z_T
OW_CardKey_D:
	db 1
	dw OW_CardKey_D_T
OW_CardKey_M:
	db 1
	dw OW_CardKey_M_T
OW_CardKey_U:
	db 1
	dw OW_CardKey_U_T
OW_CardKey_B:
	db 1
	dw OW_CardKey_B_T
OW_CardKey_K:
	db 1
	dw OW_CardKey_K_T
OW_CardKey_H:
	db 1
	dw OW_CardKey_H_T
OW_CardKey_O:
	db 1
	dw OW_CardKey_O_T
OW_CardKey_R:
	db 1
	dw OW_CardKey_R_T
OW_CardKey_X:
	db 1
	dw OW_CardKey_X_T
OW_CardKey_W:
	db 1
	dw OW_CardKey_W_T
OW_Route14:
	dw OW_Route14_S, OW_Route14_A, OW_Route14_G, OW_Route14_P, OW_Route14_C, OW_Route14_Z, OW_Route14_D, OW_Route14_M, OW_Route14_U, OW_Route14_B, OW_Route14_K, OW_Route14_H, OW_Route14_O, OW_Route14_R, OW_Route14_X, OW_Route14_W
OW_Route14_S:
	db 1
	dw OW_Route14_S_T
OW_Route14_A:
	db 1
	dw OW_Route14_A_T
OW_Route14_G:
	db 1
	dw OW_Route14_G_T
OW_Route14_P:
	db 1
	dw OW_Route14_P_T
OW_Route14_C:
	db 1
	dw OW_Route14_C_T
OW_Route14_Z:
	db 1
	dw OW_Route14_Z_T
OW_Route14_D:
	db 1
	dw OW_Route14_D_T
OW_Route14_M:
	db 1
	dw OW_Route14_M_T
OW_Route14_U:
	db 1
	dw OW_Route14_U_T
OW_Route14_B:
	db 1
	dw OW_Route14_B_T
OW_Route14_K:
	db 1
	dw OW_Route14_K_T
OW_Route14_H:
	db 1
	dw OW_Route14_H_T
OW_Route14_O:
	db 1
	dw OW_Route14_O_T
OW_Route14_R:
	db 1
	dw OW_Route14_R_T
OW_Route14_X:
	db 1
	dw OW_Route14_X_T
OW_Route14_W:
	db 1
	dw OW_Route14_W_T

DarkFriendlyTable::
	dbw POISON, DarkComfortPool
	dbw BUG, DarkComfortPool
	dbw GHOST, DarkComfortPool
	dbw PSYCHIC_TYPE, DarkComfortPool
	db -1

DarkComfortPool:
	dw DarkComfortPool_S, DarkComfortPool_A, DarkComfortPool_G, DarkComfortPool_P, DarkComfortPool_C, DarkComfortPool_Z, DarkComfortPool_D, DarkComfortPool_M, DarkComfortPool_U, DarkComfortPool_B, DarkComfortPool_K, DarkComfortPool_H, DarkComfortPool_O, DarkComfortPool_R, DarkComfortPool_X, DarkComfortPool_W
DarkComfortPool_S:
	db 1
	dw DarkComfortPool_S_T
DarkComfortPool_A:
	db 1
	dw DarkComfortPool_A_T
DarkComfortPool_G:
	db 1
	dw DarkComfortPool_G_T
DarkComfortPool_P:
	db 1
	dw DarkComfortPool_P_T
DarkComfortPool_C:
	db 1
	dw DarkComfortPool_C_T
DarkComfortPool_Z:
	db 1
	dw DarkComfortPool_Z_T
DarkComfortPool_D:
	db 1
	dw DarkComfortPool_D_T
DarkComfortPool_M:
	db 1
	dw DarkComfortPool_M_T
DarkComfortPool_U:
	db 1
	dw DarkComfortPool_U_T
DarkComfortPool_B:
	db 1
	dw DarkComfortPool_B_T
DarkComfortPool_K:
	db 1
	dw DarkComfortPool_K_T
DarkComfortPool_H:
	db 1
	dw DarkComfortPool_H_T
DarkComfortPool_O:
	db 1
	dw DarkComfortPool_O_T
DarkComfortPool_R:
	db 1
	dw DarkComfortPool_R_T
DarkComfortPool_X:
	db 1
	dw DarkComfortPool_X_T
DarkComfortPool_W:
	db 1
	dw DarkComfortPool_W_T
DarkExasperationPool:
	dw DarkExasperationPool_S, DarkExasperationPool_A, DarkExasperationPool_G, DarkExasperationPool_P, DarkExasperationPool_C, DarkExasperationPool_Z, DarkExasperationPool_D, DarkExasperationPool_M, DarkExasperationPool_U, DarkExasperationPool_B, DarkExasperationPool_K, DarkExasperationPool_H, DarkExasperationPool_O, DarkExasperationPool_R, DarkExasperationPool_X, DarkExasperationPool_W
DarkExasperationPool_S:
	db 1
	dw DarkExasperationPool_S_T
DarkExasperationPool_A:
	db 1
	dw DarkExasperationPool_A_T
DarkExasperationPool_G:
	db 1
	dw DarkExasperationPool_G_T
DarkExasperationPool_P:
	db 1
	dw DarkExasperationPool_P_T
DarkExasperationPool_C:
	db 1
	dw DarkExasperationPool_C_T
DarkExasperationPool_Z:
	db 1
	dw DarkExasperationPool_Z_T
DarkExasperationPool_D:
	db 1
	dw DarkExasperationPool_D_T
DarkExasperationPool_M:
	db 1
	dw DarkExasperationPool_M_T
DarkExasperationPool_U:
	db 1
	dw DarkExasperationPool_U_T
DarkExasperationPool_B:
	db 1
	dw DarkExasperationPool_B_T
DarkExasperationPool_K:
	db 1
	dw DarkExasperationPool_K_T
DarkExasperationPool_H:
	db 1
	dw DarkExasperationPool_H_T
DarkExasperationPool_O:
	db 1
	dw DarkExasperationPool_O_T
DarkExasperationPool_R:
	db 1
	dw DarkExasperationPool_R_T
DarkExasperationPool_X:
	db 1
	dw DarkExasperationPool_X_T
DarkExasperationPool_W:
	db 1
	dw DarkExasperationPool_W_T

Route19RockTable::
	dbw ROCK, Route19RockPool
	db -1

Route19RockPool:
	dw Route19RockPool_S, Route19RockPool_A, Route19RockPool_G, Route19RockPool_P, Route19RockPool_C, Route19RockPool_Z, Route19RockPool_D, Route19RockPool_M, Route19RockPool_U, Route19RockPool_B, Route19RockPool_K, Route19RockPool_H, Route19RockPool_O, Route19RockPool_R, Route19RockPool_X, Route19RockPool_W
Route19RockPool_S:
	db 1
	dw Route19RockPool_S_T
Route19RockPool_A:
	db 1
	dw Route19RockPool_A_T
Route19RockPool_G:
	db 1
	dw Route19RockPool_G_T
Route19RockPool_P:
	db 1
	dw Route19RockPool_P_T
Route19RockPool_C:
	db 1
	dw Route19RockPool_C_T
Route19RockPool_Z:
	db 1
	dw Route19RockPool_Z_T
Route19RockPool_D:
	db 1
	dw Route19RockPool_D_T
Route19RockPool_M:
	db 1
	dw Route19RockPool_M_T
Route19RockPool_U:
	db 1
	dw Route19RockPool_U_T
Route19RockPool_B:
	db 1
	dw Route19RockPool_B_T
Route19RockPool_K:
	db 1
	dw Route19RockPool_K_T
Route19RockPool_H:
	db 1
	dw Route19RockPool_H_T
Route19RockPool_O:
	db 1
	dw Route19RockPool_O_T
Route19RockPool_R:
	db 1
	dw Route19RockPool_R_T
Route19RockPool_X:
	db 1
	dw Route19RockPool_X_T
Route19RockPool_W:
	db 1
	dw Route19RockPool_W_T
Route19BeachPool:
	dw Route19BeachPool_S, Route19BeachPool_A, Route19BeachPool_G, Route19BeachPool_P, Route19BeachPool_C, Route19BeachPool_Z, Route19BeachPool_D, Route19BeachPool_M, Route19BeachPool_U, Route19BeachPool_B, Route19BeachPool_K, Route19BeachPool_H, Route19BeachPool_O, Route19BeachPool_R, Route19BeachPool_X, Route19BeachPool_W
Route19BeachPool_S:
	db 1
	dw Route19BeachPool_S_T
Route19BeachPool_A:
	db 1
	dw Route19BeachPool_A_T
Route19BeachPool_G:
	db 1
	dw Route19BeachPool_G_T
Route19BeachPool_P:
	db 1
	dw Route19BeachPool_P_T
Route19BeachPool_C:
	db 1
	dw Route19BeachPool_C_T
Route19BeachPool_Z:
	db 1
	dw Route19BeachPool_Z_T
Route19BeachPool_D:
	db 1
	dw Route19BeachPool_D_T
Route19BeachPool_M:
	db 1
	dw Route19BeachPool_M_T
Route19BeachPool_U:
	db 1
	dw Route19BeachPool_U_T
Route19BeachPool_B:
	db 1
	dw Route19BeachPool_B_T
Route19BeachPool_K:
	db 1
	dw Route19BeachPool_K_T
Route19BeachPool_H:
	db 1
	dw Route19BeachPool_H_T
Route19BeachPool_O:
	db 1
	dw Route19BeachPool_O_T
Route19BeachPool_R:
	db 1
	dw Route19BeachPool_R_T
Route19BeachPool_X:
	db 1
	dw Route19BeachPool_X_T
Route19BeachPool_W:
	db 1
	dw Route19BeachPool_W_T

BillPsychicPool:
	dw BillPsychicPool_S, BillPsychicPool_A, BillPsychicPool_G, BillPsychicPool_P, BillPsychicPool_C, BillPsychicPool_Z, BillPsychicPool_D, BillPsychicPool_M, BillPsychicPool_U, BillPsychicPool_B, BillPsychicPool_K, BillPsychicPool_H, BillPsychicPool_O, BillPsychicPool_R, BillPsychicPool_X, BillPsychicPool_W
BillPsychicPool_S:
	db 1
	dw BillPsychicPool_S_T
BillPsychicPool_A:
	db 1
	dw BillPsychicPool_A_T
BillPsychicPool_G:
	db 1
	dw BillPsychicPool_G_T
BillPsychicPool_P:
	db 1
	dw BillPsychicPool_P_T
BillPsychicPool_C:
	db 1
	dw BillPsychicPool_C_T
BillPsychicPool_Z:
	db 1
	dw BillPsychicPool_Z_T
BillPsychicPool_D:
	db 1
	dw BillPsychicPool_D_T
BillPsychicPool_M:
	db 1
	dw BillPsychicPool_M_T
BillPsychicPool_U:
	db 1
	dw BillPsychicPool_U_T
BillPsychicPool_B:
	db 1
	dw BillPsychicPool_B_T
BillPsychicPool_K:
	db 1
	dw BillPsychicPool_K_T
BillPsychicPool_H:
	db 1
	dw BillPsychicPool_H_T
BillPsychicPool_O:
	db 1
	dw BillPsychicPool_O_T
BillPsychicPool_R:
	db 1
	dw BillPsychicPool_R_T
BillPsychicPool_X:
	db 1
	dw BillPsychicPool_X_T
BillPsychicPool_W:
	db 1
	dw BillPsychicPool_W_T
CyclingFlyPool:
	dw CyclingFlyPool_S, CyclingFlyPool_A, CyclingFlyPool_G, CyclingFlyPool_P, CyclingFlyPool_C, CyclingFlyPool_Z, CyclingFlyPool_D, CyclingFlyPool_M, CyclingFlyPool_U, CyclingFlyPool_B, CyclingFlyPool_K, CyclingFlyPool_H, CyclingFlyPool_O, CyclingFlyPool_R, CyclingFlyPool_X, CyclingFlyPool_W
CyclingFlyPool_S:
	db 1
	dw CyclingFlyPool_S_T
CyclingFlyPool_A:
	db 1
	dw CyclingFlyPool_A_T
CyclingFlyPool_G:
	db 1
	dw CyclingFlyPool_G_T
CyclingFlyPool_P:
	db 1
	dw CyclingFlyPool_P_T
CyclingFlyPool_C:
	db 1
	dw CyclingFlyPool_C_T
CyclingFlyPool_Z:
	db 1
	dw CyclingFlyPool_Z_T
CyclingFlyPool_D:
	db 1
	dw CyclingFlyPool_D_T
CyclingFlyPool_M:
	db 1
	dw CyclingFlyPool_M_T
CyclingFlyPool_U:
	db 1
	dw CyclingFlyPool_U_T
CyclingFlyPool_B:
	db 1
	dw CyclingFlyPool_B_T
CyclingFlyPool_K:
	db 1
	dw CyclingFlyPool_K_T
CyclingFlyPool_H:
	db 1
	dw CyclingFlyPool_H_T
CyclingFlyPool_O:
	db 1
	dw CyclingFlyPool_O_T
CyclingFlyPool_R:
	db 1
	dw CyclingFlyPool_R_T
CyclingFlyPool_X:
	db 1
	dw CyclingFlyPool_X_T
CyclingFlyPool_W:
	db 1
	dw CyclingFlyPool_W_T

MansionReactionText:: text_far _NR_MansionReactionText
	text_end
CeruleanCaveReactionText:: text_far _NR_CeruleanCaveReactionText
	text_end

FE_Cut_S_T:: text_far _NR_FE_Cut_S_T
	text_end
FE_Cut_A_T:: text_far _NR_FE_Cut_A_T
	text_end
FE_Cut_G_T:: text_far _NR_FE_Cut_G_T
	text_end
FE_Cut_P_T:: text_far _NR_FE_Cut_P_T
	text_end
FE_Cut_C_T:: text_far _NR_FE_Cut_C_T
	text_end
FE_Cut_Z_T:: text_far _NR_FE_Cut_Z_T
	text_end
FE_Cut_D_T:: text_far _NR_FE_Cut_D_T
	text_end
FE_Cut_M_T:: text_far _NR_FE_Cut_M_T
	text_end
FE_Cut_U_T:: text_far _NR_FE_Cut_U_T
	text_end
FE_Cut_B_T:: text_far _NR_FE_Cut_B_T
	text_end
FE_Cut_K_T:: text_far _NR_FE_Cut_K_T
	text_end
FE_Cut_H_T:: text_far _NR_FE_Cut_H_T
	text_end
FE_Cut_O_T:: text_far _NR_FE_Cut_O_T
	text_end
FE_Cut_R_T:: text_far _NR_FE_Cut_R_T
	text_end
FE_Cut_X_T:: text_far _NR_FE_Cut_X_T
	text_end
FE_Cut_W_T:: text_far _NR_FE_Cut_W_T
	text_end
FE_Surf_S_T:: text_far _NR_FE_Surf_S_T
	text_end
FE_Surf_A_T:: text_far _NR_FE_Surf_A_T
	text_end
FE_Surf_G_T:: text_far _NR_FE_Surf_G_T
	text_end
FE_Surf_P_T:: text_far _NR_FE_Surf_P_T
	text_end
FE_Surf_C_T:: text_far _NR_FE_Surf_C_T
	text_end
FE_Surf_Z_T:: text_far _NR_FE_Surf_Z_T
	text_end
FE_Surf_D_T:: text_far _NR_FE_Surf_D_T
	text_end
FE_Surf_M_T:: text_far _NR_FE_Surf_M_T
	text_end
FE_Surf_U_T:: text_far _NR_FE_Surf_U_T
	text_end
FE_Surf_B_T:: text_far _NR_FE_Surf_B_T
	text_end
FE_Surf_K_T:: text_far _NR_FE_Surf_K_T
	text_end
FE_Surf_H_T:: text_far _NR_FE_Surf_H_T
	text_end
FE_Surf_O_T:: text_far _NR_FE_Surf_O_T
	text_end
FE_Surf_R_T:: text_far _NR_FE_Surf_R_T
	text_end
FE_Surf_X_T:: text_far _NR_FE_Surf_X_T
	text_end
FE_Surf_W_T:: text_far _NR_FE_Surf_W_T
	text_end
FE_Strength_S_T:: text_far _NR_FE_Strength_S_T
	text_end
FE_Strength_A_T:: text_far _NR_FE_Strength_A_T
	text_end
FE_Strength_G_T:: text_far _NR_FE_Strength_G_T
	text_end
FE_Strength_P_T:: text_far _NR_FE_Strength_P_T
	text_end
FE_Strength_C_T:: text_far _NR_FE_Strength_C_T
	text_end
FE_Strength_Z_T:: text_far _NR_FE_Strength_Z_T
	text_end
FE_Strength_D_T:: text_far _NR_FE_Strength_D_T
	text_end
FE_Strength_M_T:: text_far _NR_FE_Strength_M_T
	text_end
FE_Strength_U_T:: text_far _NR_FE_Strength_U_T
	text_end
FE_Strength_B_T:: text_far _NR_FE_Strength_B_T
	text_end
FE_Strength_K_T:: text_far _NR_FE_Strength_K_T
	text_end
FE_Strength_H_T:: text_far _NR_FE_Strength_H_T
	text_end
FE_Strength_O_T:: text_far _NR_FE_Strength_O_T
	text_end
FE_Strength_R_T:: text_far _NR_FE_Strength_R_T
	text_end
FE_Strength_X_T:: text_far _NR_FE_Strength_X_T
	text_end
FE_Strength_W_T:: text_far _NR_FE_Strength_W_T
	text_end
FE_Flash_S_T:: text_far _NR_FE_Flash_S_T
	text_end
FE_Flash_A_T:: text_far _NR_FE_Flash_A_T
	text_end
FE_Flash_G_T:: text_far _NR_FE_Flash_G_T
	text_end
FE_Flash_P_T:: text_far _NR_FE_Flash_P_T
	text_end
FE_Flash_C_T:: text_far _NR_FE_Flash_C_T
	text_end
FE_Flash_Z_T:: text_far _NR_FE_Flash_Z_T
	text_end
FE_Flash_D_T:: text_far _NR_FE_Flash_D_T
	text_end
FE_Flash_M_T:: text_far _NR_FE_Flash_M_T
	text_end
FE_Flash_U_T:: text_far _NR_FE_Flash_U_T
	text_end
FE_Flash_B_T:: text_far _NR_FE_Flash_B_T
	text_end
FE_Flash_K_T:: text_far _NR_FE_Flash_K_T
	text_end
FE_Flash_H_T:: text_far _NR_FE_Flash_H_T
	text_end
FE_Flash_O_T:: text_far _NR_FE_Flash_O_T
	text_end
FE_Flash_R_T:: text_far _NR_FE_Flash_R_T
	text_end
FE_Flash_X_T:: text_far _NR_FE_Flash_X_T
	text_end
FE_Flash_W_T:: text_far _NR_FE_Flash_W_T
	text_end
FE_Flame_S_T:: text_far _NR_FE_Flame_S_T
	text_end
FE_Flame_A_T:: text_far _NR_FE_Flame_A_T
	text_end
FE_Flame_G_T:: text_far _NR_FE_Flame_G_T
	text_end
FE_Flame_P_T:: text_far _NR_FE_Flame_P_T
	text_end
FE_Flame_C_T:: text_far _NR_FE_Flame_C_T
	text_end
FE_Flame_Z_T:: text_far _NR_FE_Flame_Z_T
	text_end
FE_Flame_D_T:: text_far _NR_FE_Flame_D_T
	text_end
FE_Flame_M_T:: text_far _NR_FE_Flame_M_T
	text_end
FE_Flame_U_T:: text_far _NR_FE_Flame_U_T
	text_end
FE_Flame_B_T:: text_far _NR_FE_Flame_B_T
	text_end
FE_Flame_K_T:: text_far _NR_FE_Flame_K_T
	text_end
FE_Flame_H_T:: text_far _NR_FE_Flame_H_T
	text_end
FE_Flame_O_T:: text_far _NR_FE_Flame_O_T
	text_end
FE_Flame_R_T:: text_far _NR_FE_Flame_R_T
	text_end
FE_Flame_X_T:: text_far _NR_FE_Flame_X_T
	text_end
FE_Flame_W_T:: text_far _NR_FE_Flame_W_T
	text_end
FE_Confuse_S_T:: text_far _NR_FE_Confuse_S_T
	text_end
FE_Confuse_A_T:: text_far _NR_FE_Confuse_A_T
	text_end
FE_Confuse_G_T:: text_far _NR_FE_Confuse_G_T
	text_end
FE_Confuse_P_T:: text_far _NR_FE_Confuse_P_T
	text_end
FE_Confuse_C_T:: text_far _NR_FE_Confuse_C_T
	text_end
FE_Confuse_Z_T:: text_far _NR_FE_Confuse_Z_T
	text_end
FE_Confuse_D_T:: text_far _NR_FE_Confuse_D_T
	text_end
FE_Confuse_M_T:: text_far _NR_FE_Confuse_M_T
	text_end
FE_Confuse_U_T:: text_far _NR_FE_Confuse_U_T
	text_end
FE_Confuse_B_T:: text_far _NR_FE_Confuse_B_T
	text_end
FE_Confuse_K_T:: text_far _NR_FE_Confuse_K_T
	text_end
FE_Confuse_H_T:: text_far _NR_FE_Confuse_H_T
	text_end
FE_Confuse_O_T:: text_far _NR_FE_Confuse_O_T
	text_end
FE_Confuse_R_T:: text_far _NR_FE_Confuse_R_T
	text_end
FE_Confuse_X_T:: text_far _NR_FE_Confuse_X_T
	text_end
FE_Confuse_W_T:: text_far _NR_FE_Confuse_W_T
	text_end
FE_Mystic_S_T:: text_far _NR_FE_Mystic_S_T
	text_end
FE_Mystic_A_T:: text_far _NR_FE_Mystic_A_T
	text_end
FE_Mystic_G_T:: text_far _NR_FE_Mystic_G_T
	text_end
FE_Mystic_P_T:: text_far _NR_FE_Mystic_P_T
	text_end
FE_Mystic_C_T:: text_far _NR_FE_Mystic_C_T
	text_end
FE_Mystic_Z_T:: text_far _NR_FE_Mystic_Z_T
	text_end
FE_Mystic_D_T:: text_far _NR_FE_Mystic_D_T
	text_end
FE_Mystic_M_T:: text_far _NR_FE_Mystic_M_T
	text_end
FE_Mystic_U_T:: text_far _NR_FE_Mystic_U_T
	text_end
FE_Mystic_B_T:: text_far _NR_FE_Mystic_B_T
	text_end
FE_Mystic_K_T:: text_far _NR_FE_Mystic_K_T
	text_end
FE_Mystic_H_T:: text_far _NR_FE_Mystic_H_T
	text_end
FE_Mystic_O_T:: text_far _NR_FE_Mystic_O_T
	text_end
FE_Mystic_R_T:: text_far _NR_FE_Mystic_R_T
	text_end
FE_Mystic_X_T:: text_far _NR_FE_Mystic_X_T
	text_end
FE_Mystic_W_T:: text_far _NR_FE_Mystic_W_T
	text_end
FE_Hiding_S_T:: text_far _NR_FE_Hiding_S_T
	text_end
FE_Hiding_A_T:: text_far _NR_FE_Hiding_A_T
	text_end
FE_Hiding_G_T:: text_far _NR_FE_Hiding_G_T
	text_end
FE_Hiding_P_T:: text_far _NR_FE_Hiding_P_T
	text_end
FE_Hiding_C_T:: text_far _NR_FE_Hiding_C_T
	text_end
FE_Hiding_Z_T:: text_far _NR_FE_Hiding_Z_T
	text_end
FE_Hiding_D_T:: text_far _NR_FE_Hiding_D_T
	text_end
FE_Hiding_M_T:: text_far _NR_FE_Hiding_M_T
	text_end
FE_Hiding_U_T:: text_far _NR_FE_Hiding_U_T
	text_end
FE_Hiding_B_T:: text_far _NR_FE_Hiding_B_T
	text_end
FE_Hiding_K_T:: text_far _NR_FE_Hiding_K_T
	text_end
FE_Hiding_H_T:: text_far _NR_FE_Hiding_H_T
	text_end
FE_Hiding_O_T:: text_far _NR_FE_Hiding_O_T
	text_end
FE_Hiding_R_T:: text_far _NR_FE_Hiding_R_T
	text_end
FE_Hiding_X_T:: text_far _NR_FE_Hiding_X_T
	text_end
FE_Hiding_W_T:: text_far _NR_FE_Hiding_W_T
	text_end
FE_Soft_S_T:: text_far _NR_FE_Soft_S_T
	text_end
FE_Soft_A_T:: text_far _NR_FE_Soft_A_T
	text_end
FE_Soft_G_T:: text_far _NR_FE_Soft_G_T
	text_end
FE_Soft_P_T:: text_far _NR_FE_Soft_P_T
	text_end
FE_Soft_C_T:: text_far _NR_FE_Soft_C_T
	text_end
FE_Soft_Z_T:: text_far _NR_FE_Soft_Z_T
	text_end
FE_Soft_D_T:: text_far _NR_FE_Soft_D_T
	text_end
FE_Soft_M_T:: text_far _NR_FE_Soft_M_T
	text_end
FE_Soft_U_T:: text_far _NR_FE_Soft_U_T
	text_end
FE_Soft_B_T:: text_far _NR_FE_Soft_B_T
	text_end
FE_Soft_K_T:: text_far _NR_FE_Soft_K_T
	text_end
FE_Soft_H_T:: text_far _NR_FE_Soft_H_T
	text_end
FE_Soft_O_T:: text_far _NR_FE_Soft_O_T
	text_end
FE_Soft_R_T:: text_far _NR_FE_Soft_R_T
	text_end
FE_Soft_X_T:: text_far _NR_FE_Soft_X_T
	text_end
FE_Soft_W_T:: text_far _NR_FE_Soft_W_T
	text_end
DEF_Fly_S_T:: text_far _NR_DEF_Fly_S_T
	text_end
DEF_Fly_A_T:: text_far _NR_DEF_Fly_A_T
	text_end
DEF_Fly_G_T:: text_far _NR_DEF_Fly_G_T
	text_end
DEF_Fly_P_T:: text_far _NR_DEF_Fly_P_T
	text_end
DEF_Fly_C_T:: text_far _NR_DEF_Fly_C_T
	text_end
DEF_Fly_Z_T:: text_far _NR_DEF_Fly_Z_T
	text_end
DEF_Fly_D_T:: text_far _NR_DEF_Fly_D_T
	text_end
DEF_Fly_M_T:: text_far _NR_DEF_Fly_M_T
	text_end
DEF_Fly_U_T:: text_far _NR_DEF_Fly_U_T
	text_end
DEF_Fly_B_T:: text_far _NR_DEF_Fly_B_T
	text_end
DEF_Fly_K_T:: text_far _NR_DEF_Fly_K_T
	text_end
DEF_Fly_H_T:: text_far _NR_DEF_Fly_H_T
	text_end
DEF_Fly_O_T:: text_far _NR_DEF_Fly_O_T
	text_end
DEF_Fly_R_T:: text_far _NR_DEF_Fly_R_T
	text_end
DEF_Fly_X_T:: text_far _NR_DEF_Fly_X_T
	text_end
DEF_Fly_W_T:: text_far _NR_DEF_Fly_W_T
	text_end
DEF_Dig_S_T:: text_far _NR_DEF_Dig_S_T
	text_end
DEF_Dig_A_T:: text_far _NR_DEF_Dig_A_T
	text_end
DEF_Dig_G_T:: text_far _NR_DEF_Dig_G_T
	text_end
DEF_Dig_P_T:: text_far _NR_DEF_Dig_P_T
	text_end
DEF_Dig_C_T:: text_far _NR_DEF_Dig_C_T
	text_end
DEF_Dig_Z_T:: text_far _NR_DEF_Dig_Z_T
	text_end
DEF_Dig_D_T:: text_far _NR_DEF_Dig_D_T
	text_end
DEF_Dig_M_T:: text_far _NR_DEF_Dig_M_T
	text_end
DEF_Dig_U_T:: text_far _NR_DEF_Dig_U_T
	text_end
DEF_Dig_B_T:: text_far _NR_DEF_Dig_B_T
	text_end
DEF_Dig_K_T:: text_far _NR_DEF_Dig_K_T
	text_end
DEF_Dig_H_T:: text_far _NR_DEF_Dig_H_T
	text_end
DEF_Dig_O_T:: text_far _NR_DEF_Dig_O_T
	text_end
DEF_Dig_R_T:: text_far _NR_DEF_Dig_R_T
	text_end
DEF_Dig_X_T:: text_far _NR_DEF_Dig_X_T
	text_end
DEF_Dig_W_T:: text_far _NR_DEF_Dig_W_T
	text_end
DEF_Teleport_S_T:: text_far _NR_DEF_Teleport_S_T
	text_end
DEF_Teleport_A_T:: text_far _NR_DEF_Teleport_A_T
	text_end
DEF_Teleport_G_T:: text_far _NR_DEF_Teleport_G_T
	text_end
DEF_Teleport_P_T:: text_far _NR_DEF_Teleport_P_T
	text_end
DEF_Teleport_C_T:: text_far _NR_DEF_Teleport_C_T
	text_end
DEF_Teleport_Z_T:: text_far _NR_DEF_Teleport_Z_T
	text_end
DEF_Teleport_D_T:: text_far _NR_DEF_Teleport_D_T
	text_end
DEF_Teleport_M_T:: text_far _NR_DEF_Teleport_M_T
	text_end
DEF_Teleport_U_T:: text_far _NR_DEF_Teleport_U_T
	text_end
DEF_Teleport_B_T:: text_far _NR_DEF_Teleport_B_T
	text_end
DEF_Teleport_K_T:: text_far _NR_DEF_Teleport_K_T
	text_end
DEF_Teleport_H_T:: text_far _NR_DEF_Teleport_H_T
	text_end
DEF_Teleport_O_T:: text_far _NR_DEF_Teleport_O_T
	text_end
DEF_Teleport_R_T:: text_far _NR_DEF_Teleport_R_T
	text_end
DEF_Teleport_X_T:: text_far _NR_DEF_Teleport_X_T
	text_end
DEF_Teleport_W_T:: text_far _NR_DEF_Teleport_W_T
	text_end
BattleTellNaturePool_S_T:: text_far _NR_BattleTellNaturePool_S_T
	text_end
BattleTellNaturePool_A_T:: text_far _NR_BattleTellNaturePool_A_T
	text_end
BattleTellNaturePool_G_T:: text_far _NR_BattleTellNaturePool_G_T
	text_end
BattleTellNaturePool_P_T:: text_far _NR_BattleTellNaturePool_P_T
	text_end
BattleTellNaturePool_C_T:: text_far _NR_BattleTellNaturePool_C_T
	text_end
BattleTellNaturePool_Z_T:: text_far _NR_BattleTellNaturePool_Z_T
	text_end
BattleTellNaturePool_D_T:: text_far _NR_BattleTellNaturePool_D_T
	text_end
BattleTellNaturePool_M_T:: text_far _NR_BattleTellNaturePool_M_T
	text_end
BattleTellNaturePool_U_T:: text_far _NR_BattleTellNaturePool_U_T
	text_end
BattleTellNaturePool_B_T:: text_far _NR_BattleTellNaturePool_B_T
	text_end
BattleTellNaturePool_K_T:: text_far _NR_BattleTellNaturePool_K_T
	text_end
BattleTellNaturePool_H_T:: text_far _NR_BattleTellNaturePool_H_T
	text_end
BattleTellNaturePool_O_T:: text_far _NR_BattleTellNaturePool_O_T
	text_end
BattleTellNaturePool_R_T:: text_far _NR_BattleTellNaturePool_R_T
	text_end
BattleTellNaturePool_X_T:: text_far _NR_BattleTellNaturePool_X_T
	text_end
BattleTellNaturePool_W_T:: text_far _NR_BattleTellNaturePool_W_T
	text_end
FR_Rival1Lab_G_T:: text_far _NR_FR_Rival1Lab_G_T
	text_end
FR_Rival1Lab_H_T:: text_far _NR_FR_Rival1Lab_H_T
	text_end
FR_RivalR22_G_T:: text_far _NR_FR_RivalR22_G_T
	text_end
FR_RivalR22_H_T:: text_far _NR_FR_RivalR22_H_T
	text_end
FR_RocketNugget_G_T:: text_far _NR_FR_RocketNugget_G_T
	text_end
FR_RocketNugget_H_T:: text_far _NR_FR_RocketNugget_H_T
	text_end
FR_Brock_G_T:: text_far _NR_FR_Brock_G_T
	text_end
FR_Brock_H_T:: text_far _NR_FR_Brock_H_T
	text_end
FR_Surge_G_T:: text_far _NR_FR_Surge_G_T
	text_end
FR_Surge_H_T:: text_far _NR_FR_Surge_H_T
	text_end
FR_RivalLavender_G_T:: text_far _NR_FR_RivalLavender_G_T
	text_end
FR_RivalLavender_H_T:: text_far _NR_FR_RivalLavender_H_T
	text_end
FR_FujiGrunt_G_T:: text_far _NR_FR_FujiGrunt_G_T
	text_end
FR_FujiGrunt_H_T:: text_far _NR_FR_FujiGrunt_H_T
	text_end
FR_Sabrina_G_T:: text_far _NR_FR_Sabrina_G_T
	text_end
FR_Sabrina_H_T:: text_far _NR_FR_Sabrina_H_T
	text_end
FR_GiovanniHideout_G_T:: text_far _NR_FR_GiovanniHideout_G_T
	text_end
FR_GiovanniHideout_H_T:: text_far _NR_FR_GiovanniHideout_H_T
	text_end
FR_RivalSilph_G_T:: text_far _NR_FR_RivalSilph_G_T
	text_end
FR_RivalSilph_H_T:: text_far _NR_FR_RivalSilph_H_T
	text_end
FR_ChampArena_G_T:: text_far _NR_FR_ChampArena_G_T
	text_end
FR_ChampArena_H_T:: text_far _NR_FR_ChampArena_H_T
	text_end
FR_Misty_TG_WATER_T:: text_far _NR_FR_Misty_TG_WATER_T
	text_end
FR_Misty_TG_FIRE_T:: text_far _NR_FR_Misty_TG_FIRE_T
	text_end
FR_Misty_TG_ROCK_T:: text_far _NR_FR_Misty_TG_ROCK_T
	text_end
FR_Misty_TG_ELECTRIC_T:: text_far _NR_FR_Misty_TG_ELECTRIC_T
	text_end
FR_Misty_TG_DEF_T:: text_far _NR_FR_Misty_TG_DEF_T
	text_end
FR_Misty_TH_WATER_T:: text_far _NR_FR_Misty_TH_WATER_T
	text_end
FR_Misty_TH_FIRE_T:: text_far _NR_FR_Misty_TH_FIRE_T
	text_end
FR_Misty_TH_DEF_T:: text_far _NR_FR_Misty_TH_DEF_T
	text_end
FR_Erika_TG_GRASS_T:: text_far _NR_FR_Erika_TG_GRASS_T
	text_end
FR_Erika_TG_POISON_T:: text_far _NR_FR_Erika_TG_POISON_T
	text_end
FR_Erika_TG_GHOST_T:: text_far _NR_FR_Erika_TG_GHOST_T
	text_end
FR_Erika_TG_DEF_T:: text_far _NR_FR_Erika_TG_DEF_T
	text_end
FR_Erika_TH_GRASS_T:: text_far _NR_FR_Erika_TH_GRASS_T
	text_end
FR_Erika_TH_DEF_T:: text_far _NR_FR_Erika_TH_DEF_T
	text_end
FR_RivalSSAnne_T_WATER_T:: text_far _NR_FR_RivalSSAnne_T_WATER_T
	text_end
FR_RivalSSAnne_T_FLYING_T:: text_far _NR_FR_RivalSSAnne_T_FLYING_T
	text_end
FR_RivalSSAnne_T_FLOATING_T:: text_far _NR_FR_RivalSSAnne_T_FLOATING_T
	text_end
FR_RivalSSAnne_T_BUG_T:: text_far _NR_FR_RivalSSAnne_T_BUG_T
	text_end
FR_RivalSSAnne_T_GROUND_T:: text_far _NR_FR_RivalSSAnne_T_GROUND_T
	text_end
FR_RivalSSAnne_T_ROCK_T:: text_far _NR_FR_RivalSSAnne_T_ROCK_T
	text_end
FR_RivalSSAnne_T_FIRE_T:: text_far _NR_FR_RivalSSAnne_T_FIRE_T
	text_end
FR_RivalSSAnne_T_DEF_T:: text_far _NR_FR_RivalSSAnne_T_DEF_T
	text_end
FR_Lorelei_T_WATER_T:: text_far _NR_FR_Lorelei_T_WATER_T
	text_end
FR_Lorelei_T_ICE_T:: text_far _NR_FR_Lorelei_T_ICE_T
	text_end
FR_Lorelei_T_FIRE_T:: text_far _NR_FR_Lorelei_T_FIRE_T
	text_end
FR_Lorelei_T_ROCK_T:: text_far _NR_FR_Lorelei_T_ROCK_T
	text_end
FR_Lorelei_T_DRAGON_T:: text_far _NR_FR_Lorelei_T_DRAGON_T
	text_end
FR_Lorelei_T_DEF_T:: text_far _NR_FR_Lorelei_T_DEF_T
	text_end
FR_Dojo_NG_S_T:: text_far _NR_FR_Dojo_NG_S_T
	text_end
FR_Dojo_NG_A_T:: text_far _NR_FR_Dojo_NG_A_T
	text_end
FR_Dojo_NG_G_T:: text_far _NR_FR_Dojo_NG_G_T
	text_end
FR_Dojo_NG_P_T:: text_far _NR_FR_Dojo_NG_P_T
	text_end
FR_Dojo_NG_C_T:: text_far _NR_FR_Dojo_NG_C_T
	text_end
FR_Dojo_NG_Z_T:: text_far _NR_FR_Dojo_NG_Z_T
	text_end
FR_Dojo_NG_D_T:: text_far _NR_FR_Dojo_NG_D_T
	text_end
FR_Dojo_NG_M_T:: text_far _NR_FR_Dojo_NG_M_T
	text_end
FR_Dojo_NG_U_T:: text_far _NR_FR_Dojo_NG_U_T
	text_end
FR_Dojo_NG_B_T:: text_far _NR_FR_Dojo_NG_B_T
	text_end
FR_Dojo_NG_K_T:: text_far _NR_FR_Dojo_NG_K_T
	text_end
FR_Dojo_NG_H_T:: text_far _NR_FR_Dojo_NG_H_T
	text_end
FR_Dojo_NG_O_T:: text_far _NR_FR_Dojo_NG_O_T
	text_end
FR_Dojo_NG_R_T:: text_far _NR_FR_Dojo_NG_R_T
	text_end
FR_Dojo_NG_X_T:: text_far _NR_FR_Dojo_NG_X_T
	text_end
FR_Dojo_NG_W_T:: text_far _NR_FR_Dojo_NG_W_T
	text_end
FR_Dojo_NH_S_T:: text_far _NR_FR_Dojo_NH_S_T
	text_end
FR_Dojo_NH_A_T:: text_far _NR_FR_Dojo_NH_A_T
	text_end
FR_Dojo_NH_G_T:: text_far _NR_FR_Dojo_NH_G_T
	text_end
FR_Dojo_NH_P_T:: text_far _NR_FR_Dojo_NH_P_T
	text_end
FR_Dojo_NH_C_T:: text_far _NR_FR_Dojo_NH_C_T
	text_end
FR_Dojo_NH_Z_T:: text_far _NR_FR_Dojo_NH_Z_T
	text_end
FR_Dojo_NH_D_T:: text_far _NR_FR_Dojo_NH_D_T
	text_end
FR_Dojo_NH_M_T:: text_far _NR_FR_Dojo_NH_M_T
	text_end
FR_Dojo_NH_U_T:: text_far _NR_FR_Dojo_NH_U_T
	text_end
FR_Dojo_NH_B_T:: text_far _NR_FR_Dojo_NH_B_T
	text_end
FR_Dojo_NH_K_T:: text_far _NR_FR_Dojo_NH_K_T
	text_end
FR_Dojo_NH_H_T:: text_far _NR_FR_Dojo_NH_H_T
	text_end
FR_Dojo_NH_O_T:: text_far _NR_FR_Dojo_NH_O_T
	text_end
FR_Dojo_NH_R_T:: text_far _NR_FR_Dojo_NH_R_T
	text_end
FR_Dojo_NH_X_T:: text_far _NR_FR_Dojo_NH_X_T
	text_end
FR_Dojo_NH_W_T:: text_far _NR_FR_Dojo_NH_W_T
	text_end
FR_Koga_NG_S_T:: text_far _NR_FR_Koga_NG_S_T
	text_end
FR_Koga_NG_A_T:: text_far _NR_FR_Koga_NG_A_T
	text_end
FR_Koga_NG_G_T:: text_far _NR_FR_Koga_NG_G_T
	text_end
FR_Koga_NG_P_T:: text_far _NR_FR_Koga_NG_P_T
	text_end
FR_Koga_NG_C_T:: text_far _NR_FR_Koga_NG_C_T
	text_end
FR_Koga_NG_Z_T:: text_far _NR_FR_Koga_NG_Z_T
	text_end
FR_Koga_NG_D_T:: text_far _NR_FR_Koga_NG_D_T
	text_end
FR_Koga_NG_M_T:: text_far _NR_FR_Koga_NG_M_T
	text_end
FR_Koga_NG_U_T:: text_far _NR_FR_Koga_NG_U_T
	text_end
FR_Koga_NG_B_T:: text_far _NR_FR_Koga_NG_B_T
	text_end
FR_Koga_NG_K_T:: text_far _NR_FR_Koga_NG_K_T
	text_end
FR_Koga_NG_H_T:: text_far _NR_FR_Koga_NG_H_T
	text_end
FR_Koga_NG_O_T:: text_far _NR_FR_Koga_NG_O_T
	text_end
FR_Koga_NG_R_T:: text_far _NR_FR_Koga_NG_R_T
	text_end
FR_Koga_NG_X_T:: text_far _NR_FR_Koga_NG_X_T
	text_end
FR_Koga_NG_W_T:: text_far _NR_FR_Koga_NG_W_T
	text_end
FR_Koga_NH_S_T:: text_far _NR_FR_Koga_NH_S_T
	text_end
FR_Koga_NH_A_T:: text_far _NR_FR_Koga_NH_A_T
	text_end
FR_Koga_NH_G_T:: text_far _NR_FR_Koga_NH_G_T
	text_end
FR_Koga_NH_P_T:: text_far _NR_FR_Koga_NH_P_T
	text_end
FR_Koga_NH_C_T:: text_far _NR_FR_Koga_NH_C_T
	text_end
FR_Koga_NH_Z_T:: text_far _NR_FR_Koga_NH_Z_T
	text_end
FR_Koga_NH_D_T:: text_far _NR_FR_Koga_NH_D_T
	text_end
FR_Koga_NH_M_T:: text_far _NR_FR_Koga_NH_M_T
	text_end
FR_Koga_NH_U_T:: text_far _NR_FR_Koga_NH_U_T
	text_end
FR_Koga_NH_B_T:: text_far _NR_FR_Koga_NH_B_T
	text_end
FR_Koga_NH_K_T:: text_far _NR_FR_Koga_NH_K_T
	text_end
FR_Koga_NH_H_T:: text_far _NR_FR_Koga_NH_H_T
	text_end
FR_Koga_NH_O_T:: text_far _NR_FR_Koga_NH_O_T
	text_end
FR_Koga_NH_R_T:: text_far _NR_FR_Koga_NH_R_T
	text_end
FR_Koga_NH_X_T:: text_far _NR_FR_Koga_NH_X_T
	text_end
FR_Koga_NH_W_T:: text_far _NR_FR_Koga_NH_W_T
	text_end
FR_Blaine_NG_S_T:: text_far _NR_FR_Blaine_NG_S_T
	text_end
FR_Blaine_NG_A_T:: text_far _NR_FR_Blaine_NG_A_T
	text_end
FR_Blaine_NG_G_T:: text_far _NR_FR_Blaine_NG_G_T
	text_end
FR_Blaine_NG_P_T:: text_far _NR_FR_Blaine_NG_P_T
	text_end
FR_Blaine_NG_C_T:: text_far _NR_FR_Blaine_NG_C_T
	text_end
FR_Blaine_NG_Z_T:: text_far _NR_FR_Blaine_NG_Z_T
	text_end
FR_Blaine_NG_D_T:: text_far _NR_FR_Blaine_NG_D_T
	text_end
FR_Blaine_NG_M_T:: text_far _NR_FR_Blaine_NG_M_T
	text_end
FR_Blaine_NG_U_T:: text_far _NR_FR_Blaine_NG_U_T
	text_end
FR_Blaine_NG_B_T:: text_far _NR_FR_Blaine_NG_B_T
	text_end
FR_Blaine_NG_K_T:: text_far _NR_FR_Blaine_NG_K_T
	text_end
FR_Blaine_NG_H_T:: text_far _NR_FR_Blaine_NG_H_T
	text_end
FR_Blaine_NG_O_T:: text_far _NR_FR_Blaine_NG_O_T
	text_end
FR_Blaine_NG_R_T:: text_far _NR_FR_Blaine_NG_R_T
	text_end
FR_Blaine_NG_X_T:: text_far _NR_FR_Blaine_NG_X_T
	text_end
FR_Blaine_NG_W_T:: text_far _NR_FR_Blaine_NG_W_T
	text_end
FR_Blaine_NH_S_T:: text_far _NR_FR_Blaine_NH_S_T
	text_end
FR_Blaine_NH_A_T:: text_far _NR_FR_Blaine_NH_A_T
	text_end
FR_Blaine_NH_G_T:: text_far _NR_FR_Blaine_NH_G_T
	text_end
FR_Blaine_NH_P_T:: text_far _NR_FR_Blaine_NH_P_T
	text_end
FR_Blaine_NH_C_T:: text_far _NR_FR_Blaine_NH_C_T
	text_end
FR_Blaine_NH_Z_T:: text_far _NR_FR_Blaine_NH_Z_T
	text_end
FR_Blaine_NH_D_T:: text_far _NR_FR_Blaine_NH_D_T
	text_end
FR_Blaine_NH_M_T:: text_far _NR_FR_Blaine_NH_M_T
	text_end
FR_Blaine_NH_U_T:: text_far _NR_FR_Blaine_NH_U_T
	text_end
FR_Blaine_NH_B_T:: text_far _NR_FR_Blaine_NH_B_T
	text_end
FR_Blaine_NH_K_T:: text_far _NR_FR_Blaine_NH_K_T
	text_end
FR_Blaine_NH_H_T:: text_far _NR_FR_Blaine_NH_H_T
	text_end
FR_Blaine_NH_O_T:: text_far _NR_FR_Blaine_NH_O_T
	text_end
FR_Blaine_NH_R_T:: text_far _NR_FR_Blaine_NH_R_T
	text_end
FR_Blaine_NH_X_T:: text_far _NR_FR_Blaine_NH_X_T
	text_end
FR_Blaine_NH_W_T:: text_far _NR_FR_Blaine_NH_W_T
	text_end
FR_GiovanniSilph_N_S_T:: text_far _NR_FR_GiovanniSilph_N_S_T
	text_end
FR_GiovanniSilph_N_A_T:: text_far _NR_FR_GiovanniSilph_N_A_T
	text_end
FR_GiovanniSilph_N_G_T:: text_far _NR_FR_GiovanniSilph_N_G_T
	text_end
FR_GiovanniSilph_N_P_T:: text_far _NR_FR_GiovanniSilph_N_P_T
	text_end
FR_GiovanniSilph_N_C_T:: text_far _NR_FR_GiovanniSilph_N_C_T
	text_end
FR_GiovanniSilph_N_Z_T:: text_far _NR_FR_GiovanniSilph_N_Z_T
	text_end
FR_GiovanniSilph_N_D_T:: text_far _NR_FR_GiovanniSilph_N_D_T
	text_end
FR_GiovanniSilph_N_M_T:: text_far _NR_FR_GiovanniSilph_N_M_T
	text_end
FR_GiovanniSilph_N_U_T:: text_far _NR_FR_GiovanniSilph_N_U_T
	text_end
FR_GiovanniSilph_N_B_T:: text_far _NR_FR_GiovanniSilph_N_B_T
	text_end
FR_GiovanniSilph_N_K_T:: text_far _NR_FR_GiovanniSilph_N_K_T
	text_end
FR_GiovanniSilph_N_H_T:: text_far _NR_FR_GiovanniSilph_N_H_T
	text_end
FR_GiovanniSilph_N_O_T:: text_far _NR_FR_GiovanniSilph_N_O_T
	text_end
FR_GiovanniSilph_N_R_T:: text_far _NR_FR_GiovanniSilph_N_R_T
	text_end
FR_GiovanniSilph_N_X_T:: text_far _NR_FR_GiovanniSilph_N_X_T
	text_end
FR_GiovanniSilph_N_W_T:: text_far _NR_FR_GiovanniSilph_N_W_T
	text_end
FR_GiovanniGym_N_S_T:: text_far _NR_FR_GiovanniGym_N_S_T
	text_end
FR_GiovanniGym_N_A_T:: text_far _NR_FR_GiovanniGym_N_A_T
	text_end
FR_GiovanniGym_N_G_T:: text_far _NR_FR_GiovanniGym_N_G_T
	text_end
FR_GiovanniGym_N_P_T:: text_far _NR_FR_GiovanniGym_N_P_T
	text_end
FR_GiovanniGym_N_C_T:: text_far _NR_FR_GiovanniGym_N_C_T
	text_end
FR_GiovanniGym_N_Z_T:: text_far _NR_FR_GiovanniGym_N_Z_T
	text_end
FR_GiovanniGym_N_D_T:: text_far _NR_FR_GiovanniGym_N_D_T
	text_end
FR_GiovanniGym_N_M_T:: text_far _NR_FR_GiovanniGym_N_M_T
	text_end
FR_GiovanniGym_N_U_T:: text_far _NR_FR_GiovanniGym_N_U_T
	text_end
FR_GiovanniGym_N_B_T:: text_far _NR_FR_GiovanniGym_N_B_T
	text_end
FR_GiovanniGym_N_K_T:: text_far _NR_FR_GiovanniGym_N_K_T
	text_end
FR_GiovanniGym_N_H_T:: text_far _NR_FR_GiovanniGym_N_H_T
	text_end
FR_GiovanniGym_N_O_T:: text_far _NR_FR_GiovanniGym_N_O_T
	text_end
FR_GiovanniGym_N_R_T:: text_far _NR_FR_GiovanniGym_N_R_T
	text_end
FR_GiovanniGym_N_X_T:: text_far _NR_FR_GiovanniGym_N_X_T
	text_end
FR_GiovanniGym_N_W_T:: text_far _NR_FR_GiovanniGym_N_W_T
	text_end
FR_Bruno_N_S_T:: text_far _NR_FR_Bruno_N_S_T
	text_end
FR_Bruno_N_A_T:: text_far _NR_FR_Bruno_N_A_T
	text_end
FR_Bruno_N_G_T:: text_far _NR_FR_Bruno_N_G_T
	text_end
FR_Bruno_N_P_T:: text_far _NR_FR_Bruno_N_P_T
	text_end
FR_Bruno_N_C_T:: text_far _NR_FR_Bruno_N_C_T
	text_end
FR_Bruno_N_Z_T:: text_far _NR_FR_Bruno_N_Z_T
	text_end
FR_Bruno_N_D_T:: text_far _NR_FR_Bruno_N_D_T
	text_end
FR_Bruno_N_M_T:: text_far _NR_FR_Bruno_N_M_T
	text_end
FR_Bruno_N_U_T:: text_far _NR_FR_Bruno_N_U_T
	text_end
FR_Bruno_N_B_T:: text_far _NR_FR_Bruno_N_B_T
	text_end
FR_Bruno_N_K_T:: text_far _NR_FR_Bruno_N_K_T
	text_end
FR_Bruno_N_H_T:: text_far _NR_FR_Bruno_N_H_T
	text_end
FR_Bruno_N_O_T:: text_far _NR_FR_Bruno_N_O_T
	text_end
FR_Bruno_N_R_T:: text_far _NR_FR_Bruno_N_R_T
	text_end
FR_Bruno_N_X_T:: text_far _NR_FR_Bruno_N_X_T
	text_end
FR_Bruno_N_W_T:: text_far _NR_FR_Bruno_N_W_T
	text_end
FR_Agatha_N_S_T:: text_far _NR_FR_Agatha_N_S_T
	text_end
FR_Agatha_N_A_T:: text_far _NR_FR_Agatha_N_A_T
	text_end
FR_Agatha_N_G_T:: text_far _NR_FR_Agatha_N_G_T
	text_end
FR_Agatha_N_P_T:: text_far _NR_FR_Agatha_N_P_T
	text_end
FR_Agatha_N_C_T:: text_far _NR_FR_Agatha_N_C_T
	text_end
FR_Agatha_N_Z_T:: text_far _NR_FR_Agatha_N_Z_T
	text_end
FR_Agatha_N_D_T:: text_far _NR_FR_Agatha_N_D_T
	text_end
FR_Agatha_N_M_T:: text_far _NR_FR_Agatha_N_M_T
	text_end
FR_Agatha_N_U_T:: text_far _NR_FR_Agatha_N_U_T
	text_end
FR_Agatha_N_B_T:: text_far _NR_FR_Agatha_N_B_T
	text_end
FR_Agatha_N_K_T:: text_far _NR_FR_Agatha_N_K_T
	text_end
FR_Agatha_N_H_T:: text_far _NR_FR_Agatha_N_H_T
	text_end
FR_Agatha_N_O_T:: text_far _NR_FR_Agatha_N_O_T
	text_end
FR_Agatha_N_R_T:: text_far _NR_FR_Agatha_N_R_T
	text_end
FR_Agatha_N_X_T:: text_far _NR_FR_Agatha_N_X_T
	text_end
FR_Agatha_N_W_T:: text_far _NR_FR_Agatha_N_W_T
	text_end
FR_Lance_N_S_T:: text_far _NR_FR_Lance_N_S_T
	text_end
FR_Lance_N_A_T:: text_far _NR_FR_Lance_N_A_T
	text_end
FR_Lance_N_G_T:: text_far _NR_FR_Lance_N_G_T
	text_end
FR_Lance_N_P_T:: text_far _NR_FR_Lance_N_P_T
	text_end
FR_Lance_N_C_T:: text_far _NR_FR_Lance_N_C_T
	text_end
FR_Lance_N_Z_T:: text_far _NR_FR_Lance_N_Z_T
	text_end
FR_Lance_N_D_T:: text_far _NR_FR_Lance_N_D_T
	text_end
FR_Lance_N_M_T:: text_far _NR_FR_Lance_N_M_T
	text_end
FR_Lance_N_U_T:: text_far _NR_FR_Lance_N_U_T
	text_end
FR_Lance_N_B_T:: text_far _NR_FR_Lance_N_B_T
	text_end
FR_Lance_N_K_T:: text_far _NR_FR_Lance_N_K_T
	text_end
FR_Lance_N_H_T:: text_far _NR_FR_Lance_N_H_T
	text_end
FR_Lance_N_O_T:: text_far _NR_FR_Lance_N_O_T
	text_end
FR_Lance_N_R_T:: text_far _NR_FR_Lance_N_R_T
	text_end
FR_Lance_N_X_T:: text_far _NR_FR_Lance_N_X_T
	text_end
FR_Lance_N_W_T:: text_far _NR_FR_Lance_N_W_T
	text_end
FR_RivalChamp_N_S_T:: text_far _NR_FR_RivalChamp_N_S_T
	text_end
FR_RivalChamp_N_A_T:: text_far _NR_FR_RivalChamp_N_A_T
	text_end
FR_RivalChamp_N_G_T:: text_far _NR_FR_RivalChamp_N_G_T
	text_end
FR_RivalChamp_N_P_T:: text_far _NR_FR_RivalChamp_N_P_T
	text_end
FR_RivalChamp_N_C_T:: text_far _NR_FR_RivalChamp_N_C_T
	text_end
FR_RivalChamp_N_Z_T:: text_far _NR_FR_RivalChamp_N_Z_T
	text_end
FR_RivalChamp_N_D_T:: text_far _NR_FR_RivalChamp_N_D_T
	text_end
FR_RivalChamp_N_M_T:: text_far _NR_FR_RivalChamp_N_M_T
	text_end
FR_RivalChamp_N_U_T:: text_far _NR_FR_RivalChamp_N_U_T
	text_end
FR_RivalChamp_N_B_T:: text_far _NR_FR_RivalChamp_N_B_T
	text_end
FR_RivalChamp_N_K_T:: text_far _NR_FR_RivalChamp_N_K_T
	text_end
FR_RivalChamp_N_H_T:: text_far _NR_FR_RivalChamp_N_H_T
	text_end
FR_RivalChamp_N_O_T:: text_far _NR_FR_RivalChamp_N_O_T
	text_end
FR_RivalChamp_N_R_T:: text_far _NR_FR_RivalChamp_N_R_T
	text_end
FR_RivalChamp_N_X_T:: text_far _NR_FR_RivalChamp_N_X_T
	text_end
FR_RivalChamp_N_W_T:: text_far _NR_FR_RivalChamp_N_W_T
	text_end
FR_Oak_N_S_T:: text_far _NR_FR_Oak_N_S_T
	text_end
FR_Oak_N_A_T:: text_far _NR_FR_Oak_N_A_T
	text_end
FR_Oak_N_G_T:: text_far _NR_FR_Oak_N_G_T
	text_end
FR_Oak_N_P_T:: text_far _NR_FR_Oak_N_P_T
	text_end
FR_Oak_N_C_T:: text_far _NR_FR_Oak_N_C_T
	text_end
FR_Oak_N_Z_T:: text_far _NR_FR_Oak_N_Z_T
	text_end
FR_Oak_N_D_T:: text_far _NR_FR_Oak_N_D_T
	text_end
FR_Oak_N_M_T:: text_far _NR_FR_Oak_N_M_T
	text_end
FR_Oak_N_U_T:: text_far _NR_FR_Oak_N_U_T
	text_end
FR_Oak_N_B_T:: text_far _NR_FR_Oak_N_B_T
	text_end
FR_Oak_N_K_T:: text_far _NR_FR_Oak_N_K_T
	text_end
FR_Oak_N_H_T:: text_far _NR_FR_Oak_N_H_T
	text_end
FR_Oak_N_O_T:: text_far _NR_FR_Oak_N_O_T
	text_end
FR_Oak_N_R_T:: text_far _NR_FR_Oak_N_R_T
	text_end
FR_Oak_N_X_T:: text_far _NR_FR_Oak_N_X_T
	text_end
FR_Oak_N_W_T:: text_far _NR_FR_Oak_N_W_T
	text_end
LegAweArt_T:: text_far _NR_LegAweArt_T
	text_end
LegExhArt_T:: text_far _NR_LegExhArt_T
	text_end
LegAweZap_T:: text_far _NR_LegAweZap_T
	text_end
LegExhZap_T:: text_far _NR_LegExhZap_T
	text_end
LegAweMol_T:: text_far _NR_LegAweMol_T
	text_end
LegExhMol_T:: text_far _NR_LegExhMol_T
	text_end
LegAweMewtwo_T:: text_far _NR_LegAweMewtwo_T
	text_end
LegExhMewtwo_T:: text_far _NR_LegExhMewtwo_T
	text_end
LegMewtwoUnimpressedPool_T:: text_far _NR_LegMewtwoUnimpressedPool_T
	text_end
LegMewtwoHatredPool_T:: text_far _NR_LegMewtwoHatredPool_T
	text_end
LegMewPlayfulPool_T:: text_far _NR_LegMewPlayfulPool_T
	text_end
LegMewSorrowPool_T:: text_far _NR_LegMewSorrowPool_T
	text_end
MewWonderNaturePool_S_T:: text_far _NR_MewWonderNaturePool_S_T
	text_end
MewWonderNaturePool_A_T:: text_far _NR_MewWonderNaturePool_A_T
	text_end
MewWonderNaturePool_G_T:: text_far _NR_MewWonderNaturePool_G_T
	text_end
MewWonderNaturePool_P_T:: text_far _NR_MewWonderNaturePool_P_T
	text_end
MewWonderNaturePool_C_T:: text_far _NR_MewWonderNaturePool_C_T
	text_end
MewWonderNaturePool_Z_T:: text_far _NR_MewWonderNaturePool_Z_T
	text_end
MewWonderNaturePool_D_T:: text_far _NR_MewWonderNaturePool_D_T
	text_end
MewWonderNaturePool_M_T:: text_far _NR_MewWonderNaturePool_M_T
	text_end
MewWonderNaturePool_U_T:: text_far _NR_MewWonderNaturePool_U_T
	text_end
MewWonderNaturePool_B_T:: text_far _NR_MewWonderNaturePool_B_T
	text_end
MewWonderNaturePool_K_T:: text_far _NR_MewWonderNaturePool_K_T
	text_end
MewWonderNaturePool_H_T:: text_far _NR_MewWonderNaturePool_H_T
	text_end
MewWonderNaturePool_O_T:: text_far _NR_MewWonderNaturePool_O_T
	text_end
MewWonderNaturePool_R_T:: text_far _NR_MewWonderNaturePool_R_T
	text_end
MewWonderNaturePool_X_T:: text_far _NR_MewWonderNaturePool_X_T
	text_end
MewWonderNaturePool_W_T:: text_far _NR_MewWonderNaturePool_W_T
	text_end
TP_FIRE_1:: text_far _NR_TP_FIRE_1
	text_end
TP_FIRE_2:: text_far _NR_TP_FIRE_2
	text_end
TP_WATER_1:: text_far _NR_TP_WATER_1
	text_end
TP_WATER_2:: text_far _NR_TP_WATER_2
	text_end
TP_GRASS_1:: text_far _NR_TP_GRASS_1
	text_end
TP_GRASS_2:: text_far _NR_TP_GRASS_2
	text_end
TP_ELECTRIC_1:: text_far _NR_TP_ELECTRIC_1
	text_end
TP_ELECTRIC_2:: text_far _NR_TP_ELECTRIC_2
	text_end
TP_FLYING_1:: text_far _NR_TP_FLYING_1
	text_end
TP_FLYING_2:: text_far _NR_TP_FLYING_2
	text_end
TP_GHOST_1:: text_far _NR_TP_GHOST_1
	text_end
TP_GHOST_2:: text_far _NR_TP_GHOST_2
	text_end
TP_PSYCHIC_TYPE_1:: text_far _NR_TP_PSYCHIC_TYPE_1
	text_end
TP_PSYCHIC_TYPE_2:: text_far _NR_TP_PSYCHIC_TYPE_2
	text_end
TP_FLOATING_1:: text_far _NR_TP_FLOATING_1
	text_end
TP_FLOATING_2:: text_far _NR_TP_FLOATING_2
	text_end
TP_ICE_1:: text_far _NR_TP_ICE_1
	text_end
TP_ICE_2:: text_far _NR_TP_ICE_2
	text_end
TP_ROCK_1:: text_far _NR_TP_ROCK_1
	text_end
TP_ROCK_2:: text_far _NR_TP_ROCK_2
	text_end
TP_GROUND_1:: text_far _NR_TP_GROUND_1
	text_end
TP_GROUND_2:: text_far _NR_TP_GROUND_2
	text_end
TP_FIGHTING_1:: text_far _NR_TP_FIGHTING_1
	text_end
TP_FIGHTING_2:: text_far _NR_TP_FIGHTING_2
	text_end
TP_POISON_1:: text_far _NR_TP_POISON_1
	text_end
TP_POISON_2:: text_far _NR_TP_POISON_2
	text_end
TP_BUG_1:: text_far _NR_TP_BUG_1
	text_end
TP_BUG_2:: text_far _NR_TP_BUG_2
	text_end
TP_DRAGON_1:: text_far _NR_TP_DRAGON_1
	text_end
TP_DRAGON_2:: text_far _NR_TP_DRAGON_2
	text_end
HealReactionPools_S_T:: text_far _NR_HealReactionPools_S_T
	text_end
HealReactionPools_A_T:: text_far _NR_HealReactionPools_A_T
	text_end
HealReactionPools_G_T:: text_far _NR_HealReactionPools_G_T
	text_end
HealReactionPools_P_T:: text_far _NR_HealReactionPools_P_T
	text_end
HealReactionPools_C_T:: text_far _NR_HealReactionPools_C_T
	text_end
HealReactionPools_Z_T:: text_far _NR_HealReactionPools_Z_T
	text_end
HealReactionPools_D_T:: text_far _NR_HealReactionPools_D_T
	text_end
HealReactionPools_M_T:: text_far _NR_HealReactionPools_M_T
	text_end
HealReactionPools_U_T:: text_far _NR_HealReactionPools_U_T
	text_end
HealReactionPools_B_T:: text_far _NR_HealReactionPools_B_T
	text_end
HealReactionPools_K_T:: text_far _NR_HealReactionPools_K_T
	text_end
HealReactionPools_H_T:: text_far _NR_HealReactionPools_H_T
	text_end
HealReactionPools_O_T:: text_far _NR_HealReactionPools_O_T
	text_end
HealReactionPools_R_T:: text_far _NR_HealReactionPools_R_T
	text_end
HealReactionPools_X_T:: text_far _NR_HealReactionPools_X_T
	text_end
HealReactionPools_W_T:: text_far _NR_HealReactionPools_W_T
	text_end
OW_Forest_S_T:: text_far _NR_OW_Forest_S_T
	text_end
OW_Forest_A_T:: text_far _NR_OW_Forest_A_T
	text_end
OW_Forest_G_T:: text_far _NR_OW_Forest_G_T
	text_end
OW_Forest_P_T:: text_far _NR_OW_Forest_P_T
	text_end
OW_Forest_C_T:: text_far _NR_OW_Forest_C_T
	text_end
OW_Forest_Z_T:: text_far _NR_OW_Forest_Z_T
	text_end
OW_Forest_D_T:: text_far _NR_OW_Forest_D_T
	text_end
OW_Forest_M_T:: text_far _NR_OW_Forest_M_T
	text_end
OW_Forest_U_T:: text_far _NR_OW_Forest_U_T
	text_end
OW_Forest_B_T:: text_far _NR_OW_Forest_B_T
	text_end
OW_Forest_K_T:: text_far _NR_OW_Forest_K_T
	text_end
OW_Forest_H_T:: text_far _NR_OW_Forest_H_T
	text_end
OW_Forest_O_T:: text_far _NR_OW_Forest_O_T
	text_end
OW_Forest_R_T:: text_far _NR_OW_Forest_R_T
	text_end
OW_Forest_X_T:: text_far _NR_OW_Forest_X_T
	text_end
OW_Forest_W_T:: text_far _NR_OW_Forest_W_T
	text_end
OW_MtMoon_S_T:: text_far _NR_OW_MtMoon_S_T
	text_end
OW_MtMoon_A_T:: text_far _NR_OW_MtMoon_A_T
	text_end
OW_MtMoon_G_T:: text_far _NR_OW_MtMoon_G_T
	text_end
OW_MtMoon_P_T:: text_far _NR_OW_MtMoon_P_T
	text_end
OW_MtMoon_C_T:: text_far _NR_OW_MtMoon_C_T
	text_end
OW_MtMoon_Z_T:: text_far _NR_OW_MtMoon_Z_T
	text_end
OW_MtMoon_D_T:: text_far _NR_OW_MtMoon_D_T
	text_end
OW_MtMoon_M_T:: text_far _NR_OW_MtMoon_M_T
	text_end
OW_MtMoon_U_T:: text_far _NR_OW_MtMoon_U_T
	text_end
OW_MtMoon_B_T:: text_far _NR_OW_MtMoon_B_T
	text_end
OW_MtMoon_K_T:: text_far _NR_OW_MtMoon_K_T
	text_end
OW_MtMoon_H_T:: text_far _NR_OW_MtMoon_H_T
	text_end
OW_MtMoon_O_T:: text_far _NR_OW_MtMoon_O_T
	text_end
OW_MtMoon_R_T:: text_far _NR_OW_MtMoon_R_T
	text_end
OW_MtMoon_X_T:: text_far _NR_OW_MtMoon_X_T
	text_end
OW_MtMoon_W_T:: text_far _NR_OW_MtMoon_W_T
	text_end
OW_Lavender_S_T:: text_far _NR_OW_Lavender_S_T
	text_end
OW_Lavender_A_T:: text_far _NR_OW_Lavender_A_T
	text_end
OW_Lavender_G_T:: text_far _NR_OW_Lavender_G_T
	text_end
OW_Lavender_P_T:: text_far _NR_OW_Lavender_P_T
	text_end
OW_Lavender_C_T:: text_far _NR_OW_Lavender_C_T
	text_end
OW_Lavender_Z_T:: text_far _NR_OW_Lavender_Z_T
	text_end
OW_Lavender_D_T:: text_far _NR_OW_Lavender_D_T
	text_end
OW_Lavender_M_T:: text_far _NR_OW_Lavender_M_T
	text_end
OW_Lavender_U_T:: text_far _NR_OW_Lavender_U_T
	text_end
OW_Lavender_B_T:: text_far _NR_OW_Lavender_B_T
	text_end
OW_Lavender_K_T:: text_far _NR_OW_Lavender_K_T
	text_end
OW_Lavender_H_T:: text_far _NR_OW_Lavender_H_T
	text_end
OW_Lavender_O_T:: text_far _NR_OW_Lavender_O_T
	text_end
OW_Lavender_R_T:: text_far _NR_OW_Lavender_R_T
	text_end
OW_Lavender_X_T:: text_far _NR_OW_Lavender_X_T
	text_end
OW_Lavender_W_T:: text_far _NR_OW_Lavender_W_T
	text_end
OW_GameFreak_S_T:: text_far _NR_OW_GameFreak_S_T
	text_end
OW_GameFreak_A_T:: text_far _NR_OW_GameFreak_A_T
	text_end
OW_GameFreak_G_T:: text_far _NR_OW_GameFreak_G_T
	text_end
OW_GameFreak_P_T:: text_far _NR_OW_GameFreak_P_T
	text_end
OW_GameFreak_C_T:: text_far _NR_OW_GameFreak_C_T
	text_end
OW_GameFreak_Z_T:: text_far _NR_OW_GameFreak_Z_T
	text_end
OW_GameFreak_D_T:: text_far _NR_OW_GameFreak_D_T
	text_end
OW_GameFreak_M_T:: text_far _NR_OW_GameFreak_M_T
	text_end
OW_GameFreak_U_T:: text_far _NR_OW_GameFreak_U_T
	text_end
OW_GameFreak_B_T:: text_far _NR_OW_GameFreak_B_T
	text_end
OW_GameFreak_K_T:: text_far _NR_OW_GameFreak_K_T
	text_end
OW_GameFreak_H_T:: text_far _NR_OW_GameFreak_H_T
	text_end
OW_GameFreak_O_T:: text_far _NR_OW_GameFreak_O_T
	text_end
OW_GameFreak_R_T:: text_far _NR_OW_GameFreak_R_T
	text_end
OW_GameFreak_X_T:: text_far _NR_OW_GameFreak_X_T
	text_end
OW_GameFreak_W_T:: text_far _NR_OW_GameFreak_W_T
	text_end
OW_Tall_S_T:: text_far _NR_OW_Tall_S_T
	text_end
OW_Tall_A_T:: text_far _NR_OW_Tall_A_T
	text_end
OW_Tall_G_T:: text_far _NR_OW_Tall_G_T
	text_end
OW_Tall_P_T:: text_far _NR_OW_Tall_P_T
	text_end
OW_Tall_C_T:: text_far _NR_OW_Tall_C_T
	text_end
OW_Tall_Z_T:: text_far _NR_OW_Tall_Z_T
	text_end
OW_Tall_D_T:: text_far _NR_OW_Tall_D_T
	text_end
OW_Tall_M_T:: text_far _NR_OW_Tall_M_T
	text_end
OW_Tall_U_T:: text_far _NR_OW_Tall_U_T
	text_end
OW_Tall_B_T:: text_far _NR_OW_Tall_B_T
	text_end
OW_Tall_K_T:: text_far _NR_OW_Tall_K_T
	text_end
OW_Tall_H_T:: text_far _NR_OW_Tall_H_T
	text_end
OW_Tall_O_T:: text_far _NR_OW_Tall_O_T
	text_end
OW_Tall_R_T:: text_far _NR_OW_Tall_R_T
	text_end
OW_Tall_X_T:: text_far _NR_OW_Tall_X_T
	text_end
OW_Tall_W_T:: text_far _NR_OW_Tall_W_T
	text_end
OW_Crowded_S_T:: text_far _NR_OW_Crowded_S_T
	text_end
OW_Crowded_A_T:: text_far _NR_OW_Crowded_A_T
	text_end
OW_Crowded_G_T:: text_far _NR_OW_Crowded_G_T
	text_end
OW_Crowded_P_T:: text_far _NR_OW_Crowded_P_T
	text_end
OW_Crowded_C_T:: text_far _NR_OW_Crowded_C_T
	text_end
OW_Crowded_Z_T:: text_far _NR_OW_Crowded_Z_T
	text_end
OW_Crowded_D_T:: text_far _NR_OW_Crowded_D_T
	text_end
OW_Crowded_M_T:: text_far _NR_OW_Crowded_M_T
	text_end
OW_Crowded_U_T:: text_far _NR_OW_Crowded_U_T
	text_end
OW_Crowded_B_T:: text_far _NR_OW_Crowded_B_T
	text_end
OW_Crowded_K_T:: text_far _NR_OW_Crowded_K_T
	text_end
OW_Crowded_H_T:: text_far _NR_OW_Crowded_H_T
	text_end
OW_Crowded_O_T:: text_far _NR_OW_Crowded_O_T
	text_end
OW_Crowded_R_T:: text_far _NR_OW_Crowded_R_T
	text_end
OW_Crowded_X_T:: text_far _NR_OW_Crowded_X_T
	text_end
OW_Crowded_W_T:: text_far _NR_OW_Crowded_W_T
	text_end
OW_Safari_S_T:: text_far _NR_OW_Safari_S_T
	text_end
OW_Safari_A_T:: text_far _NR_OW_Safari_A_T
	text_end
OW_Safari_G_T:: text_far _NR_OW_Safari_G_T
	text_end
OW_Safari_P_T:: text_far _NR_OW_Safari_P_T
	text_end
OW_Safari_C_T:: text_far _NR_OW_Safari_C_T
	text_end
OW_Safari_Z_T:: text_far _NR_OW_Safari_Z_T
	text_end
OW_Safari_D_T:: text_far _NR_OW_Safari_D_T
	text_end
OW_Safari_M_T:: text_far _NR_OW_Safari_M_T
	text_end
OW_Safari_U_T:: text_far _NR_OW_Safari_U_T
	text_end
OW_Safari_B_T:: text_far _NR_OW_Safari_B_T
	text_end
OW_Safari_K_T:: text_far _NR_OW_Safari_K_T
	text_end
OW_Safari_H_T:: text_far _NR_OW_Safari_H_T
	text_end
OW_Safari_O_T:: text_far _NR_OW_Safari_O_T
	text_end
OW_Safari_R_T:: text_far _NR_OW_Safari_R_T
	text_end
OW_Safari_X_T:: text_far _NR_OW_Safari_X_T
	text_end
OW_Safari_W_T:: text_far _NR_OW_Safari_W_T
	text_end
OW_CardKey_S_T:: text_far _NR_OW_CardKey_S_T
	text_end
OW_CardKey_A_T:: text_far _NR_OW_CardKey_A_T
	text_end
OW_CardKey_G_T:: text_far _NR_OW_CardKey_G_T
	text_end
OW_CardKey_P_T:: text_far _NR_OW_CardKey_P_T
	text_end
OW_CardKey_C_T:: text_far _NR_OW_CardKey_C_T
	text_end
OW_CardKey_Z_T:: text_far _NR_OW_CardKey_Z_T
	text_end
OW_CardKey_D_T:: text_far _NR_OW_CardKey_D_T
	text_end
OW_CardKey_M_T:: text_far _NR_OW_CardKey_M_T
	text_end
OW_CardKey_U_T:: text_far _NR_OW_CardKey_U_T
	text_end
OW_CardKey_B_T:: text_far _NR_OW_CardKey_B_T
	text_end
OW_CardKey_K_T:: text_far _NR_OW_CardKey_K_T
	text_end
OW_CardKey_H_T:: text_far _NR_OW_CardKey_H_T
	text_end
OW_CardKey_O_T:: text_far _NR_OW_CardKey_O_T
	text_end
OW_CardKey_R_T:: text_far _NR_OW_CardKey_R_T
	text_end
OW_CardKey_X_T:: text_far _NR_OW_CardKey_X_T
	text_end
OW_CardKey_W_T:: text_far _NR_OW_CardKey_W_T
	text_end
OW_Route14_S_T:: text_far _NR_OW_Route14_S_T
	text_end
OW_Route14_A_T:: text_far _NR_OW_Route14_A_T
	text_end
OW_Route14_G_T:: text_far _NR_OW_Route14_G_T
	text_end
OW_Route14_P_T:: text_far _NR_OW_Route14_P_T
	text_end
OW_Route14_C_T:: text_far _NR_OW_Route14_C_T
	text_end
OW_Route14_Z_T:: text_far _NR_OW_Route14_Z_T
	text_end
OW_Route14_D_T:: text_far _NR_OW_Route14_D_T
	text_end
OW_Route14_M_T:: text_far _NR_OW_Route14_M_T
	text_end
OW_Route14_U_T:: text_far _NR_OW_Route14_U_T
	text_end
OW_Route14_B_T:: text_far _NR_OW_Route14_B_T
	text_end
OW_Route14_K_T:: text_far _NR_OW_Route14_K_T
	text_end
OW_Route14_H_T:: text_far _NR_OW_Route14_H_T
	text_end
OW_Route14_O_T:: text_far _NR_OW_Route14_O_T
	text_end
OW_Route14_R_T:: text_far _NR_OW_Route14_R_T
	text_end
OW_Route14_X_T:: text_far _NR_OW_Route14_X_T
	text_end
OW_Route14_W_T:: text_far _NR_OW_Route14_W_T
	text_end
DarkComfortPool_S_T:: text_far _NR_DarkComfortPool_S_T
	text_end
DarkComfortPool_A_T:: text_far _NR_DarkComfortPool_A_T
	text_end
DarkComfortPool_G_T:: text_far _NR_DarkComfortPool_G_T
	text_end
DarkComfortPool_P_T:: text_far _NR_DarkComfortPool_P_T
	text_end
DarkComfortPool_C_T:: text_far _NR_DarkComfortPool_C_T
	text_end
DarkComfortPool_Z_T:: text_far _NR_DarkComfortPool_Z_T
	text_end
DarkComfortPool_D_T:: text_far _NR_DarkComfortPool_D_T
	text_end
DarkComfortPool_M_T:: text_far _NR_DarkComfortPool_M_T
	text_end
DarkComfortPool_U_T:: text_far _NR_DarkComfortPool_U_T
	text_end
DarkComfortPool_B_T:: text_far _NR_DarkComfortPool_B_T
	text_end
DarkComfortPool_K_T:: text_far _NR_DarkComfortPool_K_T
	text_end
DarkComfortPool_H_T:: text_far _NR_DarkComfortPool_H_T
	text_end
DarkComfortPool_O_T:: text_far _NR_DarkComfortPool_O_T
	text_end
DarkComfortPool_R_T:: text_far _NR_DarkComfortPool_R_T
	text_end
DarkComfortPool_X_T:: text_far _NR_DarkComfortPool_X_T
	text_end
DarkComfortPool_W_T:: text_far _NR_DarkComfortPool_W_T
	text_end
DarkExasperationPool_S_T:: text_far _NR_DarkExasperationPool_S_T
	text_end
DarkExasperationPool_A_T:: text_far _NR_DarkExasperationPool_A_T
	text_end
DarkExasperationPool_G_T:: text_far _NR_DarkExasperationPool_G_T
	text_end
DarkExasperationPool_P_T:: text_far _NR_DarkExasperationPool_P_T
	text_end
DarkExasperationPool_C_T:: text_far _NR_DarkExasperationPool_C_T
	text_end
DarkExasperationPool_Z_T:: text_far _NR_DarkExasperationPool_Z_T
	text_end
DarkExasperationPool_D_T:: text_far _NR_DarkExasperationPool_D_T
	text_end
DarkExasperationPool_M_T:: text_far _NR_DarkExasperationPool_M_T
	text_end
DarkExasperationPool_U_T:: text_far _NR_DarkExasperationPool_U_T
	text_end
DarkExasperationPool_B_T:: text_far _NR_DarkExasperationPool_B_T
	text_end
DarkExasperationPool_K_T:: text_far _NR_DarkExasperationPool_K_T
	text_end
DarkExasperationPool_H_T:: text_far _NR_DarkExasperationPool_H_T
	text_end
DarkExasperationPool_O_T:: text_far _NR_DarkExasperationPool_O_T
	text_end
DarkExasperationPool_R_T:: text_far _NR_DarkExasperationPool_R_T
	text_end
DarkExasperationPool_X_T:: text_far _NR_DarkExasperationPool_X_T
	text_end
DarkExasperationPool_W_T:: text_far _NR_DarkExasperationPool_W_T
	text_end
Route19RockPool_S_T:: text_far _NR_Route19RockPool_S_T
	text_end
Route19RockPool_A_T:: text_far _NR_Route19RockPool_A_T
	text_end
Route19RockPool_G_T:: text_far _NR_Route19RockPool_G_T
	text_end
Route19RockPool_P_T:: text_far _NR_Route19RockPool_P_T
	text_end
Route19RockPool_C_T:: text_far _NR_Route19RockPool_C_T
	text_end
Route19RockPool_Z_T:: text_far _NR_Route19RockPool_Z_T
	text_end
Route19RockPool_D_T:: text_far _NR_Route19RockPool_D_T
	text_end
Route19RockPool_M_T:: text_far _NR_Route19RockPool_M_T
	text_end
Route19RockPool_U_T:: text_far _NR_Route19RockPool_U_T
	text_end
Route19RockPool_B_T:: text_far _NR_Route19RockPool_B_T
	text_end
Route19RockPool_K_T:: text_far _NR_Route19RockPool_K_T
	text_end
Route19RockPool_H_T:: text_far _NR_Route19RockPool_H_T
	text_end
Route19RockPool_O_T:: text_far _NR_Route19RockPool_O_T
	text_end
Route19RockPool_R_T:: text_far _NR_Route19RockPool_R_T
	text_end
Route19RockPool_X_T:: text_far _NR_Route19RockPool_X_T
	text_end
Route19RockPool_W_T:: text_far _NR_Route19RockPool_W_T
	text_end
Route19BeachPool_S_T:: text_far _NR_Route19BeachPool_S_T
	text_end
Route19BeachPool_A_T:: text_far _NR_Route19BeachPool_A_T
	text_end
Route19BeachPool_G_T:: text_far _NR_Route19BeachPool_G_T
	text_end
Route19BeachPool_P_T:: text_far _NR_Route19BeachPool_P_T
	text_end
Route19BeachPool_C_T:: text_far _NR_Route19BeachPool_C_T
	text_end
Route19BeachPool_Z_T:: text_far _NR_Route19BeachPool_Z_T
	text_end
Route19BeachPool_D_T:: text_far _NR_Route19BeachPool_D_T
	text_end
Route19BeachPool_M_T:: text_far _NR_Route19BeachPool_M_T
	text_end
Route19BeachPool_U_T:: text_far _NR_Route19BeachPool_U_T
	text_end
Route19BeachPool_B_T:: text_far _NR_Route19BeachPool_B_T
	text_end
Route19BeachPool_K_T:: text_far _NR_Route19BeachPool_K_T
	text_end
Route19BeachPool_H_T:: text_far _NR_Route19BeachPool_H_T
	text_end
Route19BeachPool_O_T:: text_far _NR_Route19BeachPool_O_T
	text_end
Route19BeachPool_R_T:: text_far _NR_Route19BeachPool_R_T
	text_end
Route19BeachPool_X_T:: text_far _NR_Route19BeachPool_X_T
	text_end
Route19BeachPool_W_T:: text_far _NR_Route19BeachPool_W_T
	text_end
BillPsychicPool_S_T:: text_far _NR_BillPsychicPool_S_T
	text_end
BillPsychicPool_A_T:: text_far _NR_BillPsychicPool_A_T
	text_end
BillPsychicPool_G_T:: text_far _NR_BillPsychicPool_G_T
	text_end
BillPsychicPool_P_T:: text_far _NR_BillPsychicPool_P_T
	text_end
BillPsychicPool_C_T:: text_far _NR_BillPsychicPool_C_T
	text_end
BillPsychicPool_Z_T:: text_far _NR_BillPsychicPool_Z_T
	text_end
BillPsychicPool_D_T:: text_far _NR_BillPsychicPool_D_T
	text_end
BillPsychicPool_M_T:: text_far _NR_BillPsychicPool_M_T
	text_end
BillPsychicPool_U_T:: text_far _NR_BillPsychicPool_U_T
	text_end
BillPsychicPool_B_T:: text_far _NR_BillPsychicPool_B_T
	text_end
BillPsychicPool_K_T:: text_far _NR_BillPsychicPool_K_T
	text_end
BillPsychicPool_H_T:: text_far _NR_BillPsychicPool_H_T
	text_end
BillPsychicPool_O_T:: text_far _NR_BillPsychicPool_O_T
	text_end
BillPsychicPool_R_T:: text_far _NR_BillPsychicPool_R_T
	text_end
BillPsychicPool_X_T:: text_far _NR_BillPsychicPool_X_T
	text_end
BillPsychicPool_W_T:: text_far _NR_BillPsychicPool_W_T
	text_end
CyclingFlyPool_S_T:: text_far _NR_CyclingFlyPool_S_T
	text_end
CyclingFlyPool_A_T:: text_far _NR_CyclingFlyPool_A_T
	text_end
CyclingFlyPool_G_T:: text_far _NR_CyclingFlyPool_G_T
	text_end
CyclingFlyPool_P_T:: text_far _NR_CyclingFlyPool_P_T
	text_end
CyclingFlyPool_C_T:: text_far _NR_CyclingFlyPool_C_T
	text_end
CyclingFlyPool_Z_T:: text_far _NR_CyclingFlyPool_Z_T
	text_end
CyclingFlyPool_D_T:: text_far _NR_CyclingFlyPool_D_T
	text_end
CyclingFlyPool_M_T:: text_far _NR_CyclingFlyPool_M_T
	text_end
CyclingFlyPool_U_T:: text_far _NR_CyclingFlyPool_U_T
	text_end
CyclingFlyPool_B_T:: text_far _NR_CyclingFlyPool_B_T
	text_end
CyclingFlyPool_K_T:: text_far _NR_CyclingFlyPool_K_T
	text_end
CyclingFlyPool_H_T:: text_far _NR_CyclingFlyPool_H_T
	text_end
CyclingFlyPool_O_T:: text_far _NR_CyclingFlyPool_O_T
	text_end
CyclingFlyPool_R_T:: text_far _NR_CyclingFlyPool_R_T
	text_end
CyclingFlyPool_X_T:: text_far _NR_CyclingFlyPool_X_T
	text_end
CyclingFlyPool_W_T:: text_far _NR_CyclingFlyPool_W_T
	text_end
