# ROM read log (Mesen 2, headless)

Finds which ROM bytes the game really executes or reads, and how far each indexed table is read.

```
python tools/mesen/run_log.py --mesen mesen --rom "Mighty Final Fight (U) [!].nes" --out OUT_DIR \
       --frames 24000 --pids 0,1,2 --seeds 11,12 --skip 1200 --jobs 6
python tools/mesen/merge_logs.py OUT_DIR --report docs/rom_reads.md --extents docs/table_extents.txt \
       --write-cdl OUT_DIR/merged.cdl
```

* `run_log.py` copies the Mesen 2 folder given by `--mesen` into `OUT_DIR/mesen` (Lua IO on, RAM zeroed; the installed
  copy is not touched) and starts one `--testrunner` process per (character, seed).
* `rom_read_log.lua` is a random-input bot: it starts the game, picks the character on the select screen (DOWN cycles
  the characters), keeps health and lives topped up and every `--skip` frames of play warps to the next of the five stages
  (`stage` = +1, section 0, `gameAction` = $0E).
* It counts PRG exec and read hits (Mesen access counters) and registers an exec callback on each of the ~930 indexed
  ROM reads (`LDA tbl,X`, `CMP tbl,Y` ...; list made by `gen_sites.py` from `src/`), remembering the lowest and highest
  index register value.
* Speed is about 30 frames per second per process.

Limits: the bot does not finish stages by itself (stage warp is used), does not die (god mode), never reaches the
ending or the continue screen, and reads through `(zp),Y` are only visible in the read counters (no index range).
