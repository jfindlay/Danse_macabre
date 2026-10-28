\version "2.24.3"
% Episode 15 -- bars 394-415 "Ornamented" [L] (decided 2026-10-28, user + agent; see docs/NOTES.md
% and docs/PLAN.md's Episode 15 draft). Absolute pitch.
%
% Concept: V1a's line verbatim -- it is the only line in the episode (V1a/V2 in unison; the solo
% is tacet), it appears nowhere else in the piece, and it is already violin writing. 394 the
% upbeat arpeggio from bes; 395-398 the ornamented figure, descending chromatic slurred pairs
% each with an upper acciaccatura (g''-bes'' down to b'-bes'), all 1st position on the E-flat and
% A strings; 399-401 the aes'-g'-aes' / g'-fis'-g' turns and the D-major arpeggio to d'''; 402
% the tutti hammer and the restart; 403-409 the whole phrase again (the orchestra's own repeat,
% identical; 403 spells aes'' for 395's gis''); 410-415 the D / G-minor arpeggio sweeps over the
% D pedal, poco stringendo (Trame mark at 409), into the Animato at 416.
% The accompaniment is a waltz frame and nothing else -- Hb/Cl/Bn + Va/Vc/Cb quarter chords on
% beats 1-2, rest on 3 (Gm/Bb, Cm, D/F#, Gm, Ab/C, Gm/D, D; then D / Gm/D alternating over the D
% pedal 409-415, Tp/Tb join on D at 414). Not carried: under the acciaccatura pairs a double-stop
% would grind a leggiero figure, and 399-401 spell their own harmony.
% The two tutti stamps (GC/Cym) become chords in the hand V1a is already in: 394.1 -! G minor over
% a B-flat bass (Vc/Cb/Bn2/Tb3/Tba on bes; V1a's bes IS that bass) -> <bes d' bes' g''> 3-0-1-2,
% stepwise on every string from 393's <c' fis' a' fis''>; 402.1 the root-position G hammered
% 8 8 4 (Ti/Tp/Tb/horns g g g, Fl/Pic bes'' d''' g''') while V1a plays bes''8 r8 and restarts ->
% <g d' bes' bes''>8-! 0-0-1-4, then V1a's rest kept (the breath before the restart; the second
% hammer <g d'>8 was offered and declined).
% 415 an octave above V1a (user): a'' d''' fis''' a''' d'''' fis'''' -- 414-415 become one
% four-octave D-major climb from the open D into the Animato instead of V1a's drop back to a'.
% a''' is 377's top, d'''' is 172's; fis'''' (27 semitones up the E-flat string, a tone above
% 173.1's e'''') is at the fingerboard's edge. Stopped, as 172/173.1 were re-decided (2026-10-25);
% fallback if it will not speak: the artificial harmonic fis'' stopped, touch b'' (sounds
% fis''''). Ep 16's 416 g''' is a seventh below -- its register is Episode 16's decision.
% Hand: 1st position for 394-400, 402-408 and the sweeps' lower halves; the arpeggio peaks
% (401/409/411/413 d''') are V1a's own shifts; 415 climbs to the top of the E-flat string.
% Open E-flat (ees'') marked \open where the descent reaches it (397/405).
% Dynamics: ff running from 391 (no new string dynamic at 394); ff restated at 409 (Cb's, with
% the Trame's "poco stringendo"); 416 ff is Episode 16's.
% Not carried: the waltz chords (Hb/Cl/Bn, Va/Vc/Cb); the Fl/Pic d''' g''' top of the 402
% hammer; Ti/GC/Cym; V2's low 415; horns 1/2 re-crook to E-flat at 403 (silent to 438).

epFifteen = \absolute {
  \barNumberCheck #394
  % 394: the tutti -! downbeat (G minor over B-flat) with V1a's bes as the bass, then V1a's
  % upbeat arpeggio.
  <bes d' bes' g''>4-! d'8 g'8 bes'8 d''8                                      | % 394
  % 395-398: the ornamented figure (V1a/V2 unison), acciaccaturas and slurs as the source.
  g''8( bes''8) \acciaccatura bes''8 a''8( gis''8) \acciaccatura a''8 gis''8( g''8) | % 395
  \acciaccatura aes''8 g''8( fis''8) \acciaccatura g''8 fis''8( f''8)
    \acciaccatura ges''8 f''8( e''8)                                           | % 396
  \acciaccatura f''8 e''8( ees''8\open) \acciaccatura e''8 ees''8\open( d''8)
    \acciaccatura ees''8\open d''8( cis''8)                                    | % 397
  \acciaccatura d''8 cis''8( c''8) \acciaccatura des''8 c''8( b'8)
    \acciaccatura c''8 b'8( bes'8)                                             | % 398
  % 399-401: the turns and the D-major arpeggio (V1a).
  aes'8 g'8 aes'8 c''8 bes'8 aes'8                                             | % 399
  g'8 fis'8 g'8 bes'8 a'!8 g'8                                                 | % 400
  fis'8 a'8 d''8 fis''8 a''8 d'''8                                             | % 401
  % 402: the tutti hammer (root-position G) under V1a's bes'', V1a's rest, the restart.
  <g d' bes' bes''>8-! r8 d'8 g'8 bes'8 d''8                                   | % 402
  % 403-409: the phrase again (403.2 spelled aes'' in the source).
  g''8( bes''8) \acciaccatura bes''8 a''8( aes''8) \acciaccatura a''8 aes''8( g''8) | % 403
  \acciaccatura aes''8 g''8( fis''8) \acciaccatura g''8 fis''8( f''8)
    \acciaccatura ges''8 f''8( e''8)                                           | % 404
  \acciaccatura f''8 e''8( ees''8\open) \acciaccatura e''8 ees''8\open( d''8)
    \acciaccatura ees''8\open d''8( cis''8)                                    | % 405
  \acciaccatura d''8 cis''8( c''8) \acciaccatura des''8 c''8( b'8)
    \acciaccatura c''8 b'8( bes'8)                                             | % 406
  aes'8 g'8 aes'8 c''8 bes'8 aes'8                                             | % 407
  g'8 fis'8 g'8 bes'8 a'!8 g'8                                                 | % 408
  % 409-415: the sweeps over the D pedal, ff (Cb) with the Trame's "poco stringendo" at 409.
  fis'8\ff a'8 d''8 fis''8 a''8 d'''8                                          | % 409
  bes''8 g''8 d''8 bes'8 g'8 d'8                                               | % 410
  fis'8 a'8 d''8 fis''8 a''8 d'''8                                             | % 411
  bes''8 g''8 d''8 bes'8 g'8 d'8                                               | % 412
  fis'8 a'8 d''8 fis''8 a''8 d'''8                                             | % 413
  d'8 fis'8 a'8 d''8 fis''8 a''8                                               | % 414
  % 415: an octave above V1a (a' d'' fis'' a'' d''' fis''') -- the climb continues to the top of
  % the E-flat string into [416] Animato.
  a''8 d'''8 fis'''8 a'''8 d''''8 fis''''8                                     | % 415
  \barNumberCheck #416
}
