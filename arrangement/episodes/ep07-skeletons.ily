\version "2.24.3"
% Episode 7 -- bars 173-204 "Skeletons" [D] (decided 2026-10-18, see docs/NOTES.md and
% docs/PLAN.md's Episode 7 draft). Absolute pitch.
%
% One 16-bar Phrygian strain stated twice, a 4th apart. Section A (173-188): wind thirds as
% staccato double-stops on 1 & 3; "-+" is left-hand pizz (the open-G "cymbal" click, designed,
% not ad lib); the arco turn is a slurred tuplet attached to every <cis'' e''> chord (the
% ornament-attaches-to-its-chord rule). Section B (189-204): Vln I pizz line + Tb 1's third as
% pizz double-stops; beat 2 = pizz natural harmonic e''' (the triangle). The arco ossia for
% 189-204 (docs/PLAN.md) is a supplementary safety staff, not engraved in this pass -- see the
% session notes for follow-up. Dynamics as source: f 173.1, p 173.2, cresc. 194, f 204.

epSeven = \absolute {
  \barNumberCheck #173
  % 173-188: wind thirds (two-line octave) as staccato double-stops on 1 & 3; LH-pizz open G on 2
  % = cymbal; V2's slurred triplet turn e''-f''-e'' attached to every <cis'' e''> chord.
  % 173.1 = wind line's resolution (Fl/Pic) + strings'/Tb stroke: A-string 12th harmonic.
  e'''8-.\flageolet\f r8  g4-+\p  \tuplet 3/2 { <cis'' e''>8->( <cis'' f''>8 <cis'' e''>8) } | % 173
  <b' d''>4-.  g4-+  \tuplet 3/2 { <cis'' e''>8->( <cis'' f''>8 <cis'' e''>8) }              | % 174
  <a' cis''>4-.  g4-+  <b' d''>4-.                                                            | % 175
  <gis' b'>4-.  g4-+  <a' cis''>4-.                                                           | % 176 click: d' ad lib (G#)
  <a' cis''>4-.  g4-+  \tuplet 3/2 { <cis'' e''>8->( <cis'' f''>8 <cis'' e''>8) }             | % 177
  \tuplet 3/2 { <cis'' e''>8->( <cis'' f''>8 <cis'' e''>8) }  g4-+  <d'' f''>4-.              | % 178
  \tuplet 3/2 { <cis'' e''>8->( <cis'' f''>8 <cis'' e''>8) }  <b' d''>4-.  <a' cis''>4-.      | % 179 cadence
  \tuplet 3/2 { <cis'' e''>8->( <cis'' f''>8 <cis'' e''>8) }  g4-+  <b' d''>4-.               | % 180
  <b' d''>4-.  g4-+  <d'' f''>4-.                                                             | % 181
  \tuplet 3/2 { <cis'' e''>8->( <cis'' f''>8 <cis'' e''>8) }  g4-+  <d'' f''>4-.              | % 182
  <b' d''>4-.  g4-+  \tuplet 3/2 { <cis'' e''>8->( <cis'' f''>8 <cis'' e''>8) }               | % 183
  <a' cis''>4-.  g4-+  <b' d''>4-.                                                            | % 184 click: d' ad lib (G#)
  <b' d''>4-.  g4-+  <d'' f''>4-.                                                             | % 185
  <d'' f''>4-.  g4-+  <e'' g''>4-.                                                            | % 186
  <d'' f''>4-.  \tuplet 3/2 { <cis'' e''>8->( <cis'' f''>8 <cis'' e''>8) }  <b' d''>4-.       | % 187 cadence
  <d'' f''>4-.  g4-+  \tuplet 3/2 { <cis'' e''>8->( <cis'' f''>8 <cis'' e''>8) }              | % 188
  % 189: last wind chord; the strings' turn is now a-bes-a (bowed on the open A); V1a's "Pizz."
  % f'' (bow stays in hand through 204).
  <cis'' e''>4-.  \tuplet 3/2 { a'8->( bes'8 a'8) }  f''4\p^"pizz."                           | % 189
  % 189.3-204: V1a pizz line + Tb 1's third as pizz double-stops on 1 & 3; beat 2 = pizz natural
  % harmonic e''' (open A touched at e'') = triangle.
  <e'' g''>4  e'''4\flageolet  <f'' a''>4                                                     | % 190
  <d'' f''>4  e'''4\flageolet  <e'' g''>4                                                     | % 191
  <cis'' e''>4  e'''4\flageolet  <d'' f''>4                                                   | % 192
  <d'' f''>4  e'''4\flageolet  <f'' a''>4                                                     | % 193
  <f'' a''>4\<  e'''4\flageolet  <g'' bes''>4                                                 | % 194 3rd pos. from here
  <f'' a''>4  <e'' g''>4  <d'' f''>4                                                          | % 195 cadence
  <f'' a''>4  e'''4\flageolet  <e'' g''>4                                                     | % 196
  <e'' g''>4  e'''4\flageolet  <g'' bes''>4                                                   | % 197
  <f'' a''>4  e'''4\flageolet  <g'' bes''>4                                                   | % 198
  <e'' g''>4  e'''4\flageolet  <f'' a''>4                                                     | % 199
  <d'' f''>4  e'''4\flageolet  <e'' g''>4                                                     | % 200
  <e'' g''>4  e'''4\flageolet  <e'' g''>4                                                     | % 201 .3: Tb1 e' below g''
  <e'' g''>4  e'''4\flageolet  <f'' a''>4                                                     | % 202
  <e'' g''>4  <d'' f''>4  <cis'' e''>4\!                                                      | % 203 cadence
  <e'' g''>4\f  r4  <e'' g''>4                                                                | % 204 -> 205.1 tutti B
  \barNumberCheck #205
}
