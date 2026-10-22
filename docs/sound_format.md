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

## Sound effect streams
A sound effect (header byte != 0) is a time line of **records** read by `SoundStreamTick` (06:8252) from the one
shared stream pointer `soundPtr`. Header byte: bits 0-6 = priority (ignored while a higher one plays), bit 7 is copied
into `sfxFlags` bit 7 (effect uses the global detune `ram_00D8`). The stream starts right after it.

Record layout:
```
flags                 bit 7: end of effect (starts the chained request in sfxChain if its bit 0 is set, else stops)
                      bit 0: loop/jump follows: count byte, then hi, lo of the target (big endian);
                             count 0 = plain jump, else the target is taken while the counter in sfxFlags lasts
                      bit 1: one byte -> sfxGateRatio (gate length = delay * ratio / 256 + 1 frames)
                      bit 2: one byte -> sfxTranspose (added to the note index of tone channels)
delay                 frames until the next record (sfxDelay)
channel mask          bit 0 square 1, bit 1 square 2, bit 2 triangle, bit 3 noise; the channels in the mask are
                      taken over from the music (SoundSilenceMasked) and get one note each
```
Directly after a record the driver runs `SoundChannelTick` for each channel in the mask (in bit order: square 1 first, noise
last) and each reads its own data from the same stream:
```
param mask            bit 0: instrument (+1)        (SndCmd08)
                      bit 1: noise volume           (SndCmd18)
                      bit 2: volume / duty          (SndCmd07)
                      bit 3: parameter D            (SndCmd0D)
                      bit 4: parameter C            (SndCmd0C)
param bytes           one byte for every bit set, in the order above
note                  0 = silence the channel; otherwise note index + 1 (bit 7 set = retrigger the envelope
                      only for the triangle); noise channel: (note-1) xor $0F is the noise period
```
The layout was checked by parsing all 99 sound effects below $C000 (`tools/sfx_dump.py`): every one parses cleanly to an
end record. During the `delay` frames the instruments' envelopes run; at `sfxGateTimer` = 0 they enter the release phase.

## Instruments (8 bytes each, table address at 06:8A41)
Read through `ptr_C5` by `SoundEnvelopeStep` (06:86BA), the envelope runs in 4 states (attack, decay/sustain, release, off):

| byte | meaning |
|---|---|
| 0 | attack rate: index into the step table at 06:8933; the level rises to $F0, then the state advances |
| 1 | decay rate index (0 = skip, jump straight to the sustain level) |
| 2 | sustain level (decay stops here; also the level used when there is no decay) |
| 3 | release rate index (0 = end immediately); not used by the triangle (it is cut) |
| 4 | bit 7 set = the release phase starts without waiting (checked in `SoundSetPeriod`/`SoundReleaseCheck`) |
| 5 | pitch vibrato depth (0 = off), scaled by the LFO position `sndEnvPos` |
| 6 | volume LFO (tremolo) depth, active when >= 5 |
| 7 | noise mode bits OR-ed into the noise period register (channel index 0 only) |

The final volume is `sndVolReg` minus the inverted envelope level high nibble; the result is written with `SoundWriteReg`.
Bytes 4-7 are read from the code only (no instrument has been verified by ear).
