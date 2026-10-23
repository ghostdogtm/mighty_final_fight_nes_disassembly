#!/usr/bin/env python3
"""Run tools/mesen/rom_read_log.lua headless in an isolated copy of Mesen 2 (the installed one is not modified).

usage: python tools/mesen/run_log.py --mesen DIR --rom ROM --out DIR [--frames N] [--pids 0,1,2] [--seeds 1,2] [--skip N]

Steps: copy Mesen to <out>/mesen with Lua IO enabled and zeroed RAM, generate the site list, then run one emulator
process per (pid, seed) and leave <out>/run_p<pid>_s<seed>.{sites,exec,read,trace}.
"""
import argparse
import os
import re
import shutil
import subprocess
import sys
from concurrent.futures import ThreadPoolExecutor

HERE = os.path.dirname(os.path.abspath(__file__))


def setup(mesen_src, work):
    os.makedirs(work, exist_ok=True)
    for f in ['Mesen.exe', 'MesenCore.dll', 'libHarfBuzzSharp.dll', 'libSkiaSharp.dll', 'settings.json']:
        shutil.copy2(os.path.join(mesen_src, f), work)
    p = os.path.join(work, 'settings.json')
    s = open(p, encoding='utf-8').read()
    s = s.replace('"AllowIoOsAccess": false', '"AllowIoOsAccess": true')
    s = re.sub(r'"ScriptTimeout": \d+', '"ScriptTimeout": 100', s)
    s = s.replace('"RamPowerOnState": "Random"', '"RamPowerOnState": "AllZeros"')
    open(p, 'w', encoding='utf-8').write(s)


def lua_str(p):
    return '[[' + os.path.abspath(p) + ']]'


def run(a, work, sites, pid, seed):
    prefix = os.path.join(a.out, 'run_p%d_s%d' % (pid, seed))
    extra = ', ending = %d, shots = 24, shotStep = %d%s' % (a.ending, a.shot_step, ', continued = true' if a.continued else '') if a.ending else ''
    cfg = 'CFG = { out = %s, sites = %s, frames = %d, seed = %d, pid = %d, skip = %d, godmode = true%s }\n' % (
        lua_str(prefix), lua_str(sites), a.frames, seed, pid, a.skip, extra)
    script = prefix + '.lua'
    open(script, 'w').write(cfg + open(os.path.join(HERE, 'rom_read_log.lua')).read())
    r = subprocess.run([os.path.join(work, 'Mesen.exe'), '--testrunner', os.path.abspath(a.rom), script, '--timeout=3000'],
                       capture_output=True, text=True)
    print('pid', pid, 'seed', seed, 'exit', r.returncode)
    return r.returncode


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--mesen', required=True)
    ap.add_argument('--rom', required=True)
    ap.add_argument('--out', required=True)
    ap.add_argument('--frames', type=int, default=36000)
    ap.add_argument('--pids', default='0,1,2')
    ap.add_argument('--seeds', default='1')
    ap.add_argument('--skip', type=int, default=0)
    ap.add_argument('--ending', type=int, default=0, help='frames of play before forcing the ending (0 = never)')
    ap.add_argument('--shot-step', type=int, default=240, help='frames between ending screenshots')
    ap.add_argument('--continued', action='store_true', help='with --ending: set the continue-used flag')
    ap.add_argument('--jobs', type=int, default=3)
    a = ap.parse_args()
    os.makedirs(a.out, exist_ok=True)
    work = os.path.join(a.out, 'mesen')
    setup(a.mesen, work)
    sites = os.path.join(a.out, 'sites.lua')
    subprocess.run([sys.executable, os.path.join(HERE, 'gen_sites.py'), sites], check=True)
    jobs = [(int(p), int(s)) for p in a.pids.split(',') for s in a.seeds.split(',')]
    with ThreadPoolExecutor(a.jobs) as ex:
        rcs = list(ex.map(lambda j: run(a, work, sites, *j), jobs))
    return 1 if any(rcs) else 0


if __name__ == '__main__':
    sys.exit(main())
