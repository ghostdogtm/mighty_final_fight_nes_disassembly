# Unused data found among the bytes the CDL never touched

Everything below lies in ROM that the game did not read during the CDL run. It is decoded here and marked in
`tools/labels/rom.txt` (`text`/`table`).

| Address | Contents |
|---|---|
| `05:A1CD-A23B` | unused boss lines (same layout as the used dialogue at `05:A241+`): "JESSICA HAS ALREADY BEEN / TAKEN TO OUR SECRET HIDEOUT / MY BROTHER'S DEFEAT WILL BE / AVENGED!" |
| `03:ACAE-ACFF` | 41 sprite offset pairs (dy, dx), multiples of 8 (`F4/FC/04/0C`), same format as the sets in `docs/animation_format.md` |
| `02:989E-98F3` | (frame id, flags) pairs, looks like an unused animation script |

The remaining ~11 KB of unknown bytes (see `docs/unknown_data.md`) has no recognisable structure: low-density runs
(1-2 bits set per byte), dense random-looking runs, and almost no code. The big runs differ byte-for-byte in the E and J
ROMs at the same addresses, so they look like leftover build-time memory rather than shared engine data.
