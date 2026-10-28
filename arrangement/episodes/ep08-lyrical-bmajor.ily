\version "2.24.3"
% Episode 8 -- bars 205-236 "Lyrical B major" [E] (decided 2026-10-19, see docs/NOTES.md and
% docs/PLAN.md's Episode 8 draft). Absolute pitch.
%
% Concept: solo = single line, orchestra = octaves. Statements 1 and 3 (205.3-214, 221.3-230) are
% the solo verbatim. Statements 2 and 4 (213.3-222, 229.3-237.1) are the orchestra's own octave
% doublings (Fl 1 + Fl 2/Hn 1; V2 + Va) rendered as violin octaves. The open E-flat string is the
% D-sharp of B major: ringing inside the octave at 221.1 (the 205.1 strum, once four strings
% with the open E-flat on top, is a three-string pizz <b b' fis''> since 2026-10-26). The
% three-note chords mark the inner voice (V1's d-sharp'->d-natural'->d-sharp') at its change
% points. Statement 4's final note <fis' fis''> p falls on 237.1 and belongs to Episode 9's file.

epEight = \absolute {
  \barNumberCheck #205
  % 205.1 tutti B-major stamp as a three-string pizz strum <b b' fis''> (open fifth), the end of
  % the pizz. begun at 203.1 (ep07; a deliberate break of the one-note pizz convention, NOTES
  % "Conventions"). 205.2 rest = retake the bow. 205.3-214.1 VSolo verbatim, f appassionato,
  % with the "arco" that closes that pizz.
  <b b' fis''>4\f  r4  fis'4^\markup { "arco" \hspace #1 \italic "appassionato" } (        | % 205
  b'2) b'4(                                                                                     | % 206
  ais'2) ais'4(                                                                                 | % 207
  a'2) a'4(                                                                                     | % 208
  g'2->) g'4                                                                                    | % 209
  fis'4( g'4 b'4)                                                                               | % 210
  a'4( g'4 fis'4)                                                                               | % 211
  g'2 g'4(                                                                                      | % 212
  % 213.3 Fl 1's upbeat fis'' over the solo's tied b'. 214-221 = Fl 1 b'' + Fl 2/Hn 1 b' as
  % octaves. Inner voice d-sharp'(213)/d-natural'(217)/d-sharp'(221).
  b'2)~ <b'~ fis''>4\p^\markup\italic "espress." (                                              | % 213
  <b' b''>2\< <b' b''>4                                                                         | % 214
  <ais' ais''>2 <ais' ais''>4                                                                   | % 215
  <a' a''>2 <a' a''>4                                                                           | % 216
  <g' d'' g''>2->)\! <g' g''>4(\>                                                               | % 217
  <fis' fis''>4 <g' g''>4 <b' b''>4                                                             | % 218
  <a' a''>4 <g' g''>4 <fis' fis''>4\!                                                           | % 219
  <g' g''>2) <g' g''>4(                                                                         | % 220
  % 221.1 answer's goal with the open D-sharp; 221.3-230.1 VSolo verbatim.
  <b' dis'' b''>2) fis'4-\tweak self-alignment-X #CENTER -\markup{\dynamic "(f)"}(               | % 221 editorial (f)
  b'2) b'4(                                                                                     | % 222
  ais'2)\< ais'4(                                                                                | % 223
  a'2) a'4(\!                                                                                    | % 224
  gis'2->) gis'4(                                                                               | % 225
  e'4 fis'4 a'4)                                                                                 | % 226
  g'4(\> fis'4 e'4)                                                                              | % 227
  g'2-.( g'4-.)\!                                                                                | % 228
  % 229.3 upbeat not addable over the solo's held fis'. 230.1 = solo's tail + Va + V2 as a rolled
  % chord into the octave, then V2 + Va octaves molto espress.
  fis'2.~                                                                                        | % 229
  <fis' b'~ b''~>4^\markup\italic "molto espress." <b' b''>4\< <b' b''>4(                       | % 230
  <ais' ais''>2) <ais' ais''>4(                                                                  | % 231
  <a' a''>2) <a' a''>4(\!                                                                        | % 232
  <gis' gis''>2)\f <gis' gis''>4(                                                                | % 233
  <e' e''>4 <fis' fis''>4 <a' a''>4)                                                             | % 234
  <g' g''>4(\> <fis' fis''>4 <e' e''>4)                                                          | % 235
  <g' g''>2-.( <g' g''>4-.)\!                                                                    | % 236  -> 237.1 <fis' fis''>4 p (Ep 9)
  \barNumberCheck #237
}
