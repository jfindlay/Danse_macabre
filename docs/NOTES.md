# Danse macabre for unaccompanied violin — NOTES

Rolling-context notes: premises, conventions, structural map, decisions, and captured findings.
`PLAN.md` holds the build layout and the episode ledger.

## Premise and task hierarchy

Saint-Saëns, *Danse macabre* op. 40 (1874), arranged for unaccompanied violin in the original
scordatura (G–D–A–E♭). The **full orchestral score is the primary source**; the composer's own
violin/piano reduction (Durand 1877) is a secondary consult only.

Task hierarchy, applied bar by bar:

1. **Preserve** — every note of the *orchestral* solo-violin part is immutable (not the reduction's
   violin line, which is a duo part that already absorbs orchestral material).
2. **Lift** — where the solo rests, transfer the prevailing orchestral melody.
3. **Fill** — only then add harmony or counter-material, in a named idiom chosen per episode.

The solo plays ~130 of 477 bars, so step 2 dominates the work; step 3 is confined to the passages
with no liftable melody (notably [D] 173–204).

**Fidelity rule (decided 2026-10-18):** the arrangement keeps the original meter, bar count, and bar
allocation exactly — 477 bars of 3/4, rehearsal marks A–N at the source bar numbers. No cuts, no
inserted bars, no free-rhythm insertions that alter the count.

## Sources

| Path | What | Provenance |
|---|---|---|
| `source/IMSLP272914-…-full-score.pdf` | Full score, 51 pp. | Le Concert ed. 166 (2009), LilyPond-engraved, CC BY-NC-SA 3.0 |
| `source/IMSLP33277-…-violin-piano-reduction.pdf` | Composer's reduction | Durand 1877 (secondary) |
| `source/lilypond/` | **LilyPond source of the Le Concert score** | Wayback capture 2015-09-22 of `le-concert.pagesperso-orange.fr/st-saens/166-stsaens-dansemacabre-00-lys.zip`; v2.16.0 |

LilyPond source layout: one `Mus/166-NN-<Inst>.ily` per voice (31 files), each a single
`\relative` expression spanning all 477 bars; `166-StSaens-DanseMacabre-Trame.ily` is the
bar/mark/key skeleton; `-Global.ily` has the scordatura markup. `Mus/166-25b-Chant.ily` is a
byte-identical copy of the solo part (ignore). Bar numbers everywhere in this project are **Le
Concert bar numbers**; Durand may differ by a bar.

Transposing voices (confirmed 2026-10-18 from the per-instrument `.ly` headers; the `Mus/` files
carry no `\transposition`): Cl 1/2 **in B♭** (sound M2 down), Cor 1/2 in G (P4 down), Cor 3/4 in
D (m7 down), Tp 1/2 in D (M2 up). `V1b`/`Vc-b` are silent spacer desks except where the section
is divisi. The xylophone is dumped at written pitch (conventionally sounds 8va–15ma; irrelevant
here since the violin chooses its own octave).

**Absolute-pitch dump (pipeline step 0, done 2026-10-18).** All 34 `Mus/` voices dumped via
`\displayLilyMusic` into `/tmp/opencode/dm-dump/abs/<Voice>.abs.ly`, with `slice.py` (bar-range
slicer, validated at 477 bars / 1431 quarters for every voice against LilyPond's own
`ly:music-length`) and `build_dump.py` (regenerates). **`/tmp` is ephemeral — @build must copy
`abs/`, `slice.py`, `build_dump.py`, `wrap/global-stub.ily` into `arrangement/dump/` first.**
Usage: `python3 slice.py abs <Voice> <bar1> <bar2> [--transpose PRESET]`.

**Licence note.** The engraving code is CC BY-NC-SA 3.0; the music is public domain. Building the
arrangement by literally splicing Le Concert's `.ily` text makes the arrangement file a derivative
of the engraving (fine for non-commercial use with attribution). A clean re-entry of the notes
would be unencumbered. Decide before any commercial use; not a constraint now.

## Conventions (decided)

- **Sounding pitch** throughout, as in the source. Open E♭-string notes carry the `\open` circle;
  natural harmonics carry `\flageolet` with a touch-point note. The "Accord du violon" scordatura
  header (`\scordatura` markup in `-Global.ily`) is reused.
- Episode files and drafts are at **absolute pitch** (`\absolute`), the same convention as the
  dump, so every lift is a copy-paste with no octave shift (decided 2026-10-18, superseding
  `\fixed c'`). Reason: the Episode 6 draft was pasted from the dump into a `\fixed c'` heading
  and silently sounded an octave high; the only safe convention is the source's own. The
  Episode 5 draft remains `\fixed c'` and is converted by `@build` on entry. **The literal
  snippets in the Episode 1–4 decision logs below are also `\fixed c'`** (written before the
  switch; found 2026-10-20 after `@build` entered them as absolute — see PLAN "Review
  corrections"). The dump's Cl/Cor/Tp voices are written pitch; always slice them with
  `--transpose`.
- Every episode file ends with `\barNumberCheck` at its first bar and the next episode's first
  bar — the mechanical enforcement of the fidelity rule.
- Harp → pizz. is a **composer-sanctioned substitution**: the score itself marks the string parts
  "A défaut de Harpe — Pizz." at bar 33. Apply freely wherever harp material is lifted.

## Structural map (Le Concert bar numbers; marks from the Trame)

Marks: A 65 · B 117 · C 137 · D 173 · E 205 (B major) · F 237 · G 253 (G minor) · H 273 · I 309 ·
K 362 · L 394 · poco stringendo 409 · Animato 416 · M 430 · Tempo 1° 438 · N 467 · end 477.

| Bars | Solo violin | Prevailing orchestral material |
|---|---|---|
| 1–24 | tacet | harp d′ ×12 (1–12, f); horn 1 d′ pedal (1–16, p); ppp D-major shimmer (5–8, 13–16); vc+cb pizz D A C F♯ A C E♭ D (17–24) |
| 25–32 | tritone summons ⟨a′ e♭″⟩ open strings | — |
| 33–41 | tacet | f pizz G-minor chord on 33.1; **Theme 1 in flute 1 at g′** (33.2–41.1), harp/pizz chords on 2–3, vc pedal g (34–36) f (37–40) |
| 41–49 | tacet | Theme 1 repeated by Vln I at g″ (41.2–49.1) with trills; Vln II at g′; viola drone d′/b♭ (41–44) e♭′/c′ (45–48) |
| 49–64 | Theme 2 *largamente* f | strings pizz *meno p* (bass on 1, chords on 2–3) |
| 65–68 [A] | tacet | oboe/bassoon Theme 1 fragment, harp |
| 69–84 | Theme 1 *marcatissimo*; ff open-string chords 82–84 | 85–92: Vln I Theme 1 f over tutti |
| 93–101 | Theme 1 ff "2e corde" | tutti, harp ff |
| 102–116 | tacet | strings Theme 2 *largamente* |
| 117–136 [B] | Theme 1 in D major at d″ 117.2–121.1 and 125.2–129.1; ff open-string chords 133.2–136 | tutti D-major stamp on 117.1/125.1/133.1; wind choir + xylophone (enters 121.2) Theme 1 in G minor 121.2–125.1, 129.2–133.1; strings pizz chords (121–124) then col legno (129–132) |
| 137–172 [C] | tacet | **fugato on Theme 2's head**, five entries 7 bars apart (Bn/Vc/Va 137.3 · Hn3/4+V2 144.3 · Ob/Cl/V1 151.3 · Tp 158.3 · Tb 165.3), running staccato counter-lines; wind sweep g′→f‴ 166–172; all strings trill f′ at 172 |
| 173–204 [D] | tacet | **one 16-bar strain twice**: 173–188 E pedal, wind thirds p stacc on 1 & 3, string turn e–f–e as a round (Vc 1 / Va 2 / V2 3), cymbal on 2; 189–204 the same strain a 4th up over an A pedal in Vln I pizz + Tp/Tb, turn a–b♭–a, triangle on 2, timp roll, horn-call g♯→a, cresc 194 → f 204 → tutti B 205.1 |
| 205–236 [E] | lyrical Theme 2 in **B major** (205.3–214 G♮ variant, 221.3–230 G♯ variant) | **four elided 8-bar statements**: solo / Fl 1 b″ + Fl 2 & Hn 1 b′ *espress.* (213.3–222) / solo / V2 b″ + Va b′ *molto espress.* cresc → f 233 (229.3–237.1). Under: 4 solo cellos pp, harp `<b,, b,>` + arpeggio with **Cl 1 "A défaut de Harpe"** (206–), V1 inner voice d♯′→d♮′→d♯′ (213–221), Cb `<b, b>` pp, brass pedal pp 229–236. Bass is B throughout |
| 237–252 [F] | tacet | **one continuous two-octave chromatic scale** b→b″→b in 16ths (V1a/V1b desks hand off every beat), p 237, cresc 241, f 243, dim 244, over Hb d♯′/b pedal and a staccato bass figure B/G/B/G♯; 245–252 **Theme 1's head in D♯ minor** tossed strings→winds in canon at the bar (V1a + V2 8vb lead), bass descends B→A♯→A→A♭ in 8ths (→ G 253), Va `<fis dis'>` motor, pp Tba/Tb/GC dots on block downbeats; p throughout |
| 253–272 [G] | tacet | **the knot**: Vln I whirling 16ths against brass/wind Theme 2 *ten.* |
| 273–308 [H] | tacet | marcato tutti chords alternating with rests (273–282); dim.; strings p Theme 1 (290–296); wind chromatic runs + Vln I *legg.* + xylophone (297–308) |
| 309–337 [I] | tritone chords 309–312; low d♭/c/b♭ figure 313–320; Theme 2 *espress.* 324.3–337 | winds *Dies irae* parody (inferred, ~313–320); Vln I staccato answers |
| 338–361 | tacet | strings p line (338–349); wind Theme 1 ff sequences (350–358) |
| 362–393 [K] | tacet | Vln I/II *non legato* runs; tutti Theme 1 (371–389) |
| 394–415 [L] | tacet | Vln I/II grace-note ornamented figure (394–404); ascending figures; *poco stringendo* 409 |
| 416–437 | tacet | *Animato* ff tutti → [M] 430 fff repeated chords |
| 438–454 | tacet | *Tempo 1°*: horns (re-crooked in E♭ from 403) hold E♭ 438–445; oboe cock-crow 440–445; timp/GC roll + strings f→p 445–451; fermata 454 *très long* |
| 455–477 | *déclamé* f 455–466; [N] 467 tremolo d–e♭ fading to pp 473 | flute pp 472–474; pp wind chord 475–476; cb pizz |

## Decisions log

### Episode 1 — bars 1–24 "Midnight" (decided 2026-10-18)

Design "À défaut de harpe":

- Twelve strokes = **pizz open D (d′), f, laissez vibrer, one per bar, in tempo** (bars 1–12). The
  harp's d′, the horn's sounding d′ and the violin's open D are the same pitch; the horn pedal is
  absorbed by the ringing string.
- Shimmer (5–8, 13–16): stroke on beat 1, then **bowed natural harmonics ⟨f♯‴ a‴⟩ ppp on beats
  2–3** (touch f♯′ on D = 5th partial; touch d″ on A = 4th partial; both first position, fingers
  2 and 3). Ghost timbre, not voice.
- 17–24: cello/bass pizz line lifted **up one octave** (d′ a′ c′ f♯′ a c′ e♭′ d′), pp, all first
  position; d′ at 17 and 24 is the open D again.
- **The bow's first full stroke is the tritone at bar 25.** Dramaturgical rule for the whole
  piece: the violin's first *voiced* utterance is Death tuning up.

Rejected: the transcript's Biber-drone/Enescu-*doina* free-rhythm ornamentation. Reasons: the
twelve strokes are programme and must stay countable; the bareness is the composer's; a melodic
utterance before 25 spends the entrance. The Enescu idiom is reserved for the coda (455–477), which
is already a *doina* in Saint-Saëns's hand.

Known loss: no major third in the shimmer harmonics' fundamental beyond the pluck — accepted. The
F♯ harmonic exists only as the D string's 5th partial, so it cannot sound while the open D rings;
the stroke (beat 1) and shimmer (2–3) therefore alternate rather than overlap.

**Revision (decided 2026-10-23, user):** the harmonic shimmer is replaced by the strings' own
sustained notes, transferred directly. Dump: 5–8 V1 divisi d″/a′ over V2 f♯′/d′ ppp, tied four
bars; 13–16 V1 f♯″/d″ over V2 a′/f♯′ + Va d′, tied; horn d′ 1–16; harp's last stroke bar 12.
No B♭ exists anywhere in 1–24 (the user's first wording; corrected against the dump).

- **All twelve strokes are left-hand pizz** on the open D (`-+`, f, l.v.), bow in hand from bar
  1. This frees the bow to sustain through the toll and keeps the toll's timbre uniform.
- **5–8: a single tied `d''`** (V1's top note) ppp *sul tasto, senza vibrato* — 3rd finger on the
  A string while the 4th plucks the open D on each downbeat (standard LH-pizz geometry; keep the
  bow clear of the vibrating D string). **13–16: tied `<d'' fis''>`** — exactly V1a's divisi
  pair, 1st position, fingers 3–2. Not carried: V2's lower pair, the viola d′ (= the ringing open
  D anyway), the horn pedal.
- 18–24 unchanged (stopped notes → ordinary right-hand pizz; mark "pizz." at 18).
- The touch-point/diamond machinery for bars 5–8/13–16 is removed; the "ghost harmonics"
  colour is no longer used in Episode 1 (still available for later episodes).
- **"First bow at 25" rule reworded:** bars 5–16 are ppp flautando *colour*, not voice; the
  first *voiced* bow stroke is still the tritone at 25. The rule now rests on dynamics and
  bowing colour rather than on timbre class — weaker, accepted for the directness of the lift.

### Episode 2 — bars 25–48 "Summons and Theme 1" (decided 2026-10-18)

- 25–32 solo verbatim, except **32.3 becomes the strings' pizz D-major chord** `<d a fis'>` (contains
  the solo's own `<d a>`), followed by **33.1 = strings' pizz G-minor chord** `<g, d bes g'>`: two
  full pizz chords close the summons.
- 33.2–41.1: flute 1's Theme 1 lifted verbatim **at its own octave (g′)**, p, *sulla tastiera,
  imitando il flauto* (Paganini Caprice 9's device). No accompaniment.
- 41.2–49.1: Vln I's restatement at g″ **with its own trills/pralls**, pp, ord.
- Optional ornaments, engraved as small notes with an "ad lib." text: LH-pizz open G on the
  downbeats of 34–36 and 42–44 (bass G bars only); open-D drone under 42–44 (viola's d′). The
  drone is optional because the D is already fixed in the ear — implied tonality, Sonatas-and-
  Partitas style.
- Artificial-harmonic flute imitation rejected here; natural-harmonic "ghost" colour kept in
  reserve for a later episode.

### Episode 3 — bars 49–64 "Theme 2 largamente" (decided 2026-10-18)

- Bar 49 = `g'4-. r d\f` (Vln I's last note, then the solo's upbeat).
- 49.3–64 solo verbatim. Optional LH-pizz open G on the downbeats of 50–54 and 58–62 (cello bass
  G; melody on D/A strings). Nothing on 55–57 or 63–64 (bass A/D sits above or on the melody's
  string). No counter-voices.

### Episode 4 — bars 65–116 "Theme 1 exchanges" (decided 2026-10-18)

Orchestra: 65–68 and 73–76 Ob 1 (d″) + Bn 1 (d′) Theme-1 head **in D major**, p, harp D-major
chords, bass D; 69–72 and 77–84 solo f/ff over tutti (bass C); 85–92 Vln I Theme 1 f at g″ with
tutti downbeat chords (G minor 85–88, A♭/F 89–92); 93–100 solo ff "2e corde"; 101 strings' upbeat
d′ largamente; 102–116 **Theme 2 in all strings f largamente at g′** (note-for-note the solo's
49–64), Cb pedal G/A/D, wind off-beat stabs on beats 2–3 (Cl 102–106, Fl/Ob/Pic from 108).

Decisions:

1. 65–68, 73–76: lift the oboe line at its own octave (d″), p; ad-lib LH-pizz open D on downbeats.
   Bar 65 = `d4 d'8-.\p fis'-. d'-. e'-.`.
2. 69–84, 93–100: solo verbatim, nothing added (bass C is not an open string).
3. 85–92: Vln I's theme at g″ with the tutti chord on the quarter-note downbeats only (86, 88, 90,
   92); 85.1 full `<g, d bes g'>4\f`; 86/88 `<g, d bes bes'>`; 90/92 `<f' c''>` under the melody
   (bass F is below the violin — open fifth instead).
4. 101: `g'4-. r d\f^"largamente"`.
5. 102–116: Theme 2 verbatim at g′ with the wind stabs as **written (normal-size) double-stops**
   on beats 2–3 — this is what differentiates the tutti statement from the pizz meno-p first
   statement, and it is lifted, not invented. Mechanical rule for @build: the wind pitches nearest
   the melody that form a playable double-stop within the melody's hand position. Ad-lib LH-pizz
   open G on the G-bass downbeats (102–106, 110–114).

### Episode 5 — bars 117–136 "Fragments and bones" [B] (decided 2026-10-18)

Orchestra (from the dump): a strict four-bar antiphony. **Tutti D-major stamps** on 117.1, 125.1,
133.1 (harp `<d, d>` / `<d' fis' a' d''>` f, winds d/f♯, horn D-major pedal, timp d). Solo Theme 1
in D major at d″ (117.2–121.1, 125.2–129.1) over harp broken chords and string pizz a′/f♯′ on
beats 2–3, Cl/Bn/timp d p on every downbeat. **Wind choir Theme 1 in G minor** (Pic + Hb1 at g″,
Hb2/Cl at g′) **doubled by xylophone** (121.2–125.1, 129.2–133.1), f: strings **pizz**
`<ees' bes' g''>` on 2 / `<g ees' bes'>` on 3 in statement 1, the same chords **col legno** plus
Alto's downbeat chord in statement 2; Vc/Cb bass C; cymbal p in statement 2. Solo ff chords
133.2–136 with Hb/Tp sustaining a′/d′ inside and the xylophone doubling the solo's d′–a′ at
135–136; tutti stamp 136.3.

Decisions:

1. **Xylophone → col legno battuto.** Composer-sanctioned: the string section itself goes col
   legno under the xylophone's second statement (129–133); Berlioz *Fantastique* V is the
   programmatic ancestor. Theme lifted from **Hb1/Pic at g″** so the string chord stabs fall under
   it as adjacent-string battuto double-stops in one hand position: 121 `<bes g'>8 bes' <bes g'> a'`
   etc. (see draft in PLAN). Known loss: true f and some pitch clarity — accepted; fourth hearing
   of Theme 1 in forty bars, and the chord stabs carry the harmony.
2. **Stamps as pizz `<d a fis'>` f** at 117.1, 125.1, 133.1 — the Episode 2 D-major pizz chord.
   Pizz because at 125.1/133.1 the bow is in col-legno grip with one quarter to reach arco; the
   top f♯″ sits under the solo's d″ entry so the solo emerges from the tutti.
3. **Statement 2 thickens as the orchestra does:** Alto's `<g ees' bes'>` downbeat added as a
   battuto double-stop on 130–132 beat 1.
4. **136.3: small-note `fis'` ad lib** on the solo's final `<d a>` (= the tutti stamp's f♯ in
   Hb2/Cl2/Tb1). Normal-size chord stays the immutable `<d a>`.
5. LH-pizz open D on the downbeats of 118–120, 126–128 (harp/Cl/Bn/timp all sound D; D string
   free). Solo and chords 133.2–136 verbatim.

Corrections to the transcript/map: the ff chords begin **133.2** (not 134); the xylophone enters
**121.2** as a doubling of a full wind choir, not as the theme's carrier.

### Episode 6 — bars 137–172 "Fugato" [C] (decided 2026-10-18)

Orchestra (from the dump): 137.1 tutti stinger (V1 `<g d' bes' g''>4-!`), then a five-entry
fugato on Theme 2's head, entries exactly 7 bars apart alternating tonic/dominant: (1) 137.3
Bn 1/2 + Vc + Va (Va in `g8-> g8 g4 r` pairs), small octave, mf, no counter; (2) 144.3 Hn 3/4 +
V2 at a–d′, counter = Va/Vc *sempre stacc.* running line (small octave); (3) 151.3 Ob1 d″ +
Cl/V1 d′, counter = V2 (one-line octave) interlocking with Va/Vc fills, V2 cadential trill cis′
158–159; (4) 158.3 Tp 1/2 a′/a, counter = V1 rising sequence f′→c‴, Cb pizz; (5) 165.3 Tb 1/2
g′/g mf→cresc, counter = all winds unison sweep g′→f‴ (Ob drops 8va at 169 for range), strings
rejoin the subject's bars 5–6 in eighth pairs 170–171, every string trills f′ at 172 → [D].

Decisions:

1. **Surface-line principle for all-lift episodes:** one continuous line per phrase — the
   counter-line the ear follows — at the octave the orchestra's own register implies (entries
   1–3 first position, entry 4 V1 loco to c‴, entry 5 the flute's sweep to f‴).
2. **Entry-cue double-stops:** the subject's upbeat + first two bars at each entry as
   double-stops under/over the surface line, then the surface line alone with subject notes only
   where open or in hand. This is the Bach-Sonata-fugue allusion (BWV 1001/1003/1005), not a
   reproduced texture. `<d' f'>` / `<c' a'>` take the lower note on the G string (4th/3rd finger).
3. Entry 1 = Bn + Va composite (`g'8-> g'8 g'4 g'4`), lifted 8va to the solo's own Theme 2 octave.
4. 158 takes V2's cis′ trill (drops Va's descending bes–e); its resolution d′ at 159 doubles as
   entry 4's subject note and the start of V1's rising line.
5. 172 follows the **wind line** to d♯‴ (cliff to p at 173), not the strings' f′ trill. Ossia for
   safety: the oboe's octave from 169.
   **Revised 2026-10-23 (user): bar 172 an octave up.** `a''' b''' c'''' cis'''' d''''` stopped on
   the E♭ string (semitones 18–23, ordinary high-position territory), then `dis''''` as the E♭
   string's **4th-partial harmonic** (touched in place at e♭⁗ — the 3/4 node — or at a♭″ in 1st
   position) and 173.1 `e''''` as the A string's **6th-partial harmonic** (touched at c″, low 2nd
   finger, 1st position; the only practical node). 171 ends f‴, so 172's a‴ continues the climb
   instead of the orchestra's register reset: 170–173 becomes one ascent and the cliff to p is
   larger. Licence: octave placement of a lift is the arranger's throughout (Ep 1 bass line, Ep 6
   entry 1); no notes are added. Both closing harmonics are reachable from 1st position, so the
   hand is already down for 173's chords — the original join's logic, one octave higher. Ossia
   (Ob octave from 169) kept as the safety text; reliability of the 6th partial at f (fast bow,
   near the bridge) is the thing to test when played.
6. Dynamics as source: mf 137.3, "sempre stacc." 145, f 166, cresc 170–172. LH-pizz rule applies
   on 161/162/166 (G) and 163/165 (D).

Correction: the transcript's "fugato at midpoint" is **this** section, not [G] 253–272.

### Episode 7 — bars 173–204 "Skeletons" [D] (decided 2026-10-18)

Orchestra (from the dump): the transcript's "no melody" is right but the section is strictly
built — **one 16-bar strain stated twice, a fourth apart.** (A) 173–188 over an E pedal (Tb3/Tba
fp tied, Cb staccato e on 1): wind choir p staccato quarters on beats 1 and 3 in parallel thirds
(melody Cl2/Hb2/Fl/Pic `cis'' b' a' gis' | a' cis'' …`, third above in Cl1/Bn1; harp doubles an
octave lower), the strings' slurred triplet turn e–f–e as a round (Vc beat 1, Va beat 2, V2 beat
3, every bar), cymbal p on 2; 179 and 187 are three-chord cadence bars. (B) 189–204 the same
strain up a 4th over an A pedal (horns 3/4 tied, timp roll, Cb): Vln I **pizz** + Tp 1/2 + Tb 1/2
in thirds on 1 and 3, turn a–b♭–a in the same round, triangle on 2, oboe/clarinet horn-call g♯→a
on 2–3 in alternating four-bar blocks, cresc from 194 (horns 197) to f at 204, chromatic
a–b♭–a–a♯–b into the tutti B at 205.1 (Cl2 carries the `\bar "||"`). The solo enters 205.3.

The "Spanish" character is **E Phrygian over a pedal (G♯/G♮ mixed), with the semitone turn as
the ornament** — guitar-strum thirds and a mordent. That is what the arrangement keeps.

Decisions:

1. **Section A arco, Cl/Hb2 octave, all first position.** Wind thirds as staccato double-stops
   on 1 and 3 (`<cis'' e''>`, `<b' d''>`, `<a' cis''>`, `<gis' b'>`, `<d'' f''>`, `<e'' g''>` on
   D/A/E♭ strings). **LH-pizz open G on beat 2 = the cymbal** (`-+`, normal-size: a designed
   element, not the ad-lib bass device; open D ad lib in the G♯ bars 176/184). No click in the
   three-chord bars 179/187.
2. **The turn attaches to the chord that contains its note:** every `<cis'' e''>` chord, on
   whichever beat it falls, becomes the slurred triplet `<cis'' e''>8->( <cis'' f''> <cis'' e''>)`
   — V2's e″–f″–e″ mordent on the E♭ string over a held C♯. Mechanical rule; 10 of 16 bars; each
   instance is sanctioned by whichever string part has the turn on that beat. Rejected: turn on
   beat 2 every bar (drops the cymbal; monotone), 2+2 metrical alternation (ignores harmony).
3. **189 is the hand-off bar:** last wind chord on 1, the new a–b♭–a turn bowed on the open A on
   2 (the pedal announced), Vln I's "Pizz." f″ on 3; the bow stays in hand through 204.
4. **Section B pizz throughout at the Vln I octave** (`<f'' a''>` = melody + Tb1's third, above
   to 201.1 and below from 201.3): a lift, not a fill — the orchestra's own violins go pizz here,
   and the colour change at 189 mirrors the orchestra's (cymbal→triangle, winds→pizz/brass). Pizz
   carries the cresc to `<e'' g''>\f` at 204. **Beat 2 = pizz natural harmonic e‴** (open A
   touched at e″, in hand in both positions) = the triangle: a bright tick that does not grow.
   **Arco ossia** on a smaller staff below 189–204: same chords bowed, V2's turn `a''–b♭''–a''`
   on 2, 204 as the chromatic double turn into b″. Rejected as the main text: arco (32 bars of
   one texture, loses the lift) and a pizz/arco hybrid switching at 197 (switch point not in the
   source).
5. **Join 172→173:** 173.1 `e'''` f as the A string's 12th harmonic (touched at e″, 4th finger,
   first position) — the wind line's resolution lands as a ring exactly as the hand drops to first
   position for the chords. Not yet decided but noted for Episode 6: `dis'''` at 172.6 is the E♭
   string's octave harmonic, a semitone above the hand's d‴.
   **Revised 2026-10-23:** 173.1 is now `e''''` (A string 6th partial, touch c″) following the
   8va bar 172 — see Episode 6 decision 5. Same logic, one octave higher.
6. **Join 204→205 (for Episode 8):** 205.1 is the tutti B (harp `<b,, b,>` mf) → pizz `<b b'>`
   recommended, 205.2 rest to retake the bow, 205.3 the solo's `fis'` appassionato verbatim.

Known losses: trombone/tuba E pedal; timp roll and horn pedal; the horn-call g♯→a; two of the
three turns per bar; the cymbal in 179/187. All accepted.

Bug found and fixed in convention: the **Episode 6 draft is absolute pitch** (its 137.1 chord is
V1a's open-string `<g d' bes' g''>`) but was headed `\fixed c'`; Episode 5 is genuinely
`\fixed c'`. See "Conventions".

### Episode 8 — bars 205–236 "Lyrical B major" [E] (decided 2026-10-19)

Orchestra (from the dump): Theme 2 in B major four times, 8-bar phrases elided by one bar (each
statement's held final note is the next one's upbeat bar). (1) 205.3–214.1 solo f *appassionato*
(G♮ variant, G-major-over-B 209–212) over four solo cellos pp (d♯′/b · f♯/B), harp `<b,, b,>` mf
+ arpeggio `r8 fis b dis' fis' fis`, **Cl 1 marked "A défaut de Harpe"** doubling the arpeggio
from 206. (2) 213.3–222.1 Fl 1 at b″ *espress.* + Fl 2 and Hn 1 at b′ (mf), V1 "Arco" pp
d♯′→d♮′ (217)→d♯′ (221), V2 b, Va f♯/g, Cb `<b, b>` div pp. (3) 221.3–230.1 solo (G♯ variant:
E major 225–226, F♯7 227–228; cresc 223, dim 227) over cellos. (4) 229.3–237.1 V2 at b″ + Va at
b′ *molto espress.*, cresc 230 → **f 233** → dim 235, over Tb 1–3 + Tp 1 pedal pp (d♯′→e′ at
233) and Cb; ends `fis''2.~` p on 237.1 against V1's [F] run. 205.1 is a full tutti B-major
stamp. The bass is B for all 32 bars.

Decisions:

1. **Solo = single line, orchestra = octaves.** Statements 1 and 3 verbatim, nothing added
   (Episode 3 precedent). Statements 2 and 4 are the orchestra's own octave doublings rendered as
   violin octaves — a lift, not an invention — p *espress.* then f *molto espress.* Rejected:
   single line at the flute's b″ (my first proposal; loses the orchestra's mass and the user's
   virtuoso register), the horn's b′ sul D, and line/line/line/octaves (saves the effect for the
   climax but drops the doubling the orchestra writes at 213).
2. **The open E♭ string is the D♯ of B major.** 205.1 is the four-string pizz strum
   `<b dis' b' dis''>` (fingers 2–1–1–open; supersedes Episode 7's `<b b'>`); 221.1 is
   `<b' dis'' b''>` — the octave on D–A in 5th position with the open E♭ ringing inside. Death's
   tritone string is the sweet note of the oasis.
3. **Inner voice at its change points** (sibling of Episode 7's ornament rule): V1's d♯′→d♮′→d♯′
   is the harmonic event of the answer; it is carried as the middle note of a three-note chord
   where it changes and the hand allows — 217.1 `<g' d'' g''>->` (the accented G-major arrival,
   the note that distinguishes the G♮ variant) and 221.1 (above). 214.1 is a plain octave (the
   hand arrives from the solo's 1st-position b′; the open E♭ is not free). 233.1 stays a bare
   `<gis' gis''>` f — at the climax the octave is the power and the G♯ already implies E major.
4. **Joins obey immutability, including tied tails.** 213.3 `<b'~ fis''>`: Fl 1's upbeat as a 5th
   over the solo's tied b′. 214.1 `<b' b''>`: the solo's b′ is the lower octave, so the answer's
   downbeat is on time. 221.3 `fis'4` alone: the solo's upbeat truncates the flutes' tail. 229.3
   nothing added (V2's f♯″ is not reachable over a D-string f♯′; Va's f♯′ is the solo's note).
   230.1 rolled `<fis' b' b''>` — solo tail + Va + V2, everything the orchestra has on that beat —
   tied into the octave. Noted, not taken: treating the tail of a tie as "not a note" would allow
   `<b' b''>`/`<b' b''>` directly at 214.1/230.1; the rule was kept strict.
5. **Scordatura octave geometry:** octaves on A–E♭ need a 6-semitone 1–4 span and exist only for
   lower notes on the A string (b′, a♯′, a′); g′/f♯′/e′ octaves must lie on D–A (3rd position).
   The answers therefore live mostly on the D–A pair; the b′/b″ chords at 221.1 force 5th position
   there. Fingering is the performer's; the draft notes both routes.
6. Dynamics as source (Fl 1's hairpins in 2, V2's in 4); editorial *(f)* at 221.3. No LH-pizz
   anywhere in the episode (bass B is not an open string) — the lyrical episode is clean of clicks.

Known losses: the four solo cellos, the harp/clarinet rocking figure, the Cb and brass pedals, V2's
f♯″ upbeat at 229.3, the flutes' tail at 221–222. All accepted.

### Episode 9 — bars 237–252 "Spiky" [F] (decided 2026-10-22)

Orchestra (from the dump): (a) 237–244: V1a and V1b each play slurred 5-note 16th groups a beat
apart whose last note is the other desk's first — the composite is **one continuous chromatic
scale b→b″ (237–239.1) and back to b (241.1)**, stated twice (p; cresc 241, f 243, dim 244 → p
245). Under it: Hb1/Hb2 d♯′/b pedal 237–245, Bn1 f♯/g/f♯/g♯, and the staccato bass figure
`r4 b,8 dis b, cis | dis cis b,` in Vc/Cb (+ Tb1/Tb3 even bars, Va from 239, V2 from 241) on
B (237), G (239), B (241), G♯ (243) — i.e. B → G-augmented (with the oboes' d♯) → B → G♯ minor.
237.1 is the B-major cadence of Episode 8 (Hp `<fis b>`/`<b,, b,>`, Tb1/Tp1 d♯′, Tb2/Cb b) with
V2/Va's `fis''2.~`/`fis'2.~` p resolving the fourth statement. (b) 245–252: **Theme 1's head in
D♯ minor** (`dis fis dis eis | fis . eis . dis .`) in canon at the bar, strings leading (V1a with
V2 an octave below; V1a's own register toss d♯″ 245 → d♯‴ 247 → d♯″ 249 → c‴ 251) and winds
echoing one bar later (Hb1/Cl1 246, Fl/Pic/Bn1 248, Hb/Cl in thirds 250, Fl/Bn1 252 → g 253),
over a chromatic bass in repeated 8ths B (245) → A♯ (247) → A (249) → A♭ (251) → G (253), Va
`<fis dis'>` repeated-8th motor, and pp Tba/Tb3/GC dots on each block downbeat. **No crescendo:
p throughout; [G] 253 begins mf.**

Decisions:

1. **237–244 as a single line, slurred per beat.** The desk split is an orchestration artifact;
   the slur-per-beat bowing is the violin's natural 4-to-a-bow. Dynamics V1a's. Nothing added:
   the hand is in 16ths, so the LH-pizz device does not fire (bass G 239–240) and the B/G+/B/G♯m
   harmony is an accepted loss.
2. **237.1 = rolled triad `<fis' dis'' fis''>4` p** — Episode 8's octave resolution (V2/Va) with
   the cadence's D♯ (Hb1/Tb1/Tp1/harp) as the middle note; 1st position, fingers 2–4–1. Truncated
   to a quarter so the scale can be joined at 237.2 from V1b's group (`dis'16 e' eis' fis'`). The
   four 16ths dropped (V1a's `b bis cis' d'`, under the tutti stamp) are the only loss. Rejected:
   bare octave `<fis' fis''>` (user's call — the fuller cadence), and starting the scale at 237.1
   (drops the phrase's last note).
3. **245–252 = V1a verbatim plus the bass at its points of change.** The leader voice alone, with
   its own register toss and its rests kept (the rests *are* the spiky character), and the bass
   note as a short low 8th in the three downbeat rests where the tuba/trombone dots fall: 247.1
   `ais`, 249.1 `a` (open), 251.1 `aes`. V1a's own 245.1 `b8` and 253.1 `g8` frame that line,
   so the three added notes complete the descent the source literally has (Vc/Cb/Tba). Low dot →
   high figure is the one-violin rendering of "tossing", and it makes the chromatic drive into
   [G] audible. Rejected: (i) the composite that fills V1a's rests with the wind echo — turns the
   hiccup into continuous 8ths and destroys the figure; (ii) staccato octaves (V1a + V2) — the
   register rule's condition fails at 247–248 (lower note on the A string: a 6-semitone A–E♭
   stretch or D–A in 7th position, p staccato at ~8th = 340/min), so applying it only in the
   other bars breaks the figure's consistency, and it loads the heaviest technique in the piece
   onto a p transition whose weight belongs to Episode 10 and to 273. **The octave rule applies
   per passage, not per bar.**
4. Dynamics as source: p 237, cresc 241, f 243, dim 244, p 245 flat to 252; 253 mf is Episode
   10's. The bass dots carry no separate dynamic.

Known losses: the wind echo (canon at the bar), V2's lower octave, the Va motor, the oboe pedal
and the 237–244 bass figure. All accepted.

Corrections to the transcript/map: 237–244 is a **continuous chromatic scale** split between
desks, not a "spiky figure"; 245–252 is **Theme 1's head in D♯ minor in canon**, not generic
"wind tossing"; the whole episode is p with no crescendo into [G].

### Project-wide: virtuoso register (decided 2026-10-19)

The arrangement should **sound virtuosic — Sarasate's *Carmen Fantasy* is the named model.** The
first application: wherever the orchestra doubles a lifted line in octaves, the violin plays
octaves (Episode 8, statements 2 and 4). This is a register choice layered on the task hierarchy,
not a licence to add: the octaves are still lifts. Apply going forward when a lifted line is
octave-doubled in the source and the lower octave sits on the D–A (or G–D) pair.

### Project-wide: the tableau principle (decided 2026-10-18)

*Danse macabre* is a French tableau that quotes history — plainchant (*Dies irae*), Bach-style
fugato, the waltz. The arrangement makes each echo **legible in solo-violin terms** rather than
replicating its texture: the fugato reads as a Bach Sonata fugue (entry cues + single-line
episodes), the *Dies irae* as Ysaÿe's *Obsession* (sul ponticello), the harp as pizz. Allusion is
the arranger's licence; replication is not the goal.

### Project-wide: the three death timbres (decided 2026-10-18)

Each extended technique carries one orchestral identity for the whole piece; do not cross them:

| Technique | Stands for | Sanction |
|---|---|---|
| pizzicato | harp / string pizz | composer's "à défaut de harpe" (bar 33) |
| col legno battuto | xylophone (bones) | composer's own strings col legno under the xylophone (129–133); Berlioz *Fantastique* V |
| sul ponticello | *Dies irae* parody ([I] ~313–320) | Ysaÿe op. 27 no. 2 "Obsession"/"Les furies" — the solo-violin *Dies irae* precedent |
| pizz. natural harmonic | triangle ([D] 189–204) | arranger's licence, no composer sanction; distinct from the *bowed* "ghost" harmonics of the Ep 1 shimmer |
| LH-pizz open string on an off-beat | cymbal ([D] 173–188) | extension of the LH-pizz device from bass to percussion; normal-size, not ad lib |

Future xylophone passages vary by *whether the violin carries the xylophone at all* (at 266–272
and likely 298–309 it carries Vln I, so the xylophone drops), not by changing its timbre.
Solo-violin precedent for col legno before the 20th century is essentially nil (Paganini, Ernst,
Vieuxtemps, Wieniawski, Sarasate do not use it) — it is deliberately a borrowed orchestral colour:
the violin "becomes the section" for four bars. Genre precedents for the project: Ernst's
*Erlkönig* caprice op. 26 (solo-violin death ballad), Paganini *Le Streghe* op. 8 (supernatural
dance). Precedent claims are from memory, not verified against scores.

### Project-wide optional device: LH-pizz bass (decided 2026-10-18)

Wherever the cello/bass downbeat is G, D or A and the bowed note is not on that string, an
optional left-hand-pizz open string may sound the bass. Engrave as small notes + "pizz. m.g. ad
lib." This is the "à défaut de harpe" rule extended to the bass line; it is mechanical and costs
no arranger's licence per bar.

**Engraving ruled 2026-10-23, applied 2026-10-23:** the ad-lib items (Episodes 2–6) are engraved
as small-note chord members (`font-size -3`, `-+`) with a one-time "pizz. m.g. ad lib." at the
first occurrence (bar 34), and the Episode 7 arco ossia (189–205) is engraved as a parallel
padded staff. Density was known (~30 bars in 1–172, none in 7–9) and neither affects layout, so
there was no reason to defer.

### Project-wide: the fugato's model and the knot's precedents (captured 2026-10-23)

- **Bach's solo-violin polyphony is compound (latent) melody**, not organ polyphony: voices exist
  as multistops at structural points and as registral alternation in the single line between;
  nothing sustains independently. Episode 6's "entry cue as double-stop, surface counter-line
  between" is that model exactly, so "more Bach" can only mean more of the *subject* sustained at
  the entries — never independent voices. (User's framing, confirmed.)
- **Berlioz, *Symphonie fantastique* V.** The Ronde du sabbat fugue is the direct ancestor of
  Saint-Saëns' [C] fugato (staccato dance-fugue for the dead at the programme's midpoint); it is
  genuine orchestral polyphony, which validates reading the running counter-line as the audible
  surface and the subject as cue. Its climax — "Dies irae et Ronde du sabbat ensemble", brass
  chorale *tenuto* against whirling strings — is the device of **[G] 253–272 (Episode 10)**
  almost literally. Solo-violin precedents for exactly that problem: Ysaÿe op. 27 no. 2
  "Obsession" (Dies irae in the bass against running figuration), Ernst *Erlkönig* (melody
  carried inside galloping triplets), Bach Chaconne arpeggio variations (the theme's notes become
  chord tones *inside* the figuration). First lead on the knot.
- **Catalogue beyond Paganini for fugal/polyphonic solo violin, pruned:** Ysaÿe Sonata 1 Fugato
  (modern Bach-homage fugato); Bartók Solo Sonata Fuga (dry staccato fugue, subject in
  double-stops, cumulative stops); Reger op. 131a (densest post-Bach solo-violin fugues); Telemann
  12 Fantasias (fugues thinner than Bach's — closest to Saint-Saëns' lightness); Ernst Six
  Polyphonic Studies (Paganini technique in polyphonic service, LH pizz — most apropos to this
  project's register). Precedent claims from memory, not verified against scores.
- **Open for Episode 6, deferred until played:** (a) flying/up-bow staccato bowing on the
  counter-line groups 145–157 and 159–165 (Caprice 7/10; zero licence cost — the no-regret
  addition); (b) extend entry 3's cue (151.3–155) to the subject's full head as sustained
  double-stops where both lines sit in 1st position (needs a slice). "Nothing" is a legitimate
  outcome.

## Capture candidates

- **"À défaut de harpe" licence.** Saint-Saëns's own pizz-for-harp instruction at bar 33 is a
  composer-sanctioned substitution rule; it makes the entire harp part transcribable without
  arranger's licence. (Pattern: look for the composer's own ossia/substitution instructions before
  inventing one.)
- **First-bow-at-25 rule.** In a solo arrangement the soloist is already playing the clock, so
  the theatrical entrance must be re-created timbrally (pizz/harmonics → arco) rather than by
  silence.
- **Lumo transcript errors** (keep for calibration): harp strokes are one per bar, not two; the
  coda order is horn E♭ → oboe crow → *then* the solo's déclamé, not crow-after-strings; the
  B-major episode [E] was omitted; the "fugato at midpoint" is [C] 137–172 (a real five-entry
  fugato — confirmed from the dump), not [G] 253–272 (whirl vs theme); solo enters bar 25 (that
  one was right).
- **Hand-resolving `\relative` is not reliable across `<< \\ >>` and long rests.** The @explore
  extraction for 65–116 flagged two "source anomalies" (V1a bar 41 `g''`, Fl1 bar 77 `ees''`)
  that are almost certainly resolver slips, not source errors (the printed score shows Vln I at g″
  there). Rhythm and pitch class from hand extraction are trustworthy; absolute octaves are not.
  Remedy: dump every voice to absolute pitch once with `\displayLilyMusic` (LilyPond now
  installed) and extract from the dump. Treat all `(?)`-marked octaves in the 65–116 extraction as
  unverified until the dump exists.
- **Composer's own section-analogue as licence (generalises "à défaut de harpe").** When the
  composer doubles an exotic colour with a string technique anywhere in the score (harp → pizz at
  33; xylophone → col legno at 129), that pairing is the sanctioned violin analogue everywhere the
  colour recurs. Search the string parts for the technique before inventing one.
- **Dump beats hand-resolution, confirmed.** The `\displayLilyMusic` dump validated to 477 bars on
  all 34 voices against `ly:music-length`; the subagent's parser needed two fixes (chord as
  `\repeat` body; `\afterGrace` with trailing decorations) — both would have been silent
  hand-extraction errors.
- **Ornament attaches to the chord that contains its note.** When the orchestra sustains an
  ornament (a turn, a trill) continuously under changing chords and the single line cannot carry
  both, attach the ornament only to the chords that already contain its pitch, on whichever beat
  they fall. The distribution then follows the harmony instead of the bar, and every instance is
  sanctioned by some source voice. (Episode 7: e–f–e on every `<cis'' e''>`.)
- **Source-convention mismatch fails silently.** The dump is absolute; a draft headed `\fixed c'`
  with dump text pasted in compiles, plays, and sounds an octave high — nothing warns. Keep one
  pitch convention equal to the source's; convert at the single boundary where it is unavoidable,
  never per lift. (Found in the Episode 6 draft; also a general rule for any transcription
  pipeline with a relative/absolute seam.)
- **The scordatura's gift: open E♭ = D♯, the third of B major.** The tritone string that costs
  the violin everywhere else is the sweet note of [E]: a four-string B-major strum at 205.1 and an
  open-string third ringing inside the octave at 221.1. (Pattern: a constraint that is a cost in
  the home key may be a free resource in a remote key — check every key change against the open
  strings before designing the episode.)
- **"À défaut de harpe" is a map, not a single instruction.** The second instance is Cl 1 at 206
  (the clarinet doubles the harp's arpeggio, marked "A défaut de Harpe"); the first was strings
  pizz at 33. Saint-Saëns provides a substitute for every harp passage — so the harp part is
  never the arranger's problem, and the composer's substitute names the idiom (pizz where the
  strings cover it; a sustained/rocking wind figure where the clarinet does). Check every
  remaining harp bar for its marked cover before deciding.
- **Sustained inner voice carried at its points of change.** When a lifted melody has a
  sustained inner voice under it that the single line cannot hold (V1's d♯′→d♮′→d♯′ under the [E]
  answer), carry it only where it moves, as the middle note of a chord on that beat. The
  harmonic event survives; the texture does not pretend to. Sibling of the ornament rule
  ("ornament attaches to the chord that contains its note").
- **Scordatura octave geometry.** Under G–D–A–E♭, octaves on the G–D and D–A pairs are normal
  (5-semitone 1–4 span); on A–E♭ they need 6 semitones, and only for lower notes that sit on the A
  string. Octave passages belong on D–A, climbing to 5th position for b′/b″ — which also keeps the
  E♭ string free to ring open. Derived for Episode 8; applies to every octave doubling later.
- **Tied tails are notes.** The solo's `b'2.~ | b'4` at 213–214 and `fis'2.~ | fis'4` at
  229–230 are the only places so far where immutability bites against a lift; treating the tail
  as droppable would have cleaned both joins. Kept strict; recorded so the rule is revisited
  deliberately if it keeps costing, not eroded case by case.
- **A convention is a property of the document section, not the snippet** (2026-10-20 review;
  extends "Source-convention mismatch fails silently"). The pipeline has three seams — the
  dump's transposition flag, the draft octave convention, the score octave convention — and the
  first `@build` pass crossed two unchecked: it read `\fixed c'` decision-log snippets as absolute
  (five chords landed a fourth below the open G, and a correct decision was "corrected" away) and
  sliced clarinet at written pitch (ten bars of a C♮ under a G-minor stab). Neither error
  compiles differently or trips the bar-check gate; both are visible only against the source.
  Rules: when a convention switches, relabel every existing snippet in the same commit; a flag
  that can be omitted will be — bake the transposition into the dump rather than into the
  procedure; before entering from any voice, anchor-check one bar whose harmony is known (e.g.
  Cl at 102 must form G minor with the Cb).
- **Desk splits are orchestration, not music.** Two desks playing overlapping 5-note slurred
  groups whose seam notes coincide (V1a/V1b 237–244) are one line; read the composite before
  deciding anything. Generalises: when the dump shows interlocking parts with shared seam notes,
  check whether the union is a single scale/arpeggio before treating them as two voices.
- **A conditional rule applies per passage, not per bar** (Episode 9, 245–252). The octave rule's
  condition (lower note on D–A/G–D) held for six of eight bars; applying it bar by bar would have
  given an inconsistent figure. If a rule's condition fails anywhere inside one figure, it fails
  for the figure.
- **Natural-harmonic availability under scordatura** (pivotal for every shimmer/ghost passage):
  partials give D string → d″ a″ d‴ f♯‴; A string → a″ e‴ a‴ c♯⁗; G string → g′ d″ g″ b″;
  E♭ string → e♭‴ b♭‴ e♭⁗ g⁗. F♯ is available only on D; A♭/C (the Neapolitan colours) are
  not available as natural harmonics at all.
- **LilyPond 2.24.3's Slur/Script engraver has a line-break-dependent cyclic-dependency bug.**
  Two chord-tone `\tweak font-size` notes a few bars apart, the second under a slurred ornament
  (`\prall`/`\trill`), can trip `programming error: cyclic dependency ... Slur.control-points` —
  reproducible only with specific surrounding bar content (isolated by bisection, not obviously
  wrong notation) and apparently tied to which system the ornamented note's line-break lands on.
  `\override Script.avoid-slur = #'inside` sidesteps it with no visible cost. If a LilyPond build
  ever throws a cyclic-dependency crash on `Slur.control-points`, suspect a Script/ornament
  interaction near a system break before suspecting the note data (found 2026-10-23 engraving the
  Episodes 2–6 ad-lib clicks).
