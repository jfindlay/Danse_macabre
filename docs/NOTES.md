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
- Episode files use `\fixed c'` (not `\relative`) so pitches are unambiguous when spliced; the
  source's `\relative` octaves have already been resolved by hand once (see map below) and should
  not be re-derived per edit.
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
| 137–172 [C] | tacet | development: bassoon staccato Theme 2 (137–145), string fragments, wind scale ascents (163–172) |
| 173–204 [D] | tacet | **no melody**: p staccato wind chords, string triplet turns, Vln I pizz line 189–204 |
| 205–236 [E] | lyrical Theme 2 in **B major** (205.3–214, 221.3–230) | 4 solo cellos pp, clarinet rocking figure; flute+horn answer 213–222; Vln II/vla *molto espress.* 229–236 |
| 237–252 [F] | tacet | Vln I spiky 16th figure (237–245) — already violinistic; wind tossing 246–252 |
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

### Project-wide: the three death timbres (decided 2026-10-18)

Each extended technique carries one orchestral identity for the whole piece; do not cross them:

| Technique | Stands for | Sanction |
|---|---|---|
| pizzicato | harp / string pizz | composer's "à défaut de harpe" (bar 33) |
| col legno battuto | xylophone (bones) | composer's own strings col legno under the xylophone (129–133); Berlioz *Fantastique* V |
| sul ponticello | *Dies irae* parody ([I] ~313–320) | Ysaÿe op. 27 no. 2 "Obsession"/"Les furies" — the solo-violin *Dies irae* precedent |

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
  B-major episode [E] was omitted; the "fugato at midpoint" is actually [G] 253–272 (whirl vs
  theme); solo enters bar 25 (that one was right).
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
- **Natural-harmonic availability under scordatura** (pivotal for every shimmer/ghost passage):
  partials give D string → d″ a″ d‴ f♯‴; A string → a″ e‴ a‴ c♯⁗; G string → g′ d″ g″ b″;
  E♭ string → e♭‴ b♭‴ e♭⁗ g⁗. F♯ is available only on D; A♭/C (the Neapolitan colours) are
  not available as natural harmonics at all.
