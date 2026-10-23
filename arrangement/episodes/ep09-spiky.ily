\version "2.24.3"
% Episode 9 -- bars 237-252 "Spiky" [F] (decided 2026-10-22, see docs/NOTES.md and
% docs/PLAN.md's Episode 9 draft). Absolute pitch.
%
% Concept: one line. 237-244 is the V1a/V1b composite -- a continuous two-octave chromatic scale,
% slurred per beat (the source's slurs are 5-note desk groups whose seam notes coincide; the
% desk split is an orchestration artifact, not two voices -- see NOTES "Capture candidates").
% 245-252 is V1a verbatim, rests kept, with the bass note as a short low 8th on the three block
% downbeats where V1a rests and the tuba/trombone dot falls. Dynamics are V1a's; there is no
% crescendo into [G] (253 mf belongs to Episode 10).

epNine = \absolute {
  \barNumberCheck #237
  % 237.1 = Ep 8 statement 4's resolution (V2 fis''2.~ + Va fis'2.~, p) over the tutti B cadence
  % (Hp <fis b>/<b,, b,>, Tb1/Tp1/Hb1 dis', Tb2/Cb b): rolled <fis' dis'' fis''>, truncated to a
  % quarter so the hand is free for the run. 237.2-245.1: V1a + V1b are one continuous chromatic
  % scale b-b''-b handed between desks every beat (each 5-note slur's last 16th is the other
  % desk's first) -> single line, slurred per beat. Dropped: V1a's first four 16ths b bis cis' d'
  % (under the stamp). Not carried: Hb1/Hb2 dis'/b pedal 237-245, Bn1 fis/g/fis/gis, the
  % Vc/Cb/Tb/Va/V2 staccato bass figure (B 237 / G 239 / B 241 / G-sharp 243). Dynamics = V1a: p,
  % cresc 241, f 243, dim 244.
  <fis' dis'' fis''>4\p\arpeggio dis'16( e' eis' fis') g'( gis' a' ais')   | % 237
  b'16( bis' cis'' d'') dis''( e'' eis'' fis'') g''( gis'' a'' ais'')      | % 238
  b''16( ais'' a'' gis'') g''( fis'' f'' e'') dis''( d'' cis'' c'')        | % 239
  b'16( ais' a' gis') g'( fis' f' e') dis'( d' cis' c')                    | % 240
  b16(\< bis cis' d') dis'( e' eis' fis') g'( gis' a' ais')                | % 241
  b'16( bis' cis'' d'') dis''( e'' eis'' fis'') g''( gis'' a'' ais'')\!    | % 242
  b''16(\f ais'' a'' gis'') g''( fis'' f'' e'') dis''( d'' cis'' c'')      | % 243
  b'16(\> ais' a' gis') g'( fis' f' e') dis'( d' cis' c')\!                | % 244
  % 245-252: Theme 1's head in D-sharp minor tossed strings -> winds in canon at the bar (V1a + V2
  % 8vb lead; Hb1/Cl1 246, Fl/Pic/Bn1 248, Hb/Cl 250, Fl/Bn1 252 echo one bar later) over a
  % chromatic bass B, A-sharp, A, A-flat (-> G 253) in repeated 8ths, Va <fis dis'> motor, pp
  % Tba/Tb3/GC dots on the block downbeats. Carried: V1a verbatim (own register toss dis'' ->
  % dis''' -> dis'' -> c''') + the bass on the three downbeats where V1a rests (247.1 Tba/Tb3/Vc
  % ais, 249.1 a, 251.1 aes); V1a's own 245.1 b and 253.1 g frame that line. Not carried: the wind
  % echo, V2's lower octave, the Va motor. p throughout (source has no cresc; 253 is mf).
  b8-.\p r8 dis''8-. fis''8-. dis''8-. eis''8-.                            | % 245  b = bass B
  fis''8-. r8 eis''8-. r8 dis''8-. r8                                      | % 246
  ais8-. r8 dis'''8-. fis'''8-. dis'''8-. eis'''8-.                        | % 247  ais = Tba/Tb3/Vc
  fis'''8-. r8 eis'''8-. r8 dis'''8-. r8                                   | % 248
  a8-. r8 dis''8-. fis''8-. dis''8-. eis''8-.                              | % 249  a = open A
  fis''8-. r8 eis''8-. r8 dis''8-. r8                                      | % 250
  aes8-. r8 c'''8-. ees'''8-. c'''8-. d'''8-.                              | % 251  aes = bass
  ees'''8-. r8 d'''8-. r8 c'''8-. r8                                      | % 252 -> 253.1 g8 mf [G]
  \barNumberCheck #253
}
