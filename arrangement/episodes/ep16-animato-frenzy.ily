\version "2.24.3"
% Episode 16 -- bars 416-437 "Animato" (M at 430) (decided 2026-10-28, user + agent; see
% docs/NOTES.md and docs/PLAN.md's Episode 16 draft). Absolute pitch.
%
% Concept: V1a's line is the only moving line (the solo is tacet; V2 doubles it, the winds
% double or stamp), so V1a is the spine, as in Episode 15 -- but THIS IS THE PIECE'S CLIMAX, and
% the user's call is to spend the virtuosic licence on register: 416-425 an octave ABOVE V1a,
% continuing Ep 15's climb (415 ends on fis''''), coming down only at 426 to V1a's own open G.
% Three terraces, then the hammering:
%   416-418  the ff tutti descent g f ees | f ees d | ees d c, V1a's g''' taken at g'''' --
%            the top of the E-flat string (28 semitones; ees'''' at 24 is the string's double
%            octave). Stopped, as 172/173.1/415 were decided; fallback if it will not speak at
%            ff: artificial harmonics in 1st position (stop g''/f'' on the E-flat, d''/c'' on the
%            A, touch a fourth above; ees'''' = the open E-flat touched at aes''). 416.1 is
%            plain: no chord can sit under a note at the fingerboard's end.
%   419-420  Theme 1's head on A-flat then F-sharp (V1a/V2/Pic unison) over tremolo chords
%            A-flat/C -> D (the tritone pair), an octave above V1a (aes''' / fis''').
%   421-423  the descent again -- the orchestra's in three octaves (Fl1 / V1a+Hb2+Cl1 / Bn1):
%            the octave rule -> octaves, still in the upper register: <g'' g'''> down to
%            <c'' c'''> on the A/E-flat pair. The strings are a tritone apart, so these are
%            6-semitone 1-4 octaves; at 10-16 semitones the span is narrower than a 1st-position
%            1-4, widening to ~80 mm at the last <c'' c'''> (A 3 / E-flat 9). 421.1 the tutti
%            crash (Cym/GC/Trg) as <g d' g'' g'''>-!: the open G and D rolled under the octave.
%   424-425  the head figure again, an octave above V1a (= V1a's 419-420 text), then the drop
%            of two octaves and a sixth from a'' to the open G.
%   426-437  (revised 2026-10-28, user) the whole string body + bassoons in unison on g8 bes g a
%            bes4 | c' b bes a aes4 x2, then the figure in continuous 8ths from 433, as ONE line
%            (V1a's, from the open G on the G string) with the flute/piccolo's stamp as a quarter
%            note on beat 2 above it: g'4 / fis'4 alternating at 426-429, g'4 throughout [M]
%            (430) to the double bar. Two voices (stamp up, line down). The earlier winds'
%            beat-1 double-stops (<g d'>, <c' fis'>), the [M] three-string stamps and the fff
%            beat chords of 433-437 are dropped: the energy goes into the single line of the
%            stringendo's final run. 438: the strings fall silent (Tempo 1 is Episode 17's).
% Dynamics as source: ff 416 (the Trame's Animato), fff 433.
% Not carried: the inner wind line (bes'' d''' g'' ...) under the descent; Tp/horn root pedals
% 416-418/421-423; the tremolo chords and Trg roll under 419-420/424-425; V2's lower third at
% 425; the winds' beat-1 stamps (426-432) and beat-3 chords (433-437); Ti/GC/Cym/Trg.

epSixteen = \absolute {
  \barNumberCheck #416
  % 416-418: V1a (A string, 22 -> 15) under Pic's sounding pitch (E-flat string, 28 -> 21);
  % fallback = the upper voice alone.
  <g''' g''''>4-!\ff <f'''! f''''!>4 <ees''' ees''''>4                           | % 416 Animato, tutti crash
  <f''' f''''>4 <ees''' ees''''>4 <d''' d''''>4                                 | % 417
  <ees''' ees''''>4 <d''' d''''>4 <c''' c''''>4                                 | % 418
  % 419-420: Theme 1's head on A-flat (Ab/C) then F-sharp (D), an octave above V1a.
  aes'''8 c''''8 aes'''8 bes'''8 c''''4                                        | % 419
  fis'''8 a'''!8 fis'''8 g'''8 a'''4                                           | % 420
  % 421-423: the descent in octaves (V1a + the octave above), A/E-flat pair; 421.1 the crash with
  % the open G and D rolled under the octave.
  <g d' g'' g'''>4-! <f''! f'''!>4 <ees'' ees'''>4                             | % 421 crash
  <f'' f'''>4 <ees'' ees'''>4 <d'' d'''>4                                      | % 422
  <ees'' ees'''>4 <d'' d'''>4 <c'' c'''>4                                      | % 423 widest stretch (A 3 / Eb 9)
  % 424-425: the head figure an octave above V1a (= V1a's 419-420).
  aes''8 c'''8 aes''8 bes''8 c'''4                                             | % 424
  fis''8 a''!8 fis''8 g''8 a''4                                                | % 425 -> the drop to the open G
  % 426-437 (revised 2026-10-28, user): V1a's figure as the one line (lower voice, stems down) with
  % the flute/piccolo's stamp as a quarter note on beat 2 above it (upper voice, stems up),
  % alternating g' (426/428) and fis' (427/429), then g' throughout [M] to the double bar. The
  % winds' beat-1 stamps and the beat chords of 430-437 are dropped: all the energy goes into the
  % single line of the stringendo's final run.
  << { s4 g'4 s4 } \\ { g8 bes8 g8 a8 bes4 } >>                                | % 426
  << { s4 fis'4 s4 } \\ { c'8 b8 bes8 a8 aes4 } >>                             | % 427
  << { s4 g'4 s4 } \\ { g8 bes8 g8 a8 bes4 } >>                                | % 428
  << { s4 fis'4 s4 } \\ { c'8 b8 bes8 a8 aes4 } >>                             | % 429
  % 430-432 [M]
  << { s4 <d' g'>4 s4 } \\ { g8 bes8 g8 a8 bes4 } >>                           | % 430 [M]
  << { s4 <d' g'>4 s4 } \\ { g8 bes8 g8 a8 bes4 } >>                           | % 431
  << { s4 <d' g'>4 s4 } \\ { g8 bes8 g8 a8 bes4 } >>                           | % 432
  % 433-437 fff: the figure runs in continuous 8ths.
  << { s4 <d' g'>4 s4 } \\ { g8\fff_\markup\italic "sautillé" bes8 g8 a8 bes8 g8 } >> | % 433
  << { s4 <d' g'>4 s4 } \\ { a8 bes8 g8 a8 bes8 g8 } >>                       | % 434
  << { s4 <d' g'>4 s4 } \\ { a8 bes8 g8 a8 bes8 g8 } >>                       | % 435
  << { s4 <d' g'>4 s4 } \\ { a8 bes8 g8 a8 bes8 g8 } >>                       | % 436
  << { s4 <d' g'>4 s4 } \\ { a8 bes8 g8 a8 bes8 g8 } >>                       | % 437 -> 438 Tempo 1
  \barNumberCheck #438
}
