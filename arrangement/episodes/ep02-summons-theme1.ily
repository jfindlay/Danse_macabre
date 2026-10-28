\version "2.24.3"
% Episode 2 -- bars 25-48 "Summons and Theme 1" (decided 2026-10-18, see docs/NOTES.md).
% 25-32: VSolo verbatim (the tritone summons), except 32.3 becomes the strings' own pizz
% D-major chord <d' a' fis''> (confirmed in the dump: V1a <d' d''>, V2 <a fis' d''>, A <d' a'>,
% Vc/Cb d -- the violin spells it on its own open strings, containing the solo's own <d a>; the
% chord is an octave on D, so it must sound above the open G -- fixed 2026-10-20, see PLAN
% "Review corrections").
% 33.1: strings' pizz G-minor chord <g d' bes' g''> (V1a <d' bes' g''>, V2 <bes g' d''>,
% A <g d' bes'>), closing the summons with a second full pizz chord (octave fixed likewise).
% 33.2-41.1: Fl1's Theme 1 lifted verbatim at its own octave (g'), p, bowed (no "arco" needed:
% the 32.3/33.1 "pizz." chords are one-note pizz under the NOTES convention, 2026-10-26) "sulla
% tastiera, imitando il flauto" (Paganini Caprice 9's device) -- no accompaniment.
% 41.2-49.1: V1a's restatement at g'' with its own trills/pralls, pp, "ord." (cancels sulla
% tastiera; the bow never left arco -- fixed 2026-10-20, "arco" had been misplaced at 41.1).
% (V1a's bar 49.1 note belongs to Episode 3, which opens with it per docs/PLAN.md's Episode 3
% draft.)
% Ad lib (engraved 2026-10-23, "LH-pizz bass" device -- see NOTES "Project-wide"): LH-pizz open G
% on the downbeats of 34-36 (cello/bass pedal is G there), as small chord-tone noteheads with the
% "-+" pizz mark; the device's one-time "pizz. m.g. ad lib." label sits here, its first occurrence
% in the score. Open-D drone under 42-44 (viola's own d') engraved the same way.

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
