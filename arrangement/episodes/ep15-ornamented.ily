\version "2.24.3"
% Episode 15 -- bars 394-415 "Ornamented" [L]. V1a's line verbatim (V1a/V2 in unison; the solo is
% tacet): 394 the upbeat arpeggio, 395-398 the ornamented figure with upper acciaccature, 399-401
% the turns and D-major arpeggio, 402 the tutti hammer and restart, 403-409 the phrase again,
% 410-415 the arpeggio sweeps over the D pedal, poco stringendo, into the Animato; 415 an octave
% above V1a, stopped. Open E-flat marked \open where the descent reaches it (397/405).

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
