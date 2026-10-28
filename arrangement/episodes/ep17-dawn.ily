\version "2.24.3"
% Episode 17 -- bars 438-454 "Dawn" (Tempo 1 at 438). Three events, each the only thing sounding,
% lifted at pitch as the one line: 438-439 the horns' E-flat (horn 1's ees', D string, 1st
% finger; the pedal ends at 439, the crow's ees'' at 440.1 is a fresh attack); 440-445 the oboe's
% cock-crow on the E-flat string, its tail absorbed by the strings' entry; 445-454 the strings'
% C-sharp dim 7 tremolo as <cis' g'> (the tritone), f > p > fermata, dynamics as V1a.

epSeventeen = \absolute {
  \barNumberCheck #438
  % 438-439: the horns' E-flat at pitch (horn 1's ees', D string), fp.
  ees'2.\fp~                                                                   | % 438 Tempo 1 -- horns' E-flat
  ees'2.                                                                       | % 439
  % 440-445: the oboe's cock-crow, verbatim, on the E-flat string.
  ees''4\f r8 bes''8-. bes''4-.                                                | % 440 cock-crow
  ees''4-. g''2->~                                                             | % 441
  g''2.~                                                                       | % 442
  g''2.\>~                                                                     | % 443
  g''2.                                                                        | % 444 (tail absorbed at 445.1)
  % 445-454: Vc cis + Va g, 8va -- the C-sharp dim 7's tritone; 2nd position, 4 on G, 3 on D.
  <cis' g'>2.:16\f\>                                                            | % 445 strings enter (oboe's tail absorbed)
  <cis' g'>2.:16                                                                | % 446
  <cis' g'>2.:16                                                                | % 447
  <cis' g'>2.:16                                                                | % 448
  <cis' g'>2.:16                                                                | % 449
  <cis' g'>2.:16                                                                | % 450
  <cis' g'>2.:16\p\>                                                            | % 451
  <cis' g'>2.:16                                                                | % 452
  <cis' g'>2.:16\!                                                              | % 453
  <cis' g'>2.:16\fermata^\markup\italic "très long" _\markup\italic "toujours en dim." | % 454 -> 455 déclamé
  \barNumberCheck #455
}
