# Enemy AI dispatch (bank 0C)

`UpdateEnemies` (0C:8000) runs once per frame for every active object slot 1..$0D. It picks the handler with
`objKind` as index into `enemyAILo`/`enemyAIHi` (160 entries, 0C:83AF). Most handlers are a state machine on
`objActive & $0F`.

Kinds $60-$6F, $70-$7F/$90-$9F and $80-$8F do not point into bank 0C: their entries are `$A700+3k`, `$B300+3k`
and `$A000+3k`, i.e. 3-byte jump stubs inside the `$A000` window, which holds a different stage bank for each stage
(`stageBankTable`: 01, 05, 07, 09, 0D). Each stage bank therefore supplies its own AI for those kinds (bosses, stage gimmicks).

Kinds $20-$35 are the six regular enemy types in three palette/strength variants (`objVariant` 1, 2, 4);
the handlers `EnemyAI_Grunt1/2/4` only set the variant and fall into `EnemyAI_GruntCommon`.

| Handler | objKind values |
|---|---|
| `EnemyAI_None` | 00 0A 0B 0C 0D 14 15 17 18 19 1A 1B 1C 1D 1E 4C 4D 4E |
| `EnemyAI_Nop` | 01 09 |
| `EnemyAI_Launched` | 02 |
| `EnemyAI_KnockedBack` | 03 05 |
| `EnemyAI_Kind04` | 04 |
| `EnemyAI_Falling` | 06 |
| `EnemyAI_Kind07_16` | 07 16 |
| `EnemyAI_Kind08` | 08 |
| `EnemyAI_Kind0E` | 0E |
| `EnemyAI_Kind0F` | 0F |
| `EnemyAI_Item10_13` | 10 11 12 13 |
| `EnemyAI_Downed` | 1F |
| `EnemyAI_Grunt1` | 20 21 22 23 24 25 |
| `EnemyAI_Grunt2` | 26 27 28 29 2A 2B |
| `EnemyAI_Leaper1` | 2C |
| `EnemyAI_Leaper2` | 2D |
| `EnemyAI_Projectile2E` | 2E |
| `EnemyAI_Leaper4` | 2F |
| `EnemyAI_Grunt4` | 30 31 32 33 34 35 |
| `EnemyAI_TypeA1` | 36 |
| `EnemyAI_TypeA2` | 37 |
| `EnemyAI_TypeA4` | 38 |
| `EnemyAI_TypeB1` | 39 |
| `EnemyAI_TypeB2` | 3A |
| `EnemyAI_TypeB4` | 3B |
| `EnemyAI_TypeC1` | 3C |
| `EnemyAI_TypeC2` | 3D |
| `EnemyAI_TypeC4` | 3E |
| `EnemyAI_Var1` | 3F 50 53 56 57 59 5C |
| `EnemyAI_CdA_V1` | 40 43 |
| `EnemyAI_CdA_V2` | 41 44 |
| `EnemyAI_CdA_V4` | 42 45 |
| `EnemyAI_CdB_V1` | 46 49 |
| `EnemyAI_CdB_V2` | 47 4A |
| `EnemyAI_CdB_V4` | 48 4B |
| `EnemyAI_Var2` | 4F 51 54 58 5A 5D |
| `EnemyAI_Var4` | 52 55 5B 5E 5F |
| `ofs_03_B303` | 71 91 |
| `ofs_0B_B306` | 72 92 |
| `ofs_03_B30F` | 75 95 |
| `tbl_09_B318` | 78 98 |
| `ofs_03_B324` | 7C 9C |
| `ofs_03_B32A` | 7E 9E |
| `ofs_03_B32D` | 7F 9F |

| Stub table | objKind values |
|---|---|
| `$A700` + 3k (stage bank) | 60-6F |
| `$B300` + 3k (stage bank) | 70-7F and 90-9F (same stub for 7x/9x) |
| `$A000` + 3k (stage bank) | 80-8F |

## Per-object fields used by the handlers

| Field | Meaning |
|---|---|
| `objLife` ($0490) | enemy life; "one hit kills" cheat patches the SBC that subtracts from it (array of 16 object slots; slot 0 = player; Data Crystal addresses are slot $0C) |
| `objSpriteAir` ($04F0) | (?) sprite id while in the air (array of 16 object slots; slot 0 = player; Data Crystal addresses are slot $0C) |
| `objSpriteDown` ($05B0) | (?) sprite id while lying down (array of 16 object slots; slot 0 = player; Data Crystal addresses are slot $0C) |
| `objWallSide` ($03D0) | wall contact side from EnemyTileProbe3: 0 none, 1/2 side |
| `objYPage` ($03E0) | incremented when Y wraps past $EF |
| `objGrabState` ($03F0) | nonzero = held by the player (grab); $FF = being thrown |
| `objAtkBox` ($0440) | attack hitbox: bit 7 = attack active, bits 0-4 = hitbox size index (TestHitBoxOverlap) |
| `objAtkDamage` ($0450) | index into tbl_0F_FD16 = health removed from the player on hit |
| `objFacing` ($0460) | 1 = right, 2 = left (FaceToPlayer) |
| `objMoveMode` ($0470) | movement sub-mode, 0 = default (selects the facing/direction branch in bank 0C) |
| `objSpawnIndex` ($0480) | spawn list index the enemy came from ($FF = none); SpawnEnemy checks it to avoid respawn |
| `objHudLife` ($04A0) | life shown on the HUD enemy bar (>>3 = bar segments) |
| `objStunTimer` ($04B0) | frames to skip the enemy update (counts down in UpdateEnemies) |
| `objDownState` ($04C0) | knockdown phase: $FF = invulnerable/airborne, $FE/$FD = get-up countdown |
| `objAtkHeavy` ($04D0) | nonzero = heavy hit (plays sound $18, longer cooldown) |
| `objHitTimer` ($04E0) | hit-reaction timer ($1E on hit, counts down) |
| `objStep` ($0500) | general per-object phase/step counter used by the AI handlers |
| `objParamA` ($0510) | AI parameter; often a landing Y or a timer ($10, $3C ...) |
| `objParamB` ($0520) | AI parameter; often objY saved at the start of a jump/dive |
| `objParamC` ($0530) | AI parameter; often a second saved Y |
| `objCooldown` ($0540) | attack cooldown (counts down) |
| `objSubStep` ($0550) | secondary AI step/flags (mostly bank 01 and 0B) |
| `objFlags` ($0560) | bit 6 = horizontal flip (set from objFacing) |
| `objAnimFrame` ($0570) | frame counter, reset by SetAnim |
| `objAnim` ($0580) | animation id (SetPlayerAnim/SetAnimX) |
| `objAnimFlags` ($0590) | bit 7 survives SetAnimY |
| `objAirSnapshot` ($05A0) | slots 0-1 only: objSpriteAir of two active enemies, summed by the spawner (bank 08) |
| `objVariant` ($05C0) | enemy variant selector (0-3), indexes parameter tables |
| `objTimer` ($05D0) | general countdown timer of the AI handlers |
| `objCounter` ($05E0) | small repeat counter |
| `objToggle` ($05F0) | direction toggle (EOR #1) |
