\version "2.24.3"
% Converted from source/lilypond/166-StSaens-DanseMacabre-Trame.ily (v2.16.0): the bar/tempo/
% key/mark skeleton of the full score, filtered to the \tag #'Ton branch (concert pitch for a
% non-transposing instrument -- the TonClarinette and SansTon branches are the transposing-score
% and condensed-score alternatives and are dropped here). \mark numbers keep the source's own
% sequence (1-9, then 11-14, skipping 10/J, exactly as the orchestral score has it) so
% \reperes's format-mark-box-alphabet reproduces the printed A-N lettering.
%
% This expression carries NO notes -- only spacers, \key, \mark and \bar -- so it can run in
% parallel with the solo \Voice inside the same \Staff: marks, key changes and the bar grid come
% from here, never from the episode files. \barNumberCheck in the episode files is the
% cross-validation that the two line up.

trame = {
  \tempo \markup {\bold "Mouvement modéré de Valse"}
  \time 3/4
  \key g \minor
  s2.*64
  \mark #1                                                              %% A bar 65
  s2.*52
  \mark #2                                                              %% B bar 117
  s2.*20
  \mark #3                                                              %% C bar 137
  s2.*36
  \mark #4                                                              %% D bar 173
  s2.*32 \bar "||"
  \mark #5                                                              %% E bar 205
  \key b \major
  s2.*32
  \mark #6                                                              %% F bar 237
  s2.*16 \bar "||"
  \mark #7                                                              %% G bar 253
  \key g \minor
  s2.*20
  \mark #8                                                              %% H bar 273
  s2.*36
  \mark #9                                                              %% I bar 309
  s2.*53
  \mark #11                                                             %% K bar 362
  s2.*32
  \mark #12                                                             %% L bar 394
  s2.*15
  \once \override Score.RehearsalMark.self-alignment-X = #LEFT
  \mark \markup {\small "poco stringendo"}
  s2.*7
  \once \override Score.RehearsalMark.self-alignment-X = #LEFT
  \mark \markup {\small "Animato"}                                      %% bar 416
  s2.*14
  \mark #13                                                             %% M bar 430
  s2.*8 \bar "||"
  \once \override Score.RehearsalMark.self-alignment-X = #LEFT
  \mark \markup {\small "Tempo 1°"}                                     %% bar 438
  s2.*29
  \mark #14                                                             %% N bar 467
  s2.*11
  \bar "|."                                                             %% bar 477
}
