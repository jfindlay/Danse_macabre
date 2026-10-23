\version "2.24.3"
% Episode 3 -- bars 49-64 "Theme 2 largamente" (decided 2026-10-18, see docs/NOTES.md).
% Bar 49: V1a's last note (g'4, closing Episode 2's restatement) then the solo's own upbeat.
% 49.3-64: VSolo verbatim. Ad lib (engraved 2026-10-23, "LH-pizz bass" device): LH-pizz open G on
% the downbeats of 50-54 and 58-62 (cello bass is G there; the melody sits on the D/A strings),
% as small chord-tone noteheads with the "-+" pizz mark. Nothing on 55-57 or 63-64 (bass A/D sits
% above or on the melody's own string). No counter-voices. 62 is included in the range per the
% decision log's "58-62" (symmetric with 50-54's five bars), even though an earlier pass's inline
% comments stopped at 61.

epThree = \absolute {
  \barNumberCheck #49
  g'4-. r4 d'4\f^"largamente"                                                 | % 49
  <g' \tweak font-size #-3 g-+>2 g'4                                        | % 50 ad lib LH-pizz G
  <f' \tweak font-size #-3 g-+>2 f'4                                        | % 51 ad lib LH-pizz G
  <e' \tweak font-size #-3 g-+>2 e'4                                        | % 52 ad lib LH-pizz G
  <ees'! \tweak font-size #-3 g-+>2 ees'4                                   | % 53 ad lib LH-pizz G
  <d' \tweak font-size #-3 g-+>4 e'4 g'4                                    | % 54 ad lib LH-pizz G
  fis'4 e'4 d'4                                                             | % 55
  e'2 e'4                                                                   | % 56
  fis'4 r4 d'4                                                              | % 57
  <g' \tweak font-size #-3 g-+>2 g'4                                        | % 58 ad lib LH-pizz G
  <f'! \tweak font-size #-3 g-+>2 f'4                                       | % 59 ad lib LH-pizz G
  <e' \tweak font-size #-3 g-+>2 e'4                                        | % 60 ad lib LH-pizz G
  <ees'! \tweak font-size #-3 g-+>2 ees'4                                   | % 61 ad lib LH-pizz G
  <d' \tweak font-size #-3 g-+>4 g'4 bes'4                                  | % 62 ad lib LH-pizz G
  a'4 fis'4 d'4                                                               | % 63
  fis'2 e'4                                                                   | % 64
  \barNumberCheck #65
}
