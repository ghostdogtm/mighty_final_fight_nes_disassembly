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

| cmd | handler | Mega Man 3-6 name | parameter / effect |
|---|---|---|---|
| 00 | SndCmd00_TripletNote | `_cmd_triplet_note_set` | toggle note flag $20 (triplet) |
| 01 | SndCmd01_ConnectNote | `_cmd_connect_note_set` | toggle note flag $40 (connected note) |
| 02 | SndCmd02_DottedNote | `_cmd_dotted_note_set` | set note flag $10 (dotted note) |
| 03 | SndCmd03_OctaveJump | `_cmd_octave_jump` | toggle note flag $08 (octave +1) |
| 04 | SndCmd04_ChannelFlags | `_cmd_channel_flags` | flags := (flags & $97) \| param |
| 05 | SndCmd05_Tempo | `_cmd_tempo` | tempo: param = high byte, next byte = low byte (8.8 ticks per frame; default $0199) |
| 06 | SndCmd06_NoteAds | `_cmd_note_ads` | `sndNoteAds,X` := param (scales the note length) |
| 07 | SndCmd07_Volume | `_cmd_volume` | volume: (reg & $C0) \| param \| $30 (triangle: stored as is) |
| 08 | SndCmd08_Instrument | `_cmd_instrument` | instrument number = param+1; entries are 8 bytes at the address given big-endian at 06:8A41 |
| 09 | SndCmd09_Octave | `_cmd_octave` | low 3 bits of the note flags := octave |
| 0A | SndCmd0A_GlobalTranspose | `_cmd_global_transpose` | global transpose |
| 0B | SndCmd0B_ChanTranspose | `_cmd_channel_transpose` | channel transpose |
| 0C | SndCmd0C_PitchTune | `_cmd_pitch_tune` | per-channel pitch tune (`sndPitchTune`) |
| 0D | SndCmd0D_PitchSlide | `_cmd_pitch_slide` | per-channel pitch slide (`sndPitchSlide`) |
| 0E-11 | SndCmd0E_Loop1, SndCmd0F_Loop2, SndCmd10_Loop3, SndCmd11_Loop4 | `_cmd_loop_1..4` | loop with counter slot 0-3: param = count, then a big-endian address; loops back while the counter lasts |
| 12-15 | same four entries | `_cmd_break_1..4` | same slots, other sense: jump taken once the counter runs out (the param is also OR-ed into the flags) |
| 16 | SndCmd16_Jump | `_cmd_music_jump` | unconditional jump: param = high byte, next byte = low byte |
| 17 | SndCmd17_EndChannel | `_cmd_music_end` | end of channel (silences it) |
| 18 | SndCmd18_DutyCycle | `_cmd_duty_cycle` | duty / noise volume: (reg & $0F) \| param \| $30 |

**The driver is Capcom's NES sound engine.** The command list, its order, the 8.8 tempo, the flag bits and even the RAM
layout ($0700-$077F, zero page $C0-$D9) are the same as in the Mega Man 3-6 disassemblies
(`lsmmega/mm3..mm6`, `refreshing-lemonade/megaman*-disassembly`): `_music_cmd` there is a table of the same 25 handlers.
The per-channel arrays are named after them (`sndNoteFlags` = `anote_flags` $730, `sndChanTranspose` = `achannel_transpose` $734,
`sndNoteAds` = `anote_ads` $73C, `sndLoopCounter` = `achannel_loop_counter` $744, ...). The differences are
the song/header layout (big-endian pointers, banks $17/$18 for data) and the MFF-specific SFX records.

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
