\version "2.24.3"
% Converted from source/lilypond/166-StSaens-DanseMacabre-Global.ily (v2.16.0): only the pieces
% a single solo-violin score needs -- the text/dynamic helper macros used by the lifted passages,
% the "Accord du violon" scordatura markup, and the rehearsal-mark formatter. The original's
% \paper block (page layout for a 31-part orchestral score, \epsfile credits, etc.) is dropped.

% "ten." is engraved as the tenuto articulation (--); the source's text macro is dropped.
arco = ^\markup {"Arco"}
pizz = ^\markup {"Pizz."}
espr = _\markup {\italic "espress."}
anim = ^\markup {"Animato"}
menop = _\markup {\italic "meno " \dynamic p}

% Optional cut: a bracket over the bars a performer may skip. The bars stay in the score (the
% 477-bar grid is the fidelity gate); the bracket only says "these may be left out". Open it with
% \optCut before the first note of the cut with \startTextSpan on that note, and close it with
% \stopTextSpan on the last note; the hook at the right end marks where the cut ends.
optCut = {
  \once \override TextSpanner.style = #'line
  \once \override TextSpanner.bound-details.left.text = \markup { \small \italic "opt. cut" }
  \once \override TextSpanner.bound-details.left.attach-dir = #LEFT
  \once \override TextSpanner.bound-details.right.text = \markup { \draw-line #'(0 . -1) }
  \once \override TextSpanner.bound-details.right.attach-dir = #RIGHT
  \once \override TextSpanner.bound-details.right-broken.text = ##f
  \once \override TextSpanner.bound-details.left-broken.text = ##f
}

reperes = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \override Score.RehearsalMark.padding = #2.0
}

%% "Accord du violon" -- the scordatura header (from -Global.ily, same markup, current syntax).
scordatura = \markup {
  \raise #5.5
  \score {
    \new Staff \with {
      \remove "Time_signature_engraver"
      fontSize = #-3
      \override StaffSymbol.staff-space = #(magstep -3)
    }
    { \clef treble \cadenzaOn
      \override Stem.transparent = ##t
      \relative c' {<g d' a' ees'>4 }
    }
    \layout {
      ragged-right = ##t
    }
  }
  \hspace #.5
}
