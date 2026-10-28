\version "2.24.3"
% Episode 16 -- bars 416-437 "Animato" (M at 430). The climax: V1a's line as the spine, the
% register spent. 416-418 the descent in octaves, V1a (A string) under the piccolo's sounding
% pitch (E-flat string); 419-420, 424-425 Theme 1's head an octave above V1a; 421-423 the
% descent in octaves a register lower; 426-437 V1a's figure as one line (stems down) under the
% flute/piccolo's stamp (stems up: g'/fis' 426-429, <d' g'> from [M]); sautillé at 433.
% Dynamics as source: ff 416, fff 433.

epSixteen = \absolute {
  \barNumberCheck #416
  % 416-418: V1a (A string, 22 -> 15) under Pic's sounding pitch (E-flat string, 28 -> 21);
  % fallback = the upper voice alone.
  <g''' g''''>4-!\ff <f'''! f''''!>4 <ees''' ees''''>4                         | % 416 Animato, tutti crash
  <f''' f''''>4 <ees''' ees''''>4 <d''' d''''>4                                | % 417
  <ees''' ees''''>4 <d''' d''''>4 <c''' c''''>4                                | % 418
  % 419-420: Theme 1's head on A-flat (Ab/C) then F-sharp (D), an octave above V1a.
  aes'''8 c''''8 aes'''8 bes'''8 c''''4                                        | % 419
  fis'''8 a'''!8 fis'''8 g'''8 a'''4                                           | % 420
  % 421-423: the descent in octaves (V1a + the octave above), A/E-flat pair; 421.1 the crash with
  % the open G and D rolled under the octave.
  <g d' g'' g'''>4-! <f''! f'''!>4 <ees'' ees'''>4                             | % 421 crash
  <f'' f'''>4 <ees'' ees'''>4 <d'' d'''>4                                      | % 422
  <ees'' ees'''>4 <d'' d'''>4 <c'' c'''>4                                      | % 423 widest stretch (A 3 / Eb 9)
  % 424-425: the head figure an octave above V1a (= V1a's 419-420).
  aes''8 c'''8 aes''8 bes''8 c'''4                                             | % 424
  fis''8 a''!8 fis''8 g''8 a''4                                                | % 425 -> the drop to the open G
  % 426-437: V1a's figure as the one line (lower voice, stems down) with the flute/piccolo's
  % stamp as a quarter on beat 2 above it (upper voice, stems up): g'/fis' alternating 426-429,
  % then <d' g'> (open D + 4th finger over the G-string line) from [M] to the double bar.
  << { s4 g'4 s4 } \\ { g8 bes8 g8 a8 bes4 } >>                                | % 426
  << { s4 fis'4 s4 } \\ { c'8 b8 bes8 a8 aes4 } >>                             | % 427
  << { s4 g'4 s4 } \\ { g8 bes8 g8 a8 bes4 } >>                                | % 428
  << { s4 fis'4 s4 } \\ { c'8 b8 bes8 a8 aes4 } >>                             | % 429
  % 430-432 [M]
  << { s4 <d' g'>4 s4 } \\ { g8 bes8 g8 a8 bes4 } >>                           | % 430 [M]
  << { s4 <d' g'>4 s4 } \\ { g8 bes8 g8 a8 bes4 } >>                           | % 431
  << { s4 <d' g'>4 s4 } \\ { g8 bes8 g8 a8 bes4 } >>                           | % 432
  % 433-437 fff: the figure runs in continuous 8ths.
  << { s4 <d' g'>4 s4 } \\ { g8\fff_\markup\italic "sautillé" bes8 g8 a8 bes8 g8 } >> | % 433
  << { s4 <d' g'>4 s4 } \\ { a8 bes8 g8 a8 bes8 g8 } >>                       | % 434
  << { s4 <d' g'>4 s4 } \\ { a8 bes8 g8 a8 bes8 g8 } >>                       | % 435
  << { s4 <d' g'>4 s4 } \\ { a8 bes8 g8 a8 bes8 g8 } >>                       | % 436
  << { s4 <d' g'>4 s4 } \\ { a8 bes8 g8 a8 bes8 g8 } >>                       | % 437 -> 438 Tempo 1
  \barNumberCheck #438
}
