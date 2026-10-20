\version "2.24.3"
% Converted from source/lilypond/166-StSaens-DanseMacabre-Global.ily (v2.16.0): only the pieces
% a single solo-violin score needs -- the text/dynamic helper macros used by the lifted passages,
% the "Accord du violon" scordatura markup, and the rehearsal-mark formatter. The original's
% \paper block (page layout for a 31-part orchestral score, \epsfile credits, etc.) is dropped.

arco = ^\markup {"Arco"}
pizz = ^\markup {"Pizz."}
espr = _\markup {\italic "espress."}
ten = ^\markup {\italic "ten."}
anim = ^\markup {"Animato"}
menop = _\markup {\italic "meno " \dynamic p}

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
