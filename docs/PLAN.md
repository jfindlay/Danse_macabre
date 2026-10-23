# PLAN — Danse macabre, unaccompanied violin

Current sub-track: episode-by-episode sketching (architect + user), with a `@build` handoff for the
LilyPond scaffold. Decisions and the structural map live in `NOTES.md`.

**@build pipeline steps 1-4 done for Episodes 1-8 (2026-10-20).** `arrangement/danse-macabre-solo.ly`
compiles clean: 477 bars, marks A-N land at 65/117/137/173/205/237/253/273/309/362/394/416/430/
438/467, zero `barNumberCheck` warnings. Episodes 1-8 (bars 1-236) are fully composed; Episodes
9-18 (237-477) are `R2.*n` placeholders, still pending @architect. See "Build-session findings"
below for corrections and judgment calls made while entering Episodes 1-4 (no literal draft
existed for these; only prose decisions) that the user/architect should review.

**Architect review of the render (2026-10-20): three blocking defects in Episodes 2 and 4, all
from pitch-convention seams; the solo part, Trame, Episodes 1 and 5-8 verified clean against the
dump.** Fixes and two re-decided drafts are in "Review corrections" below.

**@build applied "Review corrections" (2026-10-20): all three blocking fixes, both re-decided
drafts (65–68/73–76, 102–116), and every "Minor" item except the Episodes 2–5 ad-lib-engraving
question (left deferred to @architect, as noted there).** Recompiled clean: zero
`barNumberCheck` warnings, no note below the open G in the fixed chords. Also replaced every
`"ten."` text indication in Episodes 2, 4 and 5 with the literal tenuto articulation (`--`,
matching the `--` already used elsewhere in the score) and dropped the now-unused `ten` macro
from `global.ily`.

## Deliverable

`arrangement/danse-macabre-solo.ly` → a single-staff solo-violin score, 477 bars of 3/4, marks A–N
at the source bar numbers, scordatura header, sounding pitch. Compiles with the installed
LilyPond (`lilypond danse-macabre-solo.ly`, *not* `-dbackend=null` — that flag crashes on this
install's null backend with `Unbound variable: output-stencils`, unrelated to this project's
content; the real PDF backend works fine). Bar count verified mechanically against the source
Trame via `\barNumberCheck`.

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
    ep06-fugato.ily            % bars 137–172  (C)  (status: DECIDED, draft below)
    ep07-skeletons.ily         % bars 173–204  (D)  (status: DECIDED, draft + ossia below)
    ep08-lyrical-bmajor.ily    % bars 205–236  (E)  (status: DECIDED, draft below)
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

Each episode file is one `\absolute { \barNumberCheck #<first> … \barNumberCheck #<next> }`
expression at **sounding, absolute pitch** — the same convention as the dump, so lifts are
copy-paste (decided 2026-10-18, superseding `\fixed c'`; see NOTES "Conventions"). The main file
concatenates them inside `<< \trame \new Staff = "solo" \new Voice { … } >>` so the marks, key
changes and bar numbers come from the Trame, never from the episode files. The staff is named
`"solo"` so ossia staves can `alignBelowContext` to it.

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
| 6 | 137–172 | five-entry fugato: one surface line per entry (counter-lines, ascending register), subject entry-cues as double-stops (Bach Sonata-fugue allusion); 158 V2 trill; 172 wind line to d♯‴ | **decided** — draft below |
| 7 | 173–204 | one 16-bar Phrygian strain twice (E, then A a 4th up): wind thirds as staccato double-stops, LH-pizz open G = cymbal, e–f–e turn attached to every `<cis'' e''>` chord; 189–204 Vln I pizz line in thirds, pizz harmonic e‴ = triangle; arco ossia | **decided** — draft below |
| 8 | 205–236 | Theme 2 in B major ×4: solo verbatim (1, 3); wind/string answers (2, 4) as **octaves** (the orchestra's own doubling); 205.1 four-string pizz `<b dis' b' dis''>` and 221.1 `<b' dis'' b''>` use the open E♭ as the D♯ of B major; inner voice d♯→d♮→d♯ at its change points | **decided** — draft below |
| 9–18 | 237–477 | per transcript map, to be revised episode by episode | pending |

## Resume here (next session)

0. **Done 2026-10-20.** `@build` applied "Review corrections (2026-10-20)" below — the chord
   fixes, the re-decided 65–68/73–76 and 102–116 drafts, and the minor engraving list.
   Recompiled: zero `barNumberCheck` warnings, no note below the open G. Next actionable item
   for this track is step 2 below (step 1's scaffold/Episodes-1–8 work is also already done, per
   the top-of-file status line).
1. `@build`: the dump is already rescued (`arrangement/dump/` exists, step 0 done). Do steps 1–2
   (converted reference score compiles; `arrangement/` scaffold with 18 placeholder episodes
   passing bar checks). Then enter Episodes 1–4 from the session transcript / NOTES and Episodes
   5–7 from the drafts below. Verify the `(?)` octaves of the 65–116 extraction against the dump
   before entering Episode 4. **Pitch-convention tasks:** the **Episode 5 draft is `\fixed c'`
   — shift every pitch up an octave** when entering it as `\absolute`; the **Episode 6 draft is
   already absolute** (verified: its 137.1 `<g d' bes' g''>` is V1a's open-string chord) despite
   its old heading — enter it unchanged. Episodes 7 and 8 are absolute. Note `slice.py` preset
   names are `cl-bb`, `horn-g`, `horn-d`, `tp-d`. Episode 8 adds one engraving need: the 189–204
   arco ossia ends arco into 205.1, so the ossia staff should carry its own 205.1
   `<b dis' b' dis''>4\f` arco (the main staff's is pizz).
2. `@architect`: resume at **Episode 9, bars 237–252 [F]** — Vln I/II interlocking p 16th runs
   (V1a `b16( bis cis' d' dis') r16 r8 g'16( gis' a' ais' | b'16) …`, V1b offset by a beat),
   Vc/Cb staccato `b, dis b, cis | dis cis b,` from 237.2, wind tossing 246–252. **The join from
   236 is decided from the 236 side:** statement 4 of Episode 8 (V2/Va octaves) ends on
   **237.1 `<fis' fis''>` p** (V2 `fis''2.~ | fis''4`, Va `fis'2.~ | fis'4`), simultaneous with
   V1a's run starting `b16` p on 237.1 — Episode 9 opens by resolving that collision (likely
   `<fis' fis''>` for the first beat, then V1a's run from its second group, since the run rests
   on 237.2 anyway). Slice 237–252 for all voices first.

Working method from Episode 5: a `@general` subagent slices exact bar ranges per voice from the
absolute dump (sounding pitch for transposers); the architect session spends context on
decisions only. Decided episode drafts (LilyPond text) go in the "Episode drafts" section below so
`@build` never depends on a session transcript.

## Review corrections (2026-10-20) — applied by @build (historical record)

All blocking fixes and all minor items except the deferred ad-lib-engraving question (see "Minor"
below) are now in `arrangement/episodes/`. Kept below as the record of what was found and why;
the literal replacement text is no longer a to-do.

Architect review of the first render. Verified clean, no action: every VSolo bar matches the
dump note-for-note (25–32, 49–64, 69–84, 93–101, 117–121, 125–129, 133–136, 205–214, 221–230);
the Trame equals the source Trame; Episode 1's Vc/Cb lift; all explorer-checked lifts in
Episodes 2–3 and 5–8. The defects below all come from two convention seams `@build` crossed
unchecked: (a) the NOTES decision-log snippets for **Episodes 1–4 are `\fixed c'`** (written
before the convention switch and never relabeled — e.g. "Bar 65 = `d4 …`" is the solo's
immutable d′; `<g, d bes g'>` starts on the open G), and (b) the dump's transposing voices (Cl,
Cor, Tp) are at **written** pitch unless sliced with `--transpose`.

### Blocking

1. **Chords an octave low (contain D3, below the open G).** Replace:
   - ep02 32.3 `<d a fis'>` → `<d' a' fis''>` (= Ep 5's stamp; also restores the solo's own
     immutable `<d' a'>` inside it).
   - ep02 33.1 `<g d bes g'>` → `<g d' bes' g''>` (= V1a's chord, as at 137.1).
   - ep04 85.1 `<g d bes g'>` → `<g d' bes' g''>`; 86.1 and 88.1 `<g d bes bes''>` →
     `<g d' bes' bes''>`.
2. **65–68 / 73–76: restore the decided oboe octave (d″).** The build-session "octave
   correction" misread a `\fixed c'` snippet; prose and example both said Hb 1's d″. Re-decided
   with one addition on the 49.1/101.1 precedent: Hb 1's phrase-closing `g''4-.` on the solo's
   rest at 69.1 and 77.1. 73.1 carries the solo's own `-.` (currently dropped). Replace bars
   65–69 and 73–77 with:

   ```
   d'4  d''8-.\p fis''8-. d''8-. e''8-.              | % 65  solo's own d' + Hb 1 at d''
   fis''4^"ten." e''8-. fis''8-. d''8-. fis''8-.     | % 66
   e''8( d''8) d''8-. fis''8-. d''8-. e''8-.         | % 67
   fis''4^"ten." e''8-. fis''8-. d''8-. fis''8-.     | % 68
   g''4-. g'8-.\f^"marcatissimo" bes'8-. g'8-. a'8-. | % 69  Hb 1's last note on the solo's rest
   ```
   ```
   d'4-. d''8-. fis''8-. d''8-. e''8-.               | % 73  solo's own d'-. + Hb 1 (no "ten." 74/76 in Hb 1)
   fis''4 e''8-. fis''8-. d''8-. fis''8-.            | % 74
   e''8( d''8) d''8-. fis''8-. d''8-. e''8-.         | % 75
   fis''4 e''8-. fis''8-. d''8-. fis''8-.            | % 76
   g''4-. g'8-.\f bes'8-. g'8-. a'8-.                | % 77
   ```
3. **102–116: the "drone" is built on written-pitch clarinet and is harmonically wrong.**
   Sounding, Cl 1/2 stab `d''·bes'` / `bes'·g'` (a G-minor triad) on beats 2–3 under the G bass
   and rest on beat 1; the entered `c'` is not a source pitch in any of the ten G-bass bars, and
   109.2 does have a playable partner (the melody rests). Re-decided realization: melody = V1a
   verbatim with its own slurs/accents (dropped at 106/107/114/115 in the current file); stabs on
   beats 2–3 as a second voice over the sustained melody; rule = nearest wind pitch forming an
   adjacent-string double-stop in first position → bes′ (A string) under the G bass, open A under
   the A bass, cis′ (G string) at 116.3. Replace bars 102–116 with:

   ```
   % 102-116: Theme 2 in V1a at g' (= VSolo 49-64) with the wind stabs on beats 2-3 only (winds
   % rest on 1). Sounding: Cl1 d''/bes' + Cl2 bes'/g' under the G bass (102-106, 110-114); Cl1
   % fis''/d'' + Cl2 d''/a' under the A bass (107, 109, 115); 108 e''/cis'' + cis''/a'; 116
   % fis'/e' + d'/cis'; Fl/Hb/Pic double at the octave(s) above from 108. Rule: nearest wind pitch
   % forming an adjacent-string double-stop in the melody's hand (1st position). 116.2 has no
   % playable partner (fis'/d' share the D string; fis'' is on the non-adjacent E-flat string).
   << { r4 bes'4-. bes'4-. } \\ { g'2 g'4 } >>      | % 102 ad lib LH-pizz G
   << { r4 bes'4-. bes'4-. } \\ { f'2 f'4 } >>      | % 103 ad lib LH-pizz G
   << { r4 bes'4-. bes'4-. } \\ { e'2 e'4 } >>      | % 104 ad lib LH-pizz G (e'/bes' is the source's)
   << { r4 bes'4-. bes'4-. } \\ { ees'!2 ees'4 } >> | % 105 ad lib LH-pizz G
   d'4->( <e' bes'>4-> <g' bes'>4->)                | % 106 ad lib LH-pizz G
   fis'4->( <e' a'>4-> <d' a'>4->)                  | % 107
   << { r4 a'4-. a'4-. } \\ { e'2 e'4 } >>          | % 108
   fis'4 <fis' d''>4-. <d' a'>4                     | % 109 stab alone on the melody's rest
   << { r4 bes'4-. bes'4-. } \\ { g'2 g'4 } >>      | % 110 ad lib LH-pizz G
   << { r4 bes'4-. bes'4-. } \\ { f'!2 f'4 } >>     | % 111 ad lib LH-pizz G
   << { r4 bes'4-. bes'4-. } \\ { e'2 e'4 } >>      | % 112 ad lib LH-pizz G
   << { r4 bes'4-. bes'4-. } \\ { ees'!2 ees'4 } >> | % 113 ad lib LH-pizz G
   d'4->( <g' bes'>4-> <g' bes'>4->)                | % 114 ad lib LH-pizz G
   a'4->( <fis' a'>4-> <d' a'>4->)                  | % 115
   fis'2->( <cis' e'>4->)                           | % 116 A7 -> D at 117
   ```
   Engraving: `<< … \\ … >>` inside the main Voice spawns temporary voices; if stems/dynamics
   misbehave, use `<< { \voiceOne r4 bes'4-. bes'4-. } \new Voice { \voiceTwo g'2 g'4 } >>` so
   the melody keeps the main voice. Update the ep04 header comment to match (it currently cites
   the written-pitch `c''/e''` pedal and the "no partner at 109" claim).

### Stale draft in this file

- Episode 6 draft, bar 158: `cis'2.\startTrillSpan( b16[ \stopTrillSpan cis'16]` is 3½ beats.
  `@build` correctly entered `cis'2\startTrillSpan~( cis'8\stopTrillSpan b16[ cis'16]` (matches
  V2). Fixed in the draft below; no score action.

### Minor (text/engraving; no pitch effect)

- **Applied.** ep02 33.2: add "arco" (the preceding 33.1 is pizz, so *sulla tastiera* reads as
  plucked); 41.1 "arco" → "ord." at 41.2 (cancels *sulla tastiera*; the bow never left).
- **Applied.** ep04 85.1: drop the spurious "arco" (81–84 are already arco) and fix the comment
  that calls the chord "V2's own pizz chord" — it is bowed.
- **Applied.** ep04 bar-101 comment: 101.1 `g''` is **VSolo's** last note; 101.3 `d'` is
  **V1a's** upbeat (the current comment has them reversed).
- **Applied.** ep07 header comment: V2's turn is `e'–f'–e'` (one-line octave); the engraved
  `e''–f''–e''` is the Va/V2 figure 8va on the E♭ string — say so. Also "entirely first position"
  is false under scordatura: `<b' d''>` (×9) forces d″ onto the A string (a semitone under the
  open E♭) and b′ onto the D string → 3rd position.
- **Applied.** ep08 221.3: the editorial *(f)* is engraved as a plain `\f`; engrave as
  `-\tweak self-alignment-X #CENTER -\markup{\dynamic "(f)"}` or `\parenthesize \f` equivalent.
- **Applied, choosing the diamond-touch-note option.** Natural harmonics (ep01 5–8/13–16, ep07
  173.1 and 190–202): no touch-point note is engraved; NOTES "Conventions" requires one. Realised
  as a small (`font-size -4`) diamond notehead (`\tweak NoteHead.style #'harmonic`) stacked under
  the sounding pitch — f♯′/d″ (ep01), e″ (ep07) — rather than a separate parenthesized note, to
  avoid the extra voice/cue-note machinery a true small *note* would need inside a chord. Revisit
  if the performer wants the sounding pitch shown too.
- Episodes 2–5 "ad lib" items (LH-pizz G/D, open-D drone, 136.3 small `fis''`) were downgraded
  from small-note engraving (NOTES "LH-pizz bass" device) to comments. Deferred, not decided:
  @architect to rule once Episodes 9–18 exist and the device's density is known.

## Episode drafts (decided; sounding pitch)

Pitch convention per draft: **Episode 5 is `\fixed c'`** (written an octave below sounding);
**Episodes 6, 7 and 8 are absolute** (= the dump). All new drafts are absolute. (The NOTES
decision-log snippets for Episodes 1–4 are `\fixed c'` — see "Review corrections".)

### Episode 5 — bars 117–136 (`\fixed c'` — @build shifts up an octave)

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

### Episode 6 — bars 137–172 (absolute pitch)

Register ascends entry by entry as the orchestra's does. Refinement available for 172.6→173.1
(not yet decided, see Episode 7): `dis'''` is the E♭ string's octave harmonic (midpoint node, a
semitone above the hand's d‴), and 173.1 `e'''` is the A string's 12th harmonic.
Double-stops `<d' f'>`, `<c' a'>`, `<d' g'>`: lower note on the G string (4th/3rd finger). Ossia
for 169–172: the Ob1 octave (`c''…dis''`). LH-pizz ad lib: G on 161.1, 162.1, 166.1; D on 163.1,
165.1.

```
\barNumberCheck #137
% 137.1 V1 chord verbatim; 137.3 Bn/Vc upbeat 8va. Entry 1 = Bn quarters + Va eighth-pairs, 8va
<g d' bes' g''>4-!\ff r4 d'4-.\mf                                  | % 137
g'8-.-> g'8-. g'4-. g'4-.                                          | % 138
f'8-.-> f'8-. f'4-. f'4-.                                          | % 139
e'8-.-> e'8-. e'4-. e'4-.                                          | % 140
ees'8-.-> ees'8-. ees'4-. ees'4-.                                  | % 141
d'8-. d'8-. e'8-. e'8-. g'8-. g'8-.                                | % 142
f'8-. f'8-. e'8-. e'8-. d'8-. d'8-.                                | % 143
e'8-. e'8-. a'4-. <a e'>4-.                                        | % 144  144.3 entry 2 upbeat (Hn3/4, V2)
% Entry 2: counter = Va/Vc "sempre stacc." 8va (surface); subject cue 145-146 (Hn/V2 at pitch)
<d' f'>8-.->^"sempre stacc." <d' e'>8-. d'8-. e'8-. <d' f'>8-. g'8-. | % 145
<c' a'>4-. r8 a8-. b8-. c'8-.                                      | % 146  Vc fill
d'8-. cis'8-. d'8-. f'8-. e'8-. d'8-.                              | % 147
g'4-. r8 g'8-. f'8-. e'8-.                                         | % 148
f'4-. r8 e'8-. d'8-. f'8-.                                         | % 149
a'4-. r8 e'8-. fis'8-. g'8-.                                       | % 150
fis'8-. e'8-. fis'8-. d'8-. <d' e'>8-. <d' fis'>8-.                | % 151  151.3 entry 3 upbeat (Cl/V1 d')
% Entry 3: surface = V2 at pitch spliced with Va/Vc fills 8va; cue 152-153 at V1 octave
<bes g'>8-.-> <a g'>8-. <g g'>8-. a8-. bes8-. c'8-.                | % 152
<d' f'>8-.-> <d' f'>8-. e'8-. f'8-. g'8-. a'8-.                    | % 153
g'8-. fis'8-. g'8-. bes'8-. a'8-. g'8-.                            | % 154
<ees' c''>8-. c'8-. d'8-. ees'8-. f'8-. fis'8-.                    | % 155  ees' = subject's chromatic note
<bes d'>8-. <bes d'>8-. e'8-. e'8-. g'8-. g'8-.                    | % 156  subject climax (V1) over V2 bes
<d' f'>8-. <d' f'>8-. e'8-. e'8-. <d' bes'>8-. <d' bes'>8-.        | % 157  Va bes' tied
cis'2\startTrillSpan~( cis'8\stopTrillSpan b16[ cis'16]            | % 158  V2 cadential trill (3 beats; fixed 2026-10-20)
% Entry 4: surface = V1 rising sequence loco; cue 159-160 (Tp2 at pitch)
d'4-.) d'8-. e'8-. <d' f'>8-. <d' g'>8-.                           | % 159  trill resolves = subject d'
<c' a'>8-. gis'8-. a'8-. c''8-. b'8-. a'8-.                        | % 160
d''8-. c''8-. d''8-. f''8-. e''8-. d''8-.                          | % 161
g''8-. fis''8-. g''8-. bes''8-. a''8-. g''8-.                      | % 162
f''8-. a''8-. g''8-. e''8-. f''8-. d''8-.                          | % 163
e''8-. a''8-. gis''8-. b''8-. c'''8-. a''8-.                       | % 164
d''8-. fis''8-. a''8-. c'''8-. bes''8-. a''8-.                     | % 165
% Entry 5: surface = Fl1 sweep (Ob drops 8va at 169 only for range); cue 166-167 (Tb1)
<g g'>8-.->\f <g g'>8-. g'8-. a'8-. bes'8-. c''8-.                 | % 166
<f' d''>8-.-> cis''8-. d''8-. f''8-. e''8-. d''8-.                 | % 167
g''8-.-> fis''8-. g''8-. bes''8-. a''8-. g''8-.                    | % 168
c'''8-. b''8-. c'''8-. ees'''8-. d'''8-. c'''8-.                   | % 169
f'''8-.\< d'''8-. cis'''8-. c'''8-. b''8-. bes''8-.                | % 170
a''8-. b''8-. cis'''8-. d'''8-. e'''8-. f'''8-.                    | % 171
a''8-. b''8-. c'''8-. cis'''8-. d'''8-. dis'''8-.\!                | % 172  -> [D] 173 p
\barNumberCheck #173
```

### Episode 7 — bars 173–204 [D] (absolute pitch)

Engraving: `-+` is left-hand pizz (the open-G "cymbal" clicks are normal-size, designed, not ad
lib); `\flageolet` notes are natural harmonics — @build adds the touch-point (173.1 `e'''`: A
string touched at `e''`; 190–202 `e'''`: the same node, plucked). Arco turns are `\tuplet 3/2`
slurred with the accent on the first note, as the string parts have them. Section A is entirely
first position; section B is first position to 193, third from 194. Dynamics as source: f 173.1,
p 173.2, cresc 194, f 204.

```
\barNumberCheck #173
% 173-188: wind thirds (Cl2/Hb2 melody + Cl1 third above, two-line octave) as staccato double-stops
% on 1 & 3; LH-pizz open G on 2 = cymbal (Cym p 173.2-188.2); V2's slurred triplet turn e''-f''-e''
% attached to every <cis'' e''> chord. Not carried: Tb3/Tba E pedal, Vc/Va octaves of the turn.
% 173.1 = wind line's resolution e''' (Fl/Pic) + strings'/Tb f stroke: A-string 12th harmonic.
e'''8-.\flageolet\f r8  g4-+\p  \tuplet 3/2 { <cis'' e''>8->( <cis'' f''>8 <cis'' e''>8) } | % 173
<b' d''>4-.  g4-+  \tuplet 3/2 { <cis'' e''>8->( <cis'' f''>8 <cis'' e''>8) }              | % 174
<a' cis''>4-.  g4-+  <b' d''>4-.                                                            | % 175
<gis' b'>4-.  g4-+  <a' cis''>4-.                                                           | % 176 click: d' ad lib (G#)
<a' cis''>4-.  g4-+  \tuplet 3/2 { <cis'' e''>8->( <cis'' f''>8 <cis'' e''>8) }             | % 177
\tuplet 3/2 { <cis'' e''>8->( <cis'' f''>8 <cis'' e''>8) }  g4-+  <d'' f''>4-.              | % 178
\tuplet 3/2 { <cis'' e''>8->( <cis'' f''>8 <cis'' e''>8) }  <b' d''>4-.  <a' cis''>4-.      | % 179 cadence
\tuplet 3/2 { <cis'' e''>8->( <cis'' f''>8 <cis'' e''>8) }  g4-+  <b' d''>4-.               | % 180
<b' d''>4-.  g4-+  <d'' f''>4-.                                                             | % 181
\tuplet 3/2 { <cis'' e''>8->( <cis'' f''>8 <cis'' e''>8) }  g4-+  <d'' f''>4-.              | % 182
<b' d''>4-.  g4-+  \tuplet 3/2 { <cis'' e''>8->( <cis'' f''>8 <cis'' e''>8) }               | % 183
<a' cis''>4-.  g4-+  <b' d''>4-.                                                            | % 184 click: d' ad lib (G#)
<b' d''>4-.  g4-+  <d'' f''>4-.                                                             | % 185
<d'' f''>4-.  g4-+  <e'' g''>4-.                                                            | % 186
<d'' f''>4-.  \tuplet 3/2 { <cis'' e''>8->( <cis'' f''>8 <cis'' e''>8) }  <b' d''>4-.       | % 187 cadence
<d'' f''>4-.  g4-+  \tuplet 3/2 { <cis'' e''>8->( <cis'' f''>8 <cis'' e''>8) }              | % 188
% 189: last wind chord 189.1; the strings' turn is now a-bes-a (Va 189.2) -> bowed on the open A;
% V1a "Pizz." f'' 189.3 (bow stays in hand through 204).
<cis'' e''>4-.  \tuplet 3/2 { a'8->( bes'8 a'8) }  f''4\p^"pizz."                           | % 189
% 189.3-204: V1a pizz line + Tb1's third (above to 201.1, below from 201.3) as pizz double-stops
% on 1 & 3; beat 2 = pizz natural harmonic e''' (open A touched at e'') = Trg p 189.2-204.2.
% Not carried: Ti roll a, / C3-4 pedal a, (189-203), Hb/Cl/Fl horn-call gis->a on 2-3.
<e'' g''>4  e'''4\flageolet  <f'' a''>4                                                     | % 190
<d'' f''>4  e'''4\flageolet  <e'' g''>4                                                     | % 191
<cis'' e''>4  e'''4\flageolet  <d'' f''>4                                                   | % 192
<d'' f''>4  e'''4\flageolet  <f'' a''>4                                                     | % 193
<f'' a''>4\<  e'''4\flageolet  <g'' bes''>4                                                 | % 194 3rd pos. from here
<f'' a''>4  <e'' g''>4  <d'' f''>4                                                          | % 195 cadence
<f'' a''>4  e'''4\flageolet  <e'' g''>4                                                     | % 196
<e'' g''>4  e'''4\flageolet  <g'' bes''>4                                                   | % 197
<f'' a''>4  e'''4\flageolet  <g'' bes''>4                                                   | % 198
<e'' g''>4  e'''4\flageolet  <f'' a''>4                                                     | % 199
<d'' f''>4  e'''4\flageolet  <e'' g''>4                                                     | % 200
<e'' g''>4  e'''4\flageolet  <e'' g''>4                                                     | % 201 .3: Tb1 e' below g''
<e'' g''>4  e'''4\flageolet  <f'' a''>4                                                     | % 202
<e'' g''>4  <d'' f''>4  <cis'' e''>4\!                                                      | % 203 cadence
<e'' g''>4\f  r4  <e'' g''>4                                                                | % 204 -> 205.1 tutti B
\barNumberCheck #205
```

**Ossia (arco) for 189–204**, engraved as a smaller staff below the main staff for those bars:
`\new Staff \with { alignBelowContext = "solo" fontSize = #-3 \override StaffSymbol.staff-space
= #(magstep -3) \override StaffSymbol.thickness = #(magstep -3) \remove Time_signature_engraver }`
inside a `<< … >>` with the main bars 189–204. Same chords bowed staccato; beat 2 = V2's turn
at its own octave `a''–bes''–a''` (E♭ string, in hand in both positions; open-A `a'–bes'–a'`
may be substituted in 189–193); 204 = Fl2/Hb1's chromatic rise `a''–ais''–b''` as a double turn
into 205.1 `b''` arco. Label the staff "ossia (arco)".

```
<cis'' e''>4-.  \tuplet 3/2 { a'8->( bes'8 a'8) }  f''4-.\p                                 | % 189
<e'' g''>4-.  \tuplet 3/2 { a''8->( bes''8 a''8) }  <f'' a''>4-.                            | % 190
<d'' f''>4-.  \tuplet 3/2 { a''8->( bes''8 a''8) }  <e'' g''>4-.                            | % 191
<cis'' e''>4-.  \tuplet 3/2 { a''8->( bes''8 a''8) }  <d'' f''>4-.                          | % 192
<d'' f''>4-.  \tuplet 3/2 { a''8->( bes''8 a''8) }  <f'' a''>4-.                            | % 193
<f'' a''>4-.\<  \tuplet 3/2 { a''8->( bes''8 a''8) }  <g'' bes''>4-.                        | % 194
<f'' a''>4-.  <e'' g''>4-.  <d'' f''>4-.                                                    | % 195
<f'' a''>4-.  \tuplet 3/2 { a''8->( bes''8 a''8) }  <e'' g''>4-.                            | % 196
<e'' g''>4-.  \tuplet 3/2 { a''8->( bes''8 a''8) }  <g'' bes''>4-.                          | % 197
<f'' a''>4-.  \tuplet 3/2 { a''8->( bes''8 a''8) }  <g'' bes''>4-.                          | % 198
<e'' g''>4-.  \tuplet 3/2 { a''8->( bes''8 a''8) }  <f'' a''>4-.                            | % 199
<d'' f''>4-.  \tuplet 3/2 { a''8->( bes''8 a''8) }  <e'' g''>4-.                            | % 200
<e'' g''>4-.  \tuplet 3/2 { a''8->( bes''8 a''8) }  <e'' g''>4-.                            | % 201
<e'' g''>4-.  \tuplet 3/2 { a''8->( bes''8 a''8) }  <f'' a''>4-.                            | % 202
<e'' g''>4-.  <d'' f''>4-.  <cis'' e''>4-.\!                                                | % 203
<e'' g''>4-.\f  \tuplet 3/2 { a''8( bes''8 a''8) }  \tuplet 3/2 { ais''8( b''8 ais''8) }    | % 204 -> 205.1 b''\f
```

### Episode 8 — bars 205–236 [E] (absolute pitch)

Concept: **solo = single line, orchestra = octaves.** Statements 1 and 3 are the solo verbatim
(nothing added; the bass is B throughout, so the LH-pizz device never fires). Statements 2 and 4
are the orchestra's own octave doublings (Fl 1 + Fl 2/Hn 1; V2 + Va) rendered as violin octaves.
Three-note chords mark the inner voice (V1 d♯′→d♮′→d♯′) at its change points. The **open E♭
string is the D♯ of B major**: it is the top of the 205.1 strum and rings inside 221.1.

Engraving/fingering notes for @build: octaves are conventional 1–4 octaves on the **D–A pair**
(g′/f♯′/e′ lower notes cannot be on the A string, so 217–220 and 234–236 must be D–A, 3rd
position); the b′/a♯′/a′ octaves may be taken on A–E♭ in 1st position (a 6-semitone 1–4
stretch) or on D–A in 5th position. **221.1 `<b' dis'' b''>` requires the D–A fingering** (5th
position) so that the open E♭ is free. 217.1 `<g' d'' g''>` is 1st position, fingers 4–3–2,
rolled, sustain on the upper pair. 230.1 `<fis' b' b''>` is 1st position, fingers 3–1–4(ext),
rolled into the sustained octave. Editorial dynamic *(f)* at 221.3 (the source gives none; the
solo re-enters after the p answer). Slurs are the source's phrasing, not bowings. Statement 4's
final note `<fis' fis''>` p falls on **237.1** and belongs to Episode 9's file.

```
\barNumberCheck #205
% 205.1 tutti B-major stamp (Hp-b <b,, b,> mf, Cb/Tb3 b, Tb1 dis', Tp fis', V1 fis'', Fl b'') as a
% four-string pizz strum: open E-flat = D-sharp. 205.2 rest = retake the bow. 205.3-214.1 VSolo
% verbatim, f appassionato. Not carried: 4 solo cellos pp (dis'/b, fis/b, -> d'/g 209-212),
% harp <b,, b,> + arpeggio r8 fis b dis' fis' fis, Cl1 "A defaut de Harpe" rocking figure (206-).
<b dis' b' dis''>4\f^"pizz."  r4  fis'4\f^"arco"^\markup\italic "appassionato" (             | % 205
b'2) b'4(                                                                                     | % 206
ais'2) ais'4(                                                                                 | % 207
a'2) a'4(                                                                                     | % 208
g'2->) g'4                                                                                    | % 209
fis'4( g'4 b'4)                                                                               | % 210
a'4( g'4 fis'4)                                                                               | % 211
g'2 g'4(                                                                                      | % 212
% 213.3 Fl1's upbeat fis'' (espress.) over the solo's tied b' (Fl2/Hn1's fis' is on the D string:
% not addable). 214-221 = Fl1 b'' + Fl2/Hn1 b' as octaves, Fl1's hairpins. Inner voice V1a
% dis'(213) d'(217) dis'(221): 217.1 d'' inside the chord (the accented G-major arrival), 221.1
% open E-flat under the octave taken on D-A, 5th position. Not carried: V2 b, Va fis/g, Cb <b, b>
% pp div, harp.
b'2)~ <b'~ fis''>4\p^\markup\italic "espress." (                                              | % 213
<b' b''>2\< <b' b''>4                                                                         | % 214
<ais' ais''>2 <ais' ais''>4                                                                   | % 215
<a' a''>2 <a' a''>4                                                                           | % 216
<g' d'' g''>2->)\! <g' g''>4(\>                                                               | % 217
<fis' fis''>4 <g' g''>4 <b' b''>4                                                             | % 218
<a' a''>4 <g' g''>4 <fis' fis''>4\!                                                           | % 219
<g' g''>2) <g' g''>4(                                                                         | % 220
% 221.1 answer's goal with the open D-sharp; 221.3 the solo's upbeat truncates the flutes' tail
% (immutable note wins). 221.3-230.1 VSolo verbatim, its own hairpins (G-sharp variant: E major
% 225-226, F-sharp7 227-228). Not carried: cellos, Fl e'/g', Cl ais'/b', harp.
<b' dis'' b''>2) fis'4\f(                                                                     | % 221
b'2) b'4(                                                                                     | % 222
ais'2)\< ais'4(                                                                               | % 223
a'2) a'4(\!                                                                                   | % 224
gis'2->) gis'4(                                                                               | % 225
e'4 fis'4 a'4)                                                                                | % 226
g'4(\> fis'4 e'4)                                                                             | % 227
g'2-.( g'4-.)\!                                                                               | % 228
% 229.3 V2's upbeat fis'' is not addable over the solo's held fis' (D string); Va's fis' is the
% solo's own note. 230.1 = solo's tail fis' + Va b' + V2 b'' as a rolled chord into the octave
% (b' and b'' tied through beat 2), then V2 + Va octaves molto espress., V2's hairpins, f 233.
% Not carried: Tb1-3/Tp1 pedal pp (b/fis/b, ; dis'->e' 233; cis'/ais 235), Cb <b, b>, harp.
fis'2.~                                                                                       | % 229
<fis' b'~ b''~>4^\markup\italic "molto espress." <b' b''>4\< <b' b''>4(                       | % 230
<ais' ais''>2) <ais' ais''>4(                                                                 | % 231
<a' a''>2) <a' a''>4(\!                                                                       | % 232
<gis' gis''>2)\f <gis' gis''>4(                                                               | % 233
<e' e''>4 <fis' fis''>4 <a' a''>4)                                                            | % 234
<g' g''>4(\> <fis' fis''>4 <e' e''>4)                                                         | % 235
<g' g''>2-.( <g' g''>4-.)\!                                                                   | % 236  -> 237.1 <fis' fis''>4 p (Ep 9)
\barNumberCheck #237
```

## Build-session findings (2026-10-20) — for @architect/user review

Episodes 1-4 had only prose decisions in NOTES.md, no literal LilyPond draft (unlike 5-8). Entering
them required re-grounding several details against the dump; flagging the resulting judgment calls
since they go beyond mechanical transcription:

- **Episode 1, bars 13-24: corrects the decision log.** The dump shows bar 17 is silent in every
  voice (no bass pizz until 18), and the Vc/Cb lifted line is 7 notes (d a c fis a c ees, bars
  18-24), not the decision log's 8-note "d...d" bracketing. Entered as 7 notes with bar 17 silent;
  the decision log's text predates this cross-check.
- **Episode 4, bars 65-68/73-76: octave correction.** The decision log says "oboe... own octave
  d″" but its own worked example (`d4 d'8-.\p fis'-. d'-. e'-.`) is at the d′ octave — Bn 1's, not
  Hb 1's. Entered at d′ (Bn 1) for register continuity from Episode 3's close, per the log's own
  example; flagging in case d″ (Hb 1, an octave higher) was actually intended.
  - Same pattern at 85-92: the tutti-chord octaves in the decision log's literal text
    (`<f' c''>`) sit an octave below the V1a theme they're meant to double; entered at the theme's
    actual octave (`<f'' c'''>`) instead.
- **Episode 4, bars 102-116: the wind-stab realization is a genuine arranging choice, not a
  mechanical extraction**, despite the decision log calling the underlying rule "mechanical."
  Applying "nearest wind pitch, playable double stop" required picking a specific octave and a
  specific string pairing (double stops need *adjacent* strings — G-D or D-A — which the raw wind
  pitches, two+ octaves above the melody, don't specify). Realized as a sustained drone — `c'` (G
  string) under the G-bass bars, open A under the A-bass bars — rearticulated each beat. Bar 109
  (D bass) has no playable partner since the melody itself sits on the D string; left plain. This
  passage is the most likely candidate for architect revision among Episodes 1-4.
- **Episode 7's arco ossia (bars 189-204, in the PLAN draft above) is not engraved** in the current
  `.ly` — it's a supplementary safety staff per the decision log, not the main text, and adding an
  `alignBelowContext` staff that only spans 16 of 477 bars inside the single concatenated Voice
  structure would need its own skip-padding scaffold. Follow-up if wanted.
- **Tool note:** LilyPond identifiers cannot contain digits (`ep01` fails to parse — `\ep01` reads
  as `\ep` + the number `01`). Episode variables are named `epOne`..`epEighteen`.

## Handoff to @build (when triggered)

Inputs: this file, `NOTES.md`, the decided episode drafts (LilyPond text in NOTES or session
transcript). Tasks: steps 1–2 of the pipeline, then enter decided episodes. Constraints: sounding
absolute pitch, bar checks, no edits under `source/`, 100-char lines, comments cite the source
voice and bars for every lifted passage (e.g. `% Fl1 33.2–41.1`).
