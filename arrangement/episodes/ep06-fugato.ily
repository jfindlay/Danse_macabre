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
% lift. 171 ends f''', so 172's a''' continues the climb instead of resetting the register; the
% bar's final note becomes a natural harmonic (dis'''' = the E-flat string's 4th partial, touched
% in place at e-flat'''' -- the 3/4 node -- or at a-flat'' in 1st position), landing the hand in
% 1st position for 173's chords, one octave higher than the original join's logic. Touch-point
% note engraved as a small diamond notehead under the sounding pitch (NOTES "Conventions").

touchAesDoublePrime = \tweak font-size -4 \tweak NoteHead.style #'harmonic aes''

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
  e'8-. e'8-. a'4-. <a e'>4-.                                        | % 144  144.3 entry 2 upbeat
  % Entry 2: counter = Va/Vc "sempre stacc." 8va (surface); subject cue 145-146 (Hn/V2 at pitch)
  <d' f'>8-.->^"sempre stacc." <d' e'>8-. d'8-. e'8-. <d' f'>8-. g'8-. | % 145
  <c' a'>4-. r8 a8-. b8-. c'8-.                                      | % 146  Vc fill
  d'8-. cis'8-. d'8-. f'8-. e'8-. d'8-.                              | % 147
  g'4-. r8 g'8-. f'8-. e'8-.                                         | % 148
  f'4-. r8 e'8-. d'8-. f'8-.                                         | % 149
  a'4-. r8 e'8-. fis'8-. g'8-.                                       | % 150
  fis'8-. e'8-. fis'8-. d'8-. <d' e'>8-. <d' fis'>8-.                | % 151  151.3 entry 3 upbeat
  % Entry 3: surface = V2 at pitch spliced with Va/Vc fills 8va; cue 152-153 at V1 octave
  <bes g'>8-.-> <a g'>8-. <g g'>8-. a8-. bes8-. c'8-.                | % 152
  <d' f'>8-.-> <d' f'>8-. e'8-. f'8-. g'8-. a'8-.                    | % 153
  g'8-. fis'8-. g'8-. bes'8-. a'8-. g'8-.                            | % 154
  <ees' c''>8-. c'8-. d'8-. ees'8-. f'8-. fis'8-.                    | % 155  ees' = chromatic note
  <bes d'>8-. <bes d'>8-. e'8-. e'8-. g'8-. g'8-.                    | % 156  subject climax
  <d' f'>8-. <d' f'>8-. e'8-. e'8-. <d' bes'>8-. <d' bes'>8-.        | % 157  Va bes' tied
  cis'2\startTrillSpan~( cis'8\stopTrillSpan b16[ cis'16]           | % 158  V2 cadential trill
  % Entry 4: surface = V1 rising sequence loco; cue 159-160 (Tp2 at pitch)
  d'4-.) d'8-. e'8-. <d' f'>8-. <d' g'>8-.                           | % 159  trill resolves
  <c' a'>8-. gis'8-. a'8-. c''8-. b'8-. a'8-.                        | % 160
  <d'' \tweak font-size #-3 g-+>8-. c''8-. d''8-. f''8-. e''8-. d''8-.  | % 161 ad lib LH-pizz G
  <g'' \tweak font-size #-3 g-+>8-. fis''8-. g''8-. bes''8-. a''8-. g''8-. | % 162 ad lib LH-pizz G
  <f'' \tweak font-size #-3 d'-+>8-. a''8-. g''8-. e''8-. f''8-. d''8-. | % 163 ad lib LH-pizz D
  e''8-. a''8-. gis''8-. b''8-. c'''8-. a''8-.                       | % 164
  <d'' \tweak font-size #-3 d'-+>8-. fis''8-. a''8-. c'''8-. bes''8-. a''8-. | % 165 ad lib D
  % Entry 5: surface = Fl 1 sweep (Ob drops 8va at 169 for range); cue 166-167 (Tb 1)
  <g g'>8-.->\f <g g'>8-. g'8-. a'8-. bes'8-. c''8-.                 | % 166
  <f' d''>8-.-> cis''8-. d''8-. f''8-. e''8-. d''8-.                 | % 167
  g''8-.-> fis''8-. g''8-. bes''8-. a''8-. g''8-.                    | % 168
  c'''8-. b''8-. c'''8-. ees'''8-. d'''8-. c'''8-.                   | % 169
  f'''8-.\< d'''8-. cis'''8-. c'''8-. b''8-. bes''8-.                | % 170
  a''8-. b''8-. cis'''8-. d'''8-. e'''8-. f'''8-.                    | % 171
  a'''8-. b'''8-. c''''8-. cis''''8-. d''''8-. <dis'''' \touchAesDoublePrime>8-.\flageolet\! | % 172
  \barNumberCheck #173
}
