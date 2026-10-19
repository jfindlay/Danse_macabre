\version "2.24.3"
% Stub for 166-StSaens-DanseMacabre-Global.ily: only the markup/helper
% commands referenced by Mus/*.ily are needed for a \displayLilyMusic dump.
% The real Global.ily's \paper block pulls in \epsfile "cc.eps" etc, which
% are not needed here and whose absence makes LilyPond raise a fatal error
% during page-layout (after \displayLilyMusic has already done its job, but
% before the process exits cleanly) -- so we skip it entirely.
arco = ^\markup {"Arco"}
pizz = ^\markup {"Pizz."}
espr = _\markup {\italic "espress."}
ten = ^\markup {\italic "ten."}
anim = ^\markup {"Animato"}
menop = _\markup {\italic "meno " \dynamic p}
un = -\tag #'partie ^\markup{\huge \bold "1"}
reperes = { \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
						\override Score.RehearsalMark.padding = #2.0 }
silencesMulti = { \set Score.skipBars = ##t
						\override MultiMeasureRest.expand-limit = #1 }
