\version "2.24.3"
% Episode 3 -- bars 49-64 "Theme 2 largamente". Bar 49: V1a's last g' then the solo's upbeat;
% 49.3-64 the solo verbatim, no counter-voices. Ad lib: LH-pizz open G on the downbeats of 50-54
% and 58-62 as small "-+" noteheads; none on 55-57, 63-64 (the bass sits on or above the
% melody's string).

epThree = \absolute {
  \barNumberCheck #49
  g'4-. r4 d'4\f^"largamente"                                                 | % 49
  <g' \tweak font-size #-3 g_+>2 g'4                                        | % 50 ad lib LH-pizz G
  <f' \tweak font-size #-3 g_+>2 f'4                                        | % 51 ad lib LH-pizz G
  <e' \tweak font-size #-3 g_+>2 e'4                                        | % 52 ad lib LH-pizz G
  <ees'! \tweak font-size #-3 g_+>2 ees'4                                   | % 53 ad lib LH-pizz G
  <d' \tweak font-size #-3 g_+>4 e'4 g'4                                    | % 54 ad lib LH-pizz G
  fis'4 e'4 d'4                                                             | % 55
  e'2 e'4                                                                   | % 56
  fis'4 r4 d'4                                                              | % 57
  <g' \tweak font-size #-3 g_+>2 g'4                                        | % 58 ad lib LH-pizz G
  <f'! \tweak font-size #-3 g_+>2 f'4                                       | % 59 ad lib LH-pizz G
  <e' \tweak font-size #-3 g_+>2 e'4                                        | % 60 ad lib LH-pizz G
  <ees'! \tweak font-size #-3 g_+>2 ees'4                                   | % 61 ad lib LH-pizz G
  <d' \tweak font-size #-3 g_+>4 g'4 bes'4                                  | % 62 ad lib LH-pizz G
  a'4 fis'4 d'4                                                               | % 63
  fis'2 e'4                                                                   | % 64
  \barNumberCheck #65
}
