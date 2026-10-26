\version "2.24.3"
% Episode 6 -- bars 137-172 "Fugato" [C] (decided 2026-10-18, see docs/NOTES.md and
% docs/PLAN.md's Episode 6 draft). Already absolute pitch in the draft (verified: 137.1's
% <g d' bes' g''> is V1a's own open-string chord).
%
% Five-entry fugato on Theme 2's head, register ascending entry by entry as the orchestra's does.
% Double-stops <d' f'>, <c' a'>, <d' g'>: lower note on the G string (4th/3rd finger). Ossia for
% 169-172 would be the Ob 1 octave (c''...dis''); not engraved here (safety alternative only).
% Ad lib (engraved 2026-10-23): LH-pizz open G on 161.1/162.1, open D on 163.1/165.1, as small
% chord-tone noteheads with "-+". 166.1's bass G is already the written note's own lower octave
% (<g g'>, the surface line's own open string) -- no separate click is sounded there.
%
% Bar 172 revised 2026-10-23 (user, before playing): an octave up from the original wind-line
% lift. 171 ends f''', so 172's a''' continues the climb instead of resetting the register.
% Revised again 2026-10-25: the bar's final dis'''' is a stopped note, not the E-flat string's
% 4th-partial harmonic it was engraved as (likewise 173.1 in ep07) -- the eighths either side of
% [D] are ordinary notes.

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
  % Entries 2-3 (revised 2026-10-25): both subjects are kept whole for their full 7 bars, each in
  % its own voice, with the counter-line overlaid in the other voice. Entry 2 (144.3-151, V2 = Hn
  % 3/4 at pitch) is the LOWER voice under the Va/Vc counter 8va; entry 3 (152-158, V1a at g') is
  % the UPPER voice over V2's line at pitch. 151.3 and 152.1: the counter keeps its own e'-fis'
  % and entry 3 begins directly on 152.1 (no d' upbeat). From "sempre stacc." (145) to the end of
  % the episode no staccato dots are engraved -- the text covers them. The counter's last three
  % eighths in 145-148 are beamed as one group (a deliberate departure from the source's beat-wise
  % beaming). Voice-crossings (e.g. 156.1-2) are left as written: the performer reads pitches.
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
  % 158: the subject's last bar is cue-sized (CueVoice) -- a trill with Nachschlag under a
  % separately moving line is not playable, so the small notes show the line without asking for
  % it. The trill stays in the main voice (its slur closes on 159.1), hence an explicit context
  % instead of a << \\ >> block.
  << \new CueVoice { \voiceOne e'8 e'8 a'4 e'4 }
     { \voiceTwo cis'2\startTrillSpan~( cis'8\stopTrillSpan b16[ cis'16] } >> | % 158  V2 cadential trill
  % Entry 4: surface = V1 rising sequence loco; cue 159-160 (Tp2 at pitch). Single voice.
  \oneVoice d'4) d'8 e'8 <d' f'>8 <d' g'>8                                 | % 159  trill resolves
  <c' a'>8 gis'8 a'8 c''8 b'8 a'8                                          | % 160
  <d'' \tweak font-size #-3 g-+>8 c''8 d''8 f''8 e''8 d''8                 | % 161 ad lib LH-pizz G
  <g'' \tweak font-size #-3 g-+>8 fis''8 g''8 bes''8 a''8 g''8             | % 162 ad lib LH-pizz G
  <f'' \tweak font-size #-3 d'-+>8 a''8 g''8 e''8 f''8 d''8                | % 163 ad lib LH-pizz D
  e''8 a''8 gis''8 b''8 c'''8 a''8                                         | % 164
  <d'' \tweak font-size #-3 d'-+>8 fis''8 a''8 c'''8 bes''8 a''8           | % 165 ad lib D
  % Entry 5: surface = Fl 1 sweep (Ob drops 8va at 169 for range); cue 166.1 (Tb 1) as the two
  % octave eighths, lead from beat 2. 166 alone is split in two voices (revised 2026-10-26): the
  % octave eighths and the held low G below, the sweep's lead above after a beat-1 rest. The
  % fugal development is otherwise done and the momentum has passed to the ascending lines, so
  % 167 on is single-voice again.
  << { r4 g'8 a'8 bes'8 c''8 } \\ { <g g'>8->\f <g g'>8 g4 r4 } >>         | % 166
  <f' d''>8-> cis''8 d''8 f''8 e''8 d''8                                   | % 167
  g''8-> fis''8 g''8 bes''8 a''8 g''8                                      | % 168
  c'''8 b''8 c'''8 ees'''8 d'''8 c'''8                                     | % 169
  f'''8\< d'''8 cis'''8 c'''8 b''8 bes''8                                  | % 170
  a''8 b''8 cis'''8 d'''8 e'''8 f'''8                                      | % 171
  a'''8 b'''8 c''''8 cis''''8 d''''8 dis''''8\!                            | % 172  stopped, not harmonic
  \barNumberCheck #173
}
