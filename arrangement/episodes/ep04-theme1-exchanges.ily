\version "2.24.3"
% Episode 4 -- bars 65-116 "Theme 1 exchanges" [A] (decided 2026-10-18; re-decided 2026-10-20 at
% the three points below -- see docs/PLAN.md "Review corrections" -- after an architect review
% found the first @build pass had crossed two unchecked pitch-convention seams).
%
% 65-68, 73-76: solo's own immutable downbeat (d'4, bars 65/73 only) + Hb 1's Theme-1 head lifted
% verbatim at Hb 1's own octave (d''), p. (The build session's "octave correction" had misread a
% \fixed c' decision-log snippet as absolute and dropped this to Bn 1's d'; restored to Hb 1's d''
% per the decision log's prose, with one addition: Hb 1's phrase-closing g''4-. on the solo's rest
% at 69.1 and 77.1.) Ad lib, not engraved: LH-pizz open D on the downbeats.
% 69-84, 93-100: VSolo verbatim, nothing added (bass is C, not an open string).
% 85-92: V1a's theme at g'', f, with the tutti downbeat chord on 86/88/90/92 only (85's chord
% stands alone -- V1a rests on 85.1, and is bowed, not pizz: 81-84 are already arco, so 85's
% "arco" marking was spurious and is dropped). Chords from the dump: 85 <g d' bes' g'> (V2's own
% chord); 86/88 <g d' bes' bes''> + the theme's own bes'' (V2 holds this chord unchanged through
% 85-88); 90/92 <f'' c'''> open 5th under the theme's own c''' (bass F has no open string, so
% V1a/A's f/c pitches stand in, octave-matched to the theme). The 85/86/88 chords were entered a
% 4th below the open G (read from a \fixed c' snippet as absolute) -- fixed 2026-10-20.
% 101: VSolo's last note (g'') + V1a's largamente upbeat (d') -- the current-file comment had
% these two reversed until 2026-10-20.
% 102-116: Theme 2 in V1a at g' (= VSolo 49-64) with the wind stabs on beats 2-3 only (winds rest
% on 1) as a second voice over the sustained melody -- re-decided 2026-10-20: the previous
% "drone" realisation was built on the dump's Cl voices at *written* pitch (a semitone transposition
% error) and was harmonically wrong (a C-natural under a G-minor stab). Sounding, Cl 1/2 stab
% d''/bes' + bes'/g' (a G-minor triad) under the G bass, rest on beat 1. Rule: nearest wind pitch
% forming an adjacent-string double-stop in the melody's hand (1st position) -- bes' (A string)
% under the G bass, open A under the A bass, cis' (G string) at 116.3. 116.2 has no playable
% partner (fis'/d' share the D string; fis'' is on the non-adjacent E-flat string).
% Ad lib, not engraved: LH-pizz open G on the G-bass downbeats (102-106, 110-114).

epFour = \absolute {
  \barNumberCheck #65
  % 65-68: solo's own d' downbeat + Hb 1 Theme-1 head at d''
  d'4  d''8-.\p fis''8-. d''8-. e''8-.                                        | % 65
  fis''4--  e''8-. fis''8-. d''8-. fis''8-.                                   | % 66
  e''8( d''8) d''8-. fis''8-. d''8-. e''8-.                                   | % 67
  fis''4--  e''8-. fis''8-. d''8-. fis''8-.                                   | % 68
  % 69-72: VSolo verbatim (69.1 g''4-. is Hb 1's phrase close on the solo's rest), marcatissimo
  g''4-.  g'8-.\f^"marcatissimo" bes'8-. g'8-. a'8-.                          | % 69
  bes'4-. ees'8-. g'8-. ees'8-. f'8-.                                         | % 70
  g'4-. bes8-. ees'8-. bes8-. d'8-.                                           | % 71
  ees'4-- ees'8-. ees'8-. ees'8-. ees'8-.                                     | % 72
  % 73-76: solo's own d' downbeat + Hb 1 head again (no "ten." in Hb 1 here)
  d'4-. d''8-. fis''8-. d''8-. e''8-.                                         | % 73
  fis''4  e''8-. fis''8-. d''8-. fis''8-.                                     | % 74
  e''8( d''8) d''8-. fis''8-. d''8-. e''8-.                                   | % 75
  fis''4  e''8-. fis''8-. d''8-. fis''8-.                                     | % 76
  % 77-84: VSolo verbatim (77.1 g''4-. is Hb 1's phrase close), f then ff open-string chords
  g''4-. g'8-.\f bes'8-. g'8-. a'8-.                                          | % 77
  bes'4-. ees'8-. g'8-. ees'8-. f'8-.                                         | % 78
  g'4-. bes8-. ees'8-. bes8-. d'8-.                                           | % 79
  ees'4-- ees'8-. ees'8-. ees'8-. ees'8-.                                     | % 80
  d'4-. <d' a'>8\ff <d' a'>8 <d' a'>8 <d' a'>8                                | % 81
  <a' ees''>4\open <d' a'>8 <d' a'>8 <d' a'>8 <d' a'>8                        | % 82
  <a' ees''>4-.\open <d' a'>4-. <a' ees''>4-.\open                            | % 83
  <d' a'>4-. <a' ees''>4-.\open <d' a'>4-.                                    | % 84
  % 85-92: V1a's theme at g'', f, tutti chords on 86/88/90/92 (85 bowed, not pizz)
  <g d' bes' g''>4\f  g''8-. bes''8-. g''8-. a''8-.                           | % 85
  <g d' bes' bes''>4-- a''8-. bes''8-. g''8-. bes''8-.                        | % 86
  a''8( g''8) g''8-. bes''8-. g''8-. a''8-.                                   | % 87
  <g d' bes' bes''>4-- a''8-. bes''8-. g''8-. bes''8-.                        | % 88
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
  % fis'/e' + d'/cis'; Fl/Hb/Pic double at the octave(s) above from 108. Rule: nearest wind pitch
  % forming an adjacent-string double-stop in the melody's hand (1st position). 116.2 has no
  % playable partner (fis'/d' share the D string; fis'' is on the non-adjacent E-flat string).
  << { r4 bes'4-. bes'4-. } \\ { g'2 g'4 } >>      | % 102 ad lib LH-pizz G
  << { r4 bes'4-. bes'4-. } \\ { f'2 f'4 } >>      | % 103 ad lib LH-pizz G
  << { r4 bes'4-. bes'4-. } \\ { e'2 e'4 } >>      | % 104 ad lib LH-pizz G (e'/bes' is the source's)
  << { r4 bes'4-. bes'4-. } \\ { ees'!2 ees'4 } >> | % 105 ad lib LH-pizz G
  d'4->( <e' bes'>4-> <g' bes'>4->)                | % 106 ad lib LH-pizz G
  fis'4->( <e' a'>4-> <d' a'>4->)                  | % 107
  << { r4 a'4-. a'4-. } \\ { e'2 e'4 } >>          | % 108
  fis'4 <fis' d''>4-. <d' a'>4                     | % 109 stab alone on the melody's rest
  << { r4 bes'4-. bes'4-. } \\ { g'2 g'4 } >>      | % 110 ad lib LH-pizz G
  << { r4 bes'4-. bes'4-. } \\ { f'!2 f'4 } >>     | % 111 ad lib LH-pizz G
  << { r4 bes'4-. bes'4-. } \\ { e'2 e'4 } >>      | % 112 ad lib LH-pizz G
  << { r4 bes'4-. bes'4-. } \\ { ees'!2 ees'4 } >> | % 113 ad lib LH-pizz G
  d'4->( <g' bes'>4-> <g' bes'>4->)                | % 114 ad lib LH-pizz G
  a'4->( <fis' a'>4-> <d' a'>4->)                  | % 115
  fis'2->( <cis' e'>4->)                           | % 116 A7 -> D at 117
  \barNumberCheck #117
}
