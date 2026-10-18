# PLAN — Danse macabre, unaccompanied violin

Current sub-track: episode-by-episode sketching (architect + user), with a `@build` handoff for the
LilyPond scaffold. Decisions and the structural map live in `NOTES.md`.

## Deliverable

`arrangement/danse-macabre-solo.ly` → a single-staff solo-violin score, 477 bars of 3/4, marks A–N
at the source bar numbers, scordatura header, sounding pitch. Compiles with the installed
LilyPond; bar count verified mechanically against the source Trame.

## File layout (to be created by @build)

```
arrangement/
  danse-macabre-solo.ly        % \book: header, scordatura markup, \include trame + episodes in order
  trame.ily                    % copy of source Trame, keepWithTag #'Ton, converted to current syntax
  global.ily                   % scordatura markup, \pizz/\arco/\ten helpers (from source Global)
  episodes/
    ep01-midnight.ily          % bars   1–24   (status: DECIDED, draft in session 2026-10-18)
    ep02-summons-theme1.ily    % bars  25–48
    ep03-theme2-largamente.ily % bars  49–64
    ep04-theme1-exchanges.ily  % bars  65–116  (A)
    ep05-fragments-bones.ily   % bars 117–136  (B)  (status: DECIDED, draft below)
    ep06-development.ily       % bars 137–172  (C)
    ep07-skeletons.ily         % bars 173–204  (D)  — step-3 territory
    ep08-lyrical-bmajor.ily    % bars 205–236  (E)
    ep09-spiky.ily             % bars 237–252  (F)
    ep10-whirl-vs-theme.ily    % bars 253–272  (G)  — the knot
    ep11-marcato-dim.ily       % bars 273–308  (H)
    ep12-summons-diesirae.ily  % bars 309–337  (I)
    ep13-strings-sequences.ily % bars 338–361
    ep14-runs-tutti.ily        % bars 362–393  (K)
    ep15-ornamented.ily        % bars 394–415  (L)
    ep16-animato-frenzy.ily    % bars 416–437  (M)
    ep17-dawn.ily              % bars 438–454
    ep18-declame-coda.ily      % bars 455–477  (N)
```

Each episode file is one `\fixed c' { \barNumberCheck #<first> … \barNumberCheck #<next> }`
expression. The main file concatenates them inside `<< \trame \new Voice { … } >>` so the marks,
key changes and bar numbers come from the Trame, never from the episode files.

## Build pipeline

Toolchain (installed 2026-10-18): `lilypond`, `python3-ly`, `rosegarden`, `texlive-music`.

0. **Absolute-pitch dump — DONE 2026-10-18 in scratch; must be rescued.** Lives at
   `/tmp/opencode/dm-dump/` (`abs/<Voice>.abs.ly` ×34, `slice.py`, `build_dump.py`,
   `wrap/global-stub.ily`, `src/` = convert-ly'd copy of `source/lilypond/`). Validated: every
   voice = 477 bars against `ly:music-length`. **First @build action: copy `abs/`, `slice.py`,
   `build_dump.py`, `wrap/global-stub.ily` into `arrangement/dump/`** (regenerate with
   `build_dump.py` if `/tmp` is gone). Slice with
   `python3 slice.py abs <Voice> <bar1> <bar2> [--transpose PRESET]`. Transpositions: Cl in B♭
   (M2 down), Cor 1/2 in G (P4 down), Cor 3/4 in D (m7 down), Tp in D (M2 up).
1. `convert-ly -e` a *copy* of `source/lilypond/` to the installed version; compile
   `166-StSaens-DanseMacabre-00-Score.ly` → this is the regression reference (any lifted bar can be
   checked against it). Do not edit the originals under `source/`.
2. Scaffold `arrangement/` with all 18 episode files as `R2.*n` placeholders with bar checks;
   compile; confirm 477 bars and marks A–N land on 65…467.
3. Replace placeholders episode by episode as they are decided in `NOTES.md`.
4. Each compile must pass with zero `barNumberCheck` warnings — that is the fidelity gate.

## Episode ledger

| # | Bars | Idiom anchor (transcript, revised) | Status |
|---|---|---|---|
| 1 | 1–24 | à défaut de harpe; harmonics shimmer | **decided** — see NOTES |
| 2 | 25–48 | solo verbatim + two pizz chords; Paganini Cap. 9 "imitando il flauto"; Vln I octave + trills; ad-lib LH pizz / drone | **decided** — see NOTES |
| 3 | 49–64 | solo verbatim; ad-lib LH-pizz open G on G-bass downbeats | **decided** — see NOTES |
| 4 | 65–116 | Ob/Bn D-major head; Vln I 85–92 with downbeat chords; Theme 2 tutti 102–116 with written wind double-stops | **decided** — see NOTES |
| 5 | 117–136 | pizz D-major stamps on 117.1/125.1/133.1; solo verbatim; wind/xylophone Theme 1 at g″ **col legno battuto** with string chords as battuto double-stops; 136.3 small-note f♯ | **decided** — draft below |
| 6–18 | 137–477 | per transcript map, to be revised episode by episode | pending |

## Resume here (next session)

1. `@build`: rescue the dump into `arrangement/dump/` (step 0), then steps 1–2 (converted
   reference score compiles; `arrangement/` scaffold with 18 placeholder episodes passing bar
   checks). Then enter Episodes 1–4 from the session transcript / NOTES and Episode 5 from the
   draft below. Verify the `(?)` octaves of the 65–116 extraction against the dump before
   entering Episode 4.
2. `@architect`: resume at **Episode 6, bars 137–172 [C]** (development: bassoon staccato Theme 2
   137–145, string fragments, wind scale ascents 163–172 — solo tacet throughout, so this is the
   first all-lift episode; decide what carries when fragments are tossed between sections).
   Extract with `slice.py` from the dump (fork `@general` for the slice; keep architect context
   for decisions). Then Episode 7 [D] 173–204, the first step-3 (fill) territory.

Working method from Episode 5: a `@general` subagent slices exact bar ranges per voice from the
absolute dump (sounding pitch for transposers); the architect session spends context on
decisions only. Decided episode drafts (LilyPond text) go in the "Episode drafts" section below so
`@build` never depends on a session transcript.

## Episode drafts (decided; `\fixed c'`, sounding pitch)

### Episode 5 — bars 117–136

Comments cite source voices. Engrave "ad lib." items as small notes. Col legno passages: "col
legno battuto" at 121.2 and 129.2, "arco" (ord.) at the next stamp's second beat.

```
\barNumberCheck #117
% 117.1 tutti D stamp (Hp <d, d>, winds d/fis, horns) as pizz chord; 117.2-121.1 VSolo verbatim
<d a fis'>4\f^"pizz."  d'8-.^"arco" fis'-. d'-. e'-.                          | % 117
fis'4\ten e'8-. fis'-. d'-. fis'-.                                            | % 118 ad lib LH-pizz d
e'8\prall( d') d'-. fis'-. d'-. e'-.                                          | % 119 idem
fis'4\ten e'8-. fis'-. d'-. fis'-.                                            | % 120 idem
% 121.1 VSolo g'; 121.2-125.1 Hb1 (= Pic; Xy 8vb) Theme 1 at g'' col legno battuto;
% V1 pizz <ees' bes' g''> on 2 / V2+A <g ees' bes'> on 3 as adjacent-string double-stops
g'4-.  <bes g'>8-.\f^"col legno battuto" bes'-. <bes g'>-. a'-.               | % 121
bes'4-.  <bes ees'>8-.\open g'-. <bes ees'>-.\open f'-.                       | % 122
g'4-.  <ees bes>8-. ees'-.\open <ees bes>-. d'-.                              | % 123
ees'4--\open  <bes ees'>8-.\open ees'-.\open <bes ees'>-.\open ees'-.\open    | % 124
% 125.1 stamp (Hp <d, d>, winds d'', horns); 125.2-129.1 VSolo verbatim
<d a fis'>4\f^"pizz."  d'8-.\f^"arco" fis'-. d'-. e'-.                        | % 125
fis'4\ten e'8-. fis'-. d'-. fis'-.                                            | % 126 ad lib LH-pizz d
e'8\prall( d') d'-. fis'-. d'-. e'-.                                          | % 127 idem
fis'4\ten e'8-. fis'-. d'-. fis'-.                                            | % 128 idem
% 129.2-133.1 as 121-125 but strings col legno incl. A <g ees' bes'> on beat 1 (130-132)
g'4-.  <bes g'>8-.\f^"col legno battuto" bes'-. <bes g'>-. a'-.               | % 129
<bes bes'>4-.  <bes ees'>8-.\open g'-. <bes ees'>-.\open f'-.                 | % 130
<bes g'>4-.  <ees bes>8-. ees'-.\open <ees bes>-. d'-.                        | % 131
<bes ees'>4--\open  <bes ees'>8-.\open ees'-.\open <bes ees'>-.\open ees'-.\open | % 132
% 133.1 = Hp <d' fis' a' d''> f as pizz chord; 133.2-136 VSolo verbatim ff
<d a fis'>4\f^"pizz."  <d a>8\ff^"arco" <d a> <d a> <d a>                     | % 133
<a ees'>4-.\open <d a>8 <d a> <d a> <d a>                                     | % 134
<a ees'>4-.\open <d a>4-. <a ees'>4-.\open                                    | % 135
<d a>4-. <a ees'>4-.\open <d a>4-.                                            | % 136 136.3: ad lib
                                                                                %  small fis' (tutti stamp)
\barNumberCheck #137
```

## Handoff to @build (when triggered)

Inputs: this file, `NOTES.md`, the decided episode drafts (LilyPond text in NOTES or session
transcript). Tasks: steps 1–2 of the pipeline, then enter decided episodes. Constraints: sounding
pitch, `\fixed c'`, bar checks, no edits under `source/`, 100-char lines, comments cite the source
voice and bars for every lifted passage (e.g. `% Fl1 33.2–41.1`).
