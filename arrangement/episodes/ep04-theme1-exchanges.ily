\version "2.24.3"
% Episode 4 -- bars 65-116 "Theme 1 exchanges" [A]. 65-68, 73-76 the solo's d' downbeat + Hb 1's
% Theme-1 head at d'', bass D as an LH-pizz "-+" under 66-68, 74-76; 69-84, 93-100 the solo
% verbatim; 85-92 V1a's theme at g'' with the tutti chords (85/86/88 pizz); 101 the solo's g'' +
% V1a's largamente upbeat; 102-116 Theme 2 at g' with the Cl stabs on beats 2-3 as double-stops
% (nearest wind pitch forming an adjacent-string double-stop in 1st position); the open G there
% is bowed -- a real tutti strum, not an LH-pizz click.

epFour = \absolute {
  \barNumberCheck #65
  % 65-68: solo's own d' downbeat + Hb 1 Theme-1 head at d''
  d'4  d''8-.\p fis''8-. d''8-. e''8-.                                        | % 65
  <fis'' \tweak font-size #-3 d'_+>4-- e''8-. fis''8-. d''8-. fis''8-.      | % 66 ad lib LH-pizz D
  <e'' \tweak font-size #-3 d'_+>8( d''8) d''8-. fis''8-. d''8-. e''8-.     | % 67 ad lib LH-pizz D
  <fis'' \tweak font-size #-3 d'_+>4-- e''8-. fis''8-. d''8-. fis''8-.      | % 68 ad lib LH-pizz D
  % 69-72: VSolo verbatim (69.1 g''4-. is Hb 1's phrase close on the solo's rest), marcatissimo
  g''4-.  g'8-.\f^"marcatissimo" bes'8-. g'8-. a'8-.                          | % 69
  bes'4-. ees'8-. g'8-. ees'8-. f'8-.                                         | % 70
  g'4-. bes8-. ees'8-. bes8-. d'8-.                                           | % 71
  ees'4-- ees'8-. ees'8-. ees'8-. ees'8-.                                     | % 72
  % 73-76: solo's own d' downbeat + Hb 1 head again (no "ten." in Hb 1 here)
  d'4-. d''8-. fis''8-. d''8-. e''8-.                                         | % 73
  <fis'' \tweak font-size #-3 d'_+>4 e''8-. fis''8-. d''8-. fis''8-.        | % 74 ad lib LH-pizz D
  <e'' \tweak font-size #-3 d'_+>8( d''8) d''8-. fis''8-. d''8-. e''8-.     | % 75 ad lib LH-pizz D
  <fis'' \tweak font-size #-3 d'_+>4 e''8-. fis''8-. d''8-. fis''8-.        | % 76 ad lib LH-pizz D
  % 77-84: VSolo verbatim (77.1 g''4-. is Hb 1's phrase close), f then ff open-string chords
  g''4-. g'8-.\f bes'8-. g'8-. a'8-.                                          | % 77
  bes'4-. ees'8-. g'8-. ees'8-. f'8-.                                         | % 78
  g'4-. bes8-. ees'8-. bes8-. d'8-.                                           | % 79
  ees'4-- ees'8-. ees'8-. ees'8-. ees'8-.                                     | % 80
  d'4-. <d' a'>8\ff <d' a'>8 <d' a'>8 <d' a'>8                                | % 81
  <a' ees''>4\open <d' a'>8 <d' a'>8 <d' a'>8 <d' a'>8                        | % 82
  <a' ees''>4-.\open <d' a'>4-. <a' ees''>4-.\open                            | % 83
  <d' a'>4-. <a' ees''>4-.\open <d' a'>4-.                                    | % 84
  % 85-92: V1a's theme at g'', f, tutti chords on 86/88/90/92; 85/86/88 chords pizz, no tenuto.
  <g d' bes' g''>4\f^"pizz."  g''8-. bes''8-. g''8-. a''8-.            | % 85 pizz
  <g d' bes' bes''>4^"pizz." a''8-. bes''8-. g''8-. bes''8-.           | % 86 pizz
  a''8( g''8) g''8-. bes''8-. g''8-. a''8-.                                   | % 87
  <g d' bes' bes''>4^"pizz." a''8-. bes''8-. g''8-. bes''8-.           | % 88 pizz
  aes''8-. r8 aes''8-. c'''8-. aes''8-. bes''8-.                              | % 89
  <f'' c'''>4-- bes''8-. c'''8-. aes''8-. c'''8-.                             | % 90
  bes''8( aes''8) aes''8-. c'''8-. aes''8-. bes''8-.                          | % 91
  <f'' c'''>4-! aes''8-. c'''8-. bes''8-. aes''8-.                            | % 92
  % 93-100: VSolo verbatim, ff "2e corde"
  r4 g''8-.\ff^"2e corde" bes''8-. g''8-. a''8-.                              | % 93
  bes''4-- a''8-. bes''8-. g''8-. bes''8-.                                    | % 94
  a''8\prall( g''8) g''8-. bes''8-. g''8-. a''8-.                             | % 95
  bes''4-- a''8-. bes''8-. g''8-. bes''8-.                                    | % 96
  aes''8-. r8 aes''8-. c'''8-. aes''8-. bes''8-.                              | % 97
  c'''4-- bes''8-. c'''8-. aes''8-. c'''8-.                                   | % 98
  bes''8\prall( aes''8) aes''8-. c'''8-. aes''8-. bes''8-.                    | % 99
  c'''4-! aes''8-. c'''8-. bes''8-. aes''8-.                                  | % 100
  % 101: VSolo's last note (g'') + V1a's largamente upbeat (d') (= Episode 3's bar 49)
  g''4-. r4 d'4\f^"largamente"                                                | % 101
  % 102-116: Theme 2 in V1a at g' (= VSolo 49-64) with the wind stabs on beats 2-3 only (winds
  % rest on 1). Sounding: Cl1 d''/bes' + Cl2 bes'/g' under the G bass (102-106, 110-114); Cl1
  % fis''/d'' + Cl2 d''/a' under the A bass (107, 109, 115); 108 e''/cis'' + cis''/a'; 116
  % fis'/e' + d'/cis'; Fl/Hb/Pic double at the octave(s) above from 108. 116.2 has no playable
  % partner (fis'/d' share the D string; fis'' is on the non-adjacent E-flat string).
  << { r4 bes'4-. bes'4-. } \\ { <g g'>2 g'4 } >>      | % 102 arco double-stop
  << { r4 bes'4-. bes'4-. } \\ { <g f'>2 f'4 } >>      | % 103 arco double-stop
  << { r4 bes'4-. bes'4-. } \\ { <g e'>2 e'4 } >>      | % 104 arco double-stop
  << { r4 bes'4-. bes'4-. } \\ { <g ees'!>2 ees'4 } >> | % 105 arco double-stop
  <g d'>4->( <e' bes'>4-> <g' bes'>4->)                | % 106 arco double-stop
  fis'4->( <e' a'>4-> <d' a'>4->)                  | % 107
  << { r4 a'4-. a'4-. } \\ { e'2 e'4 } >>          | % 108
  fis'4 <fis' d''>4-. <d' a'>4                     | % 109 stab alone on the melody's rest
  << { r4 bes'4-. bes'4-. } \\ { <g g'>2 g'4 } >>     | % 110 arco double-stop
  << { r4 bes'4-. bes'4-. } \\ { <g f'!>2 f'4 } >>    | % 111 arco double-stop
  << { r4 bes'4-. bes'4-. } \\ { <g e'>2 e'4 } >>     | % 112 arco double-stop
  << { r4 bes'4-. bes'4-. } \\ { <g ees'!>2 ees'4 } >>| % 113 arco double-stop
  <g d'>4->( <g' bes'>4-> <g' bes'>4->)               | % 114 arco double-stop
  a'4->( <fis' a'>4-> <d' a'>4->)                  | % 115
  fis'2->( <cis' e'>4->)                           | % 116 A7 -> D at 117
  \barNumberCheck #117
}
