# Ending test (Mesen, headless)

`tools/mesen/run_log.py --ending 800 ...` plays 800 frames, then jumps to the last section of the last stage
(`stage` = 4, `stageSection` = 2, `gameAction` = $0E = "next section"). `Act07_SelectScreen` then advances the stage
counter to 5 and the ending runs.

Result for all three characters (Cody, Guy, Haggar), continue flag `ram_0150` = 0:

1. fade out, the night city scene with the character and Jessica, typed text (`RunTextScript_00` 5 and 6),
2. staff credits on a blue screen (`ScreenInit9600` + `RunTextScript_09` 0-4),
3. `InitEndingPlayerObj`: the character stands under "PRESENTED BY CAPCOM" (Cody: anim $73, Guy, Haggar: their own).

So Cody's ending code (`09:AB34..ABCF`, 157 bytes, never seen by the FCEUX CDL) **does run** and shows the animation.

With `ram_0150` = 1 (`--continued`) the scene stays on the Jessica picture, the typed text stops after "LET G" and
neither the credits nor the character appear (`0E:DF03` jumps over them).

Not explained: why Cody's ending was missed in a normal playthrough. The code path is fine; a continue (flag set by
the CONTINUE screen, `ScreenInit9300`) or a cheat that touches `$0150` / the credits counter `$AF` would produce exactly
this. The run used god mode and forced stage warps, so it says nothing about timing-dependent causes.
