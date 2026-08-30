# Project-wide document style policy

The thesis and both report templates share one visual system. Document structure may differ, but equivalent typographic roles must render identically.

## Font roles

- Latin serif body: **XCharter**.
- Mathematics: **XCharter-Math** with matching bold math.
- Structural sans-serif: **Latin Modern Sans**.
- Chinese: **LXGW WenKai Screen 1.522**.
- Code / monospace: **Maple Mono 5.3.0**.

## Heading hierarchy

All heading numbers and their heading text use the same colour, weight, and font at a given level.

| Role | LaTeX level | Font | Size / leading | Weight | xcolor colour |
| --- | --- | --- | --- | --- | --- |
| Chapter opening | `chapter` (thesis only) | Latin Modern Sans | 22 / 28 pt | Bold | `BrickRed` |
| Level 1 | `section` | Latin Modern Sans | 16 / 20 pt | Bold | `BrickRed` |
| Level 2 | `subsection` | Latin Modern Sans | 13 / 16 pt | Bold | `RoyalBlue` |
| Level 3 | `subsubsection` | Latin Modern Sans | 11 / 14 pt | Bold | `ForestGreen` |

The thesis chapter numeral is 62 pt bold Latin Modern Sans in `BrickRed`. Chapter openings may retain the ClassicThesis-inspired rule; the three ordinary heading levels do not add rules.

## Shared layout tokens

- Base document size: 11 pt.
- Paragraph indent: `1.2em`.
- Paragraph skip: `0pt`.
- Line spread: `1.08`.
- Level 1 spacing: `3.0ex` before, `1.1ex` after.
- Level 2 spacing: `2.4ex` before, `0.8ex` after.
- Level 3 spacing: `2.0ex` before, `0.6ex` after.
- Captions: `small`, bold label, colon separator, centred block alignment.
- Table row stretch: `1.16`.
- Running heads: Latin Modern Sans, `small`, muted grey, no horizontal rule.

Paper size, one-/two-sided pagination, and thesis chapter-opening behaviour remain document-specific.

## Colour tokens

The project uses named `xcolor`/`dvipsnames` colours rather than independent RGB definitions:

- primary academic accent / level 1: `BrickRed`;
- level 2 and hyperlinks: `RoyalBlue`;
- level 3: `ForestGreen`;
- body text: `Black`;
- muted text: `Gray`;
- rules: `Black!35`;
- code background: `Black!3`.

## Preview rule

All committed preview PNGs are direct `pdftoppm -png -r 200` renders of compiled PDFs. No crop, resize, sharpening, compositing, annotation, or manual redrawing is allowed.