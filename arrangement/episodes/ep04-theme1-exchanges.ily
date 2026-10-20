\version "2.24.3"
% Episode 4 -- bars 65-116 "Theme 1 exchanges" [A] (decided 2026-10-18, see docs/NOTES.md).
%
% 65-68, 73-76: solo's own immutable downbeat (d'4, bars 65/73 only) + Bn 1's Theme-1 head lifted
% verbatim at Bn 1's own octave (d'), p. (The decision log's prose said "oboe... own octave d''"
% but its own literal example bar is at the d' octave -- Bn 1's, not Hb 1's; kept here for
% register continuity from Episode 3's close, per docs/NOTES's own worked example.) Ad lib, not
% engraved: LH-pizz open D on the downbeats.
% 69-84, 93-100: VSolo verbatim, nothing added (bass is C, not an open string).
% 85-92: V1a's theme at g'', f, with the tutti downbeat chord on 86/88/90/92 only (85's chord
% stands alone -- V1a rests on 85.1). Chords from the dump: 85 <g d bes g'> (V2's own pizz
% chord); 86/88 <g d bes> + the theme's own bes'' (V2 holds this chord unchanged through 85-88);
% 90/92 <f'' c'''> open 5th under the theme's own c''' (bass F has no open string, so V1a/A's
% f/c pitches stand in, octave-matched to the theme -- the decision log's "<f' c''>" is one
% octave low, corrected here against the theme's actual register).
% 101: V1a's last note + the solo's largamente upbeat (as Episode 3's bar 49).
% 102-116: Theme 2 verbatim at g' (note-for-note VSolo 49-64) with the wind stabs as written
% double-stops. Mechanical rule applied (docs/NOTES.md): of the wind pitches sounding under the
% theme (Cl 1/2 static c''/e'' pedal through 102-106; Fl/Hb/Pic join from 108), take the one
% nearest the melody that forms a physically adjacent-string double stop. Realised as a sustained
% drone one octave down from Cl's pedal -- c' (G string, 3rd finger) under the G-bass bars
% 102-106/110-113, open A under the A-bass bars 107-108/115-116 -- rearticulated each beat since
% the solo's half-note rhythm can't otherwise carry an added voice. Known gap: bar 109 (D bass)
% has no playable partner, since the melody itself occupies the D string throughout; left plain.
% Ad lib, not engraved: LH-pizz open G on the G-bass downbeats (102-106, 110-114) -- now mostly
% subsumed by the written drone above.

epFour = \absolute {
  \barNumberCheck #65
  % 65-68: Bn 1 Theme-1 head at d', solo's own downbeat at 65
  d'4  d'8-.\p fis'8-. d'8-. e'8-.                                            | % 65
  fis'4^"ten." e'8-. fis'8-. d'8-. fis'8-.                                    | % 66
  e'8( d'8) d'8-. fis'8-. d'8-. e'8-.                                         | % 67
  fis'4^"ten." e'8-. fis'8-. d'8-. fis'8-.                                    | % 68
  % 69-72: VSolo verbatim, marcatissimo
  r4 g'8-.\f^"marcatissimo" bes'8-. g'8-. a'8-.                               | % 69
  bes'4-. ees'8-. g'8-. ees'8-. f'8-.                                         | % 70
  g'4-. bes8-. ees'8-. bes8-. d'8-.                                           | % 71
  ees'4-- ees'8-. ees'8-. ees'8-. ees'8-.                                     | % 72
  % 73-76: Bn 1 Theme-1 head again, solo's own downbeat at 73
  d'4  d'8-. fis'8-. d'8-. e'8-.                                              | % 73
  fis'4^"ten." e'8-. fis'8-. d'8-. fis'8-.                                    | % 74
  e'8( d'8) d'8-. fis'8-. d'8-. e'8-.                                         | % 75
  fis'4^"ten." e'8-. fis'8-. d'8-. fis'8-.                                    | % 76
  % 77-84: VSolo verbatim, f then ff open-string chords
  r4 g'8-.\f bes'8-. g'8-. a'8-.                                              | % 77
  bes'4-. ees'8-. g'8-. ees'8-. f'8-.                                         | % 78
  g'4-. bes8-. ees'8-. bes8-. d'8-.                                           | % 79
  ees'4-- ees'8-. ees'8-. ees'8-. ees'8-.                                     | % 80
  d'4-. <d' a'>8\ff <d' a'>8 <d' a'>8 <d' a'>8                                | % 81
  <a' ees''>4\open <d' a'>8 <d' a'>8 <d' a'>8 <d' a'>8                        | % 82
  <a' ees''>4-.\open <d' a'>4-. <a' ees''>4-.\open                            | % 83
  <d' a'>4-. <a' ees''>4-.\open <d' a'>4-.                                    | % 84
  % 85-92: V1a's theme at g'', f, tutti chords on 86/88/90/92
  <g d bes g'>4\f^"arco"  g''8-. bes''8-. g''8-. a''8-.                       | % 85
  <g d bes bes''>4^"ten." a''8-. bes''8-. g''8-. bes''8-.                     | % 86
  a''8( g''8) g''8-. bes''8-. g''8-. a''8-.                                   | % 87
  <g d bes bes''>4^"ten." a''8-. bes''8-. g''8-. bes''8-.                     | % 88
  aes''8-. r8 aes''8-. c'''8-. aes''8-. bes''8-.                              | % 89
  <f'' c'''>4^"ten." bes''8-. c'''8-. aes''8-. c'''8-.                        | % 90
  bes''8( aes''8) aes''8-. c'''8-. aes''8-. bes''8-.                          | % 91
  <f'' c'''>4-! aes''8-. c'''8-. bes''8-. aes''8-.                            | % 92
  % 93-100: VSolo verbatim, ff "2e corde"
  r4 g''8-.\ff^"2e corde" bes''8-. g''8-. a''8-.                              | % 93
  bes''4^"ten." a''8-. bes''8-. g''8-. bes''8-.                               | % 94
  a''8\prall( g''8) g''8-. bes''8-. g''8-. a''8-.                             | % 95
  bes''4^"ten." a''8-. bes''8-. g''8-. bes''8-.                               | % 96
  aes''8-. r8 aes''8-. c'''8-. aes''8-. bes''8-.                              | % 97
  c'''4^"ten." bes''8-. c'''8-. aes''8-. c'''8-.                              | % 98
  bes''8\prall( aes''8) aes''8-. c'''8-. aes''8-. bes''8-.                    | % 99
  c'''4-! aes''8-. c'''8-. bes''8-. aes''8-.                                  | % 100
  % 101: V1a's last note + solo's largamente upbeat (= Episode 3's bar 49)
  g''4-. r4 d'4\f^"largamente"                                                | % 101
  % 102-116: Theme 2 verbatim at g' with the written double-stop drone (see header note)
  <c' g'>2 <c' g'>4                                                          | % 102 ad lib LH-pizz G
  <c' f'>2 <c' f'>4                                                          | % 103 ad lib LH-pizz G
  <c' e'>2 <c' e'>4                                                          | % 104 ad lib LH-pizz G
  <c' ees'!>2 <c' ees'>4                                                     | % 105 ad lib LH-pizz G
  d'4-> <c' e'>4-> <c' g'>4->                                                | % 106
  fis'4-> <e' a'>4-> <d' a'>4->                                              | % 107
  <e' a'>2 <e' a'>4                                                          | % 108
  fis'4 r4 d'4                                                               | % 109 no playable stab (D bass)
  <c' g'>2 <c' g'>4                                                          | % 110 ad lib LH-pizz G
  <c' f'!>2 <c' f'>4                                                         | % 111 ad lib LH-pizz G
  <c' e'>2 <c' e'>4                                                          | % 112 ad lib LH-pizz G
  <c' ees'!>2 <c' ees'>4                                                     | % 113 ad lib LH-pizz G
  <c' d'>4-> <c' g'>4-> <d' bes'>4->                                         | % 114
  a'4-> <fis' a'>4-> <d' a'>4->                                              | % 115
  <fis' a'>2->( <e' a'>4->)                                                  | % 116
  \barNumberCheck #117
}
