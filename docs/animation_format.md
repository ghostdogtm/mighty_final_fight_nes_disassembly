# Animation and sprite data (banks 02/03 and 0A/0B)

Every object is drawn by `DrawObject` (0F:E9AE area, see `DrawObjects`). The data comes from two bank pairs;
`animBankTable[objKind]` (0F:EB93) selects the pair for the object: **02** (+ **03**) or **0A** (+ **0B**).
The lower bank is mapped at `$8000`, the upper one at `$A000`.

```
objKind -> animBankTable -> lower bank (02 or 0A) mapped at $8000, lower+1 at $A000
objAnim & $7F -> animLo/animHi        (128 pointers, $8000 / $8080)  -> animation script
script, frame number -> frame id
frame id -> frameLo/frameHi           (256 pointers, $8100 / $8200)  -> frame record (inside the lower bank)
frame record -> sprite offset set     (bank 03 or 0B at $A000-$B0FF, chosen by bit 7)
```

## Animation script (`anim_BB_AAAA`)
```
n        last frame number (the script has n+1 frames)
ticks    game frames per frame (objAnimFlags counts up to this value)
f0..fn   frame ids; a 0 ends the object (objActive is cleared)
```
Length = n + 3 bytes. Checked: in both banks every script ends exactly where the next one starts (253 of 253).
`objAnimFrame` is the current index, wrapped to 0 after `n`. Bit 7 of `objAnim` is ignored for the lookup;
bit 7 of `objAnimFlags` survives `SetAnimY`; while `objFlags` bit 7 is set and the blink bit is on the object is skipped
(damage flicker).

## Frame record (`frame_BB_AAAA`, always in the lower bank, $83xx-$9FFF)
```
byte 0   bits 0-6: sprite count - 1;  bit 7: offset sets come from bank 03 (set) or bank 0B (clear)
byte 1   index into ofsSetLo/ofsSetHi (256 entries at $B100/$B200 of that bank)
then count pairs:  tile, attribute
```
The attribute byte is XOR-ed with the horizontal-flip mask and OR-ed with the priority bit. Sprites that would leave the
screen are skipped; OAM is filled from `oamHideStart` upward.

## Sprite offset set (`ofsset_BB_AAAA`, banks 03 and 0B, $A000-$B0FF)
`count` pairs `dy, dx` (signed, relative to the object position). Flipped objects use `$F8 - dx`.
Sets lie back to back: for 142 of 142 sets in bank 03 and 174 of 177 in bank 0B the next set starts exactly `2*count`
bytes later (the three exceptions share data between sets).

## Numbers
Bank 02 uses 225 frames and 6476 record bytes ($8658-$9FA3), bank 0A 228 frames and 5495 bytes ($85FD-$9B95);
the sets are 143 (bank 03) and 178 (bank 0B).
