# Sound driver (banks 06/07) — data format, partially reverse-engineered

Confidence: **header layout and note byte are solid** (checked against songs 0-7);
the control-command bytes (< $20) and SFX streams are **not decoded yet**.

## Request
`SoundPlay` (06:8003): A < $F0 → id (wrapped modulo `songCount` = $B0), A >= $F0 → control command (`SoundControl`, $F0-$F7).

## Song table (06:8A43, `bewords`)
Entry = big-endian address (hi, lo) of the song header; 0000 = unused. Addresses >= $C000 are read through banks $17/$18 (`SoundReadByte`).

## Song header (type 0 = music)
```
00            type byte (0 = music with 4 channels; non-zero = sound effect, see below)
hi lo         pointer (big-endian) to the stream of square 1   (APU offset $00)
hi lo         square 2                                         (APU offset $04)
hi lo         triangle                                         (APU offset $08)
hi lo         noise                                            (APU offset $0C)
```
The streams follow the header directly (song 0: header 06:8B57, streams at 8B60, 8C60, 8CE7, 8D98).
Default tempo is set to $0199 (ram_00C9:ram_00CA), per-channel state lives in $0700-$077F.

## Sound effect header (first byte != 0)
Bit 7 and bits 0-6 = flag and priority (a request with lower priority than `soundPriority` is ignored);
the stream starts right after the byte and is read by `SoundStreamTick` (06:8252).

## Channel stream (music)
`SoundNextNote` (06:83CD) reads one byte per event:
- `< $20` — command (handled at 06:8497, parameters follow);
- `>= $20` — note: bits 7-5 = duration code (1-7, tables at 06:8915 / 06:891C), bits 4-0 = note index (0 = rest).
