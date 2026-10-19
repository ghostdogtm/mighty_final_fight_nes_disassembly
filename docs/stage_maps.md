# Stage maps (decoded from 0F:E547-E6AA, E60F, ED43-EDB3)

All stage data lives in the `$A000` bank of the stage (`stageBankTable`: $01,$05,$07,$09,$0D).
Section k of a stage adds `$30` to the `$AExx` field addresses.

| Address | Label | Contents |
|---|---|---|
| `$AE60 + 8` (+$30*section) | `stageFieldNN_sK` | `$AE60`: 8 screen ids (`stageField60`), `$AE68`: 8 more (`stageField68`), indexed by the horizontal screen number (`ram_0029`) |
| `$AF00 + 64*id` | `stageScreenBase` | map screen: **64 bytes** = 8x8 grid of 32x32 metatiles (256x256 px); `ram_0028` = row*8+column (`ram_0024 >> 2`) |
| `$B700 + 4*m` | `stageMetaBase` | metatile m = four 16x16 block ids (top-left, top-right, bottom-left, bottom-right order of the buffer in `StageLoadMetaTiles`) |
| `$BB00,$BC00,$BD00,$BE00 + b` | `stageBlockTL/TR/BL/BR` | the four 8x8 tile numbers of 16x16 block b |
| `$BF00 + b` | `stageBlockAttr` | bits 0-1 = attribute palette, bits 4-7 = flags used for sprite priority/collision (high nibble goes to `ram_0042..`) |

Chain: screen id (`stageFieldNN[ram_0029]`) → 64-byte map → metatile (`StageMetaPtr`) → 4 blocks → 4 tiles each (`StageLoadMetaTiles` fills the tile buffer `ram_06C0..`, `NMI` copies it to the nametable via `vramQueue`).

Checked on stage 1 (bank 01): screen 0 starts `00 01 02 … 1F` (unique background metatiles) and its last rows are the repeating floor metatiles `21 22 23`, as expected for an 8x8 grid.
Not verified in the game: exact horizontal/vertical orientation of `ram_0028` (row-major is assumed) and the meaning of the `stageBlockAttr` high nibble.
