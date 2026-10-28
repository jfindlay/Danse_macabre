\version "2.24.3"
% Episode 18 -- bars 455-477 "Déclamé and coda" (N at 467). The solo's own déclamé and tremolo,
% intact, with the horns' bed as a second voice on the open G/D under the held notes and in the
% rests (455-466); at 469.2 the tremolo gives way to the three echoes of Theme 1's head (Va/Vc,
% V2, V1a's first three notes); 473-477 the bass's pizz close and the two chords that closed the
% summons (32.3-33.1), <d' a' fis''> and <g d' bes' g''>. Dynamics as source.

epEighteen = \absolute {
  \barNumberCheck #455
  % 455-466: the déclamé. 455.1 the strings' pp Gm/D stroke (V1a d', V2 bes, Va <d g>, Vc d) as the
  % open G and D rolled under the solo's f d'' (the bes cannot join: G, G and A strings). Horns' p
  % bed (Gm 455-458; Gm + horn 3's stopped ees' 459-462; A-flat 463-464.1) as a lower voice
  % wherever the solo is on the D string or resting; the drone holds through the solo's breaths.
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
  % 469.2-473.2: the solo line carries the three echoes of Theme 1's head in one line, rising:
  % Va/Vc pp (469.2-471.1: g bes a bes | a g g a bes g | d'), V2 p (471.2-472.1: g' a' bes' g' |
  % d''), V1a ppp's first three notes (472.3-473.2: g'' | a'' bes''; its fourth g'' is the Cb's
  % pizz entry at 473.3).
  \repeat tremolo 2 { d'16 ees'16) } g8-.\pp bes8-. a8-. bes8-.               | % 469 Va/Vc echo
  a8( g8) g8-. a8-. bes8-. g8-.                                                | % 470
  d'8-. r8 g'8-.\p a'8-. bes'8-. g'8-.                                         | % 471 V2 echo
  d''8-. r8 r4 g''8-.\ppp r8                                                   | % 472 V1a echo
  % 473-477: the bass's pizz close -- Cb's g, | a, bes, g, | d | d | g, an octave up, pizz. sempre
  % pp; the final wind chords D major 476 and G minor 477 as the summons' pizz chords.
  a''8-. r8 bes''8-. r8 g4^"pizz. sempre"                                      | % 473 Cb's pizz begins
  a4 bes4 g4                                                                   | % 474 Theme 1's head, the last time
  d'4 r4 r4                                                                    | % 475
  <d' a' fis''>4 r4 r4                                                         | % 476 D major (winds pp)
  <g d' bes' g''>4 r4 r4                                                       | % 477 G minor -- end
  \barNumberCheck #478
}
