\version "2.24.3"
% Episode 14 -- bars 362-393 "Runs and tutti" [K]. V1a's own part as the spine, the tutti's
% frame folded into its rests and downbeats: 362-365 the non-legato cell under the brass's D7
% stab; 366-369 the winds' rise to the G-minor crash at 370.1; 370-375 Theme 1 ff at g'' with the
% four-string chord on odd bars, 376-377 the tail and the bass rise to the D stamp at 378.1;
% 378-385 the second statement in sixths/octaves; 386-393 the D arrival, the vamp, the winds'
% return. Dynamics as source: ff 362.1, f 366.2, cresc 368, ff 370.1, ff restated at 391.

epFourteen = \absolute {
  \barNumberCheck #362
  % 362-365: the cell (V1a/V2, slurred as in the source) with the brass D7 stab on the downbeat 8th.
  <c' fis' a'>8-.\ff\upbow c'8\downbow( ees'8\sf d'8 c'8 a8)                   | % 362 [K] ff ends the cresc.
  <c' fis' a'>8-. c'8( ees'8\sf d'8 c'8 a8)                                    | % 363
  <c' fis' a'>8-. c'8( ees'8\sf d'8 c'8 a8)                                    | % 364
  <c' fis' a'>8-. c'8( ees'8\sf d'8 c'8 a8)                                    | % 365
  % 366-369: the winds' rise from the open D (last brass stab on 366.1), slurred per bar.
  <c' fis' a'>8-. d'8(\f ees'8 e'8 f'8 fis'8)                                  | % 366
  g'8( gis'8 a'8 bes'8 b'8 c''8)                                               | % 367
  cis''8(\< d''8 ees''8 e''8 fis''8 g''8)                                      | % 368
  a''8( bes''8 c'''8 d'''8 e'''8 fis'''8)                                      | % 369 4th -> 6th pos.
  % 370-375: Theme 1 ff at g'' with the G-minor four-string chord on the odd-bar downbeats.
  <g d' bes' g''>4\ff g''8 bes''8 g''8 a''8                                    | % 370
  <g d' bes' bes''>4 a''8 bes''8 g''8 bes''8                                   | % 371
  a''8( g''8) g''8 bes''8 g''8 a''8                                            | % 372
  <g d' bes' bes''>4 a''8 bes''8 g''8 bes''8                                   | % 373
  a''8( g''8) g''8 bes''8 g''8 a''8                                            | % 374
  <g d' bes' bes''>4 a''8 bes''8 g''8 bes''8                                   | % 375
  % 376-377: the tail at V1a's octave, then the bass rise from the open A.
  d'''4 e'''8 fis'''8 d'''8 fis'''8                                            | % 376
  a'''4-! a8 ais8 b8 cis'8                                                     | % 377
  % 378-383: the second statement in sixths/octaves over the winds' bes', odd-bar chords as before;
  % 378.1 the tutti's D-major stamp.
  <d' a' fis''>4-! <bes' g''>8 <bes' bes''>8 <bes' g''>8 a''8                  | % 378
  <g d' bes' bes''>4 a''8 <bes' bes''>8 <bes' g''>8 <bes' bes''>8              | % 379
  a''8( g''8) <bes' g''>8 <bes' bes''>8 <bes' g''>8 a''8                       | % 380
  <g d' bes' bes''>4 a''8 <bes' bes''>8 <bes' g''>8 <bes' bes''>8              | % 381
  a''8( g''8) <bes' g''>8 <bes' bes''>8 <bes' g''>8 a''8                       | % 382
  <g d' bes' bes''>4 a''8 <bes' bes''>8 <bes' g''>8 <bes' bes''>8              | % 383
  % 384-385: the violins' triplet-measured tremolo at V1a's octave; 385.2 the bass rise again.
  \tuplet 3/2 { fis'''4.:8 } \tuplet 3/2 { d'''4.:8 } \tuplet 3/2 { fis'''4.:8 } | % 384
  \tuplet 3/2 { a'''4.:8 } a8 ais8 b8 cis'8                                    | % 385
  % 386-389: D arrival, then the strings-alone vamp: open D 8ths, cis' (G string, 4th finger) on
  % the downbeat. Nothing added; ff runs on (the source has no new string dynamic; GC mf).
  <d' a' fis''>4 d'8 d'8 d'8 d'8                                               | % 386
  cis'4 d'2:8                                                                  | % 387
  cis'4 d'2:8                                                                  | % 388
  cis'4 d'2:8                                                                  | % 389
  % 390-393: the winds join on the 8ths at 390.2 (octaves); from 391 the downbeat is c-natural
  % everywhere = D7, the four-string stab, ff with GC/Cym, into [L] 394.
  cis'4 <d' d''>2:8                                                            | % 390
  <c' fis' a' fis''>4\ff <d' d''>2:8                                           | % 391
  <c' fis' a' fis''>4 <d' d''>2:8                                              | % 392
  <c' fis' a' fis''>4 <d' d''>2:8                                              | % 393
  \barNumberCheck #394
}
