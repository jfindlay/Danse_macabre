# Danse macabre — arranged for unaccompanied violin

Camille Saint-Saëns's *Danse macabre*, op. 40 (1874), arranged for solo violin in the work's
original scordatura (G–D–A–E♭). The full orchestral score is the primary source; see
`docs/NOTES.md` for premises, conventions, and the arranging decisions, and `docs/PLAN.md` for the
build layout and episode-by-episode status.

## Layout

```
arrangement/
  danse-macabre-solo.ly   main score: \includes global.ily, trame.ily, and episodes/
  global.ily              scordatura header + text/dynamic helper macros
  trame.ily               bar/tempo/key/rehearsal-mark skeleton (carries no notes)
  episodes/                 one .ily per episode (see docs/PLAN.md for the bar-range map)
  dump/                   absolute-pitch dump of every orchestral voice + slicer (build tooling,
                           not part of the score itself — see docs/PLAN.md "Build pipeline")
docs/
  PLAN.md                 deliverable, file layout, build pipeline, episode ledger
  NOTES.md                sources, conventions, structural map, decisions log
source/
  lilypond/               the orchestral score's own LilyPond source (reference; never edited)
  *.pdf                   full score and the composer's violin/piano reduction (secondary)
```

## Build

Requires LilyPond (developed against 2.24.3) on `PATH`.

```
cd arrangement
lilypond danse-macabre-solo.ly
```

Produces `arrangement/danse-macabre-solo.pdf`. A clean compile reports **zero `barNumberCheck`
warnings** — that is the project's fidelity gate (477 bars of 3/4, rehearsal marks A–N at the
source bar numbers, enforced mechanically at every episode boundary).

Do **not** pass `-dbackend=null`: on at least one tested install that flag crashes during the final
layout stage (`Unbound variable: output-stencils`), independent of this project's content. Plain
`lilypond` with the default PDF backend works.

## Status

Episodes 1–8 (bars 1–236) are fully composed. Episodes 9–18 (bars 237–477) are `R2.*n`
multi-measure-rest placeholders pending further arranging — see `docs/PLAN.md`'s episode ledger
and "Resume here" section for what's next.
