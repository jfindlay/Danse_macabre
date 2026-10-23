\version "2.24.3"
% Episode 1 -- bars 1-24 "Midnight" (decided 2026-10-18; revised 2026-10-23 -- user, before
% playing -- see docs/NOTES.md and docs/PLAN.md "Revision drafts").
% Orchestra (confirmed against the dump): Hp-h d'2.\f x12 (bars 1-12, one stroke per bar); Cor 1
% d' pedal tied through bars 1-16; V1a/V2 divisi hold a ppp D-major chord bars 5-8 (d''/a' over
% fis'/d') and again bars 13-16 (fis''/d'' over a'/fis', A adds d') -- two differently-voiced
% "shimmer" statements, strings only, no harp involved in the shimmer itself; bar 17 is silent in
% every voice; Vc-a/Cb pizz pp enter bar 18 (not 17) with d a c fis a c ees (7 notes, not 8 --
% corrects the decision log's "d'...d'" bracketing, which predates this dump cross-check).
%
% "A defaut de harpe" realisation: all twelve strokes are left-hand pizz on the open D (d', -+),
% f, laissez vibrer, one per bar, bow in hand from bar 1 -- this frees the bow to sustain through
% the toll and keeps the toll's timbre uniform. The shimmer is now a direct lift of the strings'
% own sustained notes rather than bowed harmonics (the earlier "ghost" realisation; the harmonic
% colour is kept in reserve for a later episode): 5-8 ties V1's top note d'' ppp sul tasto, senza
% vibrato, with the 3rd finger holding the A string while the 4th plucks the open D on each
% downbeat (bow clear of the vibrating D string); 13-16 ties V1a's own divisi pair <d'' fis''>,
% 1st position, fingers 3-2. Not carried: V2's lower pair, the viola d' (= the ringing open D
% anyway), the horn pedal. 18-24: Vc/Cb pizz line lifted up one octave, pp, 1st position; mark
% "pizz." (ordinary, right-hand) at 18 since 18-24 are stopped notes.
%
% "First bow at 25" rule reworded (2026-10-23): bars 5-16 are ppp flautando colour, not voice; the
% first *voiced* bow stroke is still the tritone at 25. The rule now rests on dynamics/bowing
% colour rather than on timbre class -- weaker, accepted for the directness of the lift.

epOne = \absolute {
  \barNumberCheck #1
  % 1-12: Hp-h d'2.\f x12 (one stroke per bar) + Cor 1 d' pedal 1-16 = the open D, LH pizz l.v.
  d'4-+\f\laissezVibrer^"pizz. m.g." r2                                | % 1
  d'4-+\laissezVibrer r2                                               | % 2
  d'4-+\laissezVibrer r2                                               | % 3
  d'4-+\laissezVibrer r2                                               | % 4
  % 5-8: V1 divisi d''/a' + V2 fis'/d' ppp tied -> V1's top note d'' tied, sul tasto senza vibr.,
  % over the continuing toll. Not carried: a', fis', d' (the open D rings anyway).
  << { d''2.\ppp~^\markup\italic "sul tasto, senza vibr." } \\ { d'4-+\laissezVibrer s2 } >> | % 5
  << { d''2.~ } \\ { d'4-+\laissezVibrer s2 } >>                       | % 6
  << { d''2.~ } \\ { d'4-+\laissezVibrer s2 } >>                       | % 7
  << { d''2. } \\ { d'4-+\laissezVibrer s2 } >>                        | % 8
  d'4-+\laissezVibrer r2                                               | % 9
  d'4-+\laissezVibrer r2                                               | % 10
  d'4-+\laissezVibrer r2                                               | % 11
  d'4-+\laissezVibrer r2                                               | % 12  twelfth stroke
  % 13-16: V1 divisi fis''/d'' (+ V2 a'/fis', A d') ppp tied -> V1a's pair as a double-stop.
  <d'' fis''>2.\ppp~                                                    | % 13
  <d'' fis''>2.~                                                        | % 14
  <d'' fis''>2.~                                                        | % 15
  <d'' fis''>2.                                                         | % 16  horn pedal ends
  r2.                                                                   | % 17 silent (ground truth)
  % 18-24: Vc-a/Cb pizz line, up one octave, pp, 1st position throughout
  d'4\pp^"pizz." r4 r4                                                  | % 18
  a'4 r4 r4                                                             | % 19
  c'4 r4 r4                                                             | % 20
  fis'4 r4 r4                                                           | % 21
  a4 r4 r4                                                              | % 22
  c'4 r4 r4                                                             | % 23
  ees'4 r4 r4                                                           | % 24 bow retakes for 25
  \barNumberCheck #25
}
