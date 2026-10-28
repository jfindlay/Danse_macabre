\version "2.24.3"
% Episode 8 -- bars 205-236 "Lyrical B major" [E]. Solo = single line, orchestra = octaves:
% statements 1 and 3 (205.3-214, 221.3-230) the solo verbatim, with the four solo cellos' tied
% dotted halves as a stems-down lower voice where a cello pitch sits on the string below the
% melody's; statements 2 and 4 (213.3-222, 229.3-237.1) the orchestra's octave doublings (Fl 1 +
% Fl 2/Hn 1; V2 + Va). Three-note chords mark the inner voice's change points; 237.1 <fis' fis''>
% belongs to ep09's file.

epEight = \absolute {
  \barNumberCheck #205
  % 205.1 tutti B-major stamp as a pizz octave <b' b''>, ending the pizz. begun at 203.1 (ep07).
  % 205.2 rest = retake the bow. 205.3-214.1 VSolo verbatim, f appassionato, with the "arco".
  % 205-213: the melody stays in the main Voice (\voiceOne) so its slurs cross the block's edges;
  % << \\ >> would move it to a new voice and break the 205->206 and 213->214 slurs.
  % 206-213: the four solo cellos' tied dotted halves (pp) as a lower voice (\new Voice,
  % \voiceTwo): solo 1 dis' 205-208 / d' 209-212 / dis' 213, solo 2 b throughout, solo 3 fis / g
  % / fis, solo 4 B,. Under the A-string melody (206-208) only solo 1's dis' fits; from 209 solo
  % 2's b (G string) sits under the D-string melody. The cellos' 214.1 quarter is dropped.
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
  % 222-229: the solo cellos again: solo 1 dis' 221-224 / e' 225-228 / dis' 229, solo 2 b 221-226 /
  % cis' 227-228 / fis 229, solo 3 fis 221-224 / gis 225-226 / ais 227-228 / b 229, solo 4 B,.
  % Under the A-string melody (222-224) only solo 1's dis' fits; from 225 solo 3's line is taken.
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
