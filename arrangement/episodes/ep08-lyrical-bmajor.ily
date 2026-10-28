\version "2.24.3"
% Episode 8 -- bars 205-236 "Lyrical B major" [E] (decided 2026-10-19, see docs/NOTES.md and
% docs/PLAN.md's Episode 8 draft). Absolute pitch.
%
% Concept: solo = single line, orchestra = octaves. Statements 1 and 3 (205.3-214, 221.3-230) are
% the solo verbatim. Statements 2 and 4 (213.3-222, 229.3-237.1) are the orchestra's own octave
% doublings (Fl 1 + Fl 2/Hn 1; V2 + Va) rendered as violin octaves. The open E-flat string is the
% D-sharp of B major: ringing inside the octave at 221.1 (the 205.1 strum, once four strings
% with the open E-flat on top, is a three-string pizz <b b' fis''> since 2026-10-26). The
% three-note chords mark the inner voice (V1's d-sharp'->d-natural'->d-sharp') at its change
% points. Statement 4's final note <fis' fis''> p falls on 237.1 and belongs to Episode 9's file.
% Revised 2026-10-27 (user): statements 1 and 3 carry the four solo cellos' tied dotted halves
% as a stems-down lower voice wherever a cello pitch sits on the string below the melody's --
% solo 1's dis' under the A-string bars, solo 2's b / solo 3's gis-ais-b under the D-string bars
% (see the bar comments). "Solo = single line" now holds only for the melody's own voice.

epEight = \absolute {
  \barNumberCheck #205
  % 205.1 tutti B-major stamp as a three-string pizz strum <b b' fis''> (open fifth), the end of
  % the pizz. begun at 203.1 (ep07; a deliberate break of the one-note pizz convention, NOTES
  % "Conventions"). 205.2 rest = retake the bow. 205.3-214.1 VSolo verbatim, f appassionato,
  % with the "arco" that closes that pizz.
  % 205-213 as two voices: the melody stays in the main Voice (\voiceOne) so its slurs cross the
  % block's edges; the cellos are a temporary \new Voice (\voiceTwo). Not the << \\ >> shorthand,
  % which moves the first branch into a new voice and breaks the 205->206 and 213->214 slurs.
  % 206-213: the four solo cellos' tied dotted halves (pp) as a lower voice (added 2026-10-27,
  % user): solo 1 dis' 205-208 / d' 209-212 / dis' 213, solo 2 b throughout, solo 3 fis / g /
  % fis, solo 4 B,. The melody on the A string (206-208) admits only a D-string note under it:
  % solo 1's dis'. From 209 the melody is on the D string and solo 2's b (G string) sits under
  % it; solo 1's d' is the open D (the melody's string) and solo 3's g the open G -- not taken.
  % 210.3 b' is on the A string (non-adjacent to the G-string b): the b is a half there. 211.1
  % a' taken on the D string (4th finger) so the b can hold; the performer may prefer the open
  % A and a half instead. 213 returns to solo 1's dis' under the tied b' and the Fl1 upbeat
  % (dis'-b'-fis'': 1-2-3 across D-A-E-flat). The cellos' 214.1 quarter is dropped (the octaves
  % take the hand). No dynamic on the lower voice: it is a sustained double-stop under an f line.
  <<
    { \voiceOne
      <b' b''>4\f  r4  fis'4^\markup { "arco" \hspace #1 \italic "appassionato" } (    | % 205
      b'2) b'4(                                                                                 | % 206
      ais'2) ais'4(                                                                             | % 207
      a'2) a'4(                                                                                 | % 208
      g'2->) g'4                                                                                | % 209
      fis'4( g'4 b'4)                                                                           | % 210
      a'4( g'4 fis'4)                                                                           | % 211 a' sul D
      g'2 g'4(                                                                                  | % 212
      % 213.3 Fl 1's upbeat fis'' over the solo's tied b'. 214-221 = Fl 1 b'' + Fl 2/Hn 1 b' as
      % octaves. Inner voice d-sharp'(213)/d-natural'(217)/d-sharp'(221).
      b'2)~ <b'~ fis''>4\p^\markup\italic "espress." (                                          | % 213
    }
    \new Voice { \voiceTwo
      s2.                                                                                       | % 205
      dis'2.~ | dis'2.~ | dis'2.                                                                | % 206-208 solo 1
      b2.~ | b2 s4 | b2.~ | b2.                                                                 | % 209-212 solo 2 (210.3: b' on A)
      dis'2.                                                                                    | % 213 solo 1
    }
  >> \oneVoice
  <b' b''>2\< <b' b''>4                                                                         | % 214
  <ais' ais''>2 <ais' ais''>4                                                                   | % 215
  <a' a''>2 <a' a''>4                                                                           | % 216
  <g' d'' g''>2->)\! <g' g''>4(\>                                                               | % 217
  <fis' fis''>4 <g' g''>4 <b' b''>4                                                             | % 218
  <a' a''>4 <g' g''>4 <fis' fis''>4\!                                                           | % 219
  <g' g''>2) <g' g''>4(                                                                         | % 220
  % 221.1 answer's goal with the open D-sharp; 221.3-230.1 VSolo verbatim.
  % 221-229 as two voices (same layout as 205-213).
  % 222-229: the solo cellos again (added 2026-10-27, user): solo 1 dis' 221-224 / e' 225-228 /
  % dis' 229, solo 2 b 221-226 / cis' 227-228 / fis 229, solo 3 fis 221-224 / gis 225-226 / ais
  % 227-228 / b 229, solo 4 B,. 222-224 under the A-string melody: solo 1's dis' (solo 3's fis
  % is below the open G; solo 2's b is on the G string, non-adjacent). From 225 the melody is on
  % the D string and solo 3's moving line is taken: gis (E major) -> ais (F-sharp 7) -> b (the
  % resolution at 229, under the solo's held fis'). 226.3 a' is the open A (non-adjacent to the
  % G-string gis): the gis is a half there; solo 2's b would hold the whole bar (<b a'> 2-4 with
  % a' sul D) if preferred. The cellos' 230.1 quarter is inside the rolled chord already.
  <<
    { \voiceOne
      <b' dis'' b''>2) fis'4-\tweak self-alignment-X #CENTER -\markup{\dynamic "(f)"}(           | % 221 editorial (f)
      b'2) b'4(                                                                                 | % 222
      ais'2)\< ais'4(                                                                            | % 223
      a'2) a'4(\!                                                                                | % 224
      gis'2->) gis'4(                                                                           | % 225
      e'4 fis'4 a'4)                                                                             | % 226
      g'4(\> fis'4 e'4)                                                                          | % 227
      g'2-.( g'4-.)\!                                                                            | % 228
      % 229.3 upbeat not addable over the solo's held fis'. 230.1 = solo's tail + Va + V2 as a
      % rolled chord into the octave, then V2 + Va octaves molto espress.
      fis'2.~                                                                                    | % 229
    }
    \new Voice { \voiceTwo
      s2.                                                                                       | % 221
      dis'2.~ | dis'2.~ | dis'2.                                                                | % 222-224 solo 1
      gis2.~ | gis2 s4                                                                          | % 225-226 solo 3 (226.3: open A)
      ais2.~ | ais2.                                                                            | % 227-228 solo 3
      b2.                                                                                       | % 229 solo 3
    }
  >> \oneVoice
  <fis' b'~ b''~>4^\markup\italic "molto espress." <b' b''>4\< <b' b''>4(                       | % 230
  <ais' ais''>2) <ais' ais''>4(                                                                  | % 231
  <a' a''>2) <a' a''>4(\!                                                                        | % 232
  <gis' gis''>2)\f <gis' gis''>4(                                                                | % 233
  <e' e''>4 <fis' fis''>4 <a' a''>4)                                                             | % 234
  <g' g''>4(\> <fis' fis''>4 <e' e''>4)                                                          | % 235
  <g' g''>2-.( <g' g''>4-.)\!                                                                    | % 236  -> 237.1 <fis' fis''>4 p (Ep 9)
  \barNumberCheck #237
}
