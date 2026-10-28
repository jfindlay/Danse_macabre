\version "2.24.3"
% Danse macabre, op. 40 (Saint-Saens) arranged for unaccompanied violin in the original
% scordatura (G-D-A-E-flat). See "Program notes.md" for the programme, the arranging rules and the
% episode-by-episode rationale.
%
% Structure: \trame (bars, tempo, key changes, rehearsal marks -- no notes) runs in parallel with
% a single melodic \Voice inside one \Staff named "solo", so marks/keys/bar grid come from the
% Trame and are never duplicated in the episode files. Pizz.: "pizz." on a note applies to that
% note only -- no "arco" follows; "pizz. sempre" runs until "arco"; "-+" is left-hand pizz. Every
% episode ends with a \barNumberCheck at its own first bar and the next episode's first bar: the
% fidelity gate is zero \barNumberCheck warnings at compile time, for the full 477 bars, 3/4
% throughout.

\include "global.ily"
\include "trame.ily"

\include "episodes/ep01-midnight.ily"
\include "episodes/ep02-summons-theme1.ily"
\include "episodes/ep03-theme2-largamente.ily"
\include "episodes/ep04-theme1-exchanges.ily"
\include "episodes/ep05-fragments-bones.ily"
\include "episodes/ep06-fugato.ily"
\include "episodes/ep07-skeletons.ily"
\include "episodes/ep08-lyrical-bmajor.ily"
\include "episodes/ep09-spiky.ily"
\include "episodes/ep10-whirl-vs-theme.ily"
\include "episodes/ep11-marcato-dim.ily"
\include "episodes/ep12-summons-diesirae.ily"
\include "episodes/ep13-strings-sequences.ily"
\include "episodes/ep14-runs-tutti.ily"
\include "episodes/ep15-ornamented.ily"
\include "episodes/ep16-animato-frenzy.ily"
\include "episodes/ep17-dawn.ily"
\include "episodes/ep18-declame-coda.ily"

\header {
  title = "Danse macabre"
  opus = "Op. 40"
  subtitle = \markup { \small "Arranged for unaccompanied violin" }
  composer = "Camille Saint-Saëns"
  arranger = \markup {
    \fontsize #-3
    \fill-line {
      \null
      \null
      \right-column {
        "Arrangement October 2026"
        "Justin Findlay & Claude Fable 5.1"
        " "
      }
    }
  }
  tagline = ##f
}

\score {
  <<
    \new Staff = "Violon solo" \with {
      instrumentName = \markup { \center-column {"Violon Solo" \scordatura } }
    } <<
      \reperes
      \trame
      \new Voice = "melody" {
        \clef treble
        % Works around a LilyPond 2.24.3 engraving bug: two small-notehead chord tones (the
        % ad-lib LH-pizz clicks, engraved via \tweak font-size on a chord member) separated by a
        % few bars, the second under a slurred ornament (\prall/\trill), trips a
        % "cyclic dependency: calculation-in-progress ... Slur.control-points" crash in the
        % default avoid-slur placement for the attached articulation. Switching Script's
        % avoid-slur strategy sidesteps the recursive branch; no visible effect on scripts this
        % small. Found 2026-10-23 entering the Episodes 2-6 ad-lib engraving.
        \override Script.avoid-slur = #'inside
        \epOne \epTwo \epThree \epFour \epFive \epSix \epSeven \epEight
        \epNine \epTen \epEleven \epTwelve \epThirteen \epFourteen \epFifteen \epSixteen
        \epSeventeen \epEighteen
      }
    >>
  >>
  \layout { }
}
