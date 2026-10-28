\version "2.24.3"
% Episode 13 -- bars 338-361 "The long string phrase" (decided 2026-10-27, user + agent; see
% docs/NOTES.md and docs/PLAN.md's Episode 13 draft). Absolute pitch.
%
% Concept: the strings' one long phrase 337.3-353, a chromatic chain of rising/falling cells over a
% D pedal (V1a on top, V2/Va/Vc in parallel below: D, E-flat, E, F, then diminished -> minor pairs),
% played as V1a's single line, p/pp with the source's swells, climbing to a'' at 346.1 and then
% oscillating fis''-g'' (F-sharp dim -> G minor over the pedal) in a six-bar crescendo, which
% runs to the end of 353 (user: "the sweep of the long string phrase completes all the way to
% the end of 353"). The winds' Theme 1 head in C minor (c ees c d | ees c ees d c bes, entering
% f on 346.2) is NOT lifted while the strings hold the phrase -- it is played when the strings take
% it over at 354-357 (user's call). The solo's own d' is held through 339.1 and the line rides on
% top of it: 337.3-338 as chord upper notes over the tied d' (d' = G string, 4th finger; the line
% on the D string, ees'/e'/f' at fingers low-1/1/2, minor-2nd and major-2nd clashes with the held
% d' as in the orchestra). V1a's a' at 339.1 is dropped (G + A are non-adjacent strings; the
% solo's d' stands for the cell's first note). From 339.2 the violin is alone with the line.
%
% 350-353: slip into octaves (the orchestra's own V1a/Va octave doubling; not possible earlier in
% the phrase, where Va's pitches fall below the open G), D-A pair, positions 4 -> 3 as in Episode
% 11's 281-288: <a' a''> (4th), <aes' aes''> (3rd/4th), <g' g''> and <fis' fis''> (3rd). Same hand
% shape moved a semitone. The cresc. begins 348.1 (V1a's hairpin) and runs to f at 354.1.
%
% 354-357: the figure c''' ees''' ... (V1a's own pitch: V2 is the octave below, Fl/Hb/Cl pairs in
% octaves in the source) in slurred bars at f -> ff, accent on the first note as the winds'.
% 358-361: tutti D7(b9) hit on 358.1 as a quarter chord <d' a' ees'''> under the run (user,
% 2026-10-27); V1a's non-legato descent (the F-sharp-dim-7 outline) from
% ees''' (E-flat string, 4th position: bes''-c'''-d'''-ees''' under fingers 1-4, the same hand as
% 354-357) three octaves down, shifting down through the strings, V2 unison from
% 360. 361 ends a' g' -- Episode 14's 362 opens on the same cell, fis' c' ees' d' c' a.
%
% Not carried: Va/Vc/V2 harmony of the chain (V1a alone, top line), the Ti roll 337-345 and the
% d pedal (C3/C4, Bn, C1/C2), Tp/Tb/Tba's fis g / c d / a bes at 354-357, Pic's entry at 350, the
% 346-353 winds' figure (held until the strings take it), V2's octave doubling of the figure
% 354-357, the inner voices of 358.1's chord (fis/c).
% Dynamics: pp 337.3 (the Ti pp), p 346.1 (the Ti "sempre p"), the source's swells, cresc.
% 348-353, f 354.1, cresc. to ff 358.1.

epThirteen = \absolute {
  \barNumberCheck #338
  % 337.3-339.1: held d' (solo) under V1a ees' | e' f' (chord upper notes); 339.1 d' alone,
  % 339.2-3 V1a's aes' g' (the descending cell without its a').
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
  % 350-353: octaves, D-A pair (see header).
  <a' a''>4->( <aes' aes''>4 <g' g''>4)                                        | % 350
  <fis' fis''>2( <g' g''>4)                                                    | % 351
  <fis' fis''>2( <g' g''>4)                                                    | % 352
  <fis' fis''>2( <g' g''>4)\!                                                  | % 353
  % 354-357: the strings take the figure (Theme 1's head in C minor), f -> ff.
  ees'''8->(\f\< c'''8 ees'''8 d'''8 c'''8 bes''8)                             | % 354
  ees'''8->( c'''8 ees'''8 d'''8 c'''8 bes''8)                                 | % 355
  ees'''8->( c'''8 ees'''8 d'''8 c'''8 bes''8)                                 | % 356
  ees'''8->( c'''8 ees'''8 d'''8 c'''8 bes''8)                                 | % 357
  % 358-361: V1a's descent, non legato, from the tutti D7 hit's top note; V2 unison from 360.
  % 358.1: the tutti hit as a quarter chord <d' a' ees'''> (open D, open A, the run's first note):
  % root, fifth and flat 9 of D7(b9), and the solo's own summons interval a'-ees'' recalled. Two
  % voices so the run keeps all six 8ths; the open strings ring for the quarter.
  <<
    { ees'''8\ff_\markup \italic "non legato" c'''8 ees'''8 d'''8 c'''8 a''8 }
    \\
    { <d' a'>4-! s2 }
  >>                                                                           | % 358
  c'''8 bes''8 a''8 fis''8 a''8 g''8                                           | % 359
  fis''8 c''8 ees''8 d''8 c''8 a'8                                             | % 360
  c''8 bes'8 a'8 fis'8 a'8 g'8                                                 | % 361
  \barNumberCheck #362
}
