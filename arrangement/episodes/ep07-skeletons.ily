\version "2.24.3"
% Episode 7 -- bars 173-204 "Skeletons" [D] (decided 2026-10-18; reworked 2026-10-26, user --
% see docs/NOTES.md Episode 7 "Revised 2026-10-26" and docs/PLAN.md "Revision drafts
% (2026-10-26)"). Absolute pitch.
%
% One 16-bar Phrygian strain stated twice, a 4th apart, engraved as TWO VOICES throughout: in
% 173-189 the upper voice (stems up) is bowed and the lower voice (stems down) is pizz. Every
% pizz. there is marked individually (revised 2026-10-26: no "pizz. sempre"), and the main-staff
% "pizz." convention (NOTES "Conventions") means no "arco" is needed -- except 205.3, where the
% deliberate break of the convention (one "pizz." at 203.1, run through 205.1, closed by "arco")
% needs one. From 190 the two voices are allocated by pitch, not technique (see Section B).
%
% Section A (173-188, the de Falla / Capriccio espagnol tableau): the wind strain as staccato
% sixths on 1 & 3 in the upper (bowed) voice, melody (Fl/Pic/Hb1, at pitch) on top and Cl1's line
% (at pitch) below -- the source's parallel thirds inverted so the headline theme is the top
% voice. Beat 2 is the waltz's "pah" and nothing else, and it belongs to the LOWER voice either
% way: a right-hand pizz open A on the hypermetrically weak bars (173/175/177, 181/183/185, 188),
% the strings' accented triplet turn e'-f'-e' (V2's own pitch, Va's beat; bowed) on the strong
% bars (174/176/178, 180/182/184/186) -- beat 2 below, beats 1 and 3 above in both cases; the
% three-chord cadence bars 179/187 carry nothing on 2. The triplet's slur and accent sit on the
% noteheads, i.e. above (the stems and beam are down). Hand: 3rd position for the sixths (d''' =
% 4th-finger extension), with the turn on the G string (3-4-3); 1st position for the G-sharp
% chords 176.1/184.1 and their following turn (D string, 1-2-1); 186.3 <g'' e'''> is one reach
% into 5th position (e''' alone is acceptable there).
%
% Section B (189-204, where the intensity starts climbing; revised 2026-10-26 -- voices by pitch,
% not by technique): the strain (V1a is pizz here in the source) and the winds' slurred horn-call
% gis'->a' on beats 2-3 (Hb/Bn 190-193, Fl/Cl 194-197, all winds from 198/201) are engraved as
% two voices: the stem-up voice carries the HIGHER notes (the melody, beats 1 and 3) and the
% stem-down voice the LOWER notes (open-A pedal on beat 1, the call gis'->( a') on 2-3 with its
% slur curving down, octave <gis gis'> on 2 from 198). Only beat 1 is pizz -- pedal and melody
% plucked together, though they sit in different voices -- marked on the melody note as "pizz."
% at 190.1-192.1 and "sim." at 193.1; the bow retakes on beat 2 (no "arco", one-note pizz convention).
% The pedal a' is omitted where the melody is itself on the A string (191-193, 200). 198-202
% beat 3 gives the melody back (a' in the stem-down voice, melody g''/f''/e''/g''/a'' in the
% stem-up voice); the beat-2 octave stays. Cadence bar 195: the melody's 2nd and 3rd beats ride
% the call (e'' d'' in the stem-up voice). 203-204 are the stem-up voice alone, a deliberate
% break of the one-note pizz convention: a single "pizz." at 203.1 runs through 205.1 and ep08's
% 205.3 says "arco". 203 = g f e over the a' pedal, 204 = <a' g''> on 1 and 3 with a rest on 2
% (the chromatic rise a-ais is dropped), resolving on ep08's 205.1 pizz <b b' fis''>. Bar 189 is
% the hand-off: the a-bes-a turn (lower voice, like Section A's) with the last wind chord above,
% then the lower voice's pizz f'' on 3.
%
% Dynamics: the cresc. starts at 190.1 in the melody voice itself (not in one of the two
% polyphonic voices) so that its dashed line runs on, across the file boundary, to the single f
% at ep08's 205.1 that closes it.
%
% Rests: none are engraved in either voice (gaps are invisible spacers) except the r8 at 173.1
% and the r4 at 204.2.
%
% Not carried: Tb3/Tba E pedal, Cb staccato e, two of the three turns per bar (A); the triangle
% (dropped 2026-10-26 with the pizz-harmonic device -- beat 2 is the call now), the timp roll,
% Tp/Tb doublings of the strain, V2/Va's 204 double turn (B). The arco ossia for 189-204 was
% dropped 2026-10-26: its premise (16 bars of pure pizz) no longer exists.
%
% 173.1 revised 2026-10-23 (user, before playing), following the octave-up revision of ep06's bar
% 172: e'''' one octave higher than the original e''' join. Revised again 2026-10-25: a stopped
% note, not the A-string 6th-partial harmonic it was engraved as (likewise ep06's 172.6).

epSeven = \absolute {
  \barNumberCheck #173
  % ---- Section A: 173-188 --------------------------------------------------------------------
  <<
    { % bowed voice
      % 173.1 = wind line's resolution (Fl/Pic) + strings'/Tb stroke, stopped (see header).
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
