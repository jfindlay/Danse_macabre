\version "2.24.3"
% Episode 18 -- bars 455-477 "Déclamé and coda" (N at 467) (decided 2026-10-28, user + agent;
% see docs/NOTES.md and docs/PLAN.md's Episode 18 draft). Absolute pitch.
%
% Concept: the solo's own déclamé and tremolo, verbatim and intact, with the horns' bed folded
% under its held D-string notes and into its rests as a second voice on the open G; the tremolo
% gives way at 469.2 to the three echoes of Theme 1's head as the solo's own line; then the
% bass's pizz close as the piece's last gesture -- the two pizz chords that closed the summons
% at 32.3-33.1 (<d' a' fis''>, <g d' bes' g''>) close the piece at 476-477.
%   455-466  the solo's déclamé verbatim. 455.1 the strings' pp Gm/D stroke (V1a d', V2 bes,
%            Va <d g>, Vc d) as the open G and D rolled under the solo's f d'' (the bes cannot
%            join: G, G and A strings). The horns' p bed (Gm 455-458; Gm + horn 3's stopped ees'
%            459-462; A-flat 463-464.1) as a lower voice wherever the solo is on the D string or
%            resting: the open G under the held g' (457-458; horn 2's g), the open D under the
%            A-string bes' (459; horn 4's d, 8va), the open G under g' f' ees' and the held ees'
%            (460-462 -- the <g ees'> of Episode 17's tremolo is exactly horn 2 + horn 3's
%            stopped note), horn 2's aes under the solo's rest at 463 (a 1st-finger barre with
%            the solo's ees' on beat 3). The drone holds through the solo's breaths (458.2-3,
%            462.2-3, 463.1-2) as the horns do. 456 and 464-466 are bare: 456 is the declamation's
%            opening gesture; the horns are silent from 464.2.
%   467-473  [N] the solo's measured tremolo d'-ees' (open D / 1st finger) in shorthand
%            (\repeat tremolo), p 468 > pp 469.2, slurred as the solo line: 466's ees' to 467's
%            (ees') and a new slur from 468.1 to the end of the tremolo at 469.1 (the source's
%            468-473 slur no longer runs through, the tremolo stopping at 469.1). 469.2-473.2 the
%            solo line is the three echoes of Theme 1's head in turn, rising, as the orchestra
%            has them: Va/Vc pp (469.2-471.1: g bes a bes | a g g a bes g | d'), V2 p (471.2-472.1:
%            g' a' bes' g' | d''), V1a ppp's first three notes (472.3-473.2: g'' | a'' bes'' --
%            its fourth g'' is the Cb's pizz entry at 473.3). The tremolo continuation (Fl1) and
%            the echoes' orchestral doublings are not carried.
%   473-477  the bass's pizz close (the flute's tremolo continuation 473-476.1 is not carried):
%            Cb's `g, | a, bes, g, | d | d | g,` an octave up (open G, 1st position, open D),
%            pizz. sempre pp, then the
%            final two wind chords -- D major 476 (Hb/Cl/Bn/horns; strings unison d') and G minor
%            477 (strings unison g) -- as the pizz chords <d' a' fis''> and <g d' bes' g''>: the
%            piece ends with the two chords that closed the summons (32.3-33.1), and with the
%            open G pizz as it began with the open D pizz. No fermata or l.v. in the source.
% Dynamics as source: f 455 déclamé, dim. 459, p 468 >, pp 469.2 (Va echo), p 471.2 (V2 echo),
% ppp 472.3 (V1a echo); horns p (lower voice, 457).
% Not carried: V2 bes / Va d / Vc d of the 455.1 stroke; horn 1's bes and horn 3's d'
% (455-458), horn 1's c' / horn 3's ees' (463-464); V1a's echo past its third note; Fl1 473-476.

epEighteen = \absolute {
  \barNumberCheck #455
  % 455-466: the déclamé, with the strings' stroke at 455.1 and the horns as a lower voice.
  <g d' d''~>4\f^\markup\italic "déclamé" d''2                                 | % 455 déclamé; strings' Gm/D stroke
  bes'4 a'4 g'4                                                                | % 456
  << { g'2.~ } \\ { g2.\p~ } >>                                                | % 457 horn 2's g under the held g'
  << { g'4 r4 r4 } \\ { g2. } >>                                               | % 458 the horns hold through the breath
  << { bes'2._\markup\italic "dim." } \\ { d'2. } >>                           | % 459 horn 4's d (8va) under bes'
  << { g'4 f'4 ees'4 } \\ { g2.~ } >>                                          | % 460
  << { ees'2.~ } \\ { g2.~ } >>                                                | % 461 <g ees'> = horn 2 + horn 3 (stopped)
  << { ees'4 r4 r4 } \\ { g2. } >>                                             | % 462
  % 463: the melody stays in the main Voice (\voiceOne) so its slur crosses the block's edge
  % (ep08's pattern); the horn is a temporary \new Voice.
  << { \voiceOne r4 r4 ees'4( } \new Voice { \voiceTwo aes2. } >> \oneVoice    | % 463 horns' A-flat under the rest
  aes4) bes4 c'4                                                               | % 464
  ees'2.                                                                       | % 465
  ees'2.(                                                                      | % 466 -> [N]
  % 467-469.1: [N] the solo's measured tremolo in shorthand, slurred as the solo line (466's
  % ees' through 467's; a new slur from 468.1 to the end of the tremolo at 469.1).
  \repeat tremolo 6 { d'16-> ees'16) }                                         | % 467 [N]
  \repeat tremolo 6 { d'16(\p\> ees'16 }                                       | % 468
  % 469.2-473.2: the solo line carries the three echoes of Theme 1's head in one line (Va/Vc,
  % V2, then V1a's first three notes), rising, out of the tremolo and up to the bass's pizz.
  \repeat tremolo 2 { d'16 ees'16) } g8-.\pp bes8-. a8-. bes8-.               | % 469 Va/Vc echo
  a8( g8) g8-. a8-. bes8-. g8-.                                                | % 470
  d'8-. r8 g'8-.\p a'8-. bes'8-. g'8-.                                         | % 471 V2 echo
  d''8-. r8 r4 g''8-.\ppp r8                                                   | % 472 V1a echo
  % 473-477: the echoes end; the bass's pizz close and the two final chords.
  a''8-. r8 bes''8-. r8 g4^"pizz. sempre"                                      | % 473 Cb's pizz begins
  a4 bes4 g4                                                                   | % 474 Theme 1's head, the last time
  d'4 r4 r4                                                                    | % 475
  <d' a' fis''>4 r4 r4                                                         | % 476 D major (winds pp)
  <g d' bes' g''>4 r4 r4                                                       | % 477 G minor -- end
  \barNumberCheck #478
}
