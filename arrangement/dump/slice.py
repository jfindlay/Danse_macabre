#!/usr/bin/env python3
"""Slice absolute-pitch LilyPond voice dumps into bar ranges.

Reads the `\\displayLilyMusic` output captured in abs/<Voice>.abs.ly (see
build_dump.py) and either:

  1. prints a chosen bar range in absolute LilyPond pitch, bar-numbered, with
     "|" bar separators, or
  2. verifies that a voice's total duration equals exactly 477 bars of 3/4.

It implements a small hand-written tokenizer + recursive-descent duration
parser for the subset of LilyPond emitted by `\\displayLilyMusic` on this
score: sequential `{ }` groups, simultaneous `<< >>` groups (`\\`-separated
or bare adjacent `{ }` branches), chords `< >`, `\\repeat unfold/percent/
tremolo N BODY`, `\\tuplet N/D BODY`, `\\grace`/`\\acciaccatura`/
`\\appoggiatura`, `\\afterGrace FRAC MAIN GRACE`, `\\tag #'x BODY`, and the
usual zero-duration engraving commands (`\\set`, `\\override`, `\\once`,
`\\clef`, dynamics, articulations, `\\markup ...`, etc).

Multi-measure rests/spacers written as `R2.*N` / `s2.*N` are expanded into N
one-bar instances so bar slicing and the "|" bar-check cross-validation both
work across them.

USAGE
    python3 slice.py <abs_dir> <Voice> <bar_start> <bar_end> [--transpose PRESET]
        Print bars bar_start..bar_end (inclusive, 1-based) for <Voice>.
        PRESET is one of: cl-bb (Clarinet in Bb), horn-g (Cor 1/2 en Sol),
        horn-d (Cor 3/4 en Re), tp-d (Trompette en Re). Omit for written pitch.

    python3 slice.py <abs_dir> --verify-all
        Parse every *.abs.ly in abs_dir, report total bar count (expect 477
        bars of 3/4 = 1431 quarter notes) and any "|" bar-check mismatch.

Examples:
    python3 slice.py abs Pic 117 136
    python3 slice.py abs Cl1 117 136 --transpose cl-bb
    python3 slice.py abs --verify-all
"""
from __future__ import annotations

import re
import sys
import pathlib
from fractions import Fraction
from typing import List, Tuple, Optional

Event = Tuple[Fraction, Fraction, int, str]  # (t_start, t_end, lane, text)

BEATS_PER_BAR = Fraction(3)  # 3/4 time throughout this score
TOTAL_BARS = 477

# --------------------------------------------------------------------------
# Tokenizer
# --------------------------------------------------------------------------

WORD_STOP = set('{}<"#\\') | set(' \t\r\n')


def tokenize(text: str) -> List[Tuple[str, str]]:
    tokens: List[Tuple[str, str]] = []
    i, n = 0, len(text)
    while i < n:
        c = text[i]
        if c.isspace():
            i += 1
            continue
        if text[i:i + 2] == '<<':
            tokens.append(('LDOUBLE', '<<')); i += 2; continue
        if text[i:i + 2] == '>>':
            tokens.append(('RDOUBLE', '>>')); i += 2; continue
        if c == '<':
            tokens.append(('LCHORD', '<')); i += 1; continue
        if c == '>':
            tokens.append(('RCHORD', '>')); i += 1; continue
        if c == '{':
            tokens.append(('LBRACE', '{')); i += 1; continue
        if c == '}':
            tokens.append(('RBRACE', '}')); i += 1; continue
        if c == '"':
            j = i + 1
            while j < n:
                if text[j] == '\\' and j + 1 < n:
                    j += 2
                    continue
                if text[j] == '"':
                    j += 1
                    break
                j += 1
            tokens.append(('STRING', text[i:j])); i = j; continue
        if c == '#':
            j = i + 1
            if j < n and text[j] == '#':
                j += 1
                while j < n and text[j] not in WORD_STOP:
                    j += 1
            else:
                depth = 0
                while j < n and text[j] == "'":
                    j += 1
                if j < n and text[j] == '(':
                    depth = 1
                    j += 1
                    while j < n and depth > 0:
                        ch = text[j]
                        if ch == '"':
                            j += 1
                            while j < n and text[j] != '"':
                                j += 1
                            j += 1
                            continue
                        if ch == '(':
                            depth += 1
                        elif ch == ')':
                            depth -= 1
                        j += 1
                else:
                    while j < n and text[j] not in WORD_STOP:
                        j += 1
            tokens.append(('SCHEME', text[i:j])); i = j; continue
        if text[i:i + 2] == '\\\\':
            tokens.append(('VOICESEP', '\\\\')); i += 2; continue
        if c == '\\':
            j = i + 1
            if j < n and text[j].isalpha():
                k = j
                while k < n and (text[k].isalnum() or text[k] == '-'):
                    k += 1
                tokens.append(('COMMAND', text[i:k])); i = k; continue
            else:
                tokens.append(('COMMAND', text[i:j + 1])); i = j + 1; continue
        j = i
        while j < n and text[j] not in WORD_STOP:
            j += 1
        tokens.append(('WORD', text[i:j])); i = j
    tokens.append(('EOF', ''))
    return tokens


# --------------------------------------------------------------------------
# Duration parsing for a single WORD token
# --------------------------------------------------------------------------

DURATION_RE = re.compile(
    r"^(?:[rRsS]|[a-g](?:is|es)*[,']*)?"
    r"[!?]?"
    r"(?P<num>\d+)(?P<dots>\.*)"
    r"(?::\d+)?"
    r"(?:\*(?P<mnum>\d+)(?:/(?P<mden>\d+))?)?"
)

MULTI_RE = re.compile(
    r"^(?P<rs>[rRsS])(?P<acc>[!?]?)(?P<num>\d+)(?P<dots>\.*)(?::\d+)?"
    r"\*(?P<mnum>\d+)(?!/)$"
)

PITCH_PREFIX_RE = re.compile(r"^[a-g](?:is|es)*[,']*")


def dot_factor(ndots: int) -> Fraction:
    if ndots == 0:
        return Fraction(1)
    return Fraction(2) - Fraction(1, 2 ** ndots)


def token_duration(word: str) -> Fraction:
    m = DURATION_RE.match(word)
    if not m or not m.group('num'):
        return Fraction(0)
    num = int(m.group('num'))
    dur = Fraction(4, num) * dot_factor(len(m.group('dots')))
    if m.group('mnum'):
        mult = Fraction(int(m.group('mnum')))
        if m.group('mden'):
            mult /= int(m.group('mden'))
        dur *= mult
    return dur


def leaf_instances(word: str) -> List[Tuple[Fraction, str]]:
    """One WORD token -> list of (duration, display_text) play instances.

    Multi-measure rests/spacers ('R2.*64', 's2.*32') expand into N
    one-measure instances so that bar slicing and '|' validation both see
    a regular per-bar grid instead of one giant multi-bar event.
    """
    m = MULTI_RE.match(word)
    if m:
        num = int(m.group('num'))
        base = Fraction(4, num) * dot_factor(len(m.group('dots')))
        base_text = m.group('rs') + m.group('acc') + m.group('num') + m.group('dots')
        return [(base, base_text)] * int(m.group('mnum'))
    return [(token_duration(word), word)]


# --------------------------------------------------------------------------
# Transposition (written -> sounding pitch)
# --------------------------------------------------------------------------

LETTERS = 'cdefgab'
NATURAL_SEMITONES = {'c': 0, 'd': 2, 'e': 4, 'f': 5, 'g': 7, 'a': 9, 'b': 11}

# (diatonic step delta, chromatic semitone delta) applied written -> sounding
TRANSPOSE_PRESETS = {
    'cl-bb': (-1, -2),    # Clarinet in B-flat: sounds a major 2nd below written
    'horn-g': (-3, -5),   # Cor 1/2 en Sol: sounds a perfect 4th below written
    'horn-d': (-6, -10),  # Cor 3/4 en Re: sounds a minor 7th below written
    'tp-d': (1, 2),       # Trompette en Re: sounds a major 2nd above written
}

TRANSPOSE: Optional[Tuple[int, int]] = None


def _parse_pitch(name: str) -> Tuple[int, int, int]:
    base = name[0]
    idx = LETTERS.index(base)
    rest = name[1:]
    acc = 0
    i = 0
    while rest[i:i + 2] == 'is':
        acc += 1; i += 2
    while rest[i:i + 2] == 'es':
        acc -= 1; i += 2
    oct_marks = rest[i:]
    octave = oct_marks.count("'") - oct_marks.count(',')
    return idx, NATURAL_SEMITONES[base] + acc, octave


def transpose_pitch(name: str, dsteps: int, dsemi: int) -> str:
    idx, semitone, octave = _parse_pitch(name)
    total_idx = idx + dsteps
    new_idx = total_idx % 7
    oct_from_steps = total_idx // 7
    absolute_semitone = octave * 12 + semitone + dsemi
    new_octave = octave + oct_from_steps
    new_natural = NATURAL_SEMITONES[LETTERS[new_idx]]
    acc = absolute_semitone - (new_octave * 12 + new_natural)
    while acc > 6:
        acc -= 12; new_octave += 1
    while acc < -6:
        acc += 12; new_octave -= 1
    letter = LETTERS[new_idx]
    accstr = ('is' * acc) if acc >= 0 else ('es' * (-acc))
    octstr = ("'" * new_octave) if new_octave >= 0 else ("," * (-new_octave))
    return letter + accstr + octstr


def maybe_transpose_word(word: str) -> str:
    if TRANSPOSE is None or word[:1] in 'rRsS':
        return word
    m = PITCH_PREFIX_RE.match(word)
    if not m:
        return word
    return transpose_pitch(m.group(0), *TRANSPOSE) + word[m.end():]


# --------------------------------------------------------------------------
# Recursive-descent parser -> flat event list with LOCAL (0-based) times
# --------------------------------------------------------------------------

MARKUP_ARITY = {
    'line': 1, 'column': 1, 'center-column': 1, 'concat': 1, 'fill-line': 1,
    'italic': 1, 'bold': 1, 'tiny': 1, 'small': 1, 'large': 1, 'huge': 1,
    'teeny': 1, 'normal-text': 1, 'roman': 1, 'sans': 1, 'typewriter': 1,
    'super': 1, 'sub': 1, 'underline': 1, 'circle': 1, 'whiteout': 1,
    'box': 1, 'dynamic': 1, 'musicglyph': 1, 'pad-around': 2, 'pad-x': 2,
    'fontsize': 2, 'raise': 2, 'with-color': 2, 'halign': 2,
    'general-align': 3, 'flat': 0, 'sharp': 0, 'natural': 0,
}

ZERO_ARG_COMMANDS = {
    'p', 'pp', 'ppp', 'pppp', 'f', 'ff', 'fff', 'ffff', 'mf', 'mp', 'fp',
    'sf', 'sfz', 'sffz', 'rfz', 'fz', '<', '>', '!', '(', ')',
    'rtoe', 'fermata', 'trill', 'prall', 'turn', 'mordent', 'upbow',
    'downbow', 'open', 'noBeam', 'startTrillSpan', 'stopTrillSpan',
    'flat', 'sharp', 'natural', 'segno', 'coda', 'arpeggio', 'glissando',
    'breathe', 'laissezVibrer', 'sustainOn', 'sustainOff', 'unaCorda',
    'treCorde', 'espressivo', 'snappizzicato', 'default', 'break',
    'noBreak', 'bar',  # bare \bar handled below with arg; kept out
}
ZERO_ARG_COMMANDS.discard('bar')

# Commands whose job is to wrap/produce a music expression (as opposed to
# attaching a zero-duration decoration to the previous note). Encountering
# one of these ends a run of trailing postfix decorations being absorbed
# into the preceding leaf -- see absorb_trailing_decorations().
MUSIC_WRAPPING_COMMANDS = {
    'tag', 'once', 'repeat', 'tuplet', 'times', 'grace', 'acciaccatura',
    'appoggiatura', 'slashedGrace', 'afterGrace', 'absolute', 'relative',
    'transpose', 'keepWithTag', 'partcombine',
}


def absorb_trailing_decorations(tokens, j, dur, events, anchor=None):
    """Fold zero-duration postfix commands (dynamics, articulations,
    \\markup, \\tweak, \\clef, \\set, etc.) immediately following a leaf
    into that same leaf.

    This matters whenever a caller treats "parse exactly one element" as
    meaning "one musical event, including everything attached to it" --
    e.g. \\afterGrace's main argument is a single decorated note; without
    this, \\trill/\\markup/etc. right after that note would wrongly be
    consumed as \\afterGrace's *second* (grace) argument instead of the
    real `{ ... }` grace block that follows them.

    Decorations are anchored at `anchor` (default: the leaf's own start,
    time 0) rather than at the end of its duration, so a decoration on a
    note that fills out the rest of a bar is not pushed into the next bar.
    """
    if anchor is None:
        anchor = Fraction(0)
    while True:
        kind, text = tokens[j]
        if kind == 'COMMAND' and text[1:] not in MUSIC_WRAPPING_COMMANDS:
            j, ddur, devents = parse_command(tokens, j)
            for (s, e, lane, txt) in devents:
                events.append((anchor + s, anchor + e, lane, txt))
            dur += ddur
            continue
        if kind == 'WORD' and text != '|' and token_duration(text) == 0:
            # Bare punctuation decorations that are their own token: slur
            # "(" ")", tie "~", beam "[" "]", etc. '|' bar-checks are kept
            # out so their absolute position stays meaningful for the
            # bar-check cross-validation in verify().
            events.append((anchor, anchor, 0, text))
            j += 1
            continue
        break
    return j, dur, events


def skip_markup(tokens, i) -> Tuple[int, str]:
    kind, text = tokens[i]
    if kind == 'STRING':
        return i + 1, text
    if kind == 'LBRACE':
        j = i + 1
        parts = []
        while tokens[j][0] != 'RBRACE':
            j, sub = skip_markup(tokens, j)
            parts.append(sub)
        return j + 1, '{ ' + ' '.join(parts) + ' }'
    if kind == 'COMMAND':
        bare = text[1:]
        arity = MARKUP_ARITY.get(bare, 1)
        j = i + 1
        args = []
        for _ in range(arity):
            j, sub = skip_markup(tokens, j)
            args.append(sub)
        return j, text + ((' ' + ' '.join(args)) if args else '')
    return i + 1, text


def skip_generic_value(tokens, i) -> Tuple[int, str]:
    kind, text = tokens[i]
    if kind in ('STRING', 'SCHEME', 'WORD'):
        return i + 1, text
    if kind == 'COMMAND' and text == '\\markup':
        return skip_markup(tokens, i + 1)
    if kind == 'LBRACE':
        depth = 1
        j = i + 1
        parts = []
        while depth > 0:
            k, t2 = tokens[j]
            if k == 'LBRACE':
                depth += 1
            elif k == 'RBRACE':
                depth -= 1
            parts.append(t2)
            j += 1
        return j, ' '.join(parts)
    return i + 1, text


def parse_one_element(tokens, i) -> Tuple[int, Fraction, List[Event]]:
    kind, text = tokens[i]

    if kind == 'LBRACE':
        j, dur, events = parse_group(tokens, i + 1, {'RBRACE'})
        assert tokens[j][0] == 'RBRACE', f"unterminated group at token {j}"
        return j + 1, dur, events

    if kind == 'LDOUBLE':
        return parse_simultaneous(tokens, i)

    if kind == 'COMMAND':
        return parse_command(tokens, i)

    if kind == 'WORD':
        instances = leaf_instances(text)
        events: List[Event] = []
        t = Fraction(0)
        last_start = Fraction(0)
        for d, disp in instances:
            last_start = t
            events.append((t, t + d, 0, maybe_transpose_word(disp)))
            t += d
        return absorb_trailing_decorations(tokens, i + 1, t, events, anchor=last_start)

    if kind == 'LCHORD':
        # A whole chord "< pitch pitch ... >duration" must be consumed as ONE
        # element: callers that parse "exactly one element" (\repeat, \tuplet,
        # \grace, \afterGrace bodies) rely on getting the chord's real
        # duration back, not just the bare '<' token (which, on its own, is
        # a zero-duration leaf and would silently drop the chord's duration
        # whenever it is the direct body of one of those constructs instead
        # of appearing inline in an ordinary sequence).
        events = [(Fraction(0), Fraction(0), 0, text)]
        j = i + 1
        while tokens[j][0] != 'RCHORD':
            events.append((Fraction(0), Fraction(0), 0, maybe_transpose_word(tokens[j][1])))
            j += 1
        events.append((Fraction(0), Fraction(0), 0, tokens[j][1]))
        j += 1
        dur = Fraction(0)
        last_start = Fraction(0)
        if tokens[j][0] == 'WORD':
            instances = leaf_instances(tokens[j][1])
            t = Fraction(0)
            for d, disp in instances:
                last_start = t
                events.append((t, t + d, 0, maybe_transpose_word(disp)))
                t += d
            dur = t
            j += 1
        return absorb_trailing_decorations(tokens, j, dur, events, anchor=last_start)

    # RCHORD '>', stray STRING/SCHEME/VOICESEP -> transparent leaf
    return i + 1, Fraction(0), [(Fraction(0), Fraction(0), 0, text)]


def parse_group(tokens, i, stop_kinds) -> Tuple[int, Fraction, List[Event]]:
    t = Fraction(0)
    events: List[Event] = []
    while tokens[i][0] not in stop_kinds and tokens[i][0] != 'EOF':
        i, dur, sub = parse_one_element(tokens, i)
        for (s, e, lane, txt) in sub:
            events.append((t + s, t + e, lane, txt))
        t += dur
    return i, t, events


def parse_simultaneous(tokens, i) -> Tuple[int, Fraction, List[Event]]:
    assert tokens[i][0] == 'LDOUBLE'
    i += 1
    branches: List[Tuple[Fraction, List[Event]]] = []
    while tokens[i][0] != 'RDOUBLE':
        if tokens[i][0] == 'VOICESEP':
            i += 1
            continue
        i, bdur, bevents = parse_one_element(tokens, i)
        branches.append((bdur, bevents))
    i += 1
    dur = max((d for d, _ in branches), default=Fraction(0))
    multi = len(branches) > 1
    events: List[Event] = []
    for idx, (bdur, bevents) in enumerate(branches):
        lane = idx if multi else 0
        for (s, e, _, txt) in bevents:
            events.append((s, e, lane, txt))
    return i, dur, events


def parse_command(tokens, i) -> Tuple[int, Fraction, List[Event]]:
    kind, name = tokens[i]
    bare = name[1:]

    if bare in ZERO_ARG_COMMANDS:
        return i + 1, Fraction(0), [(Fraction(0), Fraction(0), 0, name)]

    if bare == 'markup':
        j, mtext = skip_markup(tokens, i + 1)
        return j, Fraction(0), [(Fraction(0), Fraction(0), 0, name + ' ' + mtext)]

    if bare in ('clef', 'bar'):
        j = i + 1
        val = tokens[j][1]; j += 1
        return j, Fraction(0), [(Fraction(0), Fraction(0), 0, f'{name} {val}')]

    if bare == 'mark':
        j, val = skip_generic_value(tokens, i + 1)
        return j, Fraction(0), [(Fraction(0), Fraction(0), 0, f'{name} {val}')]

    if bare in ('unset', 'revert'):
        j = i + 1
        j += 1  # property path word
        return j, Fraction(0), []

    if bare in ('set', 'override'):
        j = i + 1
        j += 1  # path
        if tokens[j][1] == '=':
            j += 1
            j, _ = skip_generic_value(tokens, j)
        return j, Fraction(0), []

    if bare == 'once':
        return parse_one_element(tokens, i + 1)

    if bare == 'change':
        j = i + 1
        j += 1  # context type
        if tokens[j][1] == '=':
            j += 1
        j += 1  # value string
        return j, Fraction(0), []

    if bare == 'tweak':
        j = i + 1
        j += 1  # symbol/path
        j, val = skip_generic_value(tokens, j)
        return j, Fraction(0), [(Fraction(0), Fraction(0), 0, f'{name} {val}')]

    if bare == 'repeat':
        j = i + 1
        j += 1  # unfold/percent/tremolo keyword
        count = int(tokens[j][1]); j += 1
        j, bdur, bevents = parse_one_element(tokens, j)
        events: List[Event] = []
        for k in range(count):
            off = k * bdur
            for (s, e, lane, txt) in bevents:
                events.append((s + off, e + off, lane, txt))
        return j, bdur * count, events

    if bare in ('tuplet', 'times'):
        j = i + 1
        fracstr = tokens[j][1]; j += 1
        num_s, den_s = fracstr.split('/')
        num, den = int(num_s), int(den_s)
        factor = Fraction(den, num) if bare == 'tuplet' else Fraction(num, den)
        j, bdur, bevents = parse_one_element(tokens, j)
        events = [(s * factor, e * factor, lane, txt) for (s, e, lane, txt) in bevents]
        # Keep the tuplet visible in the rendered slice: without these markers a
        # triplet-8th bar reads as four beats of 3/4 and the rhythm is misread.
        # The markers ride on the first/last event text (not as separate
        # zero-duration events) so a group ending on a barline closes in its
        # own bar rather than at the start of the next.
        if events:
            s, e, lane, txt = events[0]
            events[0] = (s, e, lane, f'{name} {fracstr} {{ {txt}')
            s, e, lane, txt = events[-1]
            events[-1] = (s, e, lane, f'{txt} }}')
        return j, bdur * factor, events

    if bare in ('grace', 'acciaccatura', 'appoggiatura', 'slashedGrace'):
        j, bdur, bevents = parse_one_element(tokens, i + 1)
        events = [(Fraction(0), Fraction(0), lane, txt) for (_, _, lane, txt) in bevents]
        return j, Fraction(0), events

    if bare == 'afterGrace':
        j = i + 1
        j += 1  # fraction word
        j, mdur, mevents = parse_one_element(tokens, j)
        j, _, gevents = parse_one_element(tokens, j)
        events = list(mevents) + [(Fraction(0), Fraction(0), lane, txt) for (_, _, lane, txt) in gevents]
        return j, mdur, events

    if bare == 'tag':
        j = i + 1
        j += 1  # #'symbol
        return parse_one_element(tokens, j)

    if bare == 'absolute':
        return parse_one_element(tokens, i + 1)

    if bare == 'relative':
        j = i + 1
        if tokens[j][0] == 'WORD':
            j += 1
        return parse_one_element(tokens, j)

    if bare == 'transpose':
        j = i + 1
        j += 2  # two pitch words
        return parse_one_element(tokens, j)

    # Unknown command: best-effort -- consume one generic value, keep the
    # command name visible, contribute no duration.
    j, _ = skip_generic_value(tokens, i + 1)
    return j, Fraction(0), [(Fraction(0), Fraction(0), 0, name)]


# --------------------------------------------------------------------------
# Driver
# --------------------------------------------------------------------------

def load_events(abs_path: pathlib.Path) -> List[Event]:
    text = abs_path.read_text()
    tokens = tokenize(text)
    _, _, events = parse_group(tokens, 0, set())
    events.sort(key=lambda e: (e[0], e[2]))
    return events


def verify(abs_path: pathlib.Path) -> Tuple[Fraction, int, List[str]]:
    events = load_events(abs_path)
    total = max((e[1] for e in events), default=Fraction(0))
    problems = []
    for (s, e, lane, txt) in events:
        if txt == '|' and s % BEATS_PER_BAR != 0:
            bar = s // BEATS_PER_BAR + 1
            problems.append(f"bar-check '|' at t={s} (~bar {bar}) is not on a barline")
    return total, len(problems), problems


def render_range(events: List[Event], bar_start: int, bar_end: int) -> str:
    q_start = (bar_start - 1) * BEATS_PER_BAR
    q_end = bar_end * BEATS_PER_BAR
    lines = []
    for bar in range(bar_start, bar_end + 1):
        b0 = (bar - 1) * BEATS_PER_BAR
        b1 = bar * BEATS_PER_BAR
        by_lane = {}
        for (s, e, lane, txt) in events:
            touches = (s < b1 and e > b0) or (s == e and b0 <= s < b1)
            if touches:
                by_lane.setdefault(lane, []).append(txt)
        lines.append(f"% bar {bar}")
        if not by_lane:
            lines.append("(no events)")
        elif len(by_lane) == 1:
            ((_, toks),) = by_lane.items()
            lines.append(' '.join(toks) + ' |')
        else:
            for lane in sorted(by_lane):
                lines.append(f"  [V{lane + 1}] " + ' '.join(by_lane[lane]) + ' |')
    return '\n'.join(lines)


def main(argv: List[str]) -> int:
    if len(argv) < 2:
        print(__doc__)
        return 2
    abs_dir = pathlib.Path(argv[0])

    if argv[1] == '--verify-all':
        files = sorted(abs_dir.glob('*.abs.ly'))
        print(f"{'voice':10s} {'bars':>8s} {'quarters':>10s} {'status':8s} detail")
        bad = 0
        for f in files:
            name = f.name[:-len('.abs.ly')]
            try:
                total, nproblems, problems = verify(f)
            except Exception as exc:  # noqa: BLE001
                print(f"{name:10s} {'ERR':>8s} {'':>10s} {'FAIL':8s} {exc}")
                bad += 1
                continue
            bars = total / BEATS_PER_BAR
            ok = (bars == TOTAL_BARS) and nproblems == 0
            status = 'OK' if ok else 'FAIL'
            detail = '' if ok else (
                f"bars={bars} (expected {TOTAL_BARS})"
                + (f"; {nproblems} barcheck mismatch(es)" if nproblems else '')
            )
            print(f"{name:10s} {str(bars):>8s} {str(total):>10s} {status:8s} {detail}")
            if not ok:
                bad += 1
                for p in problems[:5]:
                    print(f"           -> {p}")
        print(f"\n{len(files)} voices checked, {bad} failed.")
        return 1 if bad else 0

    voice = argv[1]
    bar_start = int(argv[2])
    bar_end = int(argv[3])
    global TRANSPOSE
    if '--transpose' in argv:
        preset = argv[argv.index('--transpose') + 1]
        TRANSPOSE = TRANSPOSE_PRESETS[preset]

    abs_path = abs_dir / f"{voice}.abs.ly"
    events = load_events(abs_path)
    print(render_range(events, bar_start, bar_end))
    return 0


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
