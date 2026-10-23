# Unused data found among the bytes the CDL never touched

Everything below lies in ROM that the game did not read during the CDL run. It is decoded here and marked in
`tools/labels/rom.txt` (`text`/`table`).

| Address | Contents |
|---|---|
| `05:A1CD-A23B` | unused boss lines (same layout as the used dialogue at `05:A241+`): "JESSICA HAS ALREADY BEEN / TAKEN TO OUR SECRET HIDEOUT / MY BROTHER'S DEFEAT WILL BE / AVENGED!" |
| `02:989E-98F3` | frame record `$B6` (20 sprites, offset set `$A4` of bank 03), the only frame of animation `$6D` (24 ticks). No code or per-player table refers to anim `$6D`; its neighbours `$6A-$71` are single-frame poses of the player object set |
| `03:ACAE-ACFF` | sprite offset set `$A4` (dy, dx) used by that frame, plus the start of the next one; values are multiples of 8 |

The remaining ~11 KB of unknown bytes (see `docs/unknown_data.md`) has no recognisable structure: low-density runs
(1-2 bits set per byte), dense random-looking runs, and almost no code. The big runs differ byte-for-byte in the E and J
ROMs at the same addresses, so they look like leftover build-time memory rather than shared engine data.
