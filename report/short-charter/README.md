# Short Charter Report

A section-based XeLaTeX template for compact scientific or technical reports of roughly 8–12 pages.

## Font and hierarchy contract

This template follows the repository-wide [`FONT_POLICY.md`](../../FONT_POLICY.md) and [`STYLE_POLICY.md`](../../STYLE_POLICY.md).

- body: **XCharter**;
- mathematics: **XCharter-Math**;
- structural headings: **Latin Modern Sans Bold**;
- Chinese: **LXGW WenKai Screen 1.522**;
- code: **Maple Mono 5.3.0**.

Its three heading levels are identical to the classic report and thesis ordinary heading levels:

| Level | Size / leading | Weight | Colour |
| --- | --- | --- | --- |
| `section` | 16 / 20 pt | Bold | `BrickRed` |
| `subsection` | 13 / 16 pt | Bold | `RoyalBlue` |
| `subsubsection` | 11 / 14 pt | Bold | `ForestGreen` |

The section number and section title use the same `BrickRed` style; the same number/title rule applies to all lower levels. Paragraph indent is `1.2em`, line spread is `1.08`, caption style and table row spacing are shared with the other document templates, and running heads use muted Latin Modern Sans without a rule.

The template retains only its compact single-sided A4 geometry and approximately ten-page target as document-specific behaviour.

## Build

```bash
./scripts/build.sh
```

All manuscript tables use the full line width through `AcademicTable`.

## Preview

The hierarchy specimen intentionally contains `section`, `subsection`, and `subsubsection` on the same rendered page so the three-level colour and weight contract can be inspected directly.

![Short report title page](preview/title.png)

![Short report hierarchy specimen](preview/hierarchy.png)

Preview images are direct **200-dpi** renders of the compiled PDF. They must not be cropped, resized, composited, sharpened, annotated, or redrawn. The renderer appends a content-hash query parameter to the README URLs only to invalidate GitHub image caches; the PNG bytes remain untouched.
