-- Mighty Final Fight (U): headless ROM read logger for Mesen 2 (--testrunner).
--
-- tools/mesen/run_log.py prepends a global table CFG to a copy of this script:
--   out       absolute path prefix of the output files
--   sites     absolute path of the Lua table written by tools/mesen/gen_sites.py
--   frames    number of frames to run
--   seed      seed of the random bot
--   pid       character to pick on the select screen (0 Cody, 1 Guy, 2 Haggar)
--   skip      every <skip> frames of play, force the "skip stage" action (0 = never)
--   godmode   keep health and lives topped up
--   ending    (optional) this many frames after the character is chosen jump to the last section of the last
--             stage and finish it (stage 4, section 2, gameAction $0E = next section), so the credits and ending scene run
--   continued (optional) set the "continue used" flag ($0150) when the ending is forced
--   shots     (optional) number of screenshots to take after the ending was triggered, one every shotStep frames (default 240) (<out>_N.png)
--
-- Output:
--   <out>.sites  one line per indexed read instruction that ran: label base reg count idxmin idxmax bank-ok
--   <out>.exec   131072 bytes, 1 = the PRG byte was executed (exec counters)
--   <out>.read   131072 bytes, 1 = the PRG byte was read as data (read counters; includes (zp),Y reads)
--   <out>.trace  gameAction / stage / pid changes with the frame number

local MT_CPU = emu.memType.nesMemory
local PRG = emu.memType.nesPrgRom

local RAM_GAMEACTION, RAM_PID, RAM_STAGE, RAM_HEALTH, RAM_LIVES, RAM_CREDITS = 0x30, 0x34, 0x61, 0x3A, 0x3E, 0xAF
local SELECT_LOOP_PC = 0x9181 -- 04:9181, loop of the character select screen (bank 04 at $8000)

local rng = (CFG.seed or 1) % 2147483647
if rng == 0 then rng = 1 end
local function rand(n)
  rng = (rng * 48271) % 2147483647
  return rng % n
end

local trace = io.open(CFG.out .. ".trace", "w")

-- indexed read sites -------------------------------------------------------------------------------------------------
local sites = dofile(CFG.sites)
local stats = {}
for i, s in ipairs(sites) do
  local st = { n = 0, lo = 255, hi = 0, miss = 0 }
  stats[i] = st
  emu.addMemoryCallback(function()
    local ai = emu.convertAddress(s.pc, MT_CPU)
    if not ai or ai.address ~= s.off then st.miss = st.miss + 1 return end
    local state = emu.getState()
    local idx = state[s.reg == "X" and "cpu.x" or "cpu.y"]
    st.n = st.n + 1
    if idx < st.lo then st.lo = idx end
    if idx > st.hi then st.hi = idx end
  end, emu.callbackType.exec, s.pc, s.pc, emu.cpuType.nes, MT_CPU)
end

-- character select screen --------------------------------------------------------------------------------------------
-- ScreenInit9100 starts with playerId := ram_00BD (the character chosen last, 0 after a reset). It is called from
-- 0E:C6F8 (after the title) and 0E:DF8F; both run in the fixed bank, so the character can be set right before the call.
local selectDone = nil
local frame = 0
local function pickCharacter()
  emu.write(0xBD, CFG.pid, MT_CPU)
  if not selectDone then selectDone = frame end
end
emu.addMemoryCallback(pickCharacter, emu.callbackType.exec, 0xC6F8, 0xC6F8, emu.cpuType.nes, MT_CPU)
emu.addMemoryCallback(pickCharacter, emu.callbackType.exec, 0xDF8F, 0xDF8F, emu.cpuType.nes, MT_CPU)

-- bot ----------------------------------------------------------------------------------------------------------------
local held, heldLeft = {}, 0
local lastPlay = 0
local playFrames = 0

local function pickInput()
  local b = {}
  local ga = emu.read(RAM_GAMEACTION, MT_CPU)
  if heldLeft <= 0 then
    held = {}
    local r = rand(100)
    if r < 45 then held.right = true
    elseif r < 55 then held.left = true end
    if rand(3) == 0 then held.up = true elseif rand(3) == 0 then held.down = true end
    heldLeft = 10 + rand(30)
  end
  heldLeft = heldLeft - 1
  for k, v in pairs(held) do b[k] = v end
  if rand(6) == 0 then b.b = true end
  if rand(25) == 0 then b.a = true end
  if frame % 45 < 2 then b.start = true end -- title, story and select screens
  return b
end

emu.addEventCallback(function()
  emu.setInput(pickInput(), 0)
end, emu.eventType.inputPolled)

-- per frame ----------------------------------------------------------------------------------------------------------
local lastGa, lastStage, lastPid = -1, -1, -1
local stuck = 0
local endingAt, shotN = nil, 0
local function writeBin(path, counters)
  local f = io.open(path, "wb")
  local chunk = {}
  for i = 1, 131072 do
    chunk[#chunk + 1] = (counters[i] or 0) > 0 and "\1" or "\0"
    if #chunk == 4096 then f:write(table.concat(chunk)) chunk = {} end
  end
  f:write(table.concat(chunk))
  f:close()
end

local function finish()
  local f = io.open(CFG.out .. ".sites", "w")
  for i, s in ipairs(sites) do
    local st = stats[i]
    if st.n > 0 then
      f:write(string.format("%s %04X %s %d %d %d\n", s.label, s.base, s.reg, st.n, st.lo, st.hi))
    end
  end
  f:close()
  writeBin(CFG.out .. ".exec", emu.getAccessCounters(PRG, emu.counterType.execCount))
  writeBin(CFG.out .. ".read", emu.getAccessCounters(PRG, emu.counterType.readCount))
  trace:close()
  emu.stop(0)
end

emu.addEventCallback(function()
  frame = frame + 1
  local ga = emu.read(RAM_GAMEACTION, MT_CPU)
  local stage = emu.read(RAM_STAGE, MT_CPU)
  local pid = emu.read(RAM_PID, MT_CPU)
  if ga ~= lastGa or stage ~= lastStage or pid ~= lastPid then
    trace:write(string.format("%d ga=%02X stage=%d pid=%d\n", frame, ga, stage, pid))
    lastGa, lastStage, lastPid = ga, stage, pid
  end
  if CFG.godmode and frame > 600 and not endingAt then
    emu.write(RAM_HEALTH, 0x68, MT_CPU)
    if emu.read(RAM_LIVES, MT_CPU) < 3 then emu.write(RAM_LIVES, 5, MT_CPU) end
    emu.write(RAM_CREDITS, 3, MT_CPU)
  end
  if CFG.skip and CFG.skip > 0 and selectDone and frame - selectDone > 200 then
    playFrames = playFrames + 1
    if playFrames % CFG.skip == 0 then -- warp to the next stage: stage number, section 0, rebuild the screen
      emu.write(RAM_STAGE, (emu.read(RAM_STAGE, MT_CPU) + 1) % 5, MT_CPU)
      emu.write(0x60, 0, MT_CPU)
      emu.write(RAM_GAMEACTION, 0x0E, MT_CPU)
    end
  end
  if CFG.ending and not endingAt and selectDone and frame - selectDone > CFG.ending then
    endingAt = frame
    emu.write(RAM_STAGE, 4, MT_CPU)
    emu.write(0x60, 2, MT_CPU)
    if CFG.continued then emu.write(0x0150, 1, MT_CPU) end -- pretend the continue screen was used
    emu.write(RAM_GAMEACTION, 0x0E, MT_CPU) -- Act07/0E: next section; after section 2 of stage 4 the ending starts
  end
  if endingAt and CFG.shots and shotN < CFG.shots and (frame - endingAt) % (CFG.shotStep or 240) == 0 then
    shotN = shotN + 1
    local g = io.open(CFG.out .. "_" .. shotN .. ".png", "wb")
    g:write(emu.takeScreenshot())
    g:close()
  end
  if ga == 0x0E then stuck = stuck + 1 else stuck = 0 end
  if stuck > 400 then emu.write(RAM_GAMEACTION, 0, MT_CPU) stuck = 0 end
  if frame >= CFG.frames then finish() end
end, emu.eventType.endFrame)
