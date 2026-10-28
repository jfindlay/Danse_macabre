\version "2.24.3"
% Episode 11 -- bars 273-308 "Marcato, dim., the wind" [H] (decided 2026-10-27, see docs/NOTES.md
% and docs/PLAN.md's Episode 11 draft). Absolute pitch.
%
% Concept: four lifts in a row, each the section the orchestra foregrounds. (1) 273-280 hammer
% blows f, half + quarter, marcato (Le Concert engraves the ^ as \rtoe; forced above the chords
% here, as in the source and per Gould, since stems-up chords would flip it): winds/brass on the odd
% bars, strings/Tp on the even, each resting in the other's bar -- Gr6 -> D, Gr6 -> D, B dim7 ->
% C, A dim7 -> B-flat. One violin plays every bar; the antiphony becomes dissonance/resolution
% and voicing (the dissonant chords are four-string with the open E-flat or a barre on top, the
% resolutions mostly three-string), all 1st position. (2) 281-288 the winds' dim. chorale, a top
% line (Fl1/Pic/Hb1) doubled at the octave by Hb2 -> octaves, descending through positions
% 4-3-2-half-1 to p at 287. (3) 289-296 strings p: V1a's rising d'-ees'-f'-g' against the Vc/Cb
% bass falling c-bes-a-g -> the wedge as double-stops with the bass 8va (M2, P4, m6, P8), then
% the D-major vamp (chord on 1) with the timpani's repeated-8th a on beats 2-3 as the open A.
% (4) 297-308 the winds' two-octave chromatic descent twice (user's call over V1a's legg.
% Theme-1-head figure, which the ear knows by now): statement 1 is the Fl1 -> Cl1 relay g''->g
% (Cl1's final fis, 301.1, is below the violin's range; the run resolves onto V1a's own d'8-.
% instead), statement 2 is Fl1 alone an octave higher, g'''->g', its goal note on 309.1 being
% Episode 12's first decision (Fl1 fis'4 or V1a d'8-.). Runs slurred per bar (the source's slur
% is the whole phrase); accent on the first note is Fl1's.
% Hand: 273-280 all 1st position (Gr6 = 4ext-3-1-0, rolled, sustain on the upper pair; B dim7 and
% A dim7 are the same shape 2-1-3-3(barre) a tone apart; B-flat = 2(barre)-3-4). Octaves 281-288
% on the D-A pair. 293-296/301-304 = 4-2-0 then the open strings. Run 2 starts g''' = E-flat
% string, 16th semitone.
% Not carried: Tp's d''/d' inside the string chords 274-280; Bn2/Tb3's bass octave below the open
% G; the horn d'/d pedal 289-296 and 301-304; V1a's legg. figure 297-301/305-309 with its Va
% octave, V2 pizz and xylophone downbeat doublings; the Tb/Bn2 C-minor pedal 297-300/305-308;
% Fl2/Cl2/Bn1's parallel runs a third/octave below Fl1.
% Dynamics as source: f 273, dim 281-286, p 287, cresc 302-304, p 305.

epEleven = \absolute {
  \barNumberCheck #273
  % 273-280: Gr6 cis-ees-g-bes (Bn/Tb1/Tb3 cis, Hb2/Cl1/Fl1/Pic ees, Hb1/C1-4 g, Cl2/Fl2 bes) vs
  % D (V1a <d'' d'''>, V2 <a' fis''>, A <fis' a'>, Vc/Cb d'); B dim7 b-d-f-aes (Bn/Tb b, Hb2/Cl1
  % d, Hb1/C1-3 f, Fl2/Cl2 aes) vs C (V1a <c'' c'''>, V2 <g' e''>, A <e' c''>, Vc/Cb c'); A dim7
  % a-c-ees-ges (Bn/Tb a, Hb2/Cl1 c, Hb1/C3 ees, Fl2/Cl2 ges) vs B-flat (V1a <bes' bes''>, V2
  % <f' d''>, A <d' bes'>, Vc/Cb bes). 272.3's ees' (4th pos., cis' under it) drops to the Gr6
  % chord with the same cis' as its bass.
  <cis' g' bes' ees''>2^\marcato\f <cis' g' bes' ees''>4^\marcato              | % 273 winds: Gr6, open E-flat on top
  <d' a' fis''>2^\marcato <d' a' fis''>4^\marcato                              | % 274 strings: D (the stamp chord)
  <cis' g' bes' ees''>2^\marcato <cis' g' bes' ees''>4^\marcato                | % 275
  <d' a' fis''>2^\marcato <d' a' fis''>4^\marcato                              | % 276
  <b f' d'' aes''>2^\marcato <b f' d'' aes''>4^\marcato                        | % 277 winds: B dim7, 3rd-finger barre
  <c' g' e''>2^\marcato <c' g' e''>4^\marcato                                  | % 278 strings: C
  <a ees' c'' ges''>2^\marcato <a ees' c'' ges''>4^\marcato                    | % 279 winds: A dim7 (277's shape, half pos.)
  <bes f' d'' bes''>2^\marcato <bes f' d'' bes''>4^\marcato                    | % 280 strings: B-flat, V1a's bes'' on top
  % 281-288: Fl1/Pic/Hb1 a'' g'' f'' ees'' d'' ees'' d'' ees'' (-> d''4 289.1) + Hb2 an octave
  % below, dim -> p 287; under them Cl1 ees''-bes', Cl2 c''-fis', Bn ees'/c'-a/fis, Tb fis-c'/c
  % (F-sharp dim7, G minor, F, E-flat, then D7 / E-flat alternating). Strings silent.
  <a' a''>2\> <a' a''>4                                          | % 281 4th pos.
  <g' g''>2 <g' g''>4                                            | % 282 3rd
  <f' f''>2 <f' f''>4                                            | % 283 2nd
  <ees' ees''>2 <ees' ees''>4                                    | % 284 half
  <d' d''>2 <d' d''>4                                            | % 285 1st, open D
  <ees' ees''>2 <ees' ees''>4\!                                  | % 286
  <d' d''>2\p <d' d''>4                                          | % 287
  <ees' ees''>2 <ees' ees''>4                                    | % 288
  % 289-292: strings p, half + quarter: V1a d' ees' f' g' over V2 a bes c' ees', A fis g a bes,
  % Vc (div.) a g f ees / c bes, a, g,, Cb c bes, a, g, (D7/C, E-flat, F, E-flat/G); C1/C2 d'/d
  % pedal 289-296; the winds' d''4 on 289.1 is the strings' pitch class and is dropped. Carried:
  % V1a + the bass an octave up (Episode 1's licence) -> the wedge opens M2 P4 m6 P8.
  <c' d'>2 <c' d'>4                                              | % 289
  <bes ees'>2 <bes ees'>4                                        | % 290
  <a f'>2 <a f'>4                                                | % 291
  <g g'>2 <g g'>4                                                | % 292
  % 293-296: D vamp -- V1a a', V2 <a fis'>, A fis, Vc d/d,, Cb d on beat 1 with rests; Ti r4 a,8
  % a,8 a,8 a,8 | d4 a,2:8 | d4 a,2:8 | d4 a,4 d4. Chord = V1a's a' over V2/Va's fis' and the
  % bass d' (4-2-0); the timpani's a as the open A (measured 8ths), its d as the open D.
  <d' fis' a'>4 a'2:8                                            | % 293
  <d' fis' a'>4 a'2:8                                            | % 294
  <d' fis' a'>4 a'2:8                                            | % 295
  <d' fis' a'>4 a'4 d'4                                          | % 296
  % 297-301: the wind's chromatic descent as a relay -- Fl1 g''->g' (297.1-299.1) handed to Cl1
  % g'->fis (299.1-301.1); Fl2/Cl2 a third below, Bn1 an octave below Cl1; Tb1-3/Bn2 C-minor
  % chord p 297.1 held as a c, pedal to 301.1 d,. Composite top line g''->g, 24 8ths; Cl1's fis
  % at 301.1 is unplayable (below the open G), so 301.1 is V1a's own d'8-. (the legg. figure's
  % last note, the bass D), then the vamp's timpani 8ths.
  g''8->( fis''8 f''8 e''8 ees''8 d''8)                           | % 297 Fl1
  cis''8( c''8 b'8 bes'8 a'8 aes'8)                              | % 298 Fl1
  g'8( fis'8 f'8 e'8 ees'8 d'8)                                  | % 299 Fl1 g' = Cl1 g'; Cl1 on
  cis'8( c'8 b8 bes8 a8 g8)                                      | % 300 Cl1
  d'8-. r8 a'2:8                                                 | % 301 V1a d'; Ti r4 a,2:8
  % 302-304: the vamp again, cresc.: V1a <d' a'> (+ V2 <a fis'>, A fis, Vc/Cb d, C1-4 d pedal),
  % Ti r4 a,2:8 | d4 a,2:8 | d4 a,2:8 | d4 a,4 d4 with the hairpin to 304.3. V1a's own open
  % strings with the third above (0-0-2): the brighter voicing for the crescendo.
  <d' a' fis''>4\< a'2:8                                         | % 302
  <d' a' fis''>4 a'2:8                                           | % 303
  <d' a' fis''>4 a'4 d'4\!                                       | % 304
  % 305-308: Fl1 alone, the whole descent an octave up, g'''->g' (-> fis'4 309.1); Fl2 a third
  % below, Cl1/Cl2/Bn1 an octave below. V1a/Va/V2/Xy repeat 297-301 exactly, p. The run's goal
  % note on 309.1 (Fl1 fis'4, or V1a's d'8-. as at 301.1) belongs to Episode 12's file; VSolo
  % re-enters 309.3 <d' a'>4-. f.
  g'''8->(\p fis'''8 f'''8 e'''8 ees'''8 d'''8)                   | % 305 E-flat string
  cis'''8( c'''8 b''8 bes''8 a''8 aes''8)                        | % 306
  g''8( fis''8 f''8 e''8 ees''8 d''8)                            | % 307
  cis''8( c''8 b'8 bes'8 a'8 g'8)                                | % 308 -> [I] 309
  \barNumberCheck #309
}
