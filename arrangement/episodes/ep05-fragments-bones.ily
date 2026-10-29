\version "2.24.3"
% Episode 5 -- bars 117-136 "Fragments and bones" [B]. Tutti D-major pizz stamps at 117/125/133;
% the solo's Theme 1 in D at d'' (117.2-121.1, 125.2-129.1); the wind choir's Theme 1 in G minor
% at g'' doubled by xylophone (121.2-125.1, 129.2-133.1) over col legno battuto string chords; ff
% chords 133.2-136. Ad lib: LH-pizz open D on 119/127 as a small "-+" notehead; 118/120/126/128
% full pizz, the next eighth bowed by the one-note pizz convention; 136.3's F-sharp a full "-+".

epFive = \absolute {
  \barNumberCheck #117
  % 117.1 tutti D stamp (pizz); 117.2-121.1 VSolo verbatim
  <d' a' fis''>4\f^"pizz."  d''8-. fis''-. d''-. e''-.                        | % 117
  <fis'' d'>4^"pizz." e''8-. fis''-. d''-. fis''-.                    | % 118 pizz
  <e'' \tweak font-size #-3 d'_+>8\prall^( d'') d''-. fis''-. d''-. e''-.    | % 119 ad lib D
  <fis'' d'>4^"pizz." e''8-. fis''-. d''-. fis''-.                    | % 120 pizz
  % 121.1 VSolo g''; 121.2-125.1 wind choir Theme 1 at g''' col legno battuto; pizz double-stops
  g''4-.  <bes' g''>8-.\f^"col legno battuto" bes''-. <bes' g''>-. a''-.             | % 121
  bes''4-.  <bes' ees''>8-.\open g''-. <bes' ees''>-.\open f''-.                     | % 122
  g''4-.  <ees' bes'>8-. ees''-.\open <ees' bes'>-. d''-.                            | % 123
  ees''4--\open  <bes' ees''>8-.\open ees''-.\open <bes' ees''>-.\open ees''-.\open  | % 124
  % 125.1 stamp; 125.2-129.1 VSolo verbatim
  <d' a' fis''>4\f^"pizz."  d''8-.\f fis''-. d''-. e''-.                      | % 125
  <fis'' d'>4^"pizz." e''8-. fis''-. d''-. fis''-.                    | % 126 pizz
  <e'' \tweak font-size #-3 d'_+>8\prall^( d'') d''-. fis''-. d''-. e''-.    | % 127 ad lib D
  <fis'' d'>4^"pizz." e''8-. fis''-. d''-. fis''-.                    | % 128 pizz
  % 129.2-133.1 as 121-125 but strings col legno incl. A's downbeat chord (130-132)
  g''4-.  <bes' g''>8-.\f^"col legno battuto" bes''-. <bes' g''>-. a''-.             | % 129
  <bes' bes''>4-.  <bes' ees''>8-.\open g''-. <bes' ees''>-.\open f''-.              | % 130
  <bes' g''>4-.  <ees' bes'>8-. ees''-.\open <ees' bes'>-. d''-.                     | % 131
  <bes' ees''>4--\open  <bes' ees''>8-.\open ees''-.\open <bes' ees''>-.\open ees''-.\open | % 132
  % 133.1 stamp; 133.2-136 VSolo verbatim ff
  <d' a' fis''>4\f^"pizz."  <d' a'>8\ff <d' a'> <d' a'> <d' a'>               | % 133
  <a' ees''>4-.\open <d' a'>8 <d' a'> <d' a'> <d' a'>                                | % 134
  <a' ees''>4-.\open <d' a'>4-. <a' ees''>4-.\open                                   | % 135
  <d' a'>4-. <a' ees''>4-.\open <d' a' fis''-+>4-.                                   | % 136 ad lib fis'' (tutti stamp)
  \barNumberCheck #137
}
