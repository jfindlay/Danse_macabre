\version "2.24.3"
% Episode 6 -- bars 137-172 "Fugato" [C]. Five entries on Theme 2's head, rising in register as
% the orchestra's do; entries 2-3 (144.3-158) overlay subject and counter-line in two voices.
% Double-stops <d' f'>, <c' a'>, <d' g'> put the lower note on the G string. 172 and 173.1 are
% stopped. Ad lib: LH-pizz open G on 161.1/162.1 and open D on 163.1/165.1 as small "-+" noteheads.

epSix = \absolute {
  \barNumberCheck #137
  % 137.1 V1a chord verbatim; 137.3 Bn/Vc upbeat 8va. Entry 1 = Bn quarters + Va eighth-pairs, 8va
  <g d' bes' g''>4-!\ff r4 d'4-.\mf                                  | % 137
  g'8-.-> g'8-. g'4-. g'4-.                                          | % 138
  f'8-.-> f'8-. f'4-. f'4-.                                          | % 139
  e'8-.-> e'8-. e'4-. e'4-.                                          | % 140
  ees'8-.-> ees'8-. ees'4-. ees'4-.                                  | % 141
  d'8-. d'8-. e'8-. e'8-. g'8-. g'8-.                                | % 142
  f'8-. f'8-. e'8-. e'8-. d'8-. d'8-.                                | % 143
  e'8-. e'8-. a'4-. a4-.                                             | % 144  144.3 entry 2 upbeat, alone
  % Entries 2-3: each subject whole for its 7 bars in its own voice, the counter-line overlaid in
  % the other: entry 2 (144.3-151, V2 = Hn 3/4 at pitch) lower, under the Va/Vc counter 8va;
  % entry 3 (152-158, V1a at g') upper, over V2's line. 151.3/152.1: the counter keeps its own
  % e'-fis', entry 3 starts on 152.1. No dots from "sempre stacc." (145) on: the text covers them.
  % The counter's last three eighths in 145-148 are beamed as one group (departs from the source).
  << { f'4^"sempre stacc." r8 e'8[ f'8 g'8] } \\ { d'8-> d'8 d'4 } >>      | % 145
  << { a'4 } \\ { c'8-> c'8 } >> << { c'4 } \\ { r8 a8[ b8 c'8] } >>       | % 146  Vc fill 8va
  << { d'4 r8 f'8[ e'8 d'8] } \\ { b8-> b8 b4 } >>                         | % 147
  << { g'4 r8 g'8[ f'8 e'8] } \\ { bes!8-> bes8 bes4 } >>                  | % 148
  << { f'4 r8 e'8 d'8 f'8 } \\ { a8 a8 b8 b8 d'8 d'8 } >>                  | % 149  149.5 unison d'
  << { a'4 r8 e'8 fis'8 g'8 } \\ { c'8 c'8 b8 b8 a8 a8 } >>                | % 150
  << { fis'8 e'8 fis'8 d'8 e'8 fis'8 } \\ { c'8 c'8 a'4 c'4 } >>           | % 151
  << { g'8-> g'8 g'4 r4 } \\ { bes8 a8 g8 a8 bes8 c'8 } >>                 | % 152  entry 3
  << { f'8-> f'8 f'4 r4 } \\ { d'4 r8 d'8 e'8 f'8 } >>                     | % 153
  << { e'8-> e'8 e'4 r4 } \\ { g4 r8 bes8 a8 g8 } >>                       | % 154
  << { ees'!8-> ees'8 ees'4 r4 } \\ { c'4 r8 <c' ees'>8 <bes f'>8 <a fis'>8 } >> | % 155  ees' = chromatic note
  << { d'8 d'8 e'8 e'8 g'8 g'8 } \\ { g'8 fis'8 g8 a8 g8 bes8 } >>         | % 156  subject climax
  << { f'8 f'8 e'8 e'8 d'8 d'8 } \\ { d'4 r8 a8 g8 bes8 } >>               | % 157
  % 158: cue-sized (CueVoice): a trill under a moving line is unplayable; slur closes on 159.1.
  << \new CueVoice { \voiceOne e'8 e'8 a'4 e'4 }
     { \voiceTwo cis'2\startTrillSpan~( cis'8\stopTrillSpan b16[ cis'16] } >> | % 158  V2 cadential trill
  % Entry 4: surface = V1 rising sequence loco; cue 159-160 (Tp2 at pitch). Single voice.
  \oneVoice d'4) d'8 e'8 <d' f'>8 <d' g'>8                                 | % 159  trill resolves
  <c' a'>8 gis'8 a'8 c''8 b'8 a'8                                          | % 160
  <d'' \tweak font-size #-3 g_+>8 c''8 d''8 f''8 e''8 d''8                 | % 161 ad lib LH-pizz G
  <g'' \tweak font-size #-3 g_+>8 fis''8 g''8 bes''8 a''8 g''8             | % 162 ad lib LH-pizz G
  <f'' \tweak font-size #-3 d'_+>8 a''8 g''8 e''8 f''8 d''8                | % 163 ad lib LH-pizz D
  e''8 a''8 gis''8 b''8 c'''8 a''8                                         | % 164
  <d'' \tweak font-size #-3 d'_+>8 fis''8 a''8 c'''8 bes''8 a''8           | % 165 ad lib D
  % Entry 5: surface = Fl 1 sweep (Ob drops 8va at 169 for range); cue 166.1 (Tb 1) as the two
  % octave eighths, lead from beat 2. 166 alone is two voices: octave eighths + held low G below.
  << { r4 g'8 a'8 bes'8 c''8 } \\ { <g g'>8->\f <g g'>8 g4 r4 } >>         | % 166
  <f' d''>8-> cis''8 d''8 f''8 e''8 d''8                                   | % 167
  g''8-> fis''8 g''8 bes''8 a''8 g''8                                      | % 168
  c'''8 b''8 c'''8 ees'''8 d'''8 c'''8                                     | % 169
  f'''8\< d'''8 cis'''8 c'''8 b''8 bes''8                                  | % 170
  a''8 b''8 cis'''8 d'''8 e'''8 f'''8                                      | % 171
  a'''8 b'''8 c''''8 cis''''8 d''''8 dis''''8\!                            | % 172  stopped, not harmonic
  \barNumberCheck #173
}
