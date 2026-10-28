\version "2.24.3"
% Episode 2 -- bars 25-48 "Summons and Theme 1". 25-32 the solo's tritone summons verbatim, 32.3
% and 33.1 becoming the strings' pizz chords <d' a' fis''> and <g d' bes' g''> (from the dump);
% 33.2-41.1 Fl1's Theme 1 at g', "sulla tastiera, imitando il flauto", no accompaniment; 41.2-48
% V1a's restatement at g'' with its own trills/pralls, pp, "ord.". Ad lib: LH-pizz open G under
% 34-36 and open D under 42-44 as small "-+" noteheads; "pizz. m.g. ad lib." labels it at 34.

epTwo = \absolute {
  \barNumberCheck #25
  <a' ees''>2.\open\f^"arco"                                                   | % 25 VSolo; ends ep01's pizz. sempre
  <d' a'>2.                                                                    | % 26
  <a' ees''>2 <a' ees''>4\open                                                 | % 27
  <d' a'>2 <d' a'>4                                                            | % 28
  <a' ees''>8\open <a' ees''>8\open <a' ees''>4-.\open <d' a'>4-.              | % 29
  <a' ees''>8\open <a' ees''>8\open <a' ees''>4-.\open <d' a'>4-.              | % 30
  <a' ees''>4-.\open <d' a'>4-. <a' ees''>4-.\open                             | % 31
  <d' a'>4-. <a' ees''>4-.\open <d' a' fis''>4-.^"pizz."                       | % 32 strings' D-major
  % 33.1 strings' pizz G-minor chord; 33.2-41.1 Fl1 Theme 1 verbatim at g', arco
  <g d' bes' g''>4-.^"pizz." g'8-.\p^\markup{\italic "sulla tastiera, imitando il flauto"} bes'8-. g'8-. a'8-. | % 33
  <bes' \tweak font-size #-3 g_+>4--^"pizz. m.g. ad lib." a'8-. bes'8-. g'8-. bes'8-. | % 34
  <a' \tweak font-size #-3 g_+>8( g'8) g'8-. bes'8-. g'8-. a'8-.                      | % 35
  <bes' \tweak font-size #-3 g_+>4-- a'8-. bes'8-. g'8-. bes'8-.                      | % 36
  aes'8-. r8 aes'8-. c''8-. aes'8-. bes'8-.                                    | % 37
  c''4-- bes'8-. c''8-. aes'8-. c''8-.                                        | % 38
  bes'8( aes'8) aes'8-. c''8-. aes'8-. bes'8-.                                 | % 39
  c''4-! aes'8-. c''8-. bes'8-. aes'8-.                                        | % 40
  % 41.1 Fl1's final note; 41.2-48 V1a's restatement at g'', pp, ord., its own trills/pralls
  g'4-.  g''8-.\pp^"ord." bes''8-. g''8-. a''8-.                               | % 41
  <bes'' \tweak font-size #-3 d'_+>4-- a''8-. bes''8-. g''8-. bes''8-.         | % 42 ad lib D drone
  <a'' \tweak font-size #-3 d'_+>8\prall( g''8) g''8-. bes''8-. g''8-. a''8-.  | % 43 idem
  <bes'' \tweak font-size #-3 d'_+>4-- a''8-. bes''8-. g''8-. bes''8-.         | % 44 idem
  aes''8-. r8 aes''8-. c'''8-. aes''8-. bes''8-.                               | % 45
  c'''4\prall bes''8-. c'''8-. aes''8-. c'''8-.                                | % 46
  bes''8\trill( aes''8) aes''8-. c'''8-. aes''8-. bes''8-.                     | % 47
  c'''4-! aes''8-. c'''8-. bes''8-. aes''8-.                                   | % 48
  \barNumberCheck #49
}
