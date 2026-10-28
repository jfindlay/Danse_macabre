\version "2.24.3"
% Episode 10 -- bars 253-272 "Whirl vs theme" [G] (decided 2026-10-27, see docs/NOTES.md and
% docs/PLAN.md's Episode 10 draft). Absolute pitch.
%
% Concept: the theme is the whirl's bass. V1a alone carries the whirl (two triplet-8th sweeps up
% and down a two-octave arpeggio, then the bass note as an accented quarter on beat 3, tied into
% the next bar). Theme 2's head is stated three times in the brass, four bars each (upbeat on
% beat 3 -> three tenuto bars, half + quarter -> resolution on beat 1): Tb1 at C 253.3-257.1,
% Tp 1/2 at A 257.3-261.1, Bn 1/2 + Tb 1-3 at B-flat 261.3-265.1. The brass articulates on beats
% 1 and 3 -- exactly where the whirl articulates its bass note -- and at every upbeat/resolution
% the theme's note already IS V1a's bass (253.3 g, 257.1 a, 262 bes). So wherever the brass sounds
% the theme, its note replaces the whirl's lowest note on beats 1 and 3 (V1a's ties dropped
% where the theme re-strikes); the upbeats 257.3/261.3 ride the held bass as double-stops. The
% one exception is 263-264: the whirl's c''' peak needs 3rd position, where the small-octave a/g
% are out of reach, so the theme rides beat 3 ABOVE the bass (<c' a'>, <c' g'>). 265-272 f: the
% same rule carries the strings'/Tb1's accented cis' as the bottom note of every E-flat bar --
% the German sixth (cis ees g bes) spelled out, Tb1's d'->( cis') literal across each barline.
% Positions climb with the crescendo: 1st (253-260, a'' = 4th-finger extension), 2nd (261-262),
% 3rd (263-264), 4th (265-272: cis' 1st finger, d''' 4th, ees''' 4th extended = the E-flat
% string's octave node). Slurs are V1a's own (orchestral bowings; the performer may re-bow).
% Dynamics = V1a: mf 253, cresc 262, f 265.

epTen = \absolute {
  \barNumberCheck #253
  % 253.1 tutti G stamp (Vc/Cb/Tb3/Tba/Ti g, Va <g g'>, winds g 8ths, GC) = the whirl's own
  % first note, mf. 253-257: Tb1's theme at pitch (g | c' c' | b b | bes bes | a) as the bass of
  % the C-minor/C-major whirl; 254.1 accent = Tb1's. 257.3 <a f'> = V1a's held a + Tp's upbeat f'.
  % Not carried: Cor 3/4 upbeat c' 254.3, Cor 1-4 harmony g'/g'/f' 255-257, the winds' echo of the
  % head 255.3-257.1 (g' | c'' c'' | c'' -- inside the whirl's own pitches).
  \tuplet 3/2 4 { g8(\mf ees'8 c''8) g''8( c''8 ees'8 } g4->                    | % 253 Tb1 upbeat g
  \omit TupletNumber
  \tuplet 3/2 4 { c'8-> ees'8 c''8) g''8( c''8 ees'8 } c'4->                    | % 254 Tb1 c' ten.
  \tuplet 3/2 4 { b8 e'8 c''8) g''8( c''8 e'8 } b4->                            | % 255 Tb1 b
  \tuplet 3/2 4 { bes8 e'8 c''8) g''8( c''8 e'8 } bes4->                        | % 256 Tb1 bes
  \tuplet 3/2 4 { a8-> f'8 c''8) a''8( c''8 f'8 } <a f'>4->                     | % 257 Tb1 a; Tp f'
  % 257.3-261.1: Tp 1/2's theme (f' | a' a' | gis' gis' | g' g' | f') an octave down, as the bass
  % of the F-major / A-major whirl (258 a = V1a's own bass; 258.1 accent = Tp's). 261.1 f' = the
  % whirl's second note. Not carried: Cor 3/4 harmony e'/e'/d' 259-261, the winds' echo
  % 259.3-261.1 (e'' | a'' a'' | d''' -- a'' is the whirl's peak, d'' is in it).
  \tuplet 3/2 4 { a8-> f'8 c''8) a''8( c''8 f'8 } a4->                          | % 258 Tp a' 8vb ten.
  \tuplet 3/2 4 { gis8 e'8 cis''8) a''8( cis''8 e'8 } gis4->                    | % 259 Tp gis' 8vb
  \tuplet 3/2 4 { g8 e'8 cis''8) a''8( cis''8 e'8 } g4->                        | % 260 Tp g' 8vb
  \tuplet 3/2 4 { bes8-> f'8 d''8) bes''8( d''8 f'8 } <bes f'>4->               | % 261 Tp f'; Bn/Tb f
  % 261.3-265.1: Bn 1/2 + Tb 1-3's theme in octaves (f | bes bes | a a | g g | fis), cresc, at
  % Bn1/Tb1's pitch: 261.3 upbeat f as f' over V1a's held bes; 262 bes = V1a's own bass (accent =
  % Bn/Tb's); 263-264 a/g on beat 3 above V1a's c' (3rd position, see header); 265.1 fis = the
  % whirl's fis''. Not carried: Tp c''/c' held 263-264, the winds' echo 263.3-265.1 (c'' | bes''
  % bes'' | a'' -- the only echo not inside the whirl; bes'' over C minor is lost).
  \tuplet 3/2 4 { bes8->\< f'8 d''8) bes''8( d''8 f'8 } bes4->                  | % 262 Bn/Tb bes
  \tuplet 3/2 4 { c'8-> g'8 e''8) c'''8( e''8 g'8 } <c' a'>4->                  | % 263 Bn/Tb a above
  \tuplet 3/2 4 { c'8 g'8 ees''!8) c'''8( ees''8 g'8 } <c' g'>4->\!             | % 264 Bn/Tb g above
  % 265-272 f: the whirl alternates D major (265/267/269) and E-flat major (266/268/270-272);
  % Va/Vc/Cb (+ V2 from 270) f staccato quarters fis-a-d' / cis'-bes-g, Tb1/Tb3 d'->( cis'-.)
  % across each barline then cis'->-. alone 271-272, Tp 1/2 d tremolo in the D bars, winds + Xy
  % Theme 1's head ees g ees f g (8ths) in the E-flat bars; 273.1 = the German sixth tutti [H].
  % Carried: V1a, with the strings'/Tb1's cis' as the whirl's bottom note on beat 1 of every
  % E-flat bar (V1a's 270-272 ties dropped). Not carried: the Theme 1 head (same time as the
  % whirl; its ees/g are in it), the Tp tremolo, the strings' quarters, the fis bass of the D
  % bars (below the open G; d' is the root anyway).
  \tuplet 3/2 4 { d'8->\f a'8 fis''8) d'''8( fis''8 a'8 } d'4->                 | % 265 Tb1 d'->(
  \tuplet 3/2 4 { cis'8-> bes'8 g''8) ees'''8( g''8 bes'8 } ees'4->             | % 266 cis' = Gr6
  \tuplet 3/2 4 { d'8-> a'8 fis''8) d'''8( fis''8 a'8 } d'4->                   | % 267
  \tuplet 3/2 4 { cis'8-> bes'8 g''8) ees'''8( g''8 bes'8 } ees'4->             | % 268
  \tuplet 3/2 4 { d'8-> a'8 fis''8) d'''8( fis''8 a'8 } d'4->                   | % 269
  \tuplet 3/2 4 { cis'8-> bes'8 g''8) ees'''8( g''8 bes'8 } ees'4->             | % 270
  \tuplet 3/2 4 { cis'8-> bes'8 g''8) ees'''8( g''8 bes'8 } ees'4->             | % 271
  \tuplet 3/2 4 { cis'8-> bes'8 g''8) ees'''8( g''8 bes'8 } ees'4->)            | % 272 -> [H] 273
  \undo \omit TupletNumber
  \barNumberCheck #273
}
