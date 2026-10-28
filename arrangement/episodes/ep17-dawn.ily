\version "2.24.3"
% Episode 17 -- bars 438-454 "Dawn" (Tempo 1 at 438) (decided 2026-10-28, user + agent; see
% docs/NOTES.md and docs/PLAN.md's Episode 17 draft). Absolute pitch.
%
% Concept: three events, each the only thing sounding -- the horns' E-flat, the oboe's cock-crow,
% the strings' dying tremolo -- so each is lifted at pitch as the one line. No solo violin.
%   438-439  horns 1/2 hold E-flat in octaves (ees'/ees) fp. Horn 2's ees is below the open G;
%            horn 1's ees' is in range and is taken as written, on the D string (1st finger)
%            (user, 2026-10-28; the open E-flat string ees'' was the first reading). The pedal
%            cannot continue under the crow (the crow lives on the E-flat string; the D string is
%            not adjacent to it), so it ends at 439 and the crow's first note, ees'' at 440.1, is
%            a fresh f attack an octave up, no tie.
%   440-445  the oboe's cock-crow verbatim, entirely on the E-flat string (open ees'', bes'' in
%            3rd position, g'' 1st or 3rd). Its last 8th (445.1 g'' pp, the tail of the tie) is
%            absorbed by the strings' f entry on the same beat.
%   445-454  the strings' tremolo chord C-sharp dim 7 (cis ees g bes ees') f > p > fermata.
%            Taken as <g ees'>2.:16 -- the open G (the viola's g, and the timp's G an octave up)
%            under V1a's ees' (D string, 1st finger): two source pitches, both in 1st position,
%            sustainable through ten bars of dim. and a very long fermata. The cello's cis
%            (the dim-7th's defining note) is below range; cis' cannot be fingered with ees'
%            (G 3rd position against D 1st). The timp's stroke rhythm is absorbed into the
%            sustained open G. Dynamics as V1a: f 445 >, p 451 >, 453 !, 454 fermata.
% Not carried: horn 2's ees (below range); the viola's lower ees; the cello's cis; the timp's
% strokes (445-453) and the GC roll (445-449) as separate events.

epSeventeen = \absolute {
  \barNumberCheck #438
  % 438-439: the horns' E-flat at pitch (horn 1's ees', D string), fp.
  ees'2.\fp~                                                                   | % 438 Tempo 1 -- horns' E-flat
  ees'2.                                                                       | % 439
  % 440-445: the oboe's cock-crow, verbatim, on the E-flat string.
  ees''4\f r8 bes''8-. bes''4-.                                                | % 440 cock-crow
  ees''4-. g''2->~                                                             | % 441
  g''2.~                                                                       | % 442
  g''2.\>~                                                                     | % 443
  g''2.                                                                        | % 444 (tail absorbed at 445.1)
  % 445-454: the strings' tremolo, f > p > fermata; the open G = Va/timp G, ees' = V1a.
  <g ees'>2.:16\f\>                                                            | % 445 strings enter (oboe's tail absorbed)
  <g ees'>2.:16                                                                | % 446
  <g ees'>2.:16                                                                | % 447
  <g ees'>2.:16                                                                | % 448
  <g ees'>2.:16                                                                | % 449
  <g ees'>2.:16                                                                | % 450
  <g ees'>2.:16\p\>                                                            | % 451
  <g ees'>2.:16                                                                | % 452
  <g ees'>2.:16\!                                                              | % 453
  <g ees'>2.:16\fermata^\markup\italic "très long" _\markup\italic "toujours en dim." | % 454 -> 455 déclamé
  \barNumberCheck #455
}
