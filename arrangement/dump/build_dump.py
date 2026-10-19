#!/usr/bin/env python3
"""Batch-build absolute-pitch LilyPond dumps for every Mus/*.ily voice.

Usage: python3 build_dump.py

For each Mus/166-NN-X.ily (except 166-25b-Chant.ily, a duplicate of VSolo),
writes a wrapper .ly under wrap/, runs `lilypond -dbackend=null` on it,
captures the log, extracts the `\\absolute { ... }` block emitted by
`\\displayLilyMusic`, and writes it to abs/<Voice>.abs.ly.

Exit status of lilypond is not checked: once \\include'd markup/paper
machinery outside what we stub out can raise fatal errors in later layout
stages (e.g. missing cc.eps), but \\displayLilyMusic has already printed
its result to the log by the time that happens, so we just parse the log.
"""
import pathlib
import subprocess
import sys

ROOT = pathlib.Path("/tmp/opencode/dm-dump")
SRC = ROOT / "src"
MUS = SRC / "Mus"
WRAP = ROOT / "wrap"
ABS = ROOT / "abs"
GLOBAL_STUB = WRAP / "global-stub.ily"

SKIP = {"166-25b-Chant.ily"}


def voice_name(path: pathlib.Path) -> str:
    # 166-01-Pic.ily -> Pic ; 166-23a-Cym.ily -> 23a-Cym (keep letter suffix
    # disambiguator for split files)
    stem = path.stem  # 166-01-Pic
    parts = stem.split("-", 2)
    return parts[2] if len(parts) == 3 else stem


def extract_absolute_block(log_text: str) -> str | None:
    marker = "\\absolute {"
    start = log_text.find(marker)
    if start == -1:
        return None
    depth = 0
    i = start
    n = len(log_text)
    while i < n:
        c = log_text[i]
        if c == "{":
            depth += 1
        elif c == "}":
            depth -= 1
            if depth == 0:
                return log_text[start : i + 1]
        i += 1
    return None  # unbalanced -- truncated log


def main() -> int:
    WRAP.mkdir(parents=True, exist_ok=True)
    ABS.mkdir(parents=True, exist_ok=True)

    mus_files = sorted(MUS.glob("166-*.ily"))
    mus_files = [p for p in mus_files if p.name not in SKIP and not p.name.endswith("~")]

    results = []
    for mus in mus_files:
        name = voice_name(mus)
        wrapper = WRAP / f"dump-{name}.ly"
        log_path = WRAP / f"dump-{name}.log"
        wrapper.write_text(
            f'\\version "2.24.3"\n'
            f'\\include "{GLOBAL_STUB}"\n'
            f'm = \\keepWithTag #\'score \\include "{mus}"\n'
            f"\\displayLilyMusic \\m\n"
        )
        proc = subprocess.run(
            ["lilypond", "-dbackend=null", wrapper.name],
            cwd=WRAP,
            capture_output=True,
            text=True,
            timeout=120,
        )
        log_text = proc.stdout + proc.stderr
        log_path.write_text(log_text)
        block = extract_absolute_block(log_text)
        if block is None:
            results.append((name, mus.name, "FAIL", "no \\absolute{} block found in log"))
            continue
        out_path = ABS / f"{name}.abs.ly"
        out_path.write_text(f'\\version "2.24.3"\n\n{block}\n')
        results.append((name, mus.name, "OK", str(out_path)))

    print(f"{'voice':10s} {'source':24s} {'status':6s} detail")
    for name, src, status, detail in results:
        print(f"{name:10s} {src:24s} {status:6s} {detail}")

    fails = [r for r in results if r[2] != "OK"]
    print(f"\n{len(results)} voices processed, {len(fails)} failed.")
    return 1 if fails else 0


if __name__ == "__main__":
    sys.exit(main())
