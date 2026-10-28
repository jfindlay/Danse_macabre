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

**Episode 9 decided 2026-10-22 (architect + user); entered 2026-10-23.** Architect resumes at
Episode 10 [G].

**User review 2026-10-23 (before playing): three revisions to entered episodes + two engraving
tasks.** Episode 1 shimmer → sustained lifts with LH-pizz toll; bar 172 up an octave to
harmonics; Ep 7 ossia and Ep 2–6 ad-lib small notes to be engraved. Drafts under "Revision
drafts (2026-10-23)".

**Episode 7 reworked 2026-10-26 (user), two passes:** (a) section A as sixths with the melody on
top at the flute octave, beat 2 alternating click/turn; (b) the whole episode as two voices —
bowed (stems up) / pizz (stems down): A = sixths + open-A pizz or V2-pitch turn on beat 2; B =
the strain in the pizz voice (open A under it), the winds' `gis→a` call in the bowed voice, in
octaves from 198, cresc. to f 204. Triangle device and arco ossia dropped. **Per-note pizz
convention asserted** (NOTES "Conventions") and applied to Episodes 1, 2, 4, 5, 8. Applied and
compiled clean; draft under "Revision drafts (2026-10-26)".

**`@build` applied the 2026-10-23 batch (Episode 9 entry, Episode 1 revision, bar 172/173.1
revision, the Episode 7 arco ossia, and the Episodes 2–6 ad-lib engraving).** Recompiled clean:
zero `barNumberCheck` warnings. Hit and worked around a LilyPond 2.24.3 engraving bug while
entering the ad-lib small notes — see "Build-session findings" below.

**Episode 10 decided and entered 2026-10-27** (the deciding session left no PLAN/NOTES entry; the
draft below and the NOTES decision log were reconstructed from `ep10-whirl-vs-theme.ily`'s header
the same day). **Episode 11 decided and entered 2026-10-27 (user + agent).** **Episode 12
decided and entered 2026-10-27 (user + agent)** — the first episode layering orchestral notes
*over* the solo's own notes (313–320 stamps as double-stops); the solo's Theme 2 statement kept
intact. Compiles clean, zero `barNumberCheck` warnings. **Map correction:** the *Dies irae*
parody is at 181–185 (Episode 7), not at [I] — see NOTES. **Episode 13 decided and entered
2026-10-27 (user + agent):** the strings' long phrase through 353, the C-minor Theme 1 figure held
back to 354; the 337 tie restored. Compiles clean. **Episode 14 decided and entered 2026-10-27
(user + agent):** the brass D7 stabs in the cell's rests, the winds' rise from the open D onto
V1a's four-string crash, Theme 1 ff plain then in sixths/octaves, the tails at V1a's d‴–a‴, the
bare open-D vamp and the D7 stabs into [L]. Compiles clean, zero `barNumberCheck` warnings.
**Episode 15 decided and entered 2026-10-28 (user + agent):** V1a's ornamented figure verbatim
(the only line; waltz frame not carried), the two tutti stamps as chords in V1a's hand
(`<bes d' bes' g''>4-!` 394.1, `<g d' bes' bes''>8-!` 402.1), **415 an octave above V1a** (user) —
a four-octave D-major climb from the open D to `fis''''` into the Animato. Compiles clean, zero
`barNumberCheck` warnings. **Episode 16 decided and entered 2026-10-28 (user + agent):** the
piece's climax — **416–425 an octave above V1a** (user; `g''''` the piece's top), 421–423 in
octaves on the A–E♭ pair, the drop to V1a's open G at 426; **426–437 later revised (user, same day): one line
plus the flute's `g'4`/`fis'4` beat-2 stamps above it, no chords** (see the Episode 16 draft). Compiles clean, zero `barNumberCheck` warnings. Next:
Episode 17 [Tempo 1°], 438–454 (step 9 of "Resume here").

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
    ep07-skeletons.ily         % bars 173–204  (D)  (status: DECIDED; revised 2026-10-26, two-voice draft under "Revision drafts")
    ep08-lyrical-bmajor.ily    % bars 205–236  (E)  (status: DECIDED, draft below)
    ep09-spiky.ily             % bars 237–252  (F)  (status: DECIDED 2026-10-22, entered 2026-10-23)
    ep10-whirl-vs-theme.ily    % bars 253–272  (G)  (status: DECIDED + entered 2026-10-27, draft below)
    ep11-marcato-dim.ily       % bars 273–308  (H)  (status: DECIDED + entered 2026-10-27, draft below)
    ep12-summons-diesirae.ily  % bars 309–337  (I)  (status: DECIDED + entered 2026-10-27, draft below; no Dies irae here — name kept)
    ep13-strings-sequences.ily % bars 338–361  (status: DECIDED + entered 2026-10-27, draft below)
    ep14-runs-tutti.ily        % bars 362–393  (K)  (status: DECIDED + entered 2026-10-27, draft below)
    ep15-ornamented.ily        % bars 394–415  (L)  (status: DECIDED + entered 2026-10-28, draft below)
    ep16-animato-frenzy.ily    % bars 416–437  (M)  (status: DECIDED + entered 2026-10-28, draft below)
    ep17-dawn.ily              % bars 438–454  — next
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
| 7 | 173–204 | one 16-bar Phrygian strain twice (E, then A a 4th up), **two voices: bowed (stems up) / pizz (stems down)**. 173–188 sixths, melody (Fl/Pic) on top, Cl1 below, on 1 & 3; beat 2 alternates RH-pizz open A (cymbal) with V2's `e'–f'–e'` turn by hypermeter. 189–204 the strain in the pizz voice on the downbeats with the open A (pedal) under it; the winds' slurred `gis'→a'` call bowed on 2–3 with the melody's beat-3 note on top, octaves `<gis gis'>→<a a'>` from 198, cresc. → f 204 (revised 2026-10-26) | **decided; revised 2026-10-26** — draft below |
| 8 | 205–236 | Theme 2 in B major ×4: solo verbatim (1, 3); wind/string answers (2, 4) as **octaves** (the orchestra's own doubling); 205.1 four-string pizz `<b dis' b' dis''>` and 221.1 `<b' dis'' b''>` use the open E♭ as the D♯ of B major; inner voice d♯→d♮→d♯ at its change points | **decided** — draft below |
| 9 | 237–252 | two-octave chromatic scale (V1a/V1b composite) as one line, slurred per beat; 237.1 rolled `<fis' dis'' fis''>` = Ep 8's resolution + the cadence's D♯; 245–252 V1a verbatim (Theme 1's head in D♯ minor, own register toss) + bass dots `ais`/`a`/`aes` in its downbeat rests; p throughout | **decided** — draft below |
| 10 | 253–272 | **the theme is the whirl's bass**: V1a's triplet arpeggio sweeps alone, with the brass Theme 2 head (Tb1 at C, Tp at A 8vb, Bn/Tb at B♭) replacing the whirl's lowest note on beats 1 and 3, upbeats riding the held bass as double-stops; 265–272 the strings'/Tb1's cis′ as the bottom of every E♭ bar (the German sixth spelled out); positions climb 1st→4th with the cresc. | **decided** — draft below |
| 11 | 273–308 | four lifts: 273–280 hammer blows every bar (Gr6/dim7 four-string chords with the open E♭ or a barre on top vs. the triad resolutions); 281–288 the wind chorale in descending shifted octaves, dim. to p; 289–292 the string wedge as double-stops with the bass 8va (M2→P4→m6→P8) → 293–296 D vamp `<d' fis' a'>` + the timp's a as open-A 8ths; 297–300/305–308 the winds' two-octave chromatic descent twice (Fl1→Cl1 relay at `g''`, then Fl1 at `g'''`), **not** V1a's legg. figure (user's call); 301–304 vamp with V1a's own `<d' a'>` + fis″, cresc. | **decided** — draft below |
| 12 | 309–337 | 309.1 `fis'` (the run's goal); summons verbatim; **312.3–320 the strings' pizz waltz chords in the solo's rests (D, E♭7 ×2, E♭7, A♭ ×2, A♭, C♯°7 ×2 — the E♭7 strum is Ep 11's Gr6 hand) and the solo's low stamps `des'/c'/bes` as double-stops with the wind chord's D-string tone** (`<des' g'>`, `<c' aes'>`, `<bes e'>`); 320.3–321.1 the tutti G→D as open strings; 321.2–323.2 V1a's Theme-1-head cell pp in the solo's rests; **323.3–337 the solo's Theme 2 espress. intact**, cell tails in its two-beat rests (327, 331), `<bes g'>` at 331.3; editorial *(f)* at 323.3 | **decided** — draft below |
| 13 | 338–361 | **the strings' long phrase 337.3–353 as V1a's single line** (pp/p, source swells, a″ peak at 346.1, fis″–g″ cresc. 347–353), the solo's held d′ under its first bars (G string; line on the D string), **octaves from 350** (D–A pair, 4th → 3rd position); **the winds' Theme 1 head in C minor is held back until 354–357** when the strings take it (V1a's pitch, f → ff); 358.1 the tutti hit as a quarter chord `<d' a' ees'''>-!` under the run, then V1a's non-legato D7 descent from ees‴ into [K] | **decided** — draft below |
| 14 | 362–393 | **V1a's part as the spine, the tutti folded into its rests and downbeats:** 362–365 the cell with the brass D7 stab `<c' fis' a'>8-.` on each downbeat; 366–369 the winds' rise from the open D (flute octave, slurred per bar, f → ff) onto V1a's `<g d' bes' g''>` crash; 370–375 Theme 1 ff at g″ with the G-minor four-string chord on the odd-bar downbeats (Ep 4's 85–88 texture, arco); 376–377/384–385 the tails at V1a's d‴–a‴ (a‴ the piece's top), each dropping to the open A for the bass rise `a ais b cis'`; 378.1/386.1 `<d' a' fis''>` stamps; **378.2–383 the second statement in sixths/octaves over the hammered bes′**; 386–389 the strings-alone vamp bare (`cis'4 d'2:8`); 390.2 octaves `<d' d''>` on the 8ths, 391–393 the four-string D7 stab `<c' fis' a' fis''>` on the c♮ downbeats → [L]. Tb countermelody not carried | **decided** — draft below |
| 15 | 394–415 | **V1a's line verbatim — the only line** (V1a/V2 unison, solo tacet): 394 upbeat arpeggio, 395–398 the ornamented chromatic descent in slurred pairs with upper acciaccaturas (1st position, `\open` on the ees''), 399–401 turns + D arpeggio, 403–409 the orchestra's identical repeat, 410–414 the sweeps over the D pedal; tutti stamps as chords in V1a's hand: 394.1 `<bes d' bes' g''>4-!` (Gm over the B♭ bass = V1a's bes), 402.1 `<g d' bes' bes''>8-!` then V1a's rest; **415 an octave above V1a** `a'' d''' fis''' a''' d'''' fis''''` (user) — 414–415 one four-octave climb into the Animato; ff running, ff restated 409 (Cb) with *poco stringendo*. Waltz chords (Hb/Cl/Bn, Va/Vc/Cb on 1–2) not carried | **decided + entered 2026-10-28** — draft below |
| 16 | 416–437 | **the climax — V1a's line an octave up (user), then its own:** 416–418 the ff tutti descent at `g''''` (the piece's top; stopped, artificial-harmonic fallback), 419–420 Theme 1's head on A♭/F♯ at `aes'''`/`fis'''`, **421–423 octaves `<g'' g'''>`→`<c'' c'''>` on the A–E♭ pair** after the crash `<g d' g'' g'''>-!`, 424–425 the head at `aes''`/`fis''`, **426 the drop to the open G**; **426–437 (revised 2026-10-28, user): the unison figure `g bes g a bes4 \| c' b bes a aes4` (then continuous 8ths from 433) as V1a's single line, plus the flute/piccolo's quarter stamp on beat 2 above it — `g'4`/`fis'4` alternating 426–429, `g'4` throughout [M] to the double bar** (supersedes the earlier winds' double-stops, [M] stamps and fff beat chords). ff 416, fff 433 | **decided + entered 2026-10-28; 426–437 revised same day** — draft below |
| 17–18 | 438–477 | per transcript map, to be revised episode by episode | pending |

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
2. **Done 2026-10-23.** `@build` batch applied: (a) `ep09-spiky.ily` entered from the Episode 9
   draft; (b) Episode 1 bars 1–16 replaced with the revision draft (LH-pizz toll, lifted
   sustained shimmer, `touchFisPrime`/`touchDPrimePrime` dropped); (c) bar 172 (`ep06-fugato.ily`)
   and 173.1 (`ep07-skeletons.ily`) revised an octave up to the harmonic join, with new diamond
   touch-point macros (`touchAesDoublePrime`, `touchCPrimePrime`); (d) the Episode 7 arco ossia
   engraved as a parallel `\new Staff = "ossia"` (in `episodes/ossia-ep07.ily`, spanning bars
   189–205 including its own arco 205.1 `<b dis' b' dis''>4\f` — kept on the ossia per the
   Episode 8 header's note that the main staff's 205.1 is pizz), `alignBelowContext`'d to the
   main staff (named `"Violon solo"` in the actual score, not `"solo"` as drafted) via
   `\RemoveAllEmptyStaves`, confirmed visually to appear only on the 186–205 systems; (e) the
   Episodes 2–6 ad-lib items engraved as `\tweak font-size #-3` chord tones with `-+`, one-time
   `^"pizz. m.g. ad lib."` at bar 34; a few items used judgment calls beyond the literal "ad lib"
   comment markers already in the files (Episode 3 bar 62, Episode 4 bars 65–68/73–76, Episode 6
   bar 166.1) — see "Build-session findings" below. (f) Recompiled: zero `barNumberCheck`
   warnings. Hit and fixed a LilyPond engraving bug along the way — see "Build-session findings".
3. **Done 2026-10-27.** Episodes 10 and 11 decided and entered (drafts below; NOTES decision log).
4. **Done 2026-10-27.** Episode 12 decided and entered (draft below; NOTES decision log). 309.1
   is Fl1's `fis'`. The "*Dies irae* ~313–320" inference was checked against the dump and is
   wrong — the chant is at 181–185 (Episode 7); the sul-ponticello device was never built. The
   solo's `d'2.~` at 337 is engraved **without its tie** (an unterminated tie against the Ep 13
   placeholder is a compile warning).
5. **Done 2026-10-27.** Episode 13 decided and entered (draft below; NOTES decision log). The
   337 tie restored (`d'2\!~ <d'~ ees'>4(` in `ep12-summons-diesirae.ily`, ties through 339.1).
   Compiles clean, zero `barNumberCheck` warnings, no tie warnings.
6. **Done 2026-10-27.** Episode 14 decided and entered (draft below; NOTES decision log, map row
   corrected). Compiles clean, zero `barNumberCheck` warnings; render checked visually (page 5).
7. **Done 2026-10-28.** Episode 15 decided and entered (draft below; NOTES decision log, map row
   corrected). Compiles clean, zero `barNumberCheck` warnings; render checked visually (page 6).
8. **Done 2026-10-28.** Episode 16 decided and entered (draft below; NOTES decision log, map row
   corrected). `slice.py` gained the `horn-eb` preset (horns 1/2 from 403; they are silent
   416–437 anyway). Compiles clean, zero `barNumberCheck` warnings; render checked visually
   (page 6). Ledger lines kept for 416–420 (no `\ottava` anywhere in the score — user).
9. Resume at **Episode 17 [Tempo 1°], bars 438–454.** Slice 437–455 for all voices (horns 1/2
   with `--transpose horn-eb`). Known from the 415–438 slice: **438.1 horns 1/2 `ees'`/`ees` fp,
   tied** (the E♭ hold of the map's "horns hold E♭ 438–445"); every other voice rests at 438.
   The strings fall silent after 437's last `g`; the solo re-enters at 455 (*déclamé*). NOTES map:
   oboe cock-crow 440–445; timp/GC roll + strings f→p 445–451; fermata 454 *très long*.

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
  from small-note engraving (NOTES "LH-pizz bass" device) to comments. **Ruled 2026-10-23,
  applied 2026-10-23:** engraved (Resume-here step 2e).

## Revision drafts (2026-10-26; absolute pitch) — applied

### Episode 7, bars 173–204 (replaces the Episode 7 draft and its ossia entirely)

Two voices for the whole episode: bowed (stems up) and pizz (stems down), labelled once. See
NOTES Episode 7 "Revised 2026-10-26" (both passes) for the reasoning; the literal text is the
file `arrangement/episodes/ep07-skeletons.ily`, reproduced here without its comments. The arco
ossia (`ossia-ep07.ily` and its staff in the main file) is removed.

```
\barNumberCheck #173
<<
  { % bowed
    e''''8-.\f r8  s4  <e'' cis'''>4-.                                  | % 173
    <d'' b''>4-.  \tuplet 3/2 { e'8->( f'8 e'8) }  <e'' cis'''>4-.      | % 174
    <cis'' a''>4-.  s4  <d'' b''>4-.                                    | % 175
    <b' gis''>4-.  \tuplet 3/2 { e'8->( f'8 e'8) }  <cis'' a''>4-.      | % 176 1st pos.
    <cis'' a''>4-.  s4  <e'' cis'''>4-.                                 | % 177
    <e'' cis'''>4-.  \tuplet 3/2 { e'8->( f'8 e'8) }  <f'' d'''>4-.     | % 178
    <e'' cis'''>4-.  <d'' b''>4-.  <cis'' a''>4-.                       | % 179 cadence
    <e'' cis'''>4-.  \tuplet 3/2 { e'8->( f'8 e'8) }  <d'' b''>4-.      | % 180
    <d'' b''>4-.  s4  <f'' d'''>4-.                                     | % 181
    <e'' cis'''>4-.  \tuplet 3/2 { e'8->( f'8 e'8) }  <f'' d'''>4-.     | % 182
    <d'' b''>4-.  s4  <e'' cis'''>4-.                                   | % 183
    <cis'' a''>4-.  \tuplet 3/2 { e'8->( f'8 e'8) }  <d'' b''>4-.       | % 184 1st pos.
    <d'' b''>4-.  s4  <f'' d'''>4-.                                     | % 185
    <f'' d'''>4-.  \tuplet 3/2 { e'8->( f'8 e'8) }  <g'' e'''>4-.       | % 186 .3: 5th pos.
    <f'' d'''>4-.  <e'' cis'''>4-.  <d'' b''>4-.                        | % 187 cadence
    <f'' d'''>4-.  s4  <e'' cis'''>4-.                                  | % 188
  }
  \\
  { % pizz: open A on beat 2 of the weak bars
    s4  a'4\p_\markup\italic "pizz. sempre (lower voice)"  s4           | % 173
    s2.  | s4 a'4 s4  | s2.  | s4 a'4 s4  | s2.  | s2.  | s2.           | % 174-180
    s4 a'4 s4  | s2.  | s4 a'4 s4  | s2.  | s4 a'4 s4  | s2.  | s2.     | % 181-187
    s4  a'4  s4                                                         | % 188
  }
>>
<<
  { % bowed: last wind chord + a-bes-a turn; the call gis'->( a') with the melody's beat-3
    % note on top (190-197); the call in octaves (198-204)
    <e'' cis'''>4-.  \tuplet 3/2 { a'8->( bes'8 a'8) }  s4              | % 189
    s4  gis'4->(  <a' f''>4)                                            | % 190
    s4  gis'4->(  <a' e''>4)                                            | % 191
    s4  gis'4->(  <a' d''>4)                                            | % 192
    s4  gis'4->(  <a' f''>4)                                            | % 193
    s4  gis'4->(  <a' g''>4)                                            | % 194
    s4  <gis' e''>4->(  <a' d''>4)                                      | % 195 cadence
    s4  gis'4->(  <a' e''>4)                                            | % 196
    s4  gis'4->(  <a' g''>4)                                            | % 197
    s4  <gis gis'>4->(  <a a'>4)                                        | % 198 octaves
    s4  <gis gis'>4->(  <a a'>4)                                        | % 199
    s4  <gis gis'>4->(  <a a'>4)                                        | % 200
    s4  <gis gis'>4->(  <a a'>4)                                        | % 201
    s4  <gis gis'>4->(  <a a'>4)                                        | % 202
    s4  <gis gis'>4->(  <a a'>4)                                        | % 203 cadence
    s4  <a a'>4(  <ais ais'>4)                                          | % 204 -> 205.1 b (strum)
  }
  \\
  { % pizz: V1a's strain on the downbeats, open A (pedal) under it where free
    s2  f''4\p                                                          | % 189
    <a' e''>4\cresc  s2                                                 | % 190
    d''4  s2  | cis''4  s2  | d''4  s2                                  | % 191-193
    <a' f''>4  s2  | <a' f''>4  s2  | <a' f''>4  s2  | <a' e''>4  s2    | % 194-197
    <a' f''>4  s2  | <a' e''>4  s2  | d''4  s2  | <a' e''>4  s2         | % 198-201
    <a' g''>4  s2  | <a' g''>4  s2                                      | % 202-203
    <a' g''>4\f  s2                                                     | % 204
  }
>>
\barNumberCheck #205
```

## Revision drafts (2026-10-23; absolute pitch)

### Episode 1, bars 1–16 (replaces the current 1–16; 17–24 unchanged)

All twelve strokes are left-hand pizz on the open D (`-+`), f, l.v.; the bow is in hand from bar
1. 5–8: 3rd finger holds `d''` on the A string while the 4th plucks the D — bow clear of the D
string. 13–16: `<d'' fis''>` fingers 3–2. Mark "pizz." (ordinary) at 18 since 18–24 are stopped.

```
\barNumberCheck #1
% 1-12: Hp-h d'2.\f x12 (one stroke per bar) + Cor 1 d' pedal 1-16 = the open D, LH pizz l.v.
d'4-+\f\laissezVibrer^"pizz. m.g." r2                                | % 1
d'4-+\laissezVibrer r2                                               | % 2
d'4-+\laissezVibrer r2                                               | % 3
d'4-+\laissezVibrer r2                                               | % 4
% 5-8: V1 divisi d''/a' + V2 fis'/d' ppp tied -> V1's top note d'' tied, sul tasto senza vibr.,
% over the continuing toll. Not carried: a', fis', d' (the open D rings anyway).
<< { d''2.\ppp~^\markup\italic "sul tasto, senza vibr." } \\ { d'4-+\laissezVibrer s2 } >> | % 5
<< { d''2.~ } \\ { d'4-+\laissezVibrer s2 } >>                       | % 6
<< { d''2.~ } \\ { d'4-+\laissezVibrer s2 } >>                       | % 7
<< { d''2. } \\ { d'4-+\laissezVibrer s2 } >>                        | % 8
d'4-+\laissezVibrer r2                                               | % 9
d'4-+\laissezVibrer r2                                               | % 10
d'4-+\laissezVibrer r2                                               | % 11
d'4-+\laissezVibrer r2                                               | % 12  twelfth stroke
% 13-16: V1 divisi fis''/d'' (+ V2 a'/fis', A d') ppp tied -> V1a's pair as a double-stop.
<d'' fis''>2.\ppp~                                                    | % 13
<d'' fis''>2.~                                                        | % 14
<d'' fis''>2.~                                                        | % 15
<d'' fis''>2.                                                         | % 16  horn pedal ends
```

### Bars 172 and 173.1 (replace in ep06 / ep07)

```
% 172 (ep06): wind line 8va; dis'''' = E-flat string 4th partial (touch at e-flat'''' in place, or
% a-flat'' in 1st pos.); the hand is in 1st position for 173.
a'''8-. b'''8-. c''''8-. cis''''8-. d''''8-. dis''''8-.\flageolet\!  | % 172  -> [D] 173 p
```
```
% 173.1 (ep07): e'''' = A string 6th partial, touched at c'' (low 2nd finger, 1st position).
e''''8-.\flageolet\f r8  g4-+\p  \tuplet 3/2 { <cis'' e''>8->( <cis'' f''>8 <cis'' e''>8) } | % 173
```
Touch-point notes: `dis''''` ← diamond `aes''` (or `ees''''`); `e''''` ← diamond `c''`.

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

### Episode 7 — bars 173–204 [D] (absolute pitch) — SUPERSEDED 2026-10-26

Historical record of the 2026-10-18 text (thirds with the melody underneath, turn glued to the
`<cis'' e''>` chords, LH-pizz G cymbal, pizz thirds + harmonic triangle in B, arco ossia). The
current text is the two-voice draft under "Revision drafts (2026-10-26)".

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

**Revised 2026-10-27 (user): statements 1 and 3 now carry the solo cellos' tied dotted halves
as a lower voice** (d♯′ 206–208, b 209–212, d♯′ 213; d♯′ 222–224, g♯ 225–226, a♯ 227–228, b
229) — see NOTES Episode 8 decision 7 and the file's bar comments; the draft below is the
2026-10-19 single-line text. The two statements are engraved as `<< { \voiceOne … }
\new Voice { \voiceTwo … } >> \oneVoice` blocks — **not** `<< \\ >>`, which moves the melody
into a new voice and breaks the slurs crossing the block edges (205→206, 213→214).

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

### Episode 9 — bars 237–252 [F] (absolute pitch)

Concept: **one line.** 237–244 is the V1a/V1b composite — a continuous two-octave chromatic scale
— slurred per beat (bowing; the source's slurs are 5-note desk groups whose seam notes coincide).
245–252 is V1a verbatim, rests kept, with the bass note as a short low 8th on the three block
downbeats where V1a rests and the tuba/trombone dot falls. Dynamics are V1a's; there is no
crescendo into [G] (253 mf belongs to Episode 10). Engraving: 237.1 is a rolled chord
(`\arpeggio` optional), 1st position, fingers 2–4–1; the bass dots take only the staccato, no
separate dynamic. Register: 247–248 lies on the E♭ string (d♯‴ is its octave harmonic; the rest
stopped) — p, at the tip. The leaps `ais→dis'''` (247) and `aes→c'''` (251) have the 8th rest
to shift in.

```
\barNumberCheck #237
% 237.1 = Ep 8 statement 4's resolution (V2 fis''2.~ + Va fis'2.~, p) over the tutti B cadence
% (Hp <fis b>/<b,, b,>, Tb1/Tp1/Hb1 dis', Tb2/Cb b): rolled <fis' dis'' fis''>, truncated to a
% quarter so the hand is free for the run. 237.2-245.1: V1a + V1b are one continuous chromatic
% scale b-b''-b handed between desks every beat (each 5-note slur's last 16th is the other desk's
% first) -> single line, slurred per beat. Dropped: V1a's first four 16ths b bis cis' d' (under
% the stamp). Not carried: Hb1/Hb2 dis'/b pedal 237-245, Bn1 fis/g/fis/gis, the Vc/Cb/Tb/Va/V2
% staccato bass figure (B 237 / G 239 / B 241 / G-sharp 243). Dynamics = V1a: p, cresc 241, f
% 243, dim 244.
<fis' dis'' fis''>4\p\arpeggio dis'16( e' eis' fis') g'( gis' a' ais')   | % 237
b'16( bis' cis'' d'') dis''( e'' eis'' fis'') g''( gis'' a'' ais'')      | % 238
b''16( ais'' a'' gis'') g''( fis'' f'' e'') dis''( d'' cis'' c'')        | % 239
b'16( ais' a' gis') g'( fis' f' e') dis'( d' cis' c')                    | % 240
b16(\< bis cis' d') dis'( e' eis' fis') g'( gis' a' ais')                | % 241
b'16( bis' cis'' d'') dis''( e'' eis'' fis'') g''( gis'' a'' ais'')\!    | % 242
b''16(\f ais'' a'' gis'') g''( fis'' f'' e'') dis''( d'' cis'' c'')      | % 243
b'16(\> ais' a' gis') g'( fis' f' e') dis'( d' cis' c')\!                | % 244
% 245-252: Theme 1's head in D-sharp minor tossed strings -> winds in canon at the bar (V1a + V2
% 8vb lead; Hb1/Cl1 246, Fl/Pic/Bn1 248, Hb/Cl 250, Fl/Bn1 252 echo one bar later) over a
% chromatic bass B, A-sharp, A, A-flat (-> G 253) in repeated 8ths, Va <fis dis'> motor, pp
% Tba/Tb3/GC dots on the block downbeats. Carried: V1a verbatim (own register toss dis'' ->
% dis''' -> dis'' -> c''') + the bass on the three downbeats where V1a rests (247.1 Tba/Tb3/Vc
% ais, 249.1 a, 251.1 aes); V1a's own 245.1 b and 253.1 g frame that line. Not carried: the wind
% echo, V2's lower octave, the Va motor. p throughout (source has no cresc; 253 is mf).
b8-.\p r8 dis''8-. fis''8-. dis''8-. eis''8-.                            | % 245  b = bass B
fis''8-. r8 eis''8-. r8 dis''8-. r8                                      | % 246
ais8-. r8 dis'''8-. fis'''8-. dis'''8-. eis'''8-.                        | % 247  ais = Tba/Tb3/Vc
fis'''8-. r8 eis'''8-. r8 dis'''8-. r8                                   | % 248
a8-. r8 dis''8-. fis''8-. dis''8-. eis''8-.                              | % 249  a = bass (open A)
fis''8-. r8 eis''8-. r8 dis''8-. r8                                      | % 250
aes8-. r8 c'''8-. ees'''8-. c'''8-. d'''8-.                              | % 251  aes = bass
ees'''8-. r8 d'''8-. r8 c'''8-. r8                                       | % 252  -> 253.1 g8 mf [G]
\barNumberCheck #253
```

### Episode 10 — bars 253–272 [G] (absolute pitch; entered 2026-10-27, record of the file)

Concept: **the theme is the whirl's bass.** V1a alone carries the whirl; wherever the brass states
Theme 2's head (Tb1 at C 253.3–257.1, Tp 1/2 at A 257.3–261.1 taken 8vb, Bn/Tb at B♭
261.3–265.1) its note replaces the whirl's lowest note on beats 1 and 3, the upbeats 257.3/261.3
riding the held bass as double-stops; 263–264 the theme rides beat 3 *above* the bass (3rd
position for the `c'''` peak). 265–272 f: the strings'/Tb1's accented `cis'` as the bottom note
of every E♭ bar — the German sixth spelled out. Positions 1st → 2nd (261) → 3rd (263) → 4th
(265–272). Dynamics V1a's: mf 253, cresc 262, f 265. Full voice-by-voice reasoning is in the
file's comments.

```
\barNumberCheck #253
\tuplet 3/2 4 { g8(\mf ees'8 c''8) g''8( c''8 ees'8 } g4->                    | % 253 Tb1 upbeat g
\omit TupletNumber
\tuplet 3/2 4 { c'8-> ees'8 c''8) g''8( c''8 ees'8 } c'4->                    | % 254 Tb1 c' ten.
\tuplet 3/2 4 { b8 e'8 c''8) g''8( c''8 e'8 } b4->                            | % 255 Tb1 b
\tuplet 3/2 4 { bes8 e'8 c''8) g''8( c''8 e'8 } bes4->                        | % 256 Tb1 bes
\tuplet 3/2 4 { a8-> f'8 c''8) a''8( c''8 f'8 } <a f'>4->                     | % 257 Tb1 a; Tp f'
\tuplet 3/2 4 { a8-> f'8 c''8) a''8( c''8 f'8 } a4->                          | % 258 Tp a' 8vb ten.
\tuplet 3/2 4 { gis8 e'8 cis''8) a''8( cis''8 e'8 } gis4->                    | % 259 Tp gis' 8vb
\tuplet 3/2 4 { g8 e'8 cis''8) a''8( cis''8 e'8 } g4->                        | % 260 Tp g' 8vb
\tuplet 3/2 4 { bes8-> f'8 d''8) bes''8( d''8 f'8 } <bes f'>4->               | % 261 Tp f'; Bn/Tb f
\tuplet 3/2 4 { bes8->\< f'8 d''8) bes''8( d''8 f'8 } bes4->                  | % 262 Bn/Tb bes
\tuplet 3/2 4 { c'8-> g'8 e''8) c'''8( e''8 g'8 } <c' a'>4->                  | % 263 Bn/Tb a above
\tuplet 3/2 4 { c'8 g'8 ees''!8) c'''8( ees''8 g'8 } <c' g'>4->\!             | % 264 Bn/Tb g above
\tuplet 3/2 4 { d'8->\f a'8 fis''8) d'''8( fis''8 a'8 } d'4->                 | % 265 Tb1 d'->(
\tuplet 3/2 4 { cis'8-> bes'8 g''8) ees'''8( g''8 bes'8 } ees'4->             | % 266 cis' = Gr6
\tuplet 3/2 4 { d'8-> a'8 fis''8) d'''8( fis''8 a'8 } d'4->                   | % 267
\tuplet 3/2 4 { cis'8-> bes'8 g''8) ees'''8( g''8 bes'8 } ees'4->             | % 268
\tuplet 3/2 4 { d'8-> a'8 fis''8) d'''8( fis''8 a'8 } d'4->                   | % 269
\tuplet 3/2 4 { cis'8-> bes'8 g''8) ees'''8( g''8 bes'8 } ees'4->             | % 270
\tuplet 3/2 4 { cis'8-> bes'8 g''8) ees'''8( g''8 bes'8 } ees'4->             | % 271
\tuplet 3/2 4 { cis'8-> bes'8 g''8) ees'''8( g''8 bes'8 } ees'4->)            | % 272 -> [H] 273
\undo \omit TupletNumber
\barNumberCheck #273
```

### Episode 11 — bars 273–308 [H] (absolute pitch; decided + entered 2026-10-27)

Four lifts (see NOTES Episode 11 for the reasoning and the user's calls). Marcato forced above
the chords (`^\marcato`; Le Concert's `\rtoe`). Chord hands, all 1st position: Gr6 = 4ext–3–1–0
(rolled, sustain on the upper pair); B°7 and A°7 are one shape, 2–1–3–3(barre), a tone apart;
B♭ = 2(barre)–3–4. Octaves 281–288 on D–A, positions 4→3→2→½→1. Runs slurred per bar; `a'2:8`
is the timpani's measured 8ths on the open A. 309.1 (the second run's goal) is Episode 12's.

```
\barNumberCheck #273
<cis' g' bes' ees''>2^\marcato\f <cis' g' bes' ees''>4^\marcato  | % 273 winds: Gr6
<d' a' fis''>2^\marcato <d' a' fis''>4^\marcato                  | % 274 strings: D
<cis' g' bes' ees''>2^\marcato <cis' g' bes' ees''>4^\marcato    | % 275
<d' a' fis''>2^\marcato <d' a' fis''>4^\marcato                  | % 276
<b f' d'' aes''>2^\marcato <b f' d'' aes''>4^\marcato            | % 277 winds: B dim7
<c' g' e''>2^\marcato <c' g' e''>4^\marcato                      | % 278 strings: C
<a ees' c'' ges''>2^\marcato <a ees' c'' ges''>4^\marcato        | % 279 winds: A dim7
<bes f' d'' bes''>2^\marcato <bes f' d'' bes''>4^\marcato        | % 280 strings: B-flat
<a' a''>2\> <a' a''>4                                            | % 281 Fl1/Pic/Hb1 + Hb2 8vb
<g' g''>2 <g' g''>4                                              | % 282
<f' f''>2 <f' f''>4                                              | % 283
<ees' ees''>2 <ees' ees''>4                                      | % 284
<d' d''>2 <d' d''>4                                              | % 285
<ees' ees''>2 <ees' ees''>4\!                                    | % 286
<d' d''>2\p <d' d''>4                                            | % 287
<ees' ees''>2 <ees' ees''>4                                      | % 288
<c' d'>2 <c' d'>4                                                | % 289 V1a + bass 8va (wedge)
<bes ees'>2 <bes ees'>4                                          | % 290
<a f'>2 <a f'>4                                                  | % 291
<g g'>2 <g g'>4                                                  | % 292
<d' fis' a'>4 a'2:8                                              | % 293 D vamp + Ti a
<d' fis' a'>4 a'2:8                                              | % 294
<d' fis' a'>4 a'2:8                                              | % 295
<d' fis' a'>4 a'4 d'4                                            | % 296 Ti d a, d
g''8->( fis''8 f''8 e''8 ees''8 d''8)                             | % 297 Fl1 ->
cis''8( c''8 b'8 bes'8 a'8 aes'8)                                | % 298
g'8( fis'8 f'8 e'8 ees'8 d'8)                                    | % 299 -> Cl1
cis'8( c'8 b8 bes8 a8 g8)                                        | % 300
d'8-. r8 a'2:8                                                   | % 301 V1a d' (Cl1's fis unplayable)
<d' a' fis''>4\< a'2:8                                           | % 302
<d' a' fis''>4 a'2:8                                             | % 303
<d' a' fis''>4 a'4 d'4\!                                         | % 304
g'''8->(\p fis'''8 f'''8 e'''8 ees'''8 d'''8)                     | % 305 Fl1 8va
cis'''8( c'''8 b''8 bes''8 a''8 aes''8)                          | % 306
g''8( fis''8 f''8 e''8 ees''8 d''8)                              | % 307
cis''8( c''8 b'8 bes'8 a'8 g'8)                                  | % 308 -> 309.1 (Ep 12)
\barNumberCheck #309
```

### Episode 12 — bars 309–337 [I] (absolute pitch; decided + entered 2026-10-27)

Concept: **the orchestra layered over the solo's notes, never in place of them.** See NOTES
Episode 12 for the reasoning and the user's calls. All 1st position: stamp double-stops 4–3 /
3–4 / 2–1 on G–D; pizz chords 4–3–1–0 (the Ep 11 Gr6 hand), 4–2–0, 2–3–4. Each three-chord
pizz group carries one `pizz.` and the solo's re-entry one `arco` (a short passage, as 203–205).
The 337 tie into 338 was deferred to Episode 13's entry and restored there (337.3 below is the
2026-10-27 revision: held d' with the line's ees' as a chord upper note).

```
\barNumberCheck #309
fis'4 r4 <d' a'>4-.\f                                                        | % 309 Fl1 goal; summons
<a' ees''>8\open <a' ees''>8\open <a' ees''>4\open <d' a'>4-.                | % 310
<a' ees''>8\open <d' a'>8 <a' ees''>8\open <d' a'>8 <a' ees''>8\open <d' a'>8 | % 311
<a' ees''>4\open <d' a'>4-. <d' a' fis''>4\p^"pizz."                         | % 312 strings' D
<des' g' bes' ees''>4 <des' g' bes' ees''>4 <des' g'>4-.\f^"arco"            | % 313 E-flat 7 x2; stamp
<des' g'>8-. <des' g'>8-. <des' g'>4-. <des' g'>4-.                          | % 314 solo des' + Cl1 g'
<des' g'>8 <des' g'>8 <des' g'>8 <des' g'>8 <des' g'>8 <des' g'>8            | % 315
<des' g'>4-. <des' g'>4-. <des' g' bes' ees''>4\p^"pizz."                    | % 316
<aes' c'' ees''>4 <aes' c'' ees''>4 <c' aes'>4-.\f^"arco"                    | % 317 A-flat x2; stamp
<c' aes'>8-> <c' aes'>8 <c' aes'>4-. <aes' c'' ees''>4\p^"pizz."             | % 318 solo c' + Cl1 aes'
<bes g' e''>4 <bes g' e''>4 <bes e'>4-.\f^"arco"                             | % 319 C-sharp dim7 x2; stamp
<bes e'>8-> <bes e'>8 <bes e'>4-. g4-.\p                                     | % 320 solo bes + Cl2 e'; tutti G
d'4-. d'8-.\pp fis'8-. d'8-. e'8-.                                           | % 321 tutti D; V1a cell 1
fis'4-. e'4-. d'4-.                                                          | % 322
f'!4-. e'4-.
  d''4-\tweak self-alignment-X #CENTER -\markup{\dynamic "(f)"}^\markup\italic "espress." | % 323
f''!4( e''4 d''4)                                                            | % 324 VSolo Theme 2
e''2.(                                                                       | % 325
a'2.)                                                                        | % 326
ees'!4-.\pp d'4-. c''4\>                                                     | % 327 V1a tail; solo c''
ees''4( d''4 c''4)                                                           | % 328
d''2.(                                                                       | % 329
g'2.)\!                                                                      | % 330
d'4-.\pp c'4-. <bes g'>4\p                                                   | % 331 V1a tail; solo g' + bes
bes'4( a'4 g'4)                                                              | % 332
a'2(\< e'4)\!                                                                | % 333
g'2.(                                                                        | % 334
f'2.                                                                         | % 335
ees'2.)\>                                                                    | % 336
d'2\!~ <d'~ ees'>4(\pp                                                       | % 337 -> 338 (Ep 13)
\barNumberCheck #338
```

### Episode 13 — bars 338–361 (absolute pitch; decided + entered 2026-10-27)

Concept: **the strings' one long phrase, kept whole to the end of 353; the winds' figure waits
until the strings take it (354).** See NOTES Episode 13. The solo's d' (G string, 4th finger) is
held under the line through 339.1; from 339.2 the violin is alone. Octaves (D–A pair, positions
4 → 3) from 350 as the phrase swells. 358.1 the tutti hit as a quarter chord `<d' a' ees'''>-!`
under the run (second voice), per user review.

```
<d'~ e'>2\< <d'~ f'>4)\!                                                     | % 338
d'4\> aes'4( g'4)\!                                                          | % 339
fis'2( g'4                                                                   | % 340
a'2\< bes'4)\!                                                               | % 341
d''4(\> des''4 c''4)\!                                                       | % 342
b'2( c''4)                                                                   | % 343
ees''2->( d''4)                                                              | % 344
f''2->( ees''4)                                                              | % 345
a''4->(\p aes''4 g''4)                                                       | % 346 peak
fis''2( g''4)                                                                | % 347
a''4->(\< aes''4 g''4)                                                       | % 348
fis''2( g''4)                                                                | % 349
<a' a''>4->( <aes' aes''>4 <g' g''>4)                                        | % 350 octaves
<fis' fis''>2( <g' g''>4)                                                    | % 351
<fis' fis''>2( <g' g''>4)                                                    | % 352
<fis' fis''>2( <g' g''>4)\!                                                  | % 353
ees'''8->(\f\< c'''8 ees'''8 d'''8 c'''8 bes''8)                             | % 354 the figure
ees'''8->( c'''8 ees'''8 d'''8 c'''8 bes''8)                                 | % 355
ees'''8->( c'''8 ees'''8 d'''8 c'''8 bes''8)                                 | % 356
ees'''8->( c'''8 ees'''8 d'''8 c'''8 bes''8)                                 | % 357
<<
  { ees'''8\ff_\markup \italic "non legato" c'''8 ees'''8 d'''8 c'''8 a''8 }
  \\
  { <d' a'>4-! s2 }
>>                                                                           | % 358 tutti hit + V1a's descent
c'''8 bes''8 a''8 fis''8 a''8 g''8                                           | % 359
fis''8 c''8 ees''8 d''8 c''8 a'8                                             | % 360
c''8 bes'8 a'8 fis'8 a'8 g'8                                                 | % 361 -> 362 fis' (Ep 14)
\barNumberCheck #362
```

### Episode 14 — bars 362–393 [K] (absolute pitch; decided + entered 2026-10-27)

Concept: **V1a's own part is the spine; the tutti's frame is folded into its rests and
downbeats.** See NOTES Episode 14. Brass D7 stabs `<c' fis' a'>8-.` on the cell's downbeat
8ths; the winds' rise from the open D in the flutes' octave, landing on V1a's `<g d' bes' g''>`
(user); Theme 1 ff at g″ plain with odd-bar chords, then in sixths/octaves over bes′ (user); tails
at V1a's d‴–a‴ (user) dropping to the open A for the bass rise; the strings-alone vamp bare,
then octaves and the four-string D7 stab into [L] (user). The record of the file.

```
<c' fis' a'>8-. c'8( ees'8\sf d'8 c'8 a8)                                    | % 362
<c' fis' a'>8-. c'8( ees'8\sf d'8 c'8 a8)                                    | % 363
<c' fis' a'>8-. c'8( ees'8\sf d'8 c'8 a8)                                    | % 364
<c' fis' a'>8-. c'8( ees'8\sf d'8 c'8 a8)                                    | % 365
<c' fis' a'>8-. d'8(\f ees'8 e'8 f'8 fis'8)                                  | % 366 the rise
g'8( gis'8 a'8 bes'8 b'8 c''8)                                               | % 367
cis''8(\< d''8 ees''8 e''8 fis''8 g''8)                                      | % 368
a''8( bes''8 c'''8 d'''8 e'''8 fis'''8)                                      | % 369 4th -> 6th pos.
<g d' bes' g''>4\ff g''8 bes''8 g''8 a''8                                    | % 370 Theme 1
<g d' bes' bes''>4 a''8 bes''8 g''8 bes''8                                   | % 371
a''8( g''8) g''8 bes''8 g''8 a''8                                            | % 372
<g d' bes' bes''>4 a''8 bes''8 g''8 bes''8                                   | % 373
a''8( g''8) g''8 bes''8 g''8 a''8                                            | % 374
<g d' bes' bes''>4 a''8 bes''8 g''8 bes''8                                   | % 375
d'''4 e'''8 fis'''8 d'''8 fis'''8                                            | % 376
a'''4-! a8_\markup \italic "non legato" ais8 b8 cis'8                        | % 377
<d' a' fis''>4-! <bes' g''>8 <bes' bes''>8 <bes' g''>8 a''8                  | % 378 2nd statement
<g d' bes' bes''>4 a''8 <bes' bes''>8 <bes' g''>8 <bes' bes''>8              | % 379
a''8( g''8) <bes' g''>8 <bes' bes''>8 <bes' g''>8 a''8                       | % 380
<g d' bes' bes''>4 a''8 <bes' bes''>8 <bes' g''>8 <bes' bes''>8              | % 381
a''8( g''8) <bes' g''>8 <bes' bes''>8 <bes' g''>8 a''8                       | % 382
<g d' bes' bes''>4 a''8 <bes' bes''>8 <bes' g''>8 <bes' bes''>8              | % 383
\tuplet 3/2 { fis'''4.:8 } \tuplet 3/2 { d'''4.:8 } \tuplet 3/2 { fis'''4.:8 } | % 384
\tuplet 3/2 { a'''4.:8 } a8 ais8 b8 cis'8                                    | % 385
<d' a' fis''>4 d'8 d'8 d'8 d'8                                               | % 386 D; vamp
cis'4 d'2:8                                                                  | % 387
cis'4 d'2:8                                                                  | % 388
cis'4 d'2:8                                                                  | % 389
cis'4 <d' d''>2:8                                                            | % 390 winds on the 8ths
<c' fis' a' fis''>4\ff <d' d''>2:8                                           | % 391 D7
<c' fis' a' fis''>4 <d' d''>2:8                                              | % 392
<c' fis' a' fis''>4 <d' d''>2:8                                              | % 393 -> 394 [L]
\barNumberCheck #394
```

### Episode 15 — bars 394–415 [L] (absolute pitch; decided + entered 2026-10-28)

Concept: **V1a's line verbatim — it is the only line** (V1a/V2 unison, solo tacet, the
accompaniment a waltz frame on beats 1–2). See NOTES Episode 15. The two tutti stamps as chords
in V1a's hand (394.1 over the B♭ bass, 402.1 root-position G, V1a's rest kept — user); the
orchestra's repeat identical; **415 an octave above V1a (user)** — stopped to `fis''''`, with
the artificial-harmonic fallback noted in the file. The record of the file.

```
<bes d' bes' g''>4-! d'8 g'8 bes'8 d''8                                      | % 394 tutti -! over bes
g''8( bes''8) \acciaccatura bes''8 a''8( gis''8) \acciaccatura a''8 gis''8( g''8) | % 395
\acciaccatura aes''8 g''8( fis''8) \acciaccatura g''8 fis''8( f''8)
  \acciaccatura ges''8 f''8( e''8)                                           | % 396
\acciaccatura f''8 e''8( ees''8\open) \acciaccatura e''8 ees''8\open( d''8)
  \acciaccatura ees''8\open d''8( cis''8)                                    | % 397
\acciaccatura d''8 cis''8( c''8) \acciaccatura des''8 c''8( b'8)
  \acciaccatura c''8 b'8( bes'8)                                             | % 398
aes'8 g'8 aes'8 c''8 bes'8 aes'8                                             | % 399
g'8 fis'8 g'8 bes'8 a'!8 g'8                                                 | % 400
fis'8 a'8 d''8 fis''8 a''8 d'''8                                             | % 401
<g d' bes' bes''>8-! r8 d'8 g'8 bes'8 d''8                                   | % 402 tutti hammer
g''8( bes''8) \acciaccatura bes''8 a''8( aes''8) \acciaccatura a''8 aes''8( g''8) | % 403
\acciaccatura aes''8 g''8( fis''8) \acciaccatura g''8 fis''8( f''8)
  \acciaccatura ges''8 f''8( e''8)                                           | % 404
\acciaccatura f''8 e''8( ees''8\open) \acciaccatura e''8 ees''8\open( d''8)
  \acciaccatura ees''8\open d''8( cis''8)                                    | % 405
\acciaccatura d''8 cis''8( c''8) \acciaccatura des''8 c''8( b'8)
  \acciaccatura c''8 b'8( bes'8)                                             | % 406
aes'8 g'8 aes'8 c''8 bes'8 aes'8                                             | % 407
g'8 fis'8 g'8 bes'8 a'!8 g'8                                                 | % 408
fis'8\ff a'8 d''8 fis''8 a''8 d'''8                                          | % 409 poco stringendo
bes''8 g''8 d''8 bes'8 g'8 d'8                                               | % 410
fis'8 a'8 d''8 fis''8 a''8 d'''8                                             | % 411
bes''8 g''8 d''8 bes'8 g'8 d'8                                               | % 412
fis'8 a'8 d''8 fis''8 a''8 d'''8                                             | % 413
d'8 fis'8 a'8 d''8 fis''8 a''8                                               | % 414
a''8 d'''8 fis'''8 a'''8 d''''8 fis''''8                                     | % 415 8va (user) -> 416
\barNumberCheck #416
```

### Episode 16 — bars 416–437 "Animato" [M] (absolute pitch; decided + entered 2026-10-28)

Concept: **V1a's line is the only moving line; it is the spine — and this is the climax, so the
virtuosic licence goes on register (user): 416–425 an octave above V1a, down to V1a's own open G
only at 426.** See NOTES Episode 16. `g''''` (416) is the piece's top, stopped at the E♭ string's
end (artificial-harmonic fallback in the file header); 421–423 the orchestra's three-octave
descent as violin octaves on the A–E♭ pair (6-semitone 1–4; narrower than a 1st-position 1–4 at
10–16, widest at the last `<c'' c'''>`); the 421.1 crash `<g d' g'' g'''>-!` rolls the open G/D
under the octave. **426–437 revised 2026-10-28 (user): V1a's figure as the single line, with the
flute/piccolo's stamp as a quarter note on beat 2 above it — `g'4` / `fis'4` alternating at
426–429, `g'4` throughout [M] to the double bar (two voices: stamp up, line down).** The earlier
beat-1 double-stops, [M] three-string stamps and fff beat chords are dropped — the energy goes
into the single line of the final stringendo run. Ledger lines kept (no `\ottava` in the score —
user). The record of the file (the 426–437 lines below are the 2026-10-28 text).

```
g''''4-!\ff f''''!4 ees''''4                                                 | % 416 Animato, tutti crash
f''''4 ees''''4 d''''4                                                       | % 417
ees''''4 d''''4 c''''4                                                       | % 418
aes'''8 c''''8 aes'''8 bes'''8 c''''4                                        | % 419 head on Ab (Ab/C)
fis'''8 a'''!8 fis'''8 g'''8 a'''4                                           | % 420 head on F# (D)
<g d' g'' g'''>4-! <f''! f'''!>4 <ees'' ees'''>4                             | % 421 crash; octaves
<f'' f'''>4 <ees'' ees'''>4 <d'' d'''>4                                      | % 422
<ees'' ees'''>4 <d'' d'''>4 <c'' c'''>4                                      | % 423
aes''8 c'''8 aes''8 bes''8 c'''4                                             | % 424
fis''8 a''!8 fis''8 g''8 a''4                                                | % 425 -> the drop
<< { s4 g'4 s4 } \\ { g8 bes8 g8 a8 bes4 } >>                                | % 426
<< { s4 fis'4 s4 } \\ { c'8 b8 bes8 a8 aes4 } >>                             | % 427
<< { s4 g'4 s4 } \\ { g8 bes8 g8 a8 bes4 } >>                                | % 428
<< { s4 fis'4 s4 } \\ { c'8 b8 bes8 a8 aes4 } >>                             | % 429
<< { s4 g'4 s4 } \\ { g8 bes8 g8 a8 bes4 } >>                                | % 430 [M]
<< { s4 g'4 s4 } \\ { g8 bes8 g8 a8 bes4 } >>                                | % 431
<< { s4 g'4 s4 } \\ { g8 bes8 g8 a8 bes4 } >>                                | % 432
<< { s4 g'4 s4 } \\ { g8\fff bes8 g8 a8 bes8 g8 } >>                         | % 433
<< { s4 g'4 s4 } \\ { a8 bes8 g8 a8 bes8 g8 } >>                             | % 434
<< { s4 g'4 s4 } \\ { a8 bes8 g8 a8 bes8 g8 } >>                             | % 435
<< { s4 g'4 s4 } \\ { a8 bes8 g8 a8 bes8 g8 } >>                             | % 436
<< { s4 g'4 s4 } \\ { a8 bes8 g8 a8 bes8 g8 } >>                             | % 437 -> 438 Tempo 1
\barNumberCheck #438
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

## Build-session findings (2026-10-23) — for @architect/user review

- **LilyPond 2.24.3 engraving bug, found and worked around.** Two chord-tone `\tweak font-size`
  notes (the ad-lib LH-pizz clicks) a few bars apart, the second one under a slurred ornament
  (`\prall`/`\trill`), trip `programming error: cyclic dependency: calculation-in-progress
  encountered for Slur.control-points` — reproducible in isolation (bisected to ~15 minimal
  `.ly` files) and apparently dependent on which system the ornamented note's line-break lands
  on, not on anything wrong with the notation itself. `\override Script.avoid-slur = #'inside`
  (set once, at the top of the `"melody"` Voice in `danse-macabre-solo.ly`) sidesteps the
  recursive branch with no visible change to the small scripts. CAPTURE-CANDIDATE: if LilyPond
  ever reports a cyclic-dependency crash on `Slur.control-points`, suspect a Script/ornament
  interaction near a system break before suspecting the note data.
- **Ad-lib engraving judgment calls beyond the literal per-bar comment markers**, each decided
  from the surrounding NOTES/header text rather than an explicit bar-by-bar tag: Episode 3 bar
  62 (the decision log's "58–62" is five bars, symmetric with "50–54", but only 58–61 had inline
  tags — included 62); Episode 4 bars 66–68/73–76 (the header says "ad-lib LH-pizz open D on the
  downbeats" of 65–68/73–76, but 65/73's downbeat is already the open D itself — added the click
  only where it adds a new pitch); Episode 6 bar 166.1 (listed in the header as an ad-lib G site,
  but the written note there is already `<g g'>`, an octave on the open G — no separate click
  added, since there is nothing to add). Flagged per-episode in the headers; worth an
  @architect/user check since they go beyond mechanical transcription of an explicit list.
- **Staff naming mismatch, resolved by using the actual name.** PLAN's original engraving note
  for the Episode 7 ossia says the main staff is named `"solo"`; the actual score names it
  `"Violon solo"` (with the instrument-name markup). Used `alignBelowContext = "Violon solo"` to
  match the real context id.

## Handoff to @build (when triggered)

Inputs: this file, `NOTES.md`, the decided episode drafts (LilyPond text in NOTES or session
transcript). Tasks: steps 1–2 of the pipeline, then enter decided episodes. Constraints: sounding
absolute pitch, bar checks, no edits under `source/`, 100-char lines, comments cite the source
voice and bars for every lifted passage (e.g. `% Fl1 33.2–41.1`).
