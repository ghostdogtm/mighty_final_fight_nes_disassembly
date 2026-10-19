# Sound driver (banks 06/07) — data format, partially reverse-engineered

Confidence: **header layout and note byte are solid** (checked against songs 0-7);
the command table is decoded from the code (parameter layout confident, musical meaning of some commands approximate); SFX streams are only partly decoded.

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

## Stream commands (byte < $20)
`SoundCommand` (06:8497) dispatches through a table of 25 words at 06:84A7. Commands 0-3 take no parameter,
all others read one parameter byte first. Per-channel flags live in `ram_0730,X`.

| cmd | handler | parameter / effect |
|---|---|---|
| 00 | SndCmd00 | toggle flag $20 |
| 01 | SndCmd01 | toggle flag $40 |
| 02 | SndCmd02 | set flag $10 |
| 03 | SndCmd03 | toggle flag $08 |
| 04 | SndCmd04 | flags := (flags & $97) \| param |
| 05 | SndCmd05 | tempo: param = high byte, next byte = low byte (8.8 ticks per frame; default $0199) |
| 06 | SndCmd06 | `ram_073C,X` := param (multiplies note durations) |
| 07 | SndCmd07 | volume/duty: (reg & $C0) \| param \| $30 (triangle: stored as is) |
| 08 | SndCmd08 | instrument number = param+1; entries are 8 bytes at the address given big-endian at 06:8A41 |
| 09 | SndCmd09 | low 3 bits of flags := param (selects the duration table) |
| 0A | SndCmd0A | global transpose |
| 0B | SndCmd0B | channel transpose |
| 0C, 0D | SndCmd0C/0D | per-channel parameters (`ram_0714`, `ram_0718`; the latter feeds the slide/pitch logic) |
| 0E-11 | SndCmd0E.. | loop with counter slot 0-3: param = count, then a big-endian address; loops back while the counter lasts |
| 12-15 | | same slots, other sense: jump taken once the counter runs out (the param is also OR-ed into the flags) |
| 16 | | unconditional jump: param = high byte, next byte = low byte |
| 17 | SndCmd17 | end of channel (silences it) |
| 18 | SndCmd18 | noise/channel volume: (reg & $0F) \| param \| $30 |

Note pitch: word table at 06:8959 (index = pitch*2, clamped to $5F). Duration: code from the note byte
looks up 06:8915 or 06:891C, is scaled by `ram_073C` and counted down by the tempo ticks.

## Sound effect streams (partial)
After the priority byte, `SoundStreamTick` (06:8252) reads an element: a flag byte, then optional bytes selected by its bits
(a jump address, two parameters `ram_00D4`/`ram_00D2`), a delay byte (`ram_00D3`) and a channel-mask byte (`ram_00CF`).
Bit 7 ends the sound or starts a chained one. The exact register-write opcodes are not decoded.
