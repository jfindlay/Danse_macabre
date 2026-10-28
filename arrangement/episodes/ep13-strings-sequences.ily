\version "2.24.3"
% Episode 13 -- bars 338-361 "The long string phrase". V1a's single line for the strings' chain
% of rising/falling cells over a D pedal (337.3-353), climbing to a'' at 346.1 then oscillating
% fis''-g'' in a six-bar crescendo (octaves 350-353, D-A pair); 354-357 the figure (Theme 1's
% head in C minor) at f -> ff; 358-361 the non-legato descent under the tutti D7(b9) hit.
% Dynamics: pp 337.3, p 346.1, swells as source, cresc. 348-353, f 354.1, cresc. on to ff at [K].

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
  % 350-353: octaves, D-A pair, positions 4 -> 3 as in ep11's 281-288.
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
  % root, fifth and flat 9 of D7(b9). Two voices keep all six 8ths; the open strings ring for the
  % quarter. "non legato" hangs on the lower voice, right of the downbeat and above the hairpin.
  <<
    { ees'''8 c'''8 ees'''8 d'''8 c'''8 a''8 }
    \\
    { <d' a'>4-! -\tweak outside-staff-priority #100 -\tweak self-alignment-X #LEFT
      -\tweak X-offset #1.5 _\markup \italic "non legato" s2 }
  >>                                                                           | % 358
  c'''8 bes''8 a''8 fis''8 a''8 g''8                                           | % 359
  fis''8 c''8 ees''8 d''8 c''8 a'8                                             | % 360
  c''8 bes'8 a'8 fis'8 a'8 g'8                                                 | % 361
  \barNumberCheck #362
}
