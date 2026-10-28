#!/usr/bin/env python3
"""Batch-build absolute-pitch LilyPond dumps for every source/lilypond/Mus/*.ily voice.

Usage: python3 build_dump.py

The orchestral source is written for LilyPond 2.13/2.16, so the voice files are first copied to a
temp directory and upgraded in place with ``convert-ly``. Then, for each Mus/166-NN-X.ily (except
166-25b-Chant.ily, a duplicate of VSolo), a wrapper .ly is written to the same temp directory,
`lilypond -dbackend=null` is run on it, the log is captured, the `\\absolute { ... }` block emitted
by `\\displayLilyMusic` is extracted, and it is written to source/dump/<Voice>.abs.ly. That
directory is regenerated output, under the git-ignored source/.

Exit status of lilypond is not checked: once \\include'd markup/paper
machinery outside what we stub out can raise fatal errors in later layout
stages (e.g. missing cc.eps), but \\displayLilyMusic has already printed
its result to the log by the time that happens, so we just parse the log.
"""
import pathlib
import shutil
import subprocess
import sys
import tempfile

HERE = pathlib.Path(__file__).resolve().parent
ROOT = HERE.parent
SOURCE_MUS = ROOT / "source" / "lilypond" / "Mus"
ABS = ROOT / "source" / "dump"
GLOBAL_STUB = HERE / "global-stub.ily"

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


def upgrade_sources(work: pathlib.Path) -> list[pathlib.Path] | None:
    """Copy the voice files into ``work/Mus`` and upgrade them with ``convert-ly``.

    :param work: Scratch directory.
    :returns: The upgraded voice files, or ``None`` if ``convert-ly`` failed.
    """
    mus_dir = work / "Mus"
    mus_dir.mkdir()
    mus_files = []
    for src in sorted(SOURCE_MUS.glob("166-*.ily")):
        if src.name in SKIP or src.name.endswith("~"):
            continue
        dest = mus_dir / src.name
        shutil.copyfile(src, dest)
        mus_files.append(dest)
    proc = subprocess.run(
        ["convert-ly", "-e", *map(str, mus_files)], capture_output=True, text=True, check=False
    )
    if proc.returncode != 0:
        print(proc.stdout + proc.stderr, file=sys.stderr)
        return None
    return mus_files


def main() -> int:
    work = pathlib.Path(tempfile.mkdtemp(prefix="dm-dump-"))
    try:
        mus_files = upgrade_sources(work)
        if mus_files is None:
            return 1
        return dump_voices(work, mus_files)
    finally:
        shutil.rmtree(work, ignore_errors=True)


def dump_voices(work: pathlib.Path, mus_files: list[pathlib.Path]) -> int:
    ABS.mkdir(parents=True, exist_ok=True)

    results = []
    for mus in mus_files:
        name = voice_name(mus)
        wrapper = work / f"dump-{name}.ly"
        log_path = work / f"dump-{name}.log"
        wrapper.write_text(
            f'\\version "2.24.3"\n'
            f'\\include "{GLOBAL_STUB}"\n'
            f'm = \\keepWithTag #\'score \\include "{mus}"\n'
            f"\\displayLilyMusic \\m\n"
        )
        proc = subprocess.run(
            ["lilypond", "-dbackend=null", wrapper.name],
            cwd=work,
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
