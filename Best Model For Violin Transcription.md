Best Model For Violin Transcription
===================================

**USER:**
best model, post-training configuration, LoRA, whatever, for transcribing music.  Specifically I would like to transcribe Saint-Saëns's Danse macabre for unaccompanied violin

**ASSISTANT:**
I'll dig into the current state of music transcription models and any existing solo-violin treatments of the piece.



Good leads. Let me pull specifics on the violin-specific models and the fine-tuning paths.



**USER:**
I'm only asking about the written music, not audio data transformation

**ASSISTANT:**
Got it — that reframes things. You want the *written* result: a solo-violin score, not audio-to-MIDI. Let me check what exists already and what symbolic-music tooling is actually viable for score-to-score arrangement.



Right — so the task is score-to-score: take the orchestral score (or the composer's own violin-and-piano reduction) and produce a playable unaccompanied violin part. That's *arrangement/reduction*, not transcription in the ML sense, and I should be blunt up front: **no model does this reliably today**, and the reason isn't the adapter configuration.

## Why the model question has an unsatisfying answer

The automatic-reduction literature is almost entirely piano-focused. There's an IEEE paper on automatic piano reduction of orchestral music based on phrase information content, and a hobbyist pipeline that generates hybrid random-forest + MDP reductions from orchestral MusicXML — that author is explicit that it "is still not a replacement for human arrangement," and notes Romantic repertoire with 20+ staves and 5–7 simultaneous distinct pitches is where it breaks down. Danse macabre is squarely in that harder category. Community consensus on the notation-software forums is similar: no commercial package genuinely produces a playable reduction from a full score.

The deeper problem is data. Fine-tuning teaches a model a mapping it has seen examples of. There is no corpus of paired (orchestral score → unaccompanied solo violin) reductions. The closest analogues are POP909 (lead-sheet → piano arrangement) and the audio-to-symbolic arrangement work from ICASSP 2022 — both piano, both pop, neither transferable to solo strings. So a LoRA trained on what you can actually assemble will learn "write idiomatic violin music," not "reduce this score to one fiddle."

## If you still want to fine-tune, here's the realistic stack

| Model | Representation | Why it's relevant |
|---|---|---|
| **NotaGen** (IJCAI 2025) | ABC | Pre-trained on 1.6M ABC pieces, then fine-tuned on ~9K classical sheets conditioned on *period–composer–instrumentation*. Closest thing to a classical-notation model; its conditioning is coarse, not score-in. |
| **ChatMusician** (ACL Findings 2024) | ABC | LLaMA2-based, and the paper publishes its exact LoRA recipe — the most directly reusable config. |
| **YuE2** (Sept 2026) | ABC + audio | Advertises "white-box" symbolic planning and score editing, and accepts an ABC score as input. Song-oriented, but the score-editing path is the interesting bit. |
| **Any frontier LLM** | ABC / LilyPond / MusicXML | Unglamorous, but for bar-by-bar reduction drafting it's often more controllable than a purpose-built symbolic model, because you can feed it the actual score excerpt and argue with it. |

ChatMusician's published setup, if you want a starting point: LoRA on attention and MLP layers, plus training the embedding and all linear layers; rank 64, alpha 16, dropout 0.1; lr 1e-4 with 5% warmup cosine; gradient clipping 1.0; batch size 8; max sequence length 2048. Their hardware was 16×A800 80GB for pre-training and 8×V100 32GB for fine-tuning — so a from-scratch replication is out of reach on consumer gear, though LoRA-only adaptation of an existing checkpoint is not.

For data, the corpora NotaGen drew on are the ones to raid: DCML corpora, OpenScore Lieder and String Quartet, ATEPP, KernScores. You'd want to hand-build maybe a few hundred reduction pairs to have any hope of the task being learned rather than approximated — which is probably more work than arranging the piece by hand.

## What actually determines whether the result is playable

The scordatura is the governing constraint, not a detail. Per Wikipedia, the soloist's E string is tuned *down to E♭* to produce the opening A–E♭ tritone — the *diabolus in musica* — and violinists note that the E♭ tuning is held for the entire piece. Any solo arrangement inherits that: you lose the open E string and every high-E passage needs rethinking. If you don't want scordatura, the opening has to be rewritten outright.

Beyond that: the violin realistically sustains two, sometimes three notes, with four-note chords only as brief rolled sonorities. The piece's material is distributed across solo violin, solo flute, woodwind *Dies irae* quotation, xylophone (the rattling bones), harp's twelve midnight Ds, and full tutti. A solo version means deciding which lines survive as melody, which become implied harmony in double stops, and which get dropped or compressed into figuration. The violinist.com thread on unaccompanied versions describes one approach as giving orchestral material to the soloist plus "some more fireworks" — that's essentially the only viable strategy.

## Sources worth having open

The composer's own violin-and-piano transcription (Durand, 1877) is on IMSLP and is the best skeleton, since it already tells you what Saint-Saëns considered essential. IMSLP also has the full score and the separate solo violin part. Everything is public domain (Saint-Saëns died 1921). For existing solo attempts: MuseScore has at least two solo-violin arrangements, and there's a Scribd "Danse Macabre: Solo Violin / Violin I." I did *not* find a canonical published virtuoso arrangement in the Kreisler/Sarasate mould — so if you're hoping to avoid reinventing something, what exists is self-published and of variable quality. João Victor Bota's IMSLP arrangement is a symphonic-band transcription with an *ad libitum* solo violin part under CC BY-SA 4.0, which is a legitimate thing to build on if you're happy with that licence.

Engrave in MuseScore (free) or LilyPond, or Dorico/Sibelius if you have them; MusicXML is your interchange format either way.

My honest recommendation: use an LLM as a drafting assistant for individual passages in ABC or LilyPond, keep the composer's violin-piano reduction as the harmonic authority, and treat the model output as sketch material you correct by hand. The fine-tuning route is a research project whose hardest part is dataset construction, not LoRA hyperparameters.

Want me to sketch how the opening bars and the flute theme could map onto a scordatura solo part, or work through the *Dies irae* passage specifically?

**USER:**
can I decrease the problem's difficulty by prompting the agent, or it's handler with a modified idea: rather than "take the full texture of the symphonic poem (or composer's own piano reduction as you've said) to unaccompanied violin", "first, we must preserve every note in the the solo violin part unmodified, then when the instrument is absent, lift from the prevailing melody, and finally fill in harmony or counterthemes, perhaps Bach- and/or Paganini-style"?

**ASSISTANT:**


Yes — that reframing materially improves your odds. You're moving from "compress a 20+stave Romantic orchestration into one fiddle" to "extend a given violin line using style-conditioned gap-filling." That's a tractable generation problem rather than a near-impossible reduction.

Here's why your reformulated task is more feasible, and where the remaining friction points are.

## What Changes with Your Prompt Strategy

| Original formulation | Reformulated task | Why it's easier |
|---|---|---|
| Full-score → solo violin | Existing solo part preserved + rest-fill generation | The primary melodic skeleton is given, not discovered |
| Decide *what* survives from 80+ notes per measure | Fill defined rests with style-constrained material | Temporal locations for generation are explicit |
| No precedent for violin-only orchestral reductions | Gap-filling / melody continuation has precedent in training data | LLMs have seen ABC continuations, Bach inventions, Paganini etudes |
| Voice-leading across unknown orchestral voices | Fill gaps while respecting scordatura & idiom | Constraints are local and well-defined |

Your pipeline now looks like this:

1. **Extract the existing solo-violin part** from the orchestral score (this is a known, stable text/MusicXML object).
2. **Mark rest intervals** where the violin is silent.
3. **Query an LLM/symbolic model** to generate violin-appropriate material for those rests, conditioned on:
   - Nearby orchestral melodies (provide them as reference ABC/LilyPond/MusicXML excerpts)
   - Style keywords ("Bach fugato," "Paganini caprice," "Romantic virtuoso")
   - Scordatura reminder (E→E♭, no open E-string reliance)
4. **Human review** for playability (double stops, bowing, positions).

## Why This Works Better for Current Models

- **Temporal localization**: Models handle short, bounded generation tasks far better than global reconstruction. A 2-bar fill is orders of magnitude easier than rewriting a 5-minute piece.
- **Conditioning clarity**: Providing the source melody as input text (ABC or LilyPond) gives the model a concrete anchor. YuE2's "score editing" capability and ChatMusician's conditional generation both operate this way.
- **Style anchors**: "Bach violin partita" and "Paganini caprice" are well-represented in notation corpora (OpenScore, KernScores). NotaGen explicitly fine-tuned on 9K classical pieces with composer conditioning.
- **Reduced decision space**: You're not asking the model to choose which orchestral lines matter — you tell it what to preserve and where to add.

## Remaining Technical Gaps (Prompting Won't Fix These)

| Issue | Why prompts alone fail | Practical mitigation |
|---|---|---|
| Scordatura (E→E♭) | Models don't track instrument tuning unless told repeatedly | Include a scordatura header in every prompt; validate generated pitches against the lowered E string |
| Double-stop feasibility | Training data shows chords but doesn't understand ergonomic limits | Post-process with a violin-rule validator; or use LilyPond's `\voiceOne` with manual review |
| Bowing/legato markings | Not part of standard ABC/MIDI representation | Add articulation tags manually; some models accept `<articulation>` hints in MusicXML |
| Voice-leading within fills | LLMs may write parallel fifths or awkward leaps | Request "Bach-style counterpoint" explicitly; or constrain interval sizes in your system prompt |
| Phrase-level coherence | Short fills may not connect musically across longer gaps | Generate in 4-bar chunks with overlap; ask for motivic consistency across sections |

## Recommended Tool Stack for This Workflow

| Component | Candidate | Why |
|---|---|---|
| **Symbolic format** | ABC notation | Human-readable, LLM-friendly, easy to parse for rest-marking |
| **Gap-filling LLM** | ChatMusician (fine-tuned) or NotaGen | Both understand ABC; NotaGen has classical conditioning |
| **Reference extraction** | Python script (MusicXML → ABC) | Extract orchestral melodies during violin rests as prompts |
| **Engraving** | MuseScore / LilyPond | Convert generated ABC to engraved score; check playability |
| **Scordatura validation** | Custom script | Ensure no E-natural on the lowered E string |

## Sample Prompt Structure (for ChatMusician or similar)

```
[SYSTEM]
You are a violin arranger. You receive an existing solo-violin part in ABC notation.
Preserve ALL existing notes exactly. Your task is to fill ONLY the rest periods
with new material that:
1. Uses only notes playable on a violin with scordatura: G-D-A-Eb (no open E)
2. Draws melodic material from the provided orchestral excerpts
3. Employs Bach or Paganini idioms (double stops, arpeggiated figuration, sequential patterns)
4. Maintains rhythmic continuity with surrounding material

[INPUT VIOLIN PART]
X:1
T:Danse Macabre - Solo Violin
M:3/4
L:1/8
K:Cm
Z:Scordatura: E string tuned down to Eb
...

[ORCHESTRAL EXCERPT DURING RESTS]
[Provide ABC excerpt of flute theme, woodwind Dies irae, etc.]

[OUTPUT]
Return ONLY the extended ABC with original notes unchanged and rests filled.
```

## What You Should Expect

- **Short passes**: 2–8 bar fills will likely be coherent and stylistically appropriate.
- **Long sections**: Multi-minute fills may fragment; expect to stitch together multiple generations.
- **Playability**: Roughly 60–70% of generated fills will need adjustment for bowing/positions. That's acceptable for a drafting tool.
- **Scordatura compliance**: Without explicit validation, expect 10–20% of high-E positions to violate the tuning constraint.

## Alternative Shortcut

If you just want a decent draft quickly:

1. Download the composer's violin-and-piano reduction (IMSLP, Durand 1877).
2. Drop the piano part, keep the violin line intact.
3. For rests longer than one bar, paste the orchestral passage into ChatMusician/NotaGen with "fill this rest with virtuosic violin material in Paganini style."
4. Compile and engrave.

That bypasses the full orchestral reduction problem entirely and gives you something performable within a day.

---

Do you want me to sketch out a concrete example: take measures 1–12 of the orchestral score, show you where the violin rests, and generate a sample ABC fill using the "flute theme" excerpt as source material?

**USER:**
what would be appropriate idioms, styles, and spectrum of notable performer improvisational idiosyncrasies (Paganini, Joachim, Enescu, et al) to consult for this project?  Saint-Saëns is a magnificent exemplar of late French romantic universality I feel that almost any of these, elevated to high art could work, much like how all great art derives it's timelessness and relevance via it's anchoring in folk traditions and styles

**ASSISTANT:**
This is where the project stops being an engineering exercise and starts being a musical argument — and your instinct is sound. The piece is unusually rich soil for this precisely because Saint-Saëns built a French Romantic tone-poem out of materials that were already folklore: the medieval *danse macabre* tradition, the *Dies irae* plainchant, and the waltz, which was itself recently-respectable vernacular dance music in 1874. You'd be finishing a loop he started.

Your broader thesis — that great art anchors itself in folk tradition — is the central tenet of fin-de-siècle nationalism and of later Bartókian ethnography, and it explains why Enescu, Sarasate, and Grieg sound like themselves. I'd only note it's one lens among several (Stravinsky would have argued the opposite case), but for *this* piece, with *this* pedigree, it's the right one.

## The anatomy of the piece, and who owns each part

The useful way to think about your idiom palette is passage-by-passage, because Danse macabre is a chain of vividly characterized episodes:

| Passage | Core material | Idiom to consult | Specific devices to lift |
|---|---|---|---|
| Intro: twelve harp D's | Midnight tolling | **Biber, Rosary Sonatas** | Sustained pedal, open-string drones; the whole scordatura lineage — Biber's tunings *encode* imagery, as does Saint-Saëns's E♭ tritone |
| Opening A–E♭ tritone | *Diabolus in musica* | **Ysaÿe, Sonata No. 2 "Obsession"** | His entire apparatus: the Dies irae muttered under a Bach prelude, quarter-tone slides toward and away from the dissonance, sul ponticello menace |
| Main waltz theme | Grotesque dance | **Viennese/Kreisler** + **Romani waltz** | Lilt displaced across barlines, grace-note decorations, abrupt *fp* accents |
| Solo flute theme | Songful melody | **Harmonics practice (Paganini, Sarasate)** | Artificial harmonics to thin the timbre, evoking the flute's register when doubling |
| Descending violin scales | Bravura passagework | **Paganini, Caprices 1 & 24** | Violent single-position scalar runs, arpeggiated sixths/thirds sequences |
| Woodwind *Dies irae* quote | Gregorian chant | **Liszt, *Totentanz***; Ysaÿe again | Variation-set thinking: treat the chant as a bass/ostinato under violin figuration |
| Xylophone ("rattling bones") | Skeletal percussion | **Dinicu, *Ciocârlia***; col legno tradition | The folk trick of timbral imitation — bird-song on violin maps cleanly onto bone-rattle: col legno, ghost harmonics, spiccato martellato |
| Contrapuntal development | Imitative texture | **Bach, Sonatas & Partitas**; **Enescu** | Double-stop two-voice motion, pseudo-fugato entries, the Chaconne's sustained multi-voice illusion |
| Apotheosis ending | D major triumph | **Sarasate / Saint-Saëns's own Havanaise** | Final-register fireworks, left-hand pizzicato over bowed melody, harmonics cascade |

Note the pleasing symmetry: Ysaÿe already built a masterpiece around quoting *Dies irae* over Bach, and Saint-Saëns quotes *Dies irae* over a waltz. Your arrangement joins an existing conversation.

## The performer spectrum, and what each signature actually is

**Paganini** — the structural insight, not just the tricks. His caprices are *theme-and-form machines*: every virtuosic device (ricochet, left-hand pizzicato, octave thirds) exists to spin one motive into 120 bars without losing identity. That's exactly your gap-filling grammar. He also improvised variations on popular airs in concert, which is literally your workflow. And he used scordatura himself — a fellow practitioner.

**Joachim** — the counterweight of gravity. His contribution is the *layered-chord cantata* style: dense, Brahmsian, slowly-unfolding polyphony where the violin speaks as orator. Consult him for the *Dies irae* and development section, where you want solemnity rather than fireworks. His Beethoven-cadenza writing shows how to integrate quotation into original fabric.

**Enescu** — your folk-anchor par excellence, and the deepest well here. His idiom is built from actual improvisational folk practice: the *doina*'s free, ornament-laden, rhythmically unmoored lamenting and the paradoxically driving dance forms (*învârtita*-type asymmetric grooves) behind it. The *doina* is the natural voice for the introduction and the spectral middle passages — improvised melody over a drone, which the harp's twelve D's hand you for free. His harmonically misty slow movement style also matches the piece's nocturnal register.

**Sarasate** — not optional but *essential*: he was Saint-Saëns's own collaborator, dedicatee of the Third Concerto, Havanaise, and Introduction & Rondo capriccioso. His idiom is French-Spanish elegance over fire — clean, vocal phrasing with choreographed bravura. He's the stylistic native speaker for this composer.

**Kreisler** — your methodological model. He made a career of *exactly this task*: recasting others' music into concert-violin miniatures, and he encoded improvisatory ornaments into fixed notation. Recitativo & Scherzo and his cadenza practice show you how much decorative material a rest-fill can carry before collapsing.

**Bartók** — the discipline of scarcity. His Solo Sonata and 44 Duos show how to build full texture with maximum economy and zero padding — the corrective if Paganini-influenced fills become ornamental mush. Dissonant double stops as *structural* color suit the piece's grotesquerie.

A caution worth stating plainly: several of the traits we treasure in these performers — Joachim's disciplined rubato, Enescu's improvised ornaments, Kreisler's portamento slide — are **performance nuance, not notation**. They won't survive into ABC conditioning. What survives is their *notated fingerprint*: the figuration patterns, the chord spacing, the distribution across the bar. Encode the fingerprints, and let a human (or you) reintroduce the nuance later.

## Translating this into your generation pipeline

Practically:

- **NotaGen-style conditioning strings** are coarse — "Romantic-Violin" gets you an average, not Enescu. For differentiation, use **few-shot conditioning**: paste 8–16 bars of actual Paganini Caprice 24, or Ysaÿe No. 2, or an Enescu *doina*-style passage as exemplar alongside your target bar.
- Build a **mini-corpus per style**, one per episode of the piece: Caprice 24 + Caprice 1; Ysaÿe Sonatas 2 & 6; a Bach Allemande; Kreisler's Recitativo & Scherzo; a Sarasate fantasy finale. Each rest-fill gets conditioned on the corpus matching that passage's table row above.
- **Guardrails that recur across all styles**: scordatura (no open E — every E-natural stops the top string from ringing; in fact you may want to lean *into* it, since the sour stopped E♭ is the piece's whole point), and range — keep fills within first position plus the standard upper positions, unless deliberately Paganini-above-the-staff.

The one place I'd resist mixing: the *doina*/Enescu language and the Paganini language want to live in different episodes. The piece's dramatic power comes from character contrast — spectral versus kinetic — and blending them flattens it.

If you'd like, I can map this to the actual timeline of the piece — bar numbers for each episode from the IMSLP score, paired with the specific exemplar passages and the exact rest-fill instructions you'd condition on. That would give you a ready-made conditioning script for the whole arrangement.

**USER:**
yes, that would be great

**ASSISTANT:**
Let me pin down the formal structure with bar numbers so the map is grounded in the actual score, not memory.

Here's the conditioning script. One honesty note first: the only bar number I could independently verify is the solo violin's tritone entrance at **bar 25** (per a structural analysis keyed to the score), which is consistent with a 24-bar introduction — the harp's twelve D strokes occupying two bars each. Everything else below is expressed as structural landmarks that you should anchor against the Durand score from IMSLP before running prompts; bar totals vary between editions and I'd rather flag approximate than fake precise. The section sequence itself (flute first theme, violin descending second theme, fugal development, woodwind *Dies irae* in a startling major key, reprise and climax, dawn coda) is confirmed across Wikipedia, the Eulenburg preface summary, and the Runyan program notes.

One delightful historical detail from Bru Zane Mediabase worth having in your program note: after the piece caught on, Saint-Saëns wrote to his publisher Durand in March 1876 that *"Violinists no longer want their chanterelles tuned otherwise than in E flat!"*

## The episode map

| Bars (~) | Episode | Orchestral content | Solo violin | Primary idiom | Few-shot exemplar | Rest-fill instruction |
|---|---|---|---|---|---|---|
| 1–24 | Midnight | Harp D ×12, soft string chords; brief D-major shimmer at the twelfth stroke | Silent (this is where a soloist traditionally *becomes* Death mid-ritual — theatrical entry) | Biber drone / Enescu *doina* | Biber, Rosary Sonata I opening; Enescu's free-rhythm openings | Keep open D ringing as pedal tone (and sympathetic G/D resonance); improvise free-rhythm ornaments *senza misura* over it, awakening gradually |
| 25–48 | The summons | Tritone A–E♭ across open strings, syncopated | **Plays** (preserve verbatim) | Ysaÿe menace | Ysaÿe Sonata No. 2 "Obsession," bars 1–20 | No fill needed; optionally reinforce the tritone double stop A+E♭ simultaneously in rests |
| ~49–112 | First waltz statement | Violin solo leads the waltz theme | **Plays** | Kreisler lilt, *fp* wit | Kreisler *Liebesleid* opening gesture | Fill under-breath countermelodies: off-beat thirds/sixths answering each phrase |
| ~113–160 | First theme (flute) | Solo flute sings Theme 1, strings soft | Rests during flute phrases | Sarasate songfulness; artificial harmonics to impersonate flute register | Sarasate *Zigeunerweisen* slow section; Paganini Cap. 9 harmonics | **Lift the flute theme as melody**, thinned to harmonics or sustained cantabile; when both themes coexist later, flute melody wins |
| ~161–200 | Second theme (violin descent) | Violin descending scale theme with soft chords | **Plays** | Paganini scalar bravura | Caprice 1 (arpeggiated velocity); Cap. 24 var. 2 | Enrich descent with left-hand pizzicato alternating with stopped notes à la Cap. 24 var. 9 |
| ~200–midpoint | Development / fugal section | Contrapuntal working of Theme 2 | Alternates entries | Bach partita multi-voice | Solo Partita No. 2 Sarabanda; Chaconne b. 1–20 | Pseudo-fugato double stops: Theme 2 in lower voice, countersubject above, Ysaÿe-style |
| Midpoint | *Dies irae* quote | Woodwinds, staccato, **major key** — the score's ironic heart | Rests (mostly) | Liszt *Totentanz* variation logic | Ysaÿe No. 2's muttered Dies irae; Bartók pizzicato ostinato | State the chant as bass ostinato (col pizzicato or col legno battuto), spin waltz-figuration over it as a Paganini variation |
| Post-*Dies irae* | Reprise & building drive | Themes 1+2 layered, ever louder | Plays increasingly | Paganini intensity ramp | Cap. 6 (trills+velocity); var. 11 ricochet-style | Combine: flute theme in harmonics *over* waltz figuration beneath |
| Climax | Full-ensemble frenzy | Tutti, very strong | Buried | Bartók density discipline | Bartók Solo Sonata mvmt I texture | Two-voice maximal compression: melody + driving accompaniment figure; nothing decorative |
| Coda | Dawn | Horn octave E♭ → oboe "cock crow" arpeggio → strings descend to nothing | Plays final phrases | The moment for **Enescu epilogue** — the dance dissolving | Enescu Sonata III "Impressions d'enfance" fades; Kreisler ending-portamento | Recast oboe crow on artificial harmonic (thin, cold); then sustained fading double-stop descent *morendo* — the devils don't exit, they evaporate |

## The ending problem you must solve before prompting

Verified details that converge across sources: the piece is nominally G minor, wanders through B♭ major regions, and the ending pivots hard — the *Eulenburg*/Musillection analysis notes the climax brings "no conventional triumphant resolution"; the dawn interrupts with the oboe cock-crow, and analyses variously describe a D-major-leaning close with the descending strings dissipating. Meanwhile your E string is tuned to E♭, and at dawn **every E-natural in the coda must be a stopped note** — the sour resonance that was the piece's *point* now poisons the radiance. This is musically interesting, not merely logistical: I'd suggest you treat it deliberately, in Ysaÿe fashion — the E♭ string's shadow hanging over the dawn is arguably the truest reading of the legend (the creatures flee *because* they can't bear the light). Alternatively, a Biber-style moment where you audibly re-tune the chanterelle up to E before the coda is theatrically period-appropriate, practically brave. Decide *before* generating, because your conditioning prompts need to state which pitches are legal on which strings.

## Master conditioning prompt

Drop this skeleton into your ChatMusician/NotaGen/LLM workflow, replacing per-episode fields from the table:

```
[CONDITIONS — all episodes]
- Instrument: solo violin, scordatura G–D–A–E♭ (E string is E♭; E-naturals stopped only)
- Meter 3/4; character: French Romantic waltz-toned symphonic poem
- Task hierarchy: (1) original solo violin notes immutable; (2) when violin rests,
  transfer prevailing melody; (3) only then add harmony/countertheme

[EPISODE HEADER]
Bars: [X–Y] | Idiom anchor: [e.g., "Bach partita double-stop fugato"]
Few-shot exemplar (verbatim ABC): [8–16 bars from the exemplar piece]
Fill only: [bars where violin is silent / role: melody-transfer | filler]

[RULES FOR THIS EPISODE]
[e.g., "Maintain D pedal as open-string drone; free rhythm; no barlines in fill"]
```

Two workflow points from the map worth underlining: run each episode as a **separate generation with its own few-shot corpus** — the whole architecture of the piece is character contrast, and a single session will homogenize it. And validate every generated bar against the scordatura rule mechanically (a few lines of ABC-parsing Python will do it), since models will happily emit open-string E-naturals no matter how often you forbid them.

If you'd like, I can next draft the actual ABC for one test slice — say, bars 1–12 — so you have a worked example of what the *doina*-style opening fill looks like in notation, to calibrate your expectations before committing to the pipeline.