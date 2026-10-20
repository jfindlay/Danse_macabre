\version "2.24.3"
% Episode 1 -- bars 1-24 "Midnight" (decided 2026-10-18, see docs/NOTES.md).
% Orchestra (confirmed against the dump): Hp-h d'2.\f x12 (bars 1-12, one stroke per bar); Cor 1
% d' pedal tied through bars 1-16; V1a/V2 divisi hold a ppp D-major chord bars 5-8 (d''/a' over
% fis'/d') and again bars 13-16 (fis''/d'' over a'/fis', A adds d') -- two differently-voiced
% "shimmer" statements, strings only, no harp involved in the shimmer itself; bar 17 is silent in
% every voice; Vc-a/Cb pizz pp enter bar 18 (not 17) with d a c fis a c ees (7 notes, not 8 --
% corrects the decision log's "d'...d'" bracketing, which predates this dump cross-check).
%
% "A defaut de harpe" realisation: the 12 strokes become pizz open D (d'), l.v., one per bar
% (1-12). The shimmer is re-cast as bowed double-stop natural harmonics (f-sharp''' + a''')
% rather than lifted literally (the 4-voice string chord is unplayable as a single line) -- an
% idiomatic "fill", not a lift; harmonics sound only in bars 5-8 and 13-16, alternating with the
% pluck rather than overlapping it (the touch needed for f-sharp''' silences the open D's ring;
% known loss, accepted in docs/NOTES.md). Touch points: f-sharp' on D (5th partial) and d'' on A
% (4th partial), both 1st position, fingers 2 and 3. Bar 17 stays silent (ground truth; no bass
% line starts until 18). 18-24: Vc/Cb pizz line lifted up one octave, pp, 1st position.

epOne = \absolute {
  \barNumberCheck #1
  d'4\f\laissezVibrer r2                                                        | % 1  Hp-h stroke
  d'4\laissezVibrer r2                                                          | % 2
  d'4\laissezVibrer r2                                                          | % 3
  d'4\laissezVibrer r2                                                          | % 4
  % 5-8: stroke + bowed harmonic dyad (fill, not a lift -- see header note)
  d'4\laissezVibrer <fis''' a'''>2\ppp\flageolet                                | % 5
  d'4\laissezVibrer <fis''' a'''>2\flageolet                                    | % 6
  d'4\laissezVibrer <fis''' a'''>2\flageolet                                    | % 7
  d'4\laissezVibrer <fis''' a'''>2\flageolet                                    | % 8
  d'4\laissezVibrer r2                                                          | % 9
  d'4\laissezVibrer r2                                                          | % 10
  d'4\laissezVibrer r2                                                          | % 11
  d'4\laissezVibrer r2                                                          | % 12
  % 13-16: strings' own D-major shimmer continues after the harp's 12 strokes stop; no pluck to
  % alternate with here, so the harmonic dyad fills the whole bar.
  <fis''' a'''>2.\ppp\flageolet                                                 | % 13
  <fis''' a'''>2.\flageolet                                                     | % 14
  <fis''' a'''>2.\flageolet                                                     | % 15
  <fis''' a'''>2.\flageolet                                                     | % 16
  r2.                                                                           | % 17 silent (ground truth)
  % 18-24: Vc-a/Cb pizz line, up one octave, pp, 1st position throughout
  d'4\pp^"pizz." r4 r4                                                          | % 18
  a'4 r4 r4                                                                     | % 19
  c'4 r4 r4                                                                     | % 20
  fis'4 r4 r4                                                                   | % 21
  a4 r4 r4                                                                      | % 22
  c'4 r4 r4                                                                     | % 23
  ees'4 r4 r4                                                                   | % 24 bow retakes for 25
  \barNumberCheck #25
}
