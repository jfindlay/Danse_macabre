\version "2.24.3"
% Episode 12 -- bars 309-337 "Summons, stamps, two themes" [I] (decided 2026-10-27, user + agent;
% see docs/NOTES.md and docs/PLAN.md's Episode 12 draft). Absolute pitch.
%
% The file keeps its old "diesirae" name, but there is no Dies irae here: the chant's contour
% (F E F D E C D D) occurs in the score exactly once, in the winds at 181-185 -- Episode 7's
% strain. See NOTES "Structural map" (corrected 2026-10-27).
%
% Concept: the solo plays almost the whole episode, so this is the first episode where the
% orchestra is layered *over* the solo's own notes rather than lifted into its rests. (1) 309.1
% the goal note of Episode 11's second run (Fl1 fis'), then the tritone summons verbatim. (2)
% 312.3-320 a strict alternation: the strings' pizz chords (upbeat + two, waltz-shaped) in the
% solo's rests, then the solo's low gruff stamp des'/c'/bes -- the bass of a homorhythmic wind
% stamp (Bn1 in unison with the solo, Hb/Cl the chord above) -- taken as double-stops with the one
% chord tone that sits on the D string: <des' g'> (E-flat 7's tritone, the summons' interval a
% semitone down), <c' aes'> (A-flat), <bes e'> (C-sharp dim7's tritone). Every solo pitch stays on
% its beat; the harmony rides on top. The pizz E-flat 7 strum <des' g' bes' ees''> is the same hand
% as Episode 11's Gr6 hammer blow, and its bass becomes the solo's stamp note. (3) 321-337 Theme 2
% in the solo, espress., over Theme 1's head in V1a pp staccato (four two-bar cells on d', cis',
% b, a) and a pp D pedal: the solo's line is kept intact -- the cells are on the G/D strings under
% a melody on A/E-flat, so they cannot be superimposed, and shortening the held notes to fit them
% was rejected (user, 2026-10-27). Cell 1 falls in the solo's rests and is lifted whole; cells 2
% and 3 show their tails in the solo's two-beat rests (327.1-2, 331.1-2); 331.3 <bes g'> is V1a's
% bes under the solo's p entrance (the G major -> G minor shift of 329 -> 331 made audible).
% Hand: all 1st position. Stamp double-stops 4-3 / 3-4 / 2-1 (G-D); pizz chords 4-3-1-0,
% 4-2-0, 2-3-4.
% Pizz: each three-chord group is a short passage -- "pizz." on its first chord, "arco" on the
% solo's re-entry (as 203.1 -> 205.3), rather than three per-note labels.
% Not carried: Ti d8 d8 d4-. at 309; Hb1's f''-bes' oscillation 314-316 and bes'' 318 (E-flat
% string, not reachable over a G-string bass); Fl1's descant cis''' fis''' fis''' fis''' e''' d'''
% 319.3-321.1 (the cadence taken as the brass/bass g -> d instead); the pp D pedal in repeated
% 8ths 321-336 (V2 d'/a, A fis, Vc/Cb d) and its harmony changes; V1a's d'4-. at 323.3 (the solo's
% espress. entrance kept clean); cells 2-4 under the solo's held notes (325-326, 329-330,
% 333-334); V1a's c' at 327.3 (non-adjacent to the solo's c''); Ti roll + horn d pedal at 337
% (the strings' rising line begins on 337.3 over the solo's held d'; Episode 13 continues it).
% Dynamics: p carried from 305 for 309.1; f 309.3 (solo); the pizz groups p (Ti pp; strings
% unmarked), the solo's stamps f; p 320.3-321.1 (tutti); pp 321.2 (V1a); editorial (f) at 323.3
% (the solo carries no dynamic after 309 -- Episode 8's 221.3 precedent); the solo's own hairpins
% 327.3-330.1, 333, 336-337 and p 331.3. The 327/331 fragments are V1a's pp.

epTwelve = \absolute {
  \barNumberCheck #309
  % 309.1: Fl1 fis'4) = the goal of the 305-308 run, over the p D chord (Fl2/Cl2 d', Cl1 fis,
  % Bn1 a, Bn2 d, V1a d'8-., V2 d''/d', Vc/Cb d pizz, Ti d8 d8 d4-., Xy d'). 309.3-312.2 VSolo
  % verbatim (the tritone summons), f.
  fis'4 r4 <d' a'>4-.\f                                                        | % 309
  <a' ees''>8\open <a' ees''>8\open <a' ees''>4\open <d' a'>4-.                | % 310
  <a' ees''>8\open <d' a'>8 <a' ees''>8\open <d' a'>8 <a' ees''>8\open <d' a'>8 | % 311
  % 312.3-313.2: strings pizz (V1a d'', V2 d', A <a fis'>, Vc/Cb d; Ti d pp) = the D stamp; then
  % E-flat 7 (V1a <bes' g''>, V2 <g' ees''>, A <bes g'>, Vc/Cb des) x2 -- the Episode 11 Gr6 hand.
  <a' ees''>4\open <d' a'>4-. <d' a' fis''>4\p^"pizz."                         | % 312
  <des' g' bes' ees''>4 <des' g' bes' ees''>4 <des' g'>4-.\f^"arco"            | % 313
  % 313.3-316.2: VSolo des' (= Bn1 des') under Hb1 f''/bes', Hb2 bes', Cl1 g', Cl2 ees' in the
  % solo's rhythm -> <des' g'>: the D-string chord tone over the solo's note.
  <des' g'>8-. <des' g'>8-. <des' g'>4-. <des' g'>4-.                          | % 314
  <des' g'>8 <des' g'>8 <des' g'>8 <des' g'>8 <des' g'>8 <des' g'>8            | % 315
  <des' g'>4-. <des' g'>4-. <des' g' bes' ees''>4\p^"pizz."                    | % 316 .3: strings' upbeat
  % 317.1-2 / 318.3: strings pizz A-flat (V1a aes'', V2 <aes' ees''>, A <aes ees'>, Vc/Cb c);
  % 317.3-318: VSolo c' (= Bn1) under Hb1 ees''/bes'', Hb2 ees'', Cl1 aes', Cl2 ees' -> <c' aes'>.
  <aes' c'' ees''>4 <aes' c'' ees''>4 <c' aes'>4-.\f^"arco"                    | % 317
  <c' aes'>8-> <c' aes'>8 <c' aes'>4-. <aes' c'' ees''>4\p^"pizz."             | % 318
  % 319.1-2: strings pizz C-sharp dim7 (V1a des'''/des'', V2 <g' e''>, A <g e'>, Vc/Cb bes);
  % 319.3-320: VSolo bes (= Bn1) under Hb1 g'', Hb2 cis'', Cl1 g', Cl2 e' -> <bes e'>. 320.3 the
  % tutti G (Bn/Ti/C1-2/Tp g, Fl cis'''), 321.1 the tutti D (Bn/Ti/Tp/C1 d, Hb fis''/d'', Fl d'''),
  % p: taken as the open G and D.
  <bes g' e''>4 <bes g' e''>4 <bes e'>4-.\f^"arco"                             | % 319
  <bes e'>8-> <bes e'>8 <bes e'>4-. g4-.\p                                     | % 320
  % 321.2-323.2: V1a's first Theme-1-head cell pp (r4 d' fis' d' e' | fis' e' d' | f' e' d'),
  % entirely in the solo's rests. 323.3 VSolo d'' espress. (V1a's d'4-. not added).
  d'4-. d'8-.\pp fis'8-. d'8-. e'8-.                                           | % 321
  fis'4-. e'4-. d'4-.                                                          | % 322
  f'!4-. e'4-.
    d''4-\tweak self-alignment-X #CENTER -\markup{\dynamic "(f)"}^\markup\italic "espress." | % 323
  % 323.3-337: VSolo Theme 2 verbatim with its own slurs and hairpins. V1a's cells 2-4 (325.2-327,
  % 329.2-331, 333.2-334) lie under the held notes and are not carried, except their tails in the
  % solo's rests: 327.1-2 ees' d', 331.1-2 d' c', and 331.3 bes under the solo's g'.
  f''!4( e''4 d''4)                                                            | % 324
  e''2.(                                                                       | % 325
  a'2.)                                                                        | % 326
  ees'!4-.\pp d'4-. <c' c''>4\>                                                | % 327 V1a tail; solo c''
  ees''4( d''4 c''4)                                                           | % 328
  d''2.(                                                                       | % 329
  g'2.)\!                                                                      | % 330
  d'4-.\pp c'4-. <bes g'>4\p                                                   | % 331 V1a tail; solo g' + V1a bes
  bes'4( a'4 g'4)                                                              | % 332
  a'2(\< e'4)\!                                                                | % 333
  g'2.(                                                                        | % 334
  f'2.                                                                         | % 335
  ees'2.)\>                                                                    | % 336
  % 337: VSolo d'2.~ held through 339.1 (tied 337 -> 338 -> 339). The strings' rising line begins
  % on 337.3 (V1a ees'); it rides over the held d' as the chord's upper note (restored in Episode
  % 13's session, 2026-10-27: d' on the G string, 4th finger; the line on the D string).
  d'2\!~ <d'~ ees'>4(\pp                                                       | % 337 -> 338 (Ep 13)
  \barNumberCheck #338
}
