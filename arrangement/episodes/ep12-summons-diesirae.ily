\version "2.24.3"
% Episode 12 -- bars 309-337 "Summons, stamps, two themes" [I]. The orchestra layered over the
% solo's own notes: 309.1 Fl1's goal fis', then the tritone summons verbatim; 312.3-320 the
% strings' pizz chords in the solo's rests, the solo's gruff stamp des'/c'/bes as double-stops
% with the wind chord's D-string tone; 321-337 Theme 2 in the solo over V1a's pp Theme-1 cell.
% Pizz: "pizz." on a group's first chord, "arco" on the solo's re-entry.

epTwelve = \absolute {
  \barNumberCheck #309
  % 309.1: Fl1 fis'4) = the goal of the 305-308 run, over the p D chord (Fl2/Cl2 d', Cl1 fis,
  % Bn1 a, Bn2 d, V1a d'8-., V2 d''/d', Vc/Cb d pizz, Ti d8 d8 d4-., Xy d'). 309.3-312.2 VSolo
  % verbatim (the tritone summons), f.
  fis'4 r4 <d' a'>4-.\f                                                        | % 309
  <a' ees''>8\open <a' ees''>8\open <a' ees''>4\open <d' a'>4-.                | % 310
  <a' ees''>8\open <d' a'>8 <a' ees''>8\open <d' a'>8 <a' ees''>8\open <d' a'>8 | % 311
  % 312.3-313.2: strings pizz (V1a d'', V2 d', A <a fis'>, Vc/Cb d; Ti d pp) = the D stamp; then
  % E-flat 7 (V1a <bes' g''>, V2 <g' ees''>, A <bes g'>, Vc/Cb des) x2 -- the Episode 11 Gr6 hand.
  <a' ees''>4\open <d' a'>4-. <d' a' fis''>4\p^"pizz."                         | % 312
  <des' g' bes' ees''>4 <des' g' bes' ees''>4 <des' g'>4-.\f^"arco"            | % 313
  % 313.3-316.2: VSolo des' (= Bn1 des') under Hb1 f''/bes', Hb2 bes', Cl1 g', Cl2 ees' in the
  % solo's rhythm -> <des' g'>: the D-string chord tone over the solo's note.
  <des' g'>8-. <des' g'>8-. <des' g'>4-. <des' g'>4-.                          | % 314
  <des' g'>8 <des' g'>8 <des' g'>8 <des' g'>8 <des' g'>8 <des' g'>8            | % 315
  <des' g'>4-. <des' g'>4-. <des' g' bes' ees''>4\p^"pizz."                    | % 316 .3: strings' upbeat
  % 317.1-2 / 318.3: strings pizz A-flat (V1a aes'', V2 <aes' ees''>, A <aes ees'>, Vc/Cb c);
  % 317.3-318: VSolo c' (= Bn1) under Hb1 ees''/bes'', Hb2 ees'', Cl1 aes', Cl2 ees' -> <c' aes'>.
  <aes' c'' ees''>4 <aes' c'' ees''>4 <c' aes'>4-.\f^"arco"                    | % 317
  <c' aes'>8-> <c' aes'>8 <c' aes'>4-. <aes' c'' ees''>4\p^"pizz."             | % 318
  % 319.1-2: strings pizz C-sharp dim7 (V1a des'''/des'', V2 <g' e''>, A <g e'>, Vc/Cb bes);
  % 319.3-320: VSolo bes (= Bn1) under Hb1 g'', Hb2 cis'', Cl1 g', Cl2 e' -> <bes e'>. 320.3 the
  % tutti G (Bn/Ti/C1-2/Tp g, Fl cis'''), 321.1 the tutti D (Bn/Ti/Tp/C1 d, Hb fis''/d'', Fl d'''),
  % p: taken as the open G and D.
  <bes g' e''>4 <bes g' e''>4 <bes e'>4-.\f^"arco"                             | % 319
  <bes e'>8-> <bes e'>8 <bes e'>4-. g4-.\p                                     | % 320
  % 321.2-323.2: V1a's first Theme-1-head cell pp (r4 d' fis' d' e' | fis' e' d' | f' e' d'),
  % entirely in the solo's rests. 323.3 VSolo d'' espress. (V1a's d'4-. not added).
  d'4-. d'8-.\pp fis'8-. d'8-. e'8-.                                           | % 321
  fis'4-. e'4-. d'4-.                                                          | % 322
  f'!4-. e'4-.
    d''4-\tweak self-alignment-X #CENTER -\markup{\dynamic "(f)"}^\markup\italic "espress." | % 323
  % 323.3-337: VSolo Theme 2 verbatim with its own slurs and hairpins. V1a's cells 2-3 show their
  % tails in the solo's rests: 327.1-2 ees' d', 331.1-2 d' c', and 331.3 bes under the solo's g'.
  f''!4( e''4 d''4)                                                            | % 324
  e''2.(                                                                       | % 325
  a'2.)                                                                        | % 326
  ees'!4-.\pp d'4-. <c' c''>4\>                                                | % 327 V1a tail; solo c''
  ees''4( d''4 c''4)                                                           | % 328
  d''2.(                                                                       | % 329
  g'2.)\!                                                                      | % 330
  d'4-.\pp c'4-. <bes g'>4\p                                                   | % 331 V1a tail; solo g' + V1a bes
  bes'4( a'4 g'4)                                                              | % 332
  a'2(\< e'4)\!                                                                | % 333
  g'2.(                                                                        | % 334
  f'2.                                                                         | % 335
  ees'2.)\>                                                                    | % 336
  % 337: VSolo d'2.~ held through 339.1. The strings' rising line begins on 337.3 (V1a ees') as
  % the chord's upper note over the held d' (d' on the G string, 4th finger; the line on the D).
  d'2\!~ <d'~ ees'>4(\pp                                                       | % 337 -> 338 (Ep 13)
  \barNumberCheck #338
}
