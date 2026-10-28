\version "2.24.3"
% Episode 1 -- bars 1-24 "Midnight". Twelve left-hand pizz tolls on the open D, one per bar, bow
% free to hold the ppp shimmer: 5-8 V1's d'' sul tasto, senza vibr. (3rd finger on A, 4th plucking
% the open D); 13-16 V1a's own <d'' fis''> pair; bar 17 silent; 18-24 the Vc/Cb pizz line up an
% octave, "pizz. sempre", ended by "arco" at 25. Bars 5-16 are ppp colour, not voice: the first
% voiced bow stroke is the tritone at 25.

epOne = \absolute {
  \barNumberCheck #1
  % 1-12: Hp-h d'2.\f x12 (one stroke per bar) + Cor 1 d' pedal 1-16 = the open D, LH pizz l.v.
  d'4-+\f\laissezVibrer^"pizz. m.g." r2                                | % 1
  d'4-+\laissezVibrer r2                                               | % 2
  d'4-+\laissezVibrer r2                                               | % 3
  d'4-+\laissezVibrer r2                                               | % 4
  % 5-8: V1 divisi d''/a' + V2 fis'/d' ppp tied -> V1's top note d'' tied, sul tasto senza vibr.,
  % over the continuing toll (the open D rings anyway).
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
  d'4\pp^"pizz. sempre" r4 r4                                           | % 18
  a'4 r4 r4                                                             | % 19
  c'4 r4 r4                                                             | % 20
  fis'4 r4 r4                                                           | % 21
  a4 r4 r4                                                              | % 22
  c'4 r4 r4                                                             | % 23
  ees'4 r4 r4                                                           | % 24 bow retakes for 25
  \barNumberCheck #25
}
