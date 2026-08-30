# Style Specification

This file defines the repository-wide style specification for the self-owned thesis, report, and CV templates.

## Scope

Applies to:

- `thesis/classic-academic/`
- `report/classic-academic/`
- `report/short-charter/`
- `cv/curve-academic/`

Publisher journal templates under `journal/` and fixed NSFC templates under `nsfc/` retain their own class-level typography and layout.

## Typography

| Role | Typeface |
| --- | --- |
| Latin serif body | XCharter |
| Mathematics | XCharter-Math |
| Structural sans-serif | Latin Modern Sans |
| Chinese | LXGW WenKai Screen 1.522 |
| Monospace / code | Maple Mono 5.3.0 |

Display-oriented Latin Modern Sans text uses Bold. Running heads use regular weight.

## Heading hierarchy

| Role | LaTeX level | Size / leading | Weight | Colour |
| --- | --- | --- | --- | --- |
| Chapter opening | `chapter` | 22 / 28 pt | Bold | `BrickRed` |
| Level 1 | `section` | 16 / 20 pt | Bold | `BrickRed` |
| Level 2 | `subsection` | 13 / 16 pt | Bold | `RoyalBlue` |
| Level 3 | `subsubsection` | 11 / 14 pt | Bold | `ForestGreen` |

The thesis chapter numeral is 62 pt, Bold, `BrickRed`.

## Layout tokens

- Base size: 11 pt.
- Paragraph indent: `1.2em`.
- Paragraph skip: `0pt`.
- Line spread: `1.08`.
- Level 1 spacing: `3.0ex` before, `1.1ex` after.
- Level 2 spacing: `2.4ex` before, `0.8ex` after.
- Level 3 spacing: `2.0ex` before, `0.6ex` after.
- Captions: small text, bold label, colon separator.
- Table row stretch: `1.16`.
- Running heads: Latin Modern Sans, small, `Gray`, no rule.

## Colour tokens

- Primary accent / level 1: `BrickRed`.
- Level 2 / hyperlinks: `RoyalBlue`.
- Level 3: `ForestGreen`.
- Body text: `Black`.
- Muted text: `Gray`.
- Rules: `Black!35`.
- Code background: `Black!3`.

## Preview

Preview PNGs are generated from compiled PDFs with:

```bash
pdftoppm -png -r 200
```

## Constraints

- Self-owned templates use the typography table above.
- Heading numbers and heading text use the same complete style at each level.
- Report manuscript tables use the full `\linewidth` through `AcademicTable`.
- `report/short-charter` has no table of contents by default.
- Preview PNGs are not cropped, resized, composited, sharpened, annotated, or redrawn.
- README image markup does not set explicit width or height.
