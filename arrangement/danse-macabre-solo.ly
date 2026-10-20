\version "2.24.3"
% Danse macabre, op. 40 (Saint-Saens) arranged for unaccompanied violin in the original
% scordatura (G-D-A-E-flat). See docs/PLAN.md (deliverable, build pipeline, episode ledger) and
% docs/NOTES.md (premises, conventions, decisions) for the full arranging rationale.
%
% Structure: \trame (bars, tempo, key changes, rehearsal marks -- no notes) runs in parallel with
% a single melodic \Voice inside one \Staff named "solo", so marks/keys/bar grid come from the
% Trame and are never duplicated in the episode files. Every episode ends with a
% \barNumberCheck at its own first bar and the next episode's first bar: the fidelity gate is
% zero \barNumberCheck warnings at compile time, for the full 477 bars, 3/4 throughout.
%
% Episodes 1-8 (bars 1-236) are fully composed (see docs/NOTES.md decisions log). Episodes 9-18
% (bars 237-477) are \barNumberCheck'd multi-measure-rest placeholders pending @architect --
% see docs/PLAN.md "Resume here".

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
  subtitle = \markup { \column \small { "Arranged for unaccompanied violin" } }
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
  \new Staff = "Violon solo" \with {
    instrumentName = \markup { \center-column {"Violon Solo" \scordatura } }
  } <<
    \reperes
    \trame
    \new Voice = "melody" {
      \clef treble
      \epOne \epTwo \epThree \epFour \epFive \epSix \epSeven \epEight
      \epNine \epTen \epEleven \epTwelve \epThirteen \epFourteen \epFifteen \epSixteen
      \epSeventeen \epEighteen
    }
  >>
  \layout { }
}
