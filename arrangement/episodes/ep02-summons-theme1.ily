\version "2.24.3"
% Episode 2 -- bars 25-48 "Summons and Theme 1" (decided 2026-10-18, see docs/NOTES.md).
% 25-32: VSolo verbatim (the tritone summons), except 32.3 becomes the strings' own pizz
% D-major chord <d' a' fis''> (confirmed in the dump: V1a <d' d''>, V2 <a fis' d''>, A <d' a'>,
% Vc/Cb d -- the violin spells it on its own open strings, containing the solo's own <d a>; the
% chord is an octave on D, so it must sound above the open G -- fixed 2026-10-20, see PLAN
% "Review corrections").
% 33.1: strings' pizz G-minor chord <g d' bes' g''> (V1a <d' bes' g''>, V2 <bes g' d''>,
% A <g d' bes'>), closing the summons with a second full pizz chord (octave fixed likewise).
% 33.2-41.1: Fl1's Theme 1 lifted verbatim at its own octave (g'), p, "arco" (resuming after the
% pizz chords) "sulla tastiera, imitando il flauto" (Paganini Caprice 9's device) -- no
% accompaniment.
% 41.2-49.1: V1a's restatement at g'' with its own trills/pralls, pp, "ord." (cancels sulla
% tastiera; the bow never left arco -- fixed 2026-10-20, "arco" had been misplaced at 41.1).
% (V1a's bar 49.1 note belongs to Episode 3, which opens with it per docs/PLAN.md's Episode 3
% draft.)
% Ad lib, not engraved (comment only, per project convention -- see Episodes 5-8): LH-pizz open G
% on the downbeats of 34-36 and 42-44 (cello/bass pedal is G there); open-D drone under 42-44.

epTwo = \absolute {
  \barNumberCheck #25
  <a' ees''>2.\open\f                                                          | % 25 VSolo
  <d' a'>2.                                                                    | % 26
  <a' ees''>2 <a' ees''>4\open                                                 | % 27
  <d' a'>2 <d' a'>4                                                            | % 28
  <a' ees''>8\open <a' ees''>8\open <a' ees''>4-.\open <d' a'>4-.              | % 29
  <a' ees''>8\open <a' ees''>8\open <a' ees''>4-.\open <d' a'>4-.              | % 30
  <a' ees''>4-.\open <d' a'>4-. <a' ees''>4-.\open                             | % 31
  <d' a'>4-. <a' ees''>4-.\open <d' a' fis''>4-.^"pizz."                       | % 32 strings' D-major
  % 33.1 strings' pizz G-minor chord; 33.2-41.1 Fl1 Theme 1 verbatim at g', arco
  <g d' bes' g''>4-.^"pizz." g'8-.\p^"arco"^\markup{\italic "sulla tastiera, imitando il flauto"} bes'8-. g'8-. a'8-. | % 33
  bes'4-- a'8-. bes'8-. g'8-. bes'8-.                                          | % 34 ad lib LH-pizz G
  a'8( g'8) g'8-. bes'8-. g'8-. a'8-.                                          | % 35 ad lib LH-pizz G
  bes'4-- a'8-. bes'8-. g'8-. bes'8-.                                          | % 36 ad lib LH-pizz G
  aes'8-. r8 aes'8-. c''8-. aes'8-. bes'8-.                                    | % 37
  c''4-- bes'8-. c''8-. aes'8-. c''8-.                                        | % 38
  bes'8( aes'8) aes'8-. c''8-. aes'8-. bes'8-.                                 | % 39
  c''4-! aes'8-. c''8-. bes'8-. aes'8-.                                        | % 40
  % 41.1 Fl1's final note; 41.2-48 V1a's restatement at g'', pp, ord., its own trills/pralls
  g'4-.  g''8-.\pp^"ord." bes''8-. g''8-. a''8-.                               | % 41
  bes''4-- a''8-. bes''8-. g''8-. bes''8-.                                     | % 42 ad lib open-D drone
  a''8\prall( g''8) g''8-. bes''8-. g''8-. a''8-.                              | % 43 ad lib open-D drone
  bes''4-- a''8-. bes''8-. g''8-. bes''8-.                                     | % 44 ad lib open-D drone
  aes''8-. r8 aes''8-. c'''8-. aes''8-. bes''8-.                               | % 45
  c'''4\prall bes''8-. c'''8-. aes''8-. c'''8-.                                | % 46
  bes''8\trill( aes''8) aes''8-. c'''8-. aes''8-. bes''8-.                     | % 47
  c'''4-! aes''8-. c'''8-. bes''8-. aes''8-.                                   | % 48
  \barNumberCheck #49
}
