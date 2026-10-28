# Danse macabre — arranged for unaccompanied violin

Camille Saint-Saëns's *Danse macabre*, op. 40 (1874), arranged for solo violin in the work's
original scordatura (G–D–A–E♭). `Program notes.md` is the single exposition: the programme, the
arranging premise and rules, the episode-by-episode rationale, performance notes, provenance.

## Layout

```
build                     build script: score, notes, reference-score tools (see Build)
arrangement/
  danse-macabre-solo.ly   main score: \includes global.ily, trame.ily, and episodes/
  global.ily              scordatura header + text/dynamic helper macros
  trame.ily               bar/tempo/key/rehearsal-mark skeleton (carries no notes)
  episodes/               one .ily per episode, bars 1–477 in order
  dump/abs/               absolute-pitch dump of every orchestral voice (generated; git-ignored)
tools/                    build_dump.py, slice.py, global-stub.ily (behind `build dump`/`slice`)
source/
  lilypond/               the orchestral score's own LilyPond source (reference; never edited)
  *.pdf                   full score and the composer's violin/piano reduction (secondary)
```

## Build

Requires Python 3 and LilyPond (developed against 2.24.3, including `convert-ly`) on `PATH`; the
notes PDF also needs pandoc and xelatex. The reference-score tools need `./build dump` run once
(it upgrades `source/lilypond/Mus` with `convert-ly` in a temp dir and writes `arrangement/dump/abs`).

```
./build          # score + notes
./build score    # arrangement/danse-macabre-solo.pdf
./build notes    # "Program notes.pdf"
./build --help   # also the reference-score tools: slice, verify, dump
```

A clean compile reports **zero `barNumberCheck` warnings** — the project's fidelity gate (477 bars
of 3/4, rehearsal marks A–N at the source bar numbers, enforced at every episode boundary). Do not
pass `-dbackend=null`; it crashes during layout on at least one install, independent of this
project.
