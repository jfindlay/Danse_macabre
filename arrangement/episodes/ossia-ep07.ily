\version "2.24.3"
% Episode 7 arco ossia -- bars 189-205, a safety staff below the main solo staff for the pizz
% stretch of Episode 7's Section B (decided 2026-10-18, see docs/NOTES.md and docs/PLAN.md's
% Episode 7 draft; engraved 2026-10-23 per "Resume here" step 2d). Same chords as the main
% staff's pizz line, bowed staccato; beat 2 = the turn at its own octave (E-flat string, in hand
% in both positions; the open-A substitute a'-bes'-a' is also available in 189-193); 204 = Fl2/
% Hb1's chromatic rise as a double turn into bar 205's arco strum -- the ossia carries its own
% 205.1 <b dis' b' dis''>4\f arco, since the main staff's 205.1 is pizz (ep08 header).

ossiaEpSeven = \absolute {
  \clef treble
  s2.*188
  \barNumberCheck #189
  <cis'' e''>4-. \tuplet 3/2 { a'8->( bes'8 a'8) } f''4-.\p                               | % 189
  <e'' g''>4-. \tuplet 3/2 { a''8->( bes''8 a''8) } <f'' a''>4-.                         | % 190
  <d'' f''>4-. \tuplet 3/2 { a''8->( bes''8 a''8) } <e'' g''>4-.                         | % 191
  <cis'' e''>4-. \tuplet 3/2 { a''8->( bes''8 a''8) } <d'' f''>4-.                       | % 192
  <d'' f''>4-. \tuplet 3/2 { a''8->( bes''8 a''8) } <f'' a''>4-.                         | % 193
  <f'' a''>4-.\< \tuplet 3/2 { a''8->( bes''8 a''8) } <g'' bes''>4-.                     | % 194
  <f'' a''>4-. <e'' g''>4-. <d'' f''>4-.                                                 | % 195
  <f'' a''>4-. \tuplet 3/2 { a''8->( bes''8 a''8) } <e'' g''>4-.                         | % 196
  <e'' g''>4-. \tuplet 3/2 { a''8->( bes''8 a''8) } <g'' bes''>4-.                       | % 197
  <f'' a''>4-. \tuplet 3/2 { a''8->( bes''8 a''8) } <g'' bes''>4-.                       | % 198
  <e'' g''>4-. \tuplet 3/2 { a''8->( bes''8 a''8) } <f'' a''>4-.                         | % 199
  <d'' f''>4-. \tuplet 3/2 { a''8->( bes''8 a''8) } <e'' g''>4-.                         | % 200
  <e'' g''>4-. \tuplet 3/2 { a''8->( bes''8 a''8) } <e'' g''>4-.                         | % 201
  <e'' g''>4-. \tuplet 3/2 { a''8->( bes''8 a''8) } <f'' a''>4-.                         | % 202
  <e'' g''>4-. <d'' f''>4-. <cis'' e''>4-.\!                                             | % 203
  <e'' g''>4-.\f \tuplet 3/2 { a''8( bes''8 a''8) } \tuplet 3/2 { ais''8( b''8 ais''8) } | % 204
  <b dis' b' dis''>4\f^"arco" r4 r4                                                     | % 205
  \barNumberCheck #206
  s2.*272
}
