\version "2.24.3"
% Episode 18 -- bars 455-477 "Déclamé and coda" (N at 467) (decided 2026-10-28, user + agent;
% see docs/NOTES.md and docs/PLAN.md's Episode 18 draft). Absolute pitch.
%
% Concept: the solo's own déclamé and tremolo, verbatim and intact, with the horns' bed folded
% under its held D-string notes and into its rests as a second voice on the open G; then the
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
%   467-473  [N] the solo's measured tremolo d'-ees' (open D / 1st finger) verbatim, p 468 > pp
%            473, under one slur from 466's ees' to 473.1. The viola/cello's pp staccato echo of
%            Theme 1's head (469-471: g bes a bes | a g g a bes g | d') as the lower voice on the
%            G string -- adjacent to the tremolo's D string, so the two sound together; the bow's
%            16ths articulate the lower line (the dots are the source's). Its 471.1 d' is the
%            open D the tremolo is already on and is absorbed. V2's echo at g' (471-472) and V1a's
%            at g'' ppp (472-474) sit on the D and A/E-flat strings and cannot sound against the
%            D-string tremolo; not carried.
%   473-477  the solo ends 473.1 (d'8 pp). The flute's continuation of the same tremolo
%            (473-476.1) is not carried; instead the bass's pizz close is: Cb's `g, | a, bes, g,
%            | d | d | g,` an octave up (open G, 1st position, open D), pizz. sempre pp, then the
%            final two wind chords -- D major 476 (Hb/Cl/Bn/horns; strings unison d') and G minor
%            477 (strings unison g) -- as the pizz chords <d' a' fis''> and <g d' bes' g''>: the
%            piece ends with the two chords that closed the summons (32.3-33.1), and with the
%            open G pizz as it began with the open D pizz. No fermata or l.v. in the source.
% Dynamics as source: f 455 déclamé, dim. 459, p 468 >, pp 473; horns p (lower voice, 457).
% Not carried: V2 bes / Va d / Vc d of the 455.1 stroke; horn 1's bes and horn 3's d'
% (455-458), horn 1's c' / horn 3's ees' (463-464); V2's and V1a's echoes; Fl1 473-476.

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
  % 467-473: [N] the solo's tremolo; the viola/cello's echo of Theme 1's head on the G string.
  d'16-> ees'16 d'16-> ees'16 d'16-> ees'16 d'16-> ees'16 d'16-> ees'16 d'16-> ees'16 | % 467 [N]
  d'16\p\> ees'16 d'16 ees'16 d'16 ees'16 d'16 ees'16 d'16 ees'16 d'16 ees'16  | % 468
  % 469-470: the tremolo stays in the main Voice (\voiceOne) so the 466-473 slur runs through;
  % the echo is a temporary \new Voice (ep08's pattern).
  << { \voiceOne
       d'16 ees'16 d'16 ees'16 d'16 ees'16 d'16 ees'16 d'16 ees'16 d'16 ees'16 | % 469 Va/Vc echo
       d'16 ees'16 d'16 ees'16 d'16 ees'16 d'16 ees'16 d'16 ees'16 d'16 ees'16 | % 470
     }
     \new Voice { \voiceTwo
       r4 g8-.\pp bes8-. a8-. bes8-.                                           | % 469
       a8( g8) g8-. a8-. bes8-. g8-.                                           | % 470
     }
  >> \oneVoice
  d'16 ees'16 d'16 ees'16 d'16 ees'16 d'16 ees'16 d'16 ees'16 d'16 ees'16      | % 471 echo's d' absorbed
  d'16 ees'16 d'16 ees'16 d'16 ees'16 d'16 ees'16 d'16 ees'16 d'16 ees'16      | % 472
  % 473-477: the solo ends; the bass's pizz close and the two final chords.
  d'8)\pp r8 r4 g4^"pizz. sempre"                                              | % 473 solo ends; Cb's pizz begins
  a4 bes4 g4                                                                   | % 474 Theme 1's head, the last time
  d'4 r4 r4                                                                    | % 475
  <d' a' fis''>4 r4 r4                                                         | % 476 D major (winds pp)
  <g d' bes' g''>4 r4 r4                                                       | % 477 G minor -- end
  \barNumberCheck #478
}
