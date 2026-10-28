\version "2.24.3"
% Episode 7 -- bars 173-204 "Skeletons" [D]. One Phrygian strain twice, a fourth apart, in two
% voices: bowed sixths (melody on top) with a plucked open A or the strings' turn on beat 2; then
% the strain plucked on the downbeat under the winds' bowed gis->a call, octaves from 198.
% Pizz: 203.1's "pizz." runs to 205.1 (ep08's 205.3 is "arco") -- the one passage-pizz in A-B.

epSeven = \absolute {
  \barNumberCheck #173
  % ---- Section A: 173-188 --------------------------------------------------------------------
  <<
    { % bowed voice
      % 173.1 = wind line's resolution (Fl/Pic) + strings'/Tb stroke, stopped.
      e''''8-.\f r8  s4  <e'' cis'''>4-.                                  | % 173
      <d'' b''>4-.  s4  <e'' cis'''>4-.                                   | % 174
      <cis'' a''>4-.  s4  <d'' b''>4-.                                    | % 175
      <b' gis''>4-.  s4  <cis'' a''>4-.                                   | % 176 1st pos.
      <cis'' a''>4-.  s4  <e'' cis'''>4-.                                 | % 177
      <e'' cis'''>4-.  s4  <f'' d'''>4-.                                  | % 178
      <e'' cis'''>4-.  <d'' b''>4-.  <cis'' a''>4-.                       | % 179 cadence
      <e'' cis'''>4-.  s4  <d'' b''>4-.                                   | % 180
      <d'' b''>4-.  s4  <f'' d'''>4-.                                     | % 181
      <e'' cis'''>4-.  s4  <f'' d'''>4-.                                  | % 182
      <d'' b''>4-.  s4  <e'' cis'''>4-.                                   | % 183
      <cis'' a''>4-.  s4  <d'' b''>4-.                                    | % 184 1st pos.
      <d'' b''>4-.  s4  <f'' d'''>4-.                                     | % 185
      <f'' d'''>4-.  s4  <g'' e'''>4-.                                    | % 186 .3: 5th pos.
      <f'' d'''>4-.  <e'' cis'''>4-.  <d'' b''>4-.                        | % 187 cadence
      <f'' d'''>4-.  s4  <e'' cis'''>4-.                                  | % 188
    }
    \\
    { % lower voice: beat 2 only -- open A (a, one octave down) on the weak bars, the turn on
      % the strong bars (Cym p 173.2-188.2)
      s4  a4\p_"pizz."  s4                                                | % 173
      s4  \once \slurUp \tuplet 3/2 { e'8^\accent( f'8 e'8) }  s4         | % 174
      s4  a4_"pizz."  s4                                                  | % 175
      s4  \once \slurUp \tuplet 3/2 { e'8^\accent( f'8 e'8) }  s4         | % 176
      s4  a4_"pizz."  s4                                                  | % 177
      s4  \once \slurUp \tuplet 3/2 { e'8^\accent( f'8 e'8) }  s4         | % 178
      s2.                                                                 | % 179
      s4  \once \slurUp \tuplet 3/2 { e'8^\accent( f'8 e'8) }  s4         | % 180
      s4  a4_"pizz."  s4                                                  | % 181
      s4  \once \slurUp \tuplet 3/2 { e'8^\accent( f'8 e'8) }  s4         | % 182
      s4  a4_"pizz."  s4                                                  | % 183
      s4  \once \slurUp \tuplet 3/2 { e'8^\accent( f'8 e'8) }  s4         | % 184
      s4  a4_"pizz."  s4                                                  | % 185
      s4  \once \slurUp \tuplet 3/2 { e'8^\accent( f'8 e'8) }  s4         | % 186
      s2.                                                                 | % 187
      s4  a4_"pizz."  s4                                                  | % 188
    }
  >>
  % ---- Section B: 189-204 --------------------------------------------------------------------
  <<
    <<
      { % stem-up voice = the HIGHER notes from 190: V1a's strain (melody) on beats 1 and 3, pizz
        % on beat 1 only (the pedal a' under it is the stem-down voice's, plucked with it); beat
        % 2 is bowed by the one-note pizz convention (no "arco"). 189.1 last wind chord. 195: the
        % melody's beat 2 e'' rides the call too.
        % 203-204: one pizz. at 203.1 runs to 205.1 (ep08's 205.3 is "arco").
        <e'' cis'''>4-.  s4  s4                                           | % 189
        e''4^"pizz."  s4  f''4                                            | % 190
        d''4^"pizz."  s4  e''4                                            | % 191
        cis''4^"pizz."  s4  d''4                                          | % 192
        d''4^\markup\italic "sim."  s4  f''4                              | % 193
        f''4  s4  g''4                                                    | % 194
        f''4  e''4  d''4                                                  | % 195
        f''4  s4  e''4                                                    | % 196
        e''4  s4  g''4                                                    | % 197
        f''4  s4  g''4                                                    | % 198
        e''4  s4  f''4                                                    | % 199
        d''4  s4  e''4                                                    | % 200
        e''4  s4  g''4                                                    | % 201
        g''4  s4  a''4                                                    | % 202
        <g'' a'>4^"pizz."  <f'' a'>4  <e'' a'>4                           | % 203 cadence
        <a' g''>4  <a' a''>4  <a' ais''>4                                 | % 204 -> 205.1
      }
      \\
      { % stem-down voice = the LOWER notes from 190: the open-A pedal on beat 1 and the bowed
        % call gis'->( a') on 2-3 (octave <gis gis'> on 2 from 198); the slur curves down
        % (voice two). 189.2 the a-bes-a turn (V2's pitch, open A), 189.3 entry pizz.
        s4  \once \slurUp \tuplet 3/2 { a'8^\accent( bes'8 a'8) }  f''4\p^"pizz."  | % 189
        a'4  gis'4->(  a'4)                                               | % 190
        s4  gis'4->(  a'4)                                                | % 191
        s4  gis'4->(  a'4)                                                | % 192
        s4  gis'4->(  a'4)                                                | % 193
        a'4  gis'4->(  a'4)                                               | % 194
        a'4  gis'4->(  a'4)                                               | % 195 cadence
        a'4  gis'4->(  a'4)                                               | % 196
        a'4  gis'4->(  a'4)                                               | % 197
        a'4  <gis gis'>4->(  a'4)                                         | % 198 octave on 2
        a'4  <gis gis'>4->(  a'4)                                         | % 199
        s4   <gis gis'>4->(  a'4)                                         | % 200
        a'4  <gis gis'>4->(  a'4)                                         | % 201
        a'4  <gis gis'>4->(  a'4)                                         | % 202
        s2.                                                               | % 203
        s2.                                                               | % 204
      }
    >>
    \context Voice = "melody" {
      % cresc. 190.1 -> the f at ep08's 205.1 (same Voice, so the spanner crosses the files)
      s2.  s4\cresc  s2  s2.*14
    }
  >>
  \barNumberCheck #205
}
