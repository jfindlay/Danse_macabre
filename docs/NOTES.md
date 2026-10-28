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
Usage: `python3 slice.py abs <Voice> <bar1> <bar2> [--transpose PRESET]`. Presets: `cl-bb`,
`horn-g` (Cor 1/2 to 402), `horn-eb` (Cor 1/2 from 403, "Changez en Mi♭" — added 2026-10-28),
`horn-d`, `tp-d`.

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
- **Pizz. is per-note (asserted 2026-10-26, user).** A `pizz.` text on a note or chord applies to
  that note or beat only; the next note is bowed and carries no `arco`. A pizz *passage* is
  marked `pizz. sempre` and runs until an explicit `arco` (so far only bars 18–25). `-+` is
  left-hand pizz, as before. In a two-voice texture, `pizz. sempre (lower voice)` scopes the
  stems-down voice for as long as the two-voice layout lasts (Episode 7). Reason: the score is
  full of one-note pizz events (stamps, strums, waltz "pah"s) between bowed notes, and the
  `pizz.`→`arco` pairs were clutter that said nothing. Applied 2026-10-26: every `arco` after a
  one-note pizz removed (Episodes 2, 4, 5, 8); bar 18 relabelled `pizz. sempre`, bar 25 `arco`.

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
| 173–204 [D] | tacet | **one 16-bar strain twice**: 173–188 E pedal, wind thirds p stacc on 1 & 3, string turn e–f–e as a round (Vc 1 / Va 2 / V2 3), cymbal on 2; 189–204 the same strain a 4th up over an A pedal in Vln I pizz + Tp/Tb, turn a–b♭–a, triangle on 2, timp roll, horn-call g♯→a, cresc 194 → f 204 → tutti B 205.1. **This strain is the *Dies irae* parody** (verified 2026-10-27: the chant's contour F E F D E C D D occurs in the score exactly once, as the winds' `d'' cis'' d'' b' cis'' a' b' b'` at 181–185 — and its transposition in Tb1 at 197) |
| 205–236 [E] | lyrical Theme 2 in **B major** (205.3–214 G♮ variant, 221.3–230 G♯ variant) | **four elided 8-bar statements**: solo / Fl 1 b″ + Fl 2 & Hn 1 b′ *espress.* (213.3–222) / solo / V2 b″ + Va b′ *molto espress.* cresc → f 233 (229.3–237.1). Under: 4 solo cellos pp, harp `<b,, b,>` + arpeggio with **Cl 1 "A défaut de Harpe"** (206–), V1 inner voice d♯′→d♮′→d♯′ (213–221), Cb `<b, b>` pp, brass pedal pp 229–236. Bass is B throughout |
| 237–252 [F] | tacet | **one continuous two-octave chromatic scale** b→b″→b in 16ths (V1a/V1b desks hand off every beat), p 237, cresc 241, f 243, dim 244, over Hb d♯′/b pedal and a staccato bass figure B/G/B/G♯; 245–252 **Theme 1's head in D♯ minor** tossed strings→winds in canon at the bar (V1a + V2 8vb lead), bass descends B→A♯→A→A♭ in 8ths (→ G 253), Va `<fis dis'>` motor, pp Tba/Tb/GC dots on block downbeats; p throughout |
| 253–272 [G] | tacet | **the knot**: Vln I whirling triplet-8th arpeggios (two-octave sweep up and down, bass note accented on 3) against Theme 2's head *ten.* three times in the brass (Tb1 at C, Tp at A, Bn/Tb at B♭), then f 265–272 D/E♭ alternation with the strings' accented C♯ (German sixth) → [H] |
| 273–308 [H] | tacet | **273–280 hammer blows** f marcato `2^ 4^`, winds/brass (Gr6, Gr6, B°7, A°7) on the odd bars vs strings+Tp (D, D, C, B♭) on the even, each resting in the other's bar; **281–288 wind chorale** dim. → p 287, top line a″ g″ f″ e♭″ d″ e♭″ d″ e♭″ doubled 8vb; **289–292 string wedge** p (V1a d′ e♭′ f′ g′ rising, bass c b♭ a g falling) → **293–296 D vamp** (chord on 1, horn d′ pedal, timp a 8ths); **297–301 / 305–309.1 wind chromatic descent** ×2 (Fl1→Cl1 relay g″→f♯, then Fl1 alone g‴→f♯′) under V1a's *legg.* Theme-1-head figure (Va 8vb, V2 pizz + xylophone on its downbeats) over a Tb/Bn C-minor pedal; 301–304 the vamp again, cresc. Not Theme 1 in the strings as the transcript had it |
| 309–337 [I] | tritone summons 309.3–312.2; low stamps d♭′ (313.3–316) / c′ (317.3–318) / b♭ (319.3–320) f staccato; Theme 2 *espress.* 323.3–337 | 309.1 the chromatic run's goal (Fl1 f♯′) over a p D chord; **312.3–320 strict alternation**: strings pizz waltz chords (upbeat + two) in the solo's rests — D · E♭7 E♭7 · E♭7 · A♭ A♭ · A♭ · C♯°7 C♯°7 — then the solo's stamp as the bass of a homorhythmic wind stamp (Bn1 in unison with the solo; Hb/Cl the chord above); 320.3→321.1 tutti G→D p; **321–337 Theme 2 (solo) over Theme 1's head in V1a pp staccato** (four two-bar cells on d′/c♯′/b/a, 321.2/325.2/329.2/333.2) and a pp D pedal in repeated 8ths (V2 d′/a, Va f♯, Vc/Cb d) whose harmony shifts every two bars; 337 the strings' rising chromatic line begins under the solo's tied d′ (→ Ep 13). **No *Dies irae* here** — the map's "~313–320" was a transcript inference, disproved 2026-10-27 (it is [D]) |
| 338–361 | tacet (the solo's d′ is held to 339.1) | **corrected 2026-10-27:** 337–353 the strings' one long chromatic phrase over a D pedal (V1a top, V2/Va/Vc parallel: rising `x2 y4` and falling `x4 y z` cells, peak a″ at 346.1, then fis″–g″ F♯°→Gm oscillation, cresc. 348–353); **346.2–357 the winds' Theme 1 head in C minor** (`c ees c d \| ees c ees d c bes`, f, Fl/Hb/Cl in octaves, Pic from 350), taken over by V1a/V2 at 354–357 with Tp/Tb/Tba cresc.; 358–361 tutti D7(♭9) hit + V1a's non-legato descent from ees‴ (V2 from 360) into [K] |
| 362–393 [K] | tacet | **corrected 2026-10-27:** 362–365 V1a/V2's non-legato cell `fis' \| c' ees'(sf) d' c' a` ×4 (the 358 descent's landing) under brass staccato D7 downbeats (361–366); **366–369 the winds' rise** (Fl1/2, Cl1: a chromatic octave from d′, then G melodic minor to g‴, f → cresc.; Bn in contrary motion, Hb/horn d′ pedal, V2/Va join 368.3); **370–385 ff tutti Theme 1 in G minor** twice (V1a/V2 g″, Va/Vc g′; winds hammer g/b♭ 8ths; Tb1/2 chromatic countermelody g′–f′–e′–e♭′–d′), tails 376–377 (`d''' e''' fis''' d''' fis''' \| a'''-!` + bass rise `a ais b cis'`) and 384–385 (triplet-measured tremolo `fis d fis \| a` + the rise), V1a tremolo on g‴ 379–383; **386–389 strings alone** on the D pedal `cis4 d2:8` (GC mf); **390–393 D7** (c♮ downbeats, winds on the 8ths, GC/Cym ff) → [L] |
| 394–415 [L] | tacet | **corrected 2026-10-28:** one 8-bar phrase twice, V1a/V2 in unison throughout (the only line): 394 `bes4 d'8 g' bes' d''` under the tutti's `-!` G minor **over a B♭ bass**; **395–398 the ornamented figure** — descending chromatic slurred 8th pairs, each with an upper acciaccatura, g″–b♭″ → b′–b♭′; 399–401 `aes' g' aes' c'' bes' aes' \| g' fis' g' bes' a' g' \| fis' a' d'' fis'' a'' d'''`; 402 tutti G hammered `8 8 4` (Ti/Tp/Tb/horns; Fl/Pic `bes'' d''' g'''`) while V1a plays `bes''8 r8` and restarts; 403–409 the same (403 spelled `aes''`); 409–415 D / Gm arpeggio sweeps over a D pedal, ff (Cb) *poco stringendo* 409, V1a climbing to fis‴ (V2 an octave below in 415 only) → 416 Animato. Accompaniment: Hb/Cl/Bn + Va/Vc/Cb quarter chords on beats 1–2, rest on 3 (Gm/B♭ · Cm · D/F♯ · Gm · A♭/C · Gm/D · D; D / Gm/D alternating 409–415, Tp/Tb on D 414–415). Horns 1/2 "Changez en Mi♭" at 403 (silent to 438) |
| 416–437 | tacet | **corrected 2026-10-28:** three terraces down, then the hammering. **416–418** ff tutti descent `g f ees \| f ees d \| ees d c` (Fl1/Pic/V1a at g‴, V2/Hb2 at g″; inner winds `bes'' d''' g''`…; bass `g bes c' \| f a bes \| ees g aes`; Tp/horns hammer each bar's root; Trg/Cym/GC 416.1); **419–420** Theme 1's head on A♭ then F♯ (`aes''8 c''' aes'' bes'' c'''4 \| fis''8 a'' fis'' g'' a''4`, V1a/V2/Pic unison) over tremolo **A♭/C → D** (the tritone pair), Trg roll; **421–423** the descent again in three octaves (Fl1 / V1a+V2+Hb2+Cl1 at g″ / Bn1), crash 421.1; **424–425** the head an octave lower, winds unison, Va/Vc tremolo, Ti 425; **426–429** all strings + Bn in unison/octaves `g8 bes g a bes4 \| c' b bes a aes4` ×2 (V1a from the open G) under the winds' bare-octave stamps on 1–2 (`g'/g''` 426/428, `fis'/fis''` 427/429 — Gm, then **C + F♯**, Tb/horns on 1); **[M] 430–432** the figure ×3, the full Gm chord stamped on 1–2 (winds/Tp/Tb/Ti/Trg/Cym/GC); **433–437 fff** the figure in continuous 8ths `g bes g a bes g \| a bes g a bes g` ×4 (Vc/Cb 8vb), the Gm chord on every beat; 438 strings silent, horns 1/2 (E♭) fp |
| 438–454 | tacet | **corrected 2026-10-28:** *Tempo 1°*: horns 1/2 (E♭) alone hold `ees'`/`ees` fp, tied 438–445.1; **oboe 1 cock-crow 440–445** `ees''4\f r8 bes'' bes'' \| ees'' g''2->~ \| ~ \| \> \| ~ \| g''8\pp`; **445–454 strings tremolo** C♯°7 (Vc `cis`, Va `<ees g>`, V2 `bes`, V1a `ees'`) f 445 > · p 451 > · 453 !, fermata 454 *très long* / *toujours en dim.*; timp G strokes 445–453 (mf > pp), GC roll 445–449. Nothing else |
| 455–477 | *déclamé* f 455–466 (`d''2. \| bes' a' g' \| g'2.~ \| g'4 r r \| bes'2.` dim. `\| g' f' ees' \| ees'2.~ \| ees'4 r r \| r r ees'( \| aes) bes c' \| ees'2. \| ees'2.(`); [N] 467 measured tremolo d′–e♭′ 16ths (accents 467), p 468 > pp 473.1 | **corrected 2026-10-28:** 455.1 strings one pp quarter Gm/D (V1a `d'`, V2 `bes`, Va `<d g>`, Vc `d`); **horns p sustained** Gm (`g bes d d'`, 455–458) → Gm + horn 3 stopped `ees'` (459–462) → A♭ (`c aes c' ees'`, 463–464.1), then silent; **Theme 1's head echoed three times, rising:** Va/Vc pp `r4 g8-. bes a bes \| a( g) g a bes g \| d'8-.` (469–471), V2 p `r4 g'8-. a' bes' g' \| d''8-.` (471–472), V1a ppp `g''8-. r \| a'' r bes'' r g'' r \| d'''8-. r` (472–474); **Fl1 continues the d′–e♭′ tremolo** pp 473–476.1; **Cb pizz** `g, \| a, bes, g, \| d \| d \| g,` 473.3–477; final wind chords pp D major 476 → G minor 477 (Hb/Cl/Bn/horns 3–4), strings unison `d'` / `g` |

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
   **Revised 2026-10-26 (user, before playing) — supersedes decisions 1 and 2 for 173–188.** The
   thirds put the melody *under* the harmony note, and gluing the turn to the `<cis'' e''>`
   chords buried it further and smeared the waltz beat. New text (PLAN "Revision drafts
   (2026-10-26)"):
   - **Melody on top, as sixths, at the flute/piccolo octave.** The source's third is *above* the
     melody, so the chord that puts Fl/Pic/Hb1's `cis''' b'' a'' gis''…` on top is melody + Cl1's
     own line (`e'' d'' cis'' b'…`) at pitch: `<e'' cis'''>`, `<d'' b''>`, `<cis'' a''>`,
     `<b' gis''>`, `<f'' d'''>`, `<g'' e'''>`. Every pitch is still a lift; nothing invented.
     Hand: 3rd position on A/E♭ (d‴ = 4th-finger extension), 1st position for the two G♯ chords,
     one reach to 5th at 186.3. Fallback if the 3rd-position p staccato proves fussy: the same
     text an octave down (Cl2/Hb2 + Bn1 at pitch, all 1st position, open D under every b′).
   - **Beat 2 is the waltz's "pah" and nothing else:** the click and the turn *alternate* on
     beat 2 — the viola's own beat for the turn — never on a chord, so beats 1 and 3 are always the
     bare staccato sixth. Turn (accented in the source) on the hypermetrically strong bars
     174/176/178, 180/182/184/186; click on the weak bars 173/175/177, 181/183/185, 188; nothing on
     2 in the cadence bars 179/187. Both phrases therefore start the same way, and the hand-off
     reads click (188) → new a–b♭–a turn (189) → harmonic tick (190). The G♯-bar "open D ad lib"
     click is moot (those bars carry the turn). The "turn on beat 2 every bar" option rejected in
     decision 2 was rejected for dropping the cymbal; alternation keeps it.
   - Known loss added: the turn in the click bars and the click in the turn bars (the source has
     both every bar). 189.1 follows the section (`<e'' cis'''>`).

   **Revised again 2026-10-26 (user), same session — the whole episode as two voices.** The
   episode is engraved as a bowed voice (stems up) and a pizz voice (stems down), labelled once
   (`pizz. sempre (lower voice)`, 173.2) under the new per-note pizz convention.
   - **Section A:** the beat-2 click is a right-hand pizz on the **open A** (`a'`; the user's
     `a4` read as the open string — a stopped `a` is unreachable from 3rd position), not the
     LH-pizz G. The turn drops to **V2's own pitch `e'–f'–e'`** (G string 3–4–3 in 3rd position;
     D string 1–2–1 in the 1st-position bars). Both halves now have exactly one pizz per bar.
     The first half is the de Falla / Rodrigo / *Capriccio espagnol* tableau; the second is where
     Saint-Saëns starts driving the intensity back up.
   - **Section B — the strain to the pizz voice, the horn-call to the bowed voice.** Source:
     V1a is pizz here; the winds' slurred `gis→a` call sits on beats 2–3 of every bar 190–203
     (Hb/Bn 190–193, Fl/Cl 194–197, Hb/Bn again from 198 with their own cresc., everyone from
     201). Beat 1 = pizz melody with the **open A plucked under it** (= the Cb/timp/horn pedal;
     11 of 15 downbeats — not where the melody is itself on the A string). Beat 2 = bowed
     `gis'->`. **Beat 3 allocation:** the bow cannot hold the call's resolution while the right
     hand plucks, so 190–197 the resolution carries the melody's beat-3 note on top as a
     double-stop `gis'->( <a' f''>)` — both themes complete, the melody hocketing pizz/arco. From
     198 (the oboes' re-entry and hairpin; "halfway") the call goes to **octaves `<gis gis'>(
     <a a'>)`** on G–D (1–4 sliding; Bn1/Cl2 + Hb2/Cl1 at pitch), which leaves only the A string
     free and none of the melody's beat-3 notes reachable — so 198–204 the melody is its
     downbeats only (`f e d e g g g`): the call swallowing the texture, as the winds pile onto it
     in the source. Alternative kept in reserve: octaves from 201 (the tutti point) saves three
     melody notes at the cost of the "halfway" symmetry. Cadence 195: the melody's beats 2–3
     ride the call (`<gis' e''>( <a' d''>)`, fingers 3–4 → 4–3). Cadence 203: octaves win.
     Both voices `cresc.` from 190 to f at 204; 204 = the chromatic rise `a–a♯` in octaves
     resolving on Episode 8's 205.1 strum.
   - **Revised a third time 2026-10-26 (user) — explicit pizz marks, voices by pitch in 190–204.**
     - **173–188:** the pedal is `a` (one octave down); `pizz. sempre (lower voice)` is retired
       for an individual `pizz.` under each of the seven `a` (173.2, 175.2, 177.2, 181.2, 183.2,
       185.2, 188.2). 189.3 `f''` gets its own `pizz.` (it lost the "sempre" scope).
     - **190–204:** voices are allocated by pitch, not technique: the stem-up voice carries the
       higher notes (melody on 1 and 3), the stem-down voice the lower notes (pedal `a'` on 1,
       call `gis'->( a')` on 2–3, slur curving down). (First engraved with the directions the
       other way round, stems crossing; reversed the same day.) Only beat 1 is pizz (both
       voices, marked once on the melody note: `pizz.` at 190.1–192.1, `sim.` at 193.1, no `arco` on
       beat 2). This restores the melody's beat-3 notes that the 198–204 octaves had swallowed:
       198.3–202.3 `g'' f'' e'' g'' a''` over a single `a'` (the beat-2 octave `<gis gis'>`
       stays, slurred to the `a'`).
     - **195:** `e''`/`d''` on 2–3 ride the call in the stem-up voice, `gis'->( a')` below.
     - **203–205.1, a deliberate break of the per-note convention:** one `pizz.` at 203.1 runs
       through 205.1 and Episode 8's 205.3 `fis'` is marked `arco`. 203 `<g'' a'> <f'' a'>
       <e'' a'>` and 204 `<a' g''> r <a' g''>` are the stem-up voice alone. Known loss: the
       chromatic rise `a–a♯` into 205.
     - **Engraving:** the triplet turns (174–186, 189) are in the lower voice, laid out like the
       `a` pizz bars (triplet on beat 2 below, chords on 1 and 3 above), with the slur and
       accent on the noteheads (above; stems and beam down). No rests are engraved in 173–204
       except the `r8` at 173.1 and the `r4` at 204.2; every other gap is an invisible spacer.
       The `cresc.` starts at 190.1 in the melody voice itself, so its dashes run across the
       file boundary to the single `f` at 205.1 (the redundant `f` on 205.3 is gone).
    - **Triangle dropped.** Beat 2 is the call; the pizz-harmonic tick was arranger's licence
     without composer sanction, and a non-growing tick has no place in a 14-bar crescendo. The
     "pizz. natural harmonic = triangle" row of the timbre table is retired.
   - **Arco ossia dropped** (file and staff removed): its premise — 16 bars of pure pizz
     needing a bowed safety text — no longer exists.
   - Known losses added: the timp roll, Tp/Tb doublings of the strain, V2/Va's 204 double turn,
     the melody's beat-3 notes 198–204 (restored in the third revision, above).
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
   **Revised 2026-10-26 (user):** 205.1 is now the three-string pizz `<b b' fis''>` (the open E♭
   no longer on top; octave `b`–`b'` with the fifth above); 221.1 keeps the ringing open E♭.
   (Entered as `fis''` — the request's `f''` read as the key signature's F♯.)
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

7. **Revised 2026-10-27 (user): the four solo cellos' tied dotted halves under statements 1 and
   3**, as a stems-down lower voice (`\voiceOne` / `\new Voice { \voiceTwo }` so the melody keeps
   the main voice and its slurs; the `<< \\ >>` shorthand broke them). Dump: solo 1 d♯′ (205–208)
   / d′ (209–212) / d♯′ (213); solo 2 b; solo 3 f♯ / g / f♯; solo 4 B₂ — and in 221–230 solo 1
   d♯′ / e′ (225–228) / d♯′, solo 2 b / c♯′ (227–228) / f♯, solo 3 f♯ / **g♯ (225–226) / a♯
   (227–228) / b (229)**, solo 4 B₂. String adjacency decides which cello the violin holds:
   under the A-string bars (206–208, 222–224) only solo 1's **d♯′** (D string); under the
   D-string bars solo 2's **b** (209–212) and solo 3's moving **g♯ → a♯ → b** (225–229, the E
   major → F♯7 → B resolution). Two half-bar breaks where the melody lands on a non-adjacent
   string (210.3 b′ on A; 226.3 open A); 211.1 a′ sul D so the b holds. The user's recollection
   (g♯ in statement 1; "f♯ for two bars" in statement 3) was reconciled against the dump: no
   cello has g♯ under 205–213, and solo 3's f♯ (221–224) is F♯3, below the open G. No dynamic on
   the lower voice (a sustained double-stop under an f line). 214.1/230.1 cello quarters dropped.

Known losses: the harp/clarinet rocking figure, the Cb and brass pedals, V2's f♯″ upbeat at
229.3, the flutes' tail at 221–222, solo 3's g (209–212, the open G under a D-string melody —
not taken; solo 2's b preferred as the pedal), solo 1's d′/e′ where they share the melody's
string. All accepted. (The four solo cellos were a known loss until 2026-10-27.)

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

### Episode 10 — bars 253–272 "Whirl vs theme" [G] (decided 2026-10-27; logged from the file header)

The deciding session did not write this entry; reconstructed 2026-10-27 from
`ep10-whirl-vs-theme.ily`'s comments, which remain the primary record.

Orchestra (from the dump): 253.1 tutti G stamp; V1a alone whirls — two triplet-8th sweeps up
and down a two-octave arpeggio, then the bass note as an accented quarter on beat 3 tied into
the next bar. Theme 2's head *ten.* three times in the brass, four bars each (upbeat on 3 →
three tenuto bars → resolution on 1): Tb1 at C 253.3–257.1, Tp 1/2 at A 257.3–261.1, Bn 1/2 +
Tb 1–3 (octaves) at B♭ 261.3–265.1, cresc; the winds echo each head a bar later inside the
whirl's own pitches. 265–272 f: D major / E♭ major alternating, strings' staccato quarters with
the accented `cis'` and Tb1's `d'->( cis')` across each barline, Tp d tremolo, winds + Xy Theme
1's head in the E♭ bars → 273.1 German sixth tutti.

Decisions:

1. **The theme is the whirl's bass.** The brass articulates on 1 and 3 — exactly where the whirl
   articulates its bass — and at every upbeat/resolution the theme's note already *is* V1a's bass.
   So the theme's note replaces the whirl's lowest note on beats 1 and 3 (V1a's ties dropped
   where the theme re-strikes); the upbeats 257.3/261.3 ride the held bass as double-stops
   `<a f'>`, `<bes f'>`. Tp's statement taken 8vb (the whirl's register). Exception 263–264:
   the `c'''` peak needs 3rd position, where the small-octave a/g are out of reach, so the theme
   rides beat 3 *above* the bass (`<c' a'>`, `<c' g'>`). Precedents: Ysaÿe "Obsession", Ernst
   *Erlkönig*, the Chaconne's arpeggio variations (theme notes as chord tones inside figuration).
2. **265–272: the German sixth spelled out.** The strings'/Tb1's `cis'` as the bottom note of
   every E♭ bar (V1a's 270–272 ties dropped), Tb1's `d'->( cis')` literal across each barline.
3. Positions climb with the crescendo: 1st (253–260), 2nd (261–262), 3rd (263–264), 4th
   (265–272: `cis'` 1st finger, `d'''` 4th, `ees'''` = the E♭ string's octave node). Slurs are
   V1a's own; the performer may re-bow. Dynamics V1a's: mf 253, cresc 262, f 265.

Known losses: horn harmony, the wind echoes (inside the whirl's pitches except 263.3–265.1's
`bes''` over C minor), Tp's held c″/c′ 263–264, the Tp tremolo and the strings' quarters
265–272, the Theme-1 head in the E♭ bars (its e♭/g are in the whirl), the fis bass of the D bars.

### Episode 11 — bars 273–308 "Marcato, dim., the wind" [H] (decided 2026-10-27, user + agent)

Orchestra (from the dump; the structural map above is the corrected reading): (1) **273–280**
hammer blows f, `2 4` marcato (engraved `\rtoe` in Le Concert — the printed score shows `^`),
winds/brass on the odd bars and strings + Tp on the even, each section resting in the other's
bar: Gr6 (c♯–e♭–g–b♭) → D, Gr6 → D, B°7 → C, A°7 → B♭. (2) **281–288** the winds' chorale
dim. → p 287: Fl1/Pic/Hb1 `a'' g'' f'' ees'' d'' ees'' d'' ees''` (→ `d''4` 289.1) doubled at
the octave below by Hb2, Cl/Bn/Tb in thirds beneath (F♯°7, Gm, F, E♭, then D7/E♭ alternating);
strings silent. (3) **289–292** strings p: V1a `d' ees' f' g'` rising over the Vc/Cb bass
`c bes, a, g,` falling (V2/Va inside), C1/C2 d′/d pedal to 296; **293–296** D chord on beat 1
with rests (V1a `a'`, V2 `<a fis'>`, Va `fis`, Vc/Cb `d`), timp `a,` repeated 8ths on beats
2–3, `d a, d` in 296. (4) **297–301** the winds' chromatic descent as a relay — Fl1 `g''`→`g'`
297.1–299.1 handed to Cl1 `g'`→`fis` 299.1–301.1 (Fl2/Cl2 a third below, Bn1 an octave below
Cl1) — under V1a's *legg.* Theme-1-head figure (`r4 g'' bes'' g'' a'' | bes'' r ees'' g'' ees''
f'' | g'' r bes' ees'' bes' d'' | ees'' r ees' ×4 | d'8`; Va 8vb, V2 pizz div. + Xy doubling
its downbeats), Tb/Bn2 C-minor pedal p; **301–304** the vamp again with V1a `<d' a'>`, cresc.
hairpin to 304; **305–309.1** the same, V1a/Va/V2/Xy identical, winds now Fl1 alone running the
whole descent an octave up `g'''`→`fis'`. VSolo re-enters 309.3 `<d' a'>4-.\f`.

Decisions:

1. **273–280: the violin plays every bar; the antiphony becomes dissonance/resolution and
   voicing.** Dissonant (wind) chords four-string with the open E♭ or a barre on top, resolutions
   mostly three-string, all 1st position: `<cis' g' bes' ees''>` (Gr6; the hand's `cis'` from
   Episode 10 becomes the bass), `<d' a' fis''>` (the project's D stamp), `<b f' d'' aes''>`
   (B°7, 3rd-finger barre across A/E♭), `<c' g' e''>`, `<a ees' c'' ges''>` (A°7 — the identical
   hand shape a tone lower, half position), `<bes f' d'' bes''>` (the strings' own voicing less
   doublings, V1a's `bes''` on top). Rejected: colouring the two sections differently (both are
   arco f marcato in the source) and the four-string `<a d' a' fis''>` for D (the orchestra's
   bass is d). Engraving: marcato forced above (`^\marcato`) — stems-up chords would flip it to
   the inverted form.
2. **281–288: shifted octaves** by the octave rule (Fl1 + Hb2 are a literal octave doubling),
   `<a' a''>` → `<d' d''>` descending through positions 4–3–2–½–1, `2 4` rhythm kept, dim. to p
   287. User's call over a single line at the flute's octave.
3. **289–292: the wedge as double-stops with the bass an octave up** (Episode 1's licence):
   `<c' d'>` `<bes ees'>` `<a f'>` `<g g'>` — M2 → P4 → m6 → P8, the orchestra's opening wedge
   made audible on one instrument. The winds' `d''4` at 289.1 is dropped (the strings' pitch
   class, and the hand is on the wedge).
4. **293–296 / 301–304: the vamp with the timpani as the open A.** Chord on 1 (`<d' fis' a'>`
   4–2–0 at p; from 302 V1a's own open strings with the third above, `<d' a' fis''>`, the brighter
   voicing for the crescendo), then the timp's `a,` 8ths as `a'2:8` and its `d` as the open D
   (296.3/304.3). A literal lift at the octave, the only motion in the source's vamp bars,
   carrying the 302–304 hairpin. User's call over bare chord + rests. Horn pedal not carried.
5. **297–308: the winds' chromatic descent both times, not V1a's figure.** User's call, and a
   stated principle: *by now the listener knows the repeated themes — like a quantum image they
   should resonate in the mind if the arrangement has done its work — and the novel material here
   is excellent.* Statement 1 = the Fl1→Cl1 composite `g''`→`g` (24 8ths; Cl1's final `fis` at
   301.1 is below the open G, so the run resolves onto V1a's own `d'8-.`, the figure's cadence
   note and the bass D). Statement 2 = Fl1 alone an octave up, `g'''`→`g'` over 305–308 — the
   register escalation the orchestra writes; its goal note on 309.1 (Fl1 `fis'4` or V1a's
   `d'8-.`) is Episode 12's first decision. Runs slurred per bar (the source's slur is the whole
   phrase; the performer re-bows), Fl1's accent on the first note, p at 305. The Tb C-minor stamp
   under the run's accented downbeat is not carried.
6. Dynamics as source: f 273, dim 281–286, p 287, cresc 302–304 (hairpin to 304.3 per Ti), p 305.

Known losses: Tp's d″/d′ inside the string chords; Bn2/Tb3's bass octave; the horn pedals; V1a's
*legg.* figure with its Va octave and V2 pizz/xylophone downbeats (both statements); the C-minor
pedal; the runs' parallel voices (Fl2/Cl2/Bn1); the Cl1 handoff note `fis` at 301.1.

Corrections to the transcript/map: 289–296 is a **wedge into a D vamp**, not "strings p Theme 1";
the "wind chromatic runs" are one two-octave descent relayed Fl1→Cl1 the first time and Fl1
alone 8va the second.

### Episode 12 — bars 309–337 "Summons, stamps, two themes" [I] (decided 2026-10-27, user + agent)

Orchestra (from the dump; the structural map above is the corrected reading): (1) **309.1** the
goal of Episode 11's second run — Fl1 `fis'4)` over a p D chord (Fl2/Cl2 d′, Cl1 f♯, Bn1 a,
Bn2 d, V1a `d'8-.`, V2 d″/d′, Vc/Cb d pizz, Ti `d8 d8 d4-.`, Xy d′); then the solo's tritone
summons 309.3–312.2, alone (310–311 are rests in every other voice). (2) **312.3–320** a strict
alternation. Strings pizz, waltz-shaped (upbeat on 3, then beats 1–2), in the solo's rests: 312.3
D (V1a d″, V2 d′, A `<a fis'>`, Vc/Cb d, Ti d pp); 313.1–2 E♭7 (V1a `<bes' g''>`, V2
`<g' ees''>`, A `<bes g'>`, Vc/Cb d♭); 316.3 E♭7 again; 317.1–2 and 318.3 A♭ (V1a a♭″, V2
`<aes' ees''>`, A `<aes ees'>`, Vc/Cb c); 319.1–2 C♯°7 (V1a d♭‴/d♭″ div., V2 `<g' e''>`, A
`<g e'>`, Vc/Cb b♭). Then the solo's low staccato stamp — `des'` ×12, `c'` ×4, `bes` ×4 in
`8 8 4 4 | 8×6 | 4 4` — with **Bn1 in unison** and the wind choir stamping the same rhythm a
chord above: E♭7 (Cl2 e♭′, Cl1 g′, Hb2 b♭′, Hb1 f″/b♭′ oscillating), A♭ (Cl2 e♭′, Cl1 a♭′, Hb2
e♭″, Hb1 e♭″→b♭″), C♯°7 (Cl2 e′, Cl1 g′, Hb2 c♯″, Hb1 g″); Fl1 adds a p descant
`cis''' | fis''' fis''' fis''' e''' | d'''` 319.3–321.1. 320.3→321.1 a p tutti cadence G→D
(brass/Bn/Ti/Trg). (3) **321–337**: Theme 2 in the solo, *espress.*, 323.3–337 (no dynamic
given; its own hairpins 327.3–330.1, 333, 336–337; p 331.3), over **Theme 1's head in V1a pp
staccato** in four two-bar cells — `r4 d' fis' d' e' | fis' e' d' | f' e' d'` on d′ (321.2),
then on c♯′ (325.2), b (329.2), a (333.2, two bars only) — and a pp D pedal in repeated 8ths
(V2 d′/a, Va f♯, Vc/Cb d) whose upper notes shift every two bars (A 325, D7 327, G 329, Gm 331,
A 333, C/E♭ 335). 337: the solo holds `d'2.~` while the strings begin a rising chromatic line
(V1a `d'2( ees'4 | e'2\< f'4)` with V2/Va/Vc in parallel) over a Ti roll and horn d pedal —
Episode 13's texture starting a bar early.

The user's opening proposal: *"we might actually substitute some of the orchestral notes over
the solo notes"* — the first episode where the solo plays nearly throughout and its material is
partly accompaniment-grade. Resolved as **layer, don't replace**:

1. **309.1 = `fis'`.** The run was Fl1's, so its goal note lands (at 301.1 Cl1's `fis` was out of
   range and V1a's `d'8-.` stood in). The Ti rhythm is not carried.
2. **313–320: the wind chord *over* the solo's stamp, as a double-stop.** The solo's `des'`/`c'`/
   `bes` is the bass of a homorhythmic wind stamp, and it stays on every beat at f; the one chord
   tone that sits on the D string rides on top: `<des' g'>` (E♭7's tritone — the summons'
   interval a semitone lower), `<c' aes'>` (A♭; `<c' ees'>` rejected as sounding C minor),
   `<bes e'>` (C♯°7's tritone). Hb1's f″–b♭′ oscillation is on the E♭ string and unreachable
   over a G-string bass — accepted loss. **User's call** over the full four-string stamp on every
   8th (heavy; buries the solo's gruff line in a chord) and over the bare solo (loses the harmony
   that gives the passage its lilt).
3. **The pizz chords in the rests are lifts**, each voiced with its bass so that the chord's
   bottom note becomes the solo's next stamp: `<des' g' bes' ees''>` (4–3–1–0 — **the same hand
   as Episode 11's Gr6 hammer blow `<cis' g' bes' ees''>`**, now plucked and spelled as E♭7),
   `<aes' c'' ees''>` (4–2–0; the bass c is the solo's 317.3), `<bes g' e''>` (2–3–4; V2's dyad
   over the bass 8va). 312.3 is the project's D stamp `<d' a' fis''>`. Each three-chord group
   carries one `pizz.` and the solo's re-entry one `arco` — a short passage, as 203–205, not
   three per-note labels. The f/p alternation is engraved on every group (stamps f, chords p).
4. **320.3–321.1: the cadence as open strings `g`→`d'`** (the brass/bass register), p; Fl1's
   stratospheric e‴→d‴ dropped.
5. **323.3–337: the solo's Theme 2 kept intact.** The tempting substitution — strike each held
   note (`e''2.`, `a'2.`, …) and let V1a's cell fill the bar — was checked against the geometry
   and rejected (user): the cells lie on G/D under a melody on A/E♭, with `cis'`/`b`/`a` on the
   G string, so superimposition is impossible and the only way in shortens the solo's notes,
   which inverts the texture (espress. foreground, pp shadow) and spends the last lyrical moment
   before the 338–437 drive. The "known themes resonate" principle applies: Theme 1's head is on
   its ninth hearing. Carried instead: **cell 1 whole** (321.2–323.2, entirely in the solo's
   rests), **cell tails in the two-beat rests** (327.1–2 `ees' d'`, 331.1–2 `d' c'`), and
   **331.3 `<bes g'>`** — V1a's b♭ under the solo's p entrance, the G major → G minor shift
   made audible. V1a's `d'4-.` at 323.3 is not added (the espress. entrance kept clean); its
   `c'` at 327.3 is non-adjacent to the solo's `c''`. Editorial *(f)* at 323.3 (the solo
   carries no dynamic after 309 and now follows pp cells — Episode 8's 221.3 precedent).
6. **337 tie deferred** (resolved 2026-10-27 — see Episode 13 below). `d'2.~` into Episode 13's
   placeholder was an "unterminated tie" warning; engraved as `d'2.` until Episode 13 was entered.

Known losses: the Ti figure at 309; Hb1's oscillation 314–316 and b♭″ 318; Fl1's descant
319.3–321.1; the pp D pedal and its harmony changes 321–336; V1a's cells 2–4 under the held
notes; the Ti roll / horn pedal at 337. All accepted.

Corrections to the transcript/map: **no *Dies irae* in [I]** (it is [D] 181–185); 313–320 is not
"winds parody + Vln I answers" but the solo's own stamp doubled by Bn1 under wind chords, with
the strings' pizz waltz in its rests; 321–337 is the **two-theme combination** (Theme 2 solo /
Theme 1 head V1a), the structural event the transcript missed.

### Episode 13 — bars 338–361 "The long string phrase" (decided 2026-10-27, user + agent)

Orchestra (from the dump; the map's reading corrected above): (1) **337–353** the strings' one
phrase over a D pedal (Ti roll pp 337–345, C3/C4/Bn/C1-2 d): V1a `d' ees' | e' f' | a' aes' g' |
fis' g' | a' bes' | d'' des'' c'' | b' c'' | ees'' d'' | f'' ees'' | a'' aes'' g''` with V2 about a
fourth below, Va an octave under V1a, Vc/Vc-b under (D, E♭, E, F major triads, then F♯°/A°/D° →
G minor / C minor pairs — a V°→i chain climbing by half-steps); from 347 `fis''2( g''4)`
repeated (F♯° → G minor), cresc. 348–353. (2) **346.2–357** the winds' Theme 1 head in **C minor**
(`r4 c''' ees''' c''' d''' | ees''' c''' ees''' d''' c''' bes''`, f; Fl at ''', Hb/Cl in octaves
below, Pic from 350), continuous 8ths from 352; V1a's accented `a''` fills its beat-1 rest on
346/348/350; from 354 V1a (at ''') and V2 (an octave below) play the figure while Tp/Tb/Tba enter
`fis g / c d / a bes` cresc. (3) **358–361** the tutti D7(♭9) chord on 358.1 and V1a's
non-legato descent `ees''' c''' ees''' d''' c''' a'' | c''' bes'' a'' fis'' a'' g'' | fis'' c''
ees'' d'' c'' a' | c'' bes' a' fis' a' g'` (V2 unison from 360), which continues into 362.

Decisions (user's calls marked):

1. **337.3–339.1: the line rides over the held d'.** The solo's d' (immutable) is held to 339.1;
   it is played on the **G string, 4th finger**, with V1a's `ees' | e' f'` on the D string above
   it as chord upper notes (`<d'~ ees'>`, `<d'~ e'>`, `<d'~ f'>`): the orchestra's minor-/major-
   second clashes against the solo, kept. 339.1 is the solo's d' alone — V1a's `a'` is dropped
   (G + A are non-adjacent strings). Rejected: the solo's d' alone with the line starting at
   339.2 (loses the rising seed), a re-struck `<d' a'>` at 339.1 (breaks the tie early).
2. **339.2–353: V1a's single line.** Top line with the source's swells; the chain's harmony is
   implied. Rejected: V1a + V2 as double-stops (parallel fourths/tritones, heavy at p, 2nd/3rd
   position shapes) and double-stops only at the peaks.
3. **346–353: the strings' phrase is not interrupted by the winds' figure (user).** *"Let's keep
   to the strings here and play the eighth-note figure when the strings get it later, so that the
   sweep of the long string phrase completes all the way to the end of 353."* The winds' Theme 1
   head (a known theme by its eleventh hearing — the "known themes resonate" principle) waits
   until 354. The open-D drone double-stop under the figure was therefore not used.
4. **350–353: octaves, to increase the size (user).** The orchestra's own V1a/Va octave doubling
   (not possible earlier in the phrase, where Va's pitches fall below the open G), D–A pair,
   positions 4 → 3: `<a' a''>-> <aes' aes''> <g' g''> | <fis' fis''> <g' g''>` ×3, as Episode
   11's 281–288. Entrance at 350 confirmed (user): *the last chromatic descent, then the
   repeated second subphrase half runaway until the eighth-note breakout descending line.*
5. **354–357: the figure at V1a's pitch (ees'''–bes'')**, slurred per bar, accent on the first
   note (the winds'), f → ff cresc. to 358.1 (the brass entry's hairpin). V2's octave below
   not doubled (the octave is impossible on the A–E♭ pair at ees''/ees'''). Rejected: the
   Ob/Cl octave (c''–bes', 1st position) and the open-D drone.
6. **358–361: V1a's descent as written from ees''' (user, confirming the recommendation).** E♭
   string, 4th position (the 354–357 hand), non legato, ff; 361 lands on `a' g'`, 362 opens
   `fis' c' ees' d' c' a`. **358.1's tutti hit is a quarter-note wedged chord `<d' a' ees'''>4-!`
   under the run** (user, after review): open D, open A and the run's first note — root, fifth
   and ♭9 of D7(♭9), and the solo's own summons interval a′–e♭″ recalled at the orchestra's
   arrival. Engraved as a second voice (stems down) so the run keeps all six 8ths; the open
   strings ring for the quarter. The inner voices (f♯, c) are not carried.
7. **Dynamics:** pp at 337.3 (the Ti pp), p at 346.1 (Ti "sempre p"), source swells, cresc.
   348–354, f 354.1, cresc. to ff 358.1.
8. **The 337 tie is restored** (`d'2\!~ <d'~ ees'>4(\pp` in `ep12-summons-diesirae.ily`): the
   Episode 12 entry deferred it; ties run 337 → 338 → 339.1.

Known losses: V2/Va/Vc/Vc-b of the chain (harmony), the D pedal (Ti roll, horns, Bn), the winds'
346–353 figure and V1a's beat-1 accents (346/348/350 — the `a''` 346.1 is kept as the phrase's
peak), Pic's entry, Tp/Tb/Tba 354–357, V2's octave below the figure, 358.1's inner voices. All
accepted.

### Episode 14 — bars 362–393 "Runs and tutti" [K] (decided 2026-10-27, user + agent)

Orchestra (from the dump; the map's reading corrected above): (1) **362–365** V1a/V2 in unison,
`fis'8 | c'8( ees'8\sf d'8 c'8 a8)` then `r8 c'( ees'\sf d' c' a)` ×3 — the 358 descent's
landing cell; horns/Tp staccato quarter on every downbeat 361–366 = D7 (`d`/`c'`/`a`, `a'`/`fis'`).
(2) **366–369** Fl1/Fl2/Cl1 `r8 d'( ees' e' f' fis' | g' gis' a' bes' b' c'' | cis'' d'' ees'' e''
fis'' g'' | a'' bes'' c''' d''' e''' fis''' | g'''4)` f, cresc. from 368 (Pic/Cl2 from 368.2); Bn1/2
in contrary motion from d′ down to g,; Hb `d'2.~` f and C3/C4 d′ held under; V2 `fis' g' | a' bes'
c'' d'' e'' fis'' | g''` and Va a 6th below from 368.5; Cb `r4 d c bes, a, | g,`. (3) **370–377**
ff tutti Theme 1 in G minor: V1a `<g d' bes' g''>4 g''8 bes'' g'' a'' | bes''4 a''8 bes'' g'' bes''
| a''( g'') g'' bes'' g'' a'' | …`, V2 the same at g″, Va/Vc at g′; Fl/Hb/Cl/Pic/Bn/horns hammer
repeated-8th g and b♭ (no d); **Tb1/2 countermelody** `r r d' | g'2 g'4 | f' | e' | ees' | d' e'
g' | fis' e' d' | e'2 e'4 | fis'4 r d'` (repeated 379–386 with `d' g' bes' | a' fis' d' | fis'2
e'4 | d'`); Trg roll throughout; 376–377 `d'''4 e'''8 fis''' d''' fis''' | a'''4-!` (V1a; V2 an
octave down) then `a8 ais b cis'` in V2/Va/Vc/Cb ("non legato" in Cb), Ti `a, ×4 | d d d g, g,`.
(4) **378–385** 378.1 D-major stamp (`fis'''`/`fis''`/`fis'` in winds and Tb, `d'4-!` V2/Vc),
V1a/Va/Tba/Cb `d'8 c' bes a g4`; from 378.2 V2 (g″) and Vc (g′) restate the theme, Va from 379,
while V1a arpeggiates in triplet-measured tremolo `d'' g'' bes'' | d''' g''' g''' | g''' …` and
sits on g‴ to 383, Pic at bes″; 384 all violins tremolo `fis d fis` (V1a at ‴), 385 `a` tremolo
with the winds' `fis fis e e` (6–5) and the Vc/Cb rise `a ais b cis'` again. (5) **386–389** 386.1
tutti d (V1a `d'''4`), then strings alone: V1a/V2 `d'8 d' d' d' | cis'4 d'2:8` ×3 on the open-D
pitch, Vc d′, Va/Cb `d`/`cis` an octave down; Ti d on downbeats, GC mf from 387; no new string
dynamic. (6) **390–393** winds re-enter `r4 d2:8` at 390.2 (Fl1 d‴, Hb/Cl d″, horns/Tp d′/d″);
391–393 downbeats `c!` in strings/Bn/Tb3/Tba, `fis` Tb1/Fl1/Pic/Hb2/Cl2, `a` Tb2/Hb1/Cl1/horns,
`d` Fl2/Tp/Ti = D7; GC/Cym ff 391–394 → [L] 394 `bes4 d'8 g' bes' d''` (G minor).

Decisions (user's calls marked; all four recommendations confirmed by the user):

1. **362–366.1: the brass stab fills the cell's downbeat 8th** as `<c' fis' a'>8-.` (7th, 3rd,
   5th of D7, open A on top, 1st position); 362.1's `fis'` is the line's own landing note inside
   it. The cell keeps V1a's slur and `\sf`. Rejected: the stab as a second-voice quarter (as
   358.1) — an 8th staccato chord is the brass's articulation and keeps one voice.
2. **366–369: the winds' rise from the open D, in the flutes' octave**, slurred per bar as
   Episode 11's runs, f → cresc. 368 → ff 370.1. A lower octave is not available (the run would
   have to drop a 7th at 368, and `d` below the open G is not a start). **Arrival on V1a's own
   `<g d' bes' g''>` at 370.1 (user)**, not the flutes' g‴: the run reaches fis‴ (6th position)
   and the four-string G-minor crash follows in 1st position — run-then-chord. Rejected: the
   open-string `<g d' a' g'''>` (keeps the run's goal, loses the third).
3. **370–375: Theme 1 ff at g″ with the G-minor four-string chord on the odd-bar downbeats**
   (`<g d' bes' g''>` 370, `<g d' bes' bes''>` 371/373/375) — Episode 4's 85–88 texture, arco.
   **The trombones' countermelody is not carried:** at any octave it lies two strings away from
   the theme (g′–d′ on the D string vs the theme on the E♭ string; an octave up it sits inside the
   theme), and alone it is half-notes with no tune — the "novel line" principle does not apply
   when the novel line cannot stand without the known one.
4. **376–377 and 384–385 at V1a's octave (user)**: `d'''4 e'''8 fis''' d''' fis''' | a'''4-!` (a‴
   is the piece's top; 4th → 8th position) and the triplet-measured tremolo `fis''' d''' fis''' |
   a'''`; both then drop three octaves to the open A for the bass rise `a ais b cis'` — the solo
   makes V2's own 377 gesture (`a''4-! a8 ais b cis'`) twice. Rejected: V2's d″–a″ (safer, less
   brilliant).
5. **378.1 and 386.1: the D-major stamps as `<d' a' fis''>`** (open D, open A, fis″ low-2 on the
   E♭ string), `-!` at 378 as V2/Vc. V1a's 378 descent `d' c' bes a g` yields to the theme's
   restart at 378.2 (the theme's head would otherwise be truncated).
6. **378.2–383: the second statement in sixths and octaves over the winds' hammered bes′
   (user)**: `<bes' g''> <bes' bes''> <bes' g''> a''` (a″ single — bes′ under it is a major 7th),
   same odd-bar chords. The orchestra's own thickening here (V1a's tremolo to g‴, Pic) rendered
   as double-stops; the 1st finger stays on bes′ throughout. Rejected: V1a's tremolo arpeggio in
   place of the theme (five bars of tremolo on one note is colour, not a line — the "known
   themes resonate" tie-breaker needs a line to resonate against); both statements plain; both
   double-stopped.
7. **385: beat 1 tremolo a‴, beats 2–3 the Vc/Cb rise** — the solo becomes the moving section
   mid-bar, exactly as V2 does at 377.
8. **386–389: the strings-alone vamp bare (user)** — `cis'4 d'2:8`, the open D with the G-string
   cis′ (4th finger), nothing added, ff running (no new string dynamic in the source; the GC's mf
   is the drum's, not the strings'). **390.2–393: octaves `<d' d''>` on the 8ths** as the winds
   enter on them, and **the four-string D7 stab `<c' fis' a' fis''>` on 391–393's c♮ downbeats**
   — the opening stab's chord with the winds' fis″ on top, ff with the GC/Cym. Rejected: V1a's
   single line throughout 386–393.
9. **Dynamics:** ff from 358 runs through 365; f 366.2 (Fl), cresc. 368, ff 370.1, `-!` 377.1
   and 378.1, ff restated 391.1 (GC/Cym).

Known losses: Tb1/2's chromatic countermelody; the bassoons' contrary-motion descent, the Hb/C3–4
d′ pedal, V2/Va's lower octaves and Cb's `d c bes, a,` under the run; the winds'/horns' g/b♭
hammer (only as the downbeat chords); V1a's 378 descent and 379–383 tremolo arpeggio; V2's lower
octave of both tails; the Trg roll 370–386; Ti/GC/Cym; the winds' 6–5 (`fis`→`e`) at 385. All
accepted.

### Episode 15 — bars 394–415 "Ornamented" [L] (decided 2026-10-28, user + agent)

Orchestra (from the dump; the map's reading corrected above): **one line, V1a/V2 in unison,
and a waltz frame.** (1) **394** the tutti `-!` downbeat — G minor in first inversion (Vc/Cb/
Bn2/Tb3/Tba on B♭; Fl1/Pic g‴, Hb1/Cl1 b♭″, Hb2/Cl2 g″, Tb1 g′, Ti d, GC/Cym) — with V1a/V2 on
`bes4`, then their upbeat arpeggio `d'8 g' bes' d''`. (2) **395–398** the ornamented figure:
slurred descending 8th pairs with an upper acciaccatura before each pair from the second,
`g''( bes'') \acc bes'' a''( gis'') \acc a'' gis''( g'') | \acc aes'' g''( fis'') … | … b'( bes')`.
(3) **399–401** `aes' g' aes' c'' bes' aes' | g' fis' g' bes' a'! g' | fis' a' d'' fis'' a'' d'''`.
(4) **402** the tutti G hammered `8 8 4` (Ti `g,`, Tp/Tb/horns/Hb2/Cl2/Bn, Fl/Pic `bes'' d''' g'''`,
Cym/GC `-!`) while V1a/V2 play `bes''8 r8` and restart `d' g' bes' d''`. (5) **403–409** the phrase
again, identical (403.2 `a''( aes'')` for 395's `gis''`). (6) **409–415** `fis' a' d'' fis'' a''
d''' | bes'' g'' d'' bes' g' d' | …` alternating, then `d' fis' a' d'' fis'' a'' | a' d'' fis'' a''
d''' fis'''` (V2 `a' d'' fis'' a' d'' fis''`) → 416 `g'''4\ff f'''! ees'''`. Cb ff and the Trame's
*poco stringendo* at 409. Under everything: Hb/Cl/Bn + Va/Vc/Cb quarter chords on beats 1–2, rest
on 3 — Gm/B♭ · Cm · D/F♯ · Gm · A♭/C · Gm/D · D (395–401), then D / Gm/D over the D pedal, Tp/Tb/
horns 3–4 joining on D at 414. Horns 1/2 "Changez en Mi♭" at 403. No solo violin anywhere.

Decisions (user's calls marked; the recommendations confirmed):

1. **V1a verbatim.** It is the only line, it appears once in the piece (the "novel line"
   principle has nothing to weigh against), and it is violin writing already: the descent is all
   1st position on the E♭/A strings, the arpeggio peaks are the section's own shifts. The source's
   acciaccaturas, slurs, the `a'!` courtesy natural and the `aes''`/`gis''` spellings are kept;
   the open E♭ carries `\open` where the descent reaches it (397/405).
2. **The waltz chords are not carried.** Under the acciaccatura pairs a double-stop would grind a
   leggiero figure; in 399–401 the figure spells its own harmony (A♭, G minor, D); under the
   sweeps every chord tone is already in the arpeggio and the pedal is the open D the sweeps land
   on. Rejected: the viola's chord as a double-stop on beat 1 of each descent bar in the repeat
   (geometry: barre fourths under slurred semitones), open-G/D drones under 399–400 (same-string
   or wrong-bass).
3. **394.1 `<bes d' bes' g''>4-!`** — V1a's `bes` is the orchestra's bass, so the stamp is the
   first-inversion tutti with that bass (3–0–1–2); every string moves by step from 393's D7 stab
   `<c' fis' a' fis''>`. Rejected (user): the root-position crash `<g d' bes' g''>` of 137/370 —
   the orchestra's bass here is B♭.
4. **402.1 `<g d' bes' bes''>8-! r8`** — the root-position hammer (Ti/Tb/Tba on G) under V1a's
   `bes''`, 0–0–1–4 in the hand of the restart; **V1a's 8th rest kept (user)** — the breath before
   the restart; the tutti's second hammer as `<g d'>8-!` was offered and declined (the third
   coincides with the restart's `d' g'` anyway). Fl/Pic's `d''' g'''` top not carried.
5. **The repeat identical** (403–409), as the orchestra's.
6. **415 an octave above V1a (user): `a'' d''' fis''' a''' d'''' fis''''`.** 414–415 become one
   four-octave D-major climb from the open D into the Animato, instead of V1a's drop back to
   `a'` for the last bar. `a'''` is 377's top, `d''''` is 172's; **`fis''''` (27 semitones up the
   E♭ string, a tone above 173.1's `e''''`) is at the fingerboard's edge** — entered stopped, as
   172/173.1 were re-decided on 2026-10-25; fallback if it will not speak at ff: the artificial
   harmonic (`fis''` stopped, touch `b''`). Rejected: V1a as written (the second half alone
   leaps), and 415.4–6 as octaves with V2 (the source's only octave doubling in the episode —
   A–E♭ 6-semitone stretches at ff in a stringendo). **Consequence for Episode 16:** 416's
   `g'''4\ff f'''! ees'''` (V1a; V2 an octave below) is now a seventh below the solo's last note;
   its register is Episode 16's first decision.
7. **Dynamics:** ff running from 391 (the source gives V1a nothing new at 394); ff restated at
   409.1 (Cb's) under the Trame's *poco stringendo*.

Known losses: the waltz frame (Hb/Cl/Bn, Va/Vc/Cb chords on 1–2); Fl/Pic's `d''' g'''` at 402;
Ti/GC/Cym; V2's low 415. All accepted.

Corrections to the transcript/map: the grace-note figure is **395–398 and 403–406** (an 8-bar
phrase stated twice with a tutti hammer between), not "394–404"; the "ascending figures" are the
D / G-minor arpeggio sweeps 409–415 over a D pedal; the tutti at 394 is G minor **over B♭**.

### Episode 16 — bars 416–437 "Animato" [M] (decided 2026-10-28, user + agent)

Orchestra (from the dump; the map's one-line reading corrected above): V1a is again the only
moving line — the ff descent `g''' f''' ees'''…` (416–418), Theme 1's head on A♭ and F♯ over
the tritone pair of tremolo chords (419–420), the descent an octave lower in three octaves
(421–423), the head an octave lower (424–425), then the whole string body in unison on `g8 bes g
a bes4 | c' b bes a aes4` from the open G (426–429) under the winds' stamps, [M] with the full
G-minor tutti stamped on beats 1–2 (430–432), fff with the figure running in 8ths and the chord
on every beat (433–437). Horns 1/2 are silent (re-crooked in E♭ for 438). No solo violin.

Decisions (user's calls marked; the recommendations confirmed):

1. **416–425 an octave above V1a (user): this is the climax of the whole piece, and the
   virtuosic licence is spent on register.** Ep 15's climb to `fis''''` resolves to **`g''''`**
   (28 semitones up the E♭ string, the piece's top; `ees''''` at 24 is the string's double
   octave), the descent `g'''' f'''' ees'''' | f'''' ees'''' d'''' | ees'''' d'''' c''''`
   stopped, as 172/173.1/415 were; fallback if it will not speak at ff: artificial harmonics in
   1st position (stop `g''`/`f''` on the E♭, `d''`/`c''` on the A, touch a fourth above; the
   `ees''''` = the open E♭ touched at `aes''`). 419–420 at `aes'''`/`fis'''`, 424–425 at
   `aes''`/`fis''` (= V1a's 419–420 text). **416.1 is a plain `g''''-!`** — no chord can sit
   under a note at the fingerboard's end; the crash resonates. Rejected (agent's offer): V1a as
   written with a `<g d' bes'' g'''>` crash (the seventh drop after `fis''''`).
2. **421–423 in octaves, still in the upper register (user).** The orchestra's three-octave
   doubling (Fl1 / V1a+Hb2+Cl1 / Bn1) → the octave rule → `<g'' g'''>`…`<c'' c'''>` on the
   A–E♭ pair, coming down from the peak. The strings are a tritone apart, so these are
   6-semitone 1–4 octaves: at 10–16 semitones the physical span (~53 mm) is narrower than a
   1st-position 1–4 (~73 mm), widening to ~80 mm only at the last `<c'' c'''>` (A 3 / E♭ 9) —
   the Ep 15 objection (6-semitone stretches *in 8ths, in a stringendo*) does not apply to ff
   quarters. **421.1 `<g d' g'' g'''>4-!`** — the tutti crash (Cym/GC/Trg) as the open G and D
   rolled under the octave; the third (`bes`) yields to keeping the line in octaves.
3. **426: the drop to V1a's own open G** — two octaves and a sixth from 425's `a''`. The figure
   stays on the G string through 437.
4. **426–432 the winds' beat-1–2 stamps as double-stops, escalating at [M].** 426/428 `<g d'>`
   on both beats (open strings; beat 2's `d'` is a small liberty — the winds there are the bare
   `g'/g''` octave — the chord is still Gm); 427/429 `<c' fis'>` then `<bes fis'>` — the
   orchestra's C + F♯ stamp, the *diabolus*; [M] 430–432 `<g d' bes'>` on both beats, the full
   chord the tutti now stamps. Rejected: beat-1-only stamps; the bare figure.
5. **433–437 fff: single line + a chord on every beat (user).** The figure runs `g bes g a bes g
   | a bes g a bes g` with `<g d' bes'>` / `<a d' bes'>` / `<bes d' bes'>` on the beat 8ths.
   **Hand: half position throughout** — the 1st finger parks on `bes'` (A string, 1 semitone)
   for all five bars; the figure is 0–3–0–2–3–0 on the G string (2nd finger `a`, 3rd `bes`), so
   the `a`+`bes'` pair that collides in 1st position (both 1st finger) never does. `<bes d'
   bes'>` sounds B♭ on its own but sits inside the running G; `<bes g' bes'>` (a 4th-finger
   `g'`) was considered and dropped for speed. Rejected: the figure in octaves on the G–D pair
   (the orchestra's Vc/Cb doubling; the agent's recommendation); chords only.
6. **Engraving: ledger lines, no `\ottava` (user).** 416–420 sit on 7–8 ledger lines; the score
   has no ottava bracket anywhere (172, 377, 415 are plain), and the performer sees the shift.
7. **Dynamics as source:** ff 416 (the Trame's *Animato*), fff 433; nothing new at [M].
8. **Revised 2026-10-28 (user): 426–437 supersede decisions 4 and 5.** The figure is V1a's single
   line (426–429 `g bes g a bes4 | c' b bes a aes4` ×2; [M] 430–432; 433–437 continuous 8ths),
   with the flute/piccolo's stamp imitated as a **quarter note on beat 2 above it: `g'4` / `fis'4`
   alternating at 426–429, `g'4` throughout from [M] to the double bar.** No beat-1 double-stops,
   no `<g d' bes'>` stamps, no fff beat chords: all the virtuosic energy goes into the single
   line of the stringendo's final run. Engraved as two voices (stamp stems up, line stems down).
   Hand: the stamp is on the D string over the G-string line (adjacent strings, 1st position).

Revisions to Episodes 13–14 the same day (user): **358** — no *ff* (the cresc. from 354 runs on
through 361 and now lands on an *ff* at [K] 362.1) and the single *non legato* now hangs on the lower voice, right of the downbeat and
above the hairpin; **377** — the redundant *non legato* (copied from the basses, which only start
that style there) is removed.

Known losses: the inner wind line under the descent; the Tp/horn root pedals; the tremolo chords
and Trg roll under 419–420/424–425; V2's lower third at 425; the winds' beat-3 chords 433–437
(the figure's note is the chord's); Ti/GC/Cym/Trg. All accepted.

Corrections to the transcript/map: the "ff tutti → [M] fff repeated chords" row hid the
three-terrace shape (416 / 421 / 426), the tritone pair A♭–D under Theme 1's head (419–420,
424–425), and the C–F♯ stamps at 427/429; fff is at 433, not [M].

### Episode 17 — bars 438–454 "Dawn" (Tempo 1°) (decided 2026-10-28, user + agent)

Orchestra (from the dump; map row corrected above): three events, each alone — the horns' E♭
fp (`ees'`/`ees`, tied 438–445.1), the oboe's cock-crow (440–445, on `ees''`/`bes''`/`g''`), the
strings' C♯°7 tremolo (`cis ees g bes ees'`) f → p → fermata *très long* with the timp's G strokes
and a GC roll. The strings are silent 438–444; the solo is tacet throughout.

Decisions:

1. **The horn pedal at pitch, `ees'` (horn 1, D string, 1st finger), fp, 438–439** (revised
   2026-10-28, user; the first reading took it as the open E♭ string `ees''`, the retuned
   string and the crow's starting pitch). Horn 2's `ees` is below the open G. The pedal cannot
   continue under the crow (the crow lives on the E♭ string; the D string is not adjacent), so
   it ends at 439 and 440.1's `ees''` is a fresh f attack an octave up, no tie.
2. **The cock-crow verbatim, entirely on the E♭ string** (open `ees''`, `bes''` 3rd position,
   `g''` 1st or 3rd). Its last 8th (445.1 `g''` pp, the end of the tie) is absorbed by the
   strings' f entry on the same beat; the oboe's hairpin terminates at that f.
3. **445–454 as `<g ees'>2.:16`** — the open G (the viola's `g`, and the timp's G an octave
   up) under V1a's `ees'`, 1st position, sustainable for ten bars of dim. and a very long
   fermata. The cello's `cis` (the dim-7th's defining note) is below range, and `cis'` cannot be
   fingered against `ees'` (G 3rd position vs D 1st); V2's `bes` was the other candidate pair
   (`<bes ees'>`) and lost to the open string. The timp's stroke rhythm is absorbed into the
   sustained open G. Dynamics as V1a (f 445 >, p 451 >, 453 !, 454 fermata, *très long* above,
   *toujours en dim.* below).

Known losses: horn 2's `ees`; the viola's lower `ees`; the cello's `cis`; the timp's strokes and
the GC roll as separate events. All accepted.

### Episode 18 — bars 455–477 "Déclamé and coda" [N] (decided 2026-10-28, user + agent)

Orchestra (from the dump; map row corrected above): the solo's *déclamé* f over the horns' p bed
(Gm → Gm + stopped `ees'` → A♭, 455–464.1) with one pp string stroke at 455.1; [N] the solo's
measured d′–e♭′ tremolo p → pp 473.1, under which Theme 1's head is echoed three times rising
(Va/Vc `g` pp 469–471, V2 `g'` p 471–472, V1a `g''` ppp 472–474); Fl1 carries the same tremolo
on pp to 476.1; Cb pizz `g, | a, bes, g, | d | d | g,` 473.3–477; final wind chords pp D major
(476) → G minor (477) over the strings' unison `d'` / `g`.

Decisions:

1. **The solo's déclamé and tremolo verbatim and intact (455–473.1).** The Enescu/*doina*
   licence noted at Episode 1 is not spent: the recitative is already a *doina* in Saint-Saëns's
   hand, and the project's rule is the solo's text untouched.
2. **455.1 the strings' pp stroke as `<g d' d''>`** — the open G and D rolled under the solo's f
   `d''` (V2's `bes` cannot join: G, G and A strings). The two-pizz-chord idiom of 320.3–321.1.
3. **The horns' bed as a second voice on the open strings, wherever the solo is on the D string
   or resting:** open G under the held `g'` (457–458; horn 2's `g`), open D under the A-string
   `bes'` (459; horn 4's `d`, 8va), open G under `g' f' ees'` and the held `ees'` (460–462 —
   `<g ees'>` is horn 2 + horn 3's stopped note, and Episode 17's tremolo pair), horn 2's `aes`
   under the solo's rest at 463 (a 1st-finger barre with the solo's `ees'` on beat 3). **The
   drone holds through the solo's breaths** (458.2–3, 462.2–3, 463.1–2), as the horns do — the
   Episode 12/13 rule, the orchestra folded into the rests. 456 and 464–466 bare: 456 is the
   declamation's opening gesture; the horns are silent from 464.2. Engraved as ep08's pattern
   where a spanner crosses the block (463's slur): the melody stays in the main Voice.
4. **467–469.1 the tremolo in shorthand (`\repeat tremolo`), bowed as the solo line** (revised
   2026-10-28, user): 466's `ees'` slurred into 467's, a new slur from 468.1 to the end of the
   tremolo at 469.1 (the source's 468–473 slur no longer runs through), accents 467, p 468 >.
   **469.2–473.2 the solo line is the three echoes of Theme 1's head in turn, rising, in place
   of the tremolo's continuation:** Va/Vc pp `g bes a bes | a( g) g a bes g | d'` (469.2–471.1),
   V2 p `g' a' bes' g' | d''` (471.2–472.1), V1a ppp's first three notes `g'' | a'' bes''`
   (472.3–473.2; its fourth `g''` is the Cb's pizz entry at 473.3). This supersedes the earlier
   reading (the Va/Vc echo only, as double-stops under the tremolo on the G string, V2's and
   V1a's dropped as unplayable against it): with the tremolo stopped at 469.1 all three fit in
   one line.
5. **473.3–477 the bass's pizz close, not the flute's tremolo.** After the solo's echoes the
   violin takes Cb's `g, | a, bes, g, | d | d | g,` an octave up (open G, 1st position, open
   D), *pizz. sempre* pp — Theme 1's head for the last time, at the bottom — and the two final
   wind chords as the pizz chords **`<d' a' fis''>` (476, D major) and `<g d' bes' g''>` (477,
   G minor): the chords that closed the summons at 32.3–33.1 close the piece,** and the open-G
   pizz ends it as the open-D pizz began it. Fl1's continuation of the tremolo (473–476.1) is
   not carried: continuing it would exclude both the bass and the chords. No fermata, no l.v. in
   the source; none added.
6. **Dynamics as source:** f 455 *déclamé*, *dim.* 459, p 468 >, pp 469.2 (Va echo), p 471.2 (V2
   echo), ppp 472.3 (V1a echo); the horn voice p (457).

Known losses: V2/Va/Vc's notes of the 455.1 stroke beyond the open strings; horn 1's `bes` and
horn 3's `d'` (455–458), horn 1's `c'`/horn 3's `ees'` (463–464); V1a's echo past its third note; Fl1
473–476; the winds' inner chord tones at 476–477 beyond the three-/four-string chords. All
accepted.

Corrections to the transcript/map: the solo's tremolo fades to pp at 473.1 (not "fading to pp
473" as a region); the flute's tremolo is 473–476.1, not 472–474; the pp wind chords are 476–477,
not 475–476; the coda order (horn E♭ → crow → déclamé) confirmed.

### Project-wide: known themes resonate; prefer the novel line (user, 2026-10-27)

Once a theme has been stated enough times for the listener to carry it, a further orchestral
restatement of it may yield to simultaneous *novel* material in the lift — the known figure
"resonates" unplayed. First applied in Episode 11 (the winds' chromatic descent over V1a's
sixth-and-seventh hearing of Theme 1's head). This is a tie-breaker between two simultaneous
liftable lines, layered on the task hierarchy; it does not override step 1 (the solo part stays
immutable) and it is a judgment per passage, not a rule that the violin section's own line loses.

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
| ~~sul ponticello~~ | ~~*Dies irae* parody ([I] ~313–320)~~ | **orphaned 2026-10-27**: the *Dies irae* is [D] 181–185, already engraved as Episode 7's strain without it; [I] has no chant. The device remains available, unsanctioned (Ysaÿe op. 27 no. 2 is still the solo-violin *Dies irae* precedent if Episode 7 is ever revisited) |
| ~~pizz. natural harmonic~~ | ~~triangle ([D] 189–204)~~ | **retired 2026-10-26** (the call took beat 2); the device remains available, unsanctioned |
| RH-pizz open string on an off-beat | cymbal ([D] 173–188) | extension of the pizz device from bass to percussion; normal-size, not ad lib (was LH-pizz G; open A, right hand, from 2026-10-26) |

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
first occurrence (bar 34), and the Episode 7 arco ossia (189–205) was engraved as a parallel
padded staff (removed 2026-10-26 with the Episode 7 rework). Density was known (~30 bars in
1–172, none in 7–9) and neither affects layout, so there was no reason to defer.

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
  sanctioned by some source voice. (Episode 7: e–f–e on every `<cis'' e''>`.) **Retracted for
  Episode 7, 2026-10-26:** when the ornament's host chord is also the melody's chord, the rule
  buries the melody under the ornament. Prefer the ornament's own *beat* in the source (the
  viola's beat 2) when that beat is free — a melody-free beat is a better host than a
  melody-bearing chord, even if the harmony-driven placement looks more principled on paper.
- **Lifted parallel thirds put the melody on the bottom; invert to sixths.** A wind line doubled
  in thirds *above* lands in the violin as `<melody third>` with the harmony note on top, and the
  ear follows the top. Before inventing the sixth below, check whether the source already has it
  (Episode 7: Cl1/Bn1 are exactly the sixth below at the two octaves) — then the inversion is
  still a lift at pitch. Sibling of "melody on top" for every future thirds passage.
- **Two simultaneous lines on one violin: the shared beat goes to the bow, with the other line's
  note on top.** When a pizz line and a bowed line both claim a beat (Episode 7 B: the strain's
  beat 3 vs the call's resolution), the bow cannot sustain while the right hand plucks, so the
  beat is bowed and the plucked line's note rides as the upper note of the double-stop. The
  plucked line then hockets between colours; that is the texture, not a defect. Where a bowed
  octave takes the beat, check which string is left free before assuming the other line can
  join — under G–D–A–E♭ an octave on G–D frees only the A string.
- **Per-note pizz as the default reading.** In a solo-violin arrangement built from stamps,
  strums and off-beat "pah"s, `pizz.`→`arco` pairs around single notes are pure clutter; make
  the one-note reading the convention and reserve `sempre` for passages. Generalises to any
  score whose plucked events are mostly isolated.
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
- **Verify a quotation claim by contour search before building a device on it.** The map's
  "*Dies irae* parody at [I] ~313–320" was a transcript inference that survived eleven episodes
  and seeded a timbre reservation (sul ponticello). A seven-line script over the absolute dump
  — match the chant's semitone deltas (−1 +1 −3 +2 −4 +2 0) in every voice — found it in one
  place only, [D] 181–185, already engraved as Episode 7's "Spanish" strain. Generalises: any
  "the orchestra quotes X here" claim in rolling notes is a hypothesis until the dump confirms
  it; the search is cheap once the dump exists, and it should run before the episode that
  depends on the claim, not during it.
- **Layer over the solo, never replace it — and let geometry decide.** When the solo plays
  accompaniment-grade material (Episode 12's low stamps) the orchestra's chord can ride on top as
  a double-stop with the solo's note as bass; when the solo plays the melody (Theme 2 espress.)
  and the orchestra's counter-line sits on non-adjacent strings, the only way to carry both is
  to shorten the solo's notes, which is substitution by another name. The string-adjacency check
  is the fast test: if the counter-line's notes are not adjacent-string to the melody's, the
  counter-line goes into the rests or goes unplayed.
- **`<< { } \\ { } >>` evicts the melody from the main voice.** Inside an existing Voice the
  shorthand puts *both* branches in fresh temporary voices, so a slur or tie that starts before
  the block and ends inside it (or vice versa) dies with "cannot end slur" / "unterminated
  slur". Where a melody line must stay continuous across a two-voice passage, write
  `<< { \voiceOne … } \new Voice { \voiceTwo … } >> \oneVoice` — the first branch is then the
  enclosing voice itself. The shorthand is fine only where nothing spans the block edges
  (Episode 1's bar-by-bar blocks happen to tie first-branch to first-branch, which works because
  the temporary voice id is reused; do not rely on it for slurs). Found entering Episode 8's
  cello voice, 2026-10-27.
- **LilyPond 2.24.3's Slur/Script engraver has a line-break-dependent cyclic-dependency bug.**
  Two chord-tone `\tweak font-size` notes a few bars apart, the second under a slurred ornament
  (`\prall`/`\trill`), can trip `programming error: cyclic dependency ... Slur.control-points` —
  reproducible only with specific surrounding bar content (isolated by bisection, not obviously
  wrong notation) and apparently tied to which system the ornamented note's line-break lands on.
  `\override Script.avoid-slur = #'inside` sidesteps it with no visible cost. If a LilyPond build
  ever throws a cyclic-dependency crash on `Slur.control-points`, suspect a Script/ornament
  interaction near a system break before suspecting the note data (found 2026-10-23 engraving the
  Episodes 2–6 ad-lib clicks).
