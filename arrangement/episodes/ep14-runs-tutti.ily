\version "2.24.3"
% Episode 14 -- bars 362-393 "Runs and tutti" [K] (decided 2026-10-27, user + agent; see
% docs/NOTES.md and docs/PLAN.md's Episode 14 draft). Absolute pitch.
%
% Concept: V1a's own part is the spine, with the tutti's frame folded into its rests and
% downbeats. (1) 362-365 the non-legato cell fis' | c'( ees'\sf d' c' a) that Episode 13's
% descent lands on, four times; the brass's staccato D7 quarter on every downbeat (horns d/c'/a,
% Tp a'/fis') fills the cell's downbeat 8th as the three-string stab <c' fis' a'> (7th, 3rd, 5th,
% open A on top; 362.1's fis' is the line's own note inside it). (2) 366-369 the winds' rise
% (Fl1/Fl2/Cl1): a chromatic octave from the open D, then G melodic minor to fis''' (6th position),
% f, cresc. from 368, slurred per bar as Episode 11's runs; it lands not on the flutes' g''' but on
% V1a's own 1st-position crash <g d' bes' g''> at 370.1 (user: the chord, not the open-string
% <g d' a' g'''>). (3) 370-375 Theme 1 ff at g'' (V1a/V2's octave) with the G-minor four-string
% chord on the odd-bar downbeats -- Episode 4's 85-88 texture, now arco -- and 376-377's tail at
% V1a's own d'''-a''' (6th-8th position; a''' is the piece's top), then the bass rise a-ais-b-cis'
% from the open A (V2/Va/Vc/Cb) to the D-major stamp <d' a' fis''> at 378.1.
% (4) 378.2-383 the second statement (V2/Vc; V1a has tremolo colour on g''', not a line) in
% sixths and octaves over the winds' hammered bes' (<bes' g''> <bes' bes''>, a'' single: the
% orchestra's own thickening by tremolo + piccolo rendered as double-stops), same odd-bar chords;
% 384-385 the tail as the violins' triplet-measured tremolo at V1a's octave (fis''' d''' fis''' |
% a'''), then the bass rise again from the open A as at 377. (5) 386-389 the D arrival as
% <d' a' fis''>, then the strings-alone vamp on the open D with the G-string cis' on the downbeat
% (cis'4 d'2:8), nothing added -- the orchestra is bare here (V1/V2/Vc d', Va/Cb d, Ti, GC mf);
% ff runs on. (6) 390-393 the winds re-enter on the 8ths at 390.2 -> octaves <d' d''>; the
% downbeats turn c-natural at 391 (D7 everywhere) -> the four-string stab <c' fis' a' fis''>,
% the opening stab's chord with the winds' fis'' on top, ff with GC/Cym, into [L] 394 (G minor).
% Hand: 1st position throughout except the run's top (369: 4th -> 6th), 376-377 and 384-385
% (4th -> 8th); every chord is 1st position with open strings.
% Not carried: Tb1/Tb2's chromatic countermelody g'-f'-e'-ees'-d' against the theme (two strings
% away from the theme at any octave, too sparse to stand alone); the bassoons' contrary-motion
% descent and the Hb/horn d' pedal under the run; the winds'/horns' repeated-8th g/bes hammer
% (present only as the downbeat chords); V1a's 378 descent d' c' bes a g (the theme restart
% wins) and its 379-383 tremolo arpeggio to g'''; the Trg roll 370-386; Ti/GC/Cym; the
% bass rise's doubling at 385 (the solo takes it from the violins' tremolo).
% Dynamics as source: cresc. running through 361 to ff at [K] 362.1 (user, 2026-10-28; no ff
% written at 358; the "non legato" is marked once, at 358); f at the run's start 366.2, cresc. 368, ff 370.1;
% \sf on the cell's ees'; -! on 377.1 / 378.1; ff restated at 391 with the GC/Cym.

epFourteen = \absolute {
  \barNumberCheck #362
  % 362-365: the cell (V1a/V2, slurred as in the source) with the brass D7 stab on the downbeat 8th.
  <c' fis' a'>8-.\ff c'8( ees'8\sf d'8 c'8 a8)                                 | % 362 [K] ff ends the cresc.
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
  % 376-377: the tail at V1a's octave, then the bass rise from the open A (the run's non legato, marked at 358, carries on).
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
