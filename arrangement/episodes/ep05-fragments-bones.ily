\version "2.24.3"
% Episode 5 -- bars 117-136 "Fragments and bones" [B] (decided 2026-10-18, see docs/NOTES.md and
% docs/PLAN.md's Episode 5 draft). The PLAN draft is written \fixed c' (written an octave below
% sounding); every pitch below is shifted up one octave from that draft to land at sounding,
% absolute pitch, per the project's pitch convention (see NOTES.md "Conventions").
%
% Orchestra: tutti D-major pizz stamps at 117.1/125.1/133.1 (harp/winds/horns/timp); solo Theme 1
% in D major at d'' (117.2-121.1, 125.2-129.1); wind choir Theme 1 in G minor at g'' doubled by
% xylophone (121.2-125.1, 129.2-133.1), col legno battuto string chords under it; solo ff chords
% 133.2-136. See docs/NOTES.md Episode 5 decisions for the col-legno/xylophone rationale.
%
% Ad lib (engraved 2026-10-23, "LH-pizz bass" device): LH-pizz open D on the downbeats of
% 118-120/126-128 (Cl/Bn/timp sound D there), as small chord-tone noteheads with "-+". 136.3
% carries the tutti stamp's F-sharp (Hb2/Cl2/Tb1) as a small ad-lib chord tone the same way.

epFive = \absolute {
  \barNumberCheck #117
  % 117.1 tutti D stamp (pizz); 117.2-121.1 VSolo verbatim
  <d' a' fis''>4\f^"pizz."  d''8-.^"arco" fis''-. d''-. e''-.                        | % 117
  <fis'' \tweak font-size #-3 d'-+>4-- e''8-. fis''-. d''-. fis''-.          | % 118 ad lib D
  <e'' \tweak font-size #-3 d'-+>8\prall( d'') d''-. fis''-. d''-. e''-.     | % 119 idem
  <fis'' \tweak font-size #-3 d'-+>4-- e''8-. fis''-. d''-. fis''-.          | % 120 idem
  % 121.1 VSolo g''; 121.2-125.1 wind choir Theme 1 at g''' col legno battuto; pizz double-stops
  g''4-.  <bes' g''>8-.\f^"col legno battuto" bes''-. <bes' g''>-. a''-.             | % 121
  bes''4-.  <bes' ees''>8-.\open g''-. <bes' ees''>-.\open f''-.                     | % 122
  g''4-.  <ees' bes'>8-. ees''-.\open <ees' bes'>-. d''-.                            | % 123
  ees''4--\open  <bes' ees''>8-.\open ees''-.\open <bes' ees''>-.\open ees''-.\open  | % 124
  % 125.1 stamp; 125.2-129.1 VSolo verbatim
  <d' a' fis''>4\f^"pizz."  d''8-.\f^"arco" fis''-. d''-. e''-.                      | % 125
  <fis'' \tweak font-size #-3 d'-+>4-- e''8-. fis''-. d''-. fis''-.          | % 126 ad lib D
  <e'' \tweak font-size #-3 d'-+>8\prall( d'') d''-. fis''-. d''-. e''-.     | % 127 idem
  <fis'' \tweak font-size #-3 d'-+>4-- e''8-. fis''-. d''-. fis''-.          | % 128 idem
  % 129.2-133.1 as 121-125 but strings col legno incl. A's downbeat chord (130-132)
  g''4-.  <bes' g''>8-.\f^"col legno battuto" bes''-. <bes' g''>-. a''-.             | % 129
  <bes' bes''>4-.  <bes' ees''>8-.\open g''-. <bes' ees''>-.\open f''-.              | % 130
  <bes' g''>4-.  <ees' bes'>8-. ees''-.\open <ees' bes'>-. d''-.                     | % 131
  <bes' ees''>4--\open  <bes' ees''>8-.\open ees''-.\open <bes' ees''>-.\open ees''-.\open | % 132
  % 133.1 stamp; 133.2-136 VSolo verbatim ff
  <d' a' fis''>4\f^"pizz."  <d' a'>8\ff^"arco" <d' a'> <d' a'> <d' a'>               | % 133
  <a' ees''>4-.\open <d' a'>8 <d' a'> <d' a'> <d' a'>                                | % 134
  <a' ees''>4-.\open <d' a'>4-. <a' ees''>4-.\open                                   | % 135
  <d' a'>4-. <a' ees''>4-.\open <d' a' \tweak font-size #-3 fis''-+>4-.               | % 136 ad lib small fis'' (tutti stamp)
  \barNumberCheck #137
}
