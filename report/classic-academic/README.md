# Classic Academic Report

A self-contained XeLaTeX report template for research reports, technical reports, project reports, and modelling notes. It uses the same visual family as the thesis template while remaining an independent `article`-based template.

## Rendered preview

These PNG files are direct **200-dpi** renders of the compiled sample PDF. They are not cropped, resized, composited, sharpened, annotated, or redrawn. Markdown references them at intrinsic size without `width` or `height` overrides.

![Rendered report title page](preview/page-01.png)

![Rendered report content page](preview/page-04.png)

## Font and hierarchy contract

This template follows the repository-wide [`FONT_POLICY.md`](../../FONT_POLICY.md) and [`STYLE_POLICY.md`](../../STYLE_POLICY.md).

- body: **XCharter**;
- mathematics: **XCharter-Math**;
- structural headings: **Latin Modern Sans Bold**;
- Chinese: **LXGW WenKai Screen 1.522**;
- code: **Maple Mono 5.3.0**.

The heading hierarchy is identical to the thesis ordinary heading levels and the short report:

| Level | Size / leading | Weight | Colour |
| --- | --- | --- | --- |
| `section` | 16 / 20 pt | Bold | `BrickRed` |
| `subsection` | 13 / 16 pt | Bold | `RoyalBlue` |
| `subsubsection` | 11 / 14 pt | Bold | `ForestGreen` |

Heading numbers and heading text always share the complete style of their level. Paragraph indent is `1.2em`, line spread is `1.08`, caption style and table row spacing are shared with the other document templates, and running heads use muted Latin Modern Sans without a rule.

## English / 中文

Switch `\DocumentLanguage` in `config/metadata.tex` between `english` and `chinese`. Mixed bilingual scientific text is supported.

## Mandatory full-width tables

All manuscript tables use `AcademicTable`, fixed to the complete `\linewidth`. The validation script rejects raw `tabular`, `tabularx`, and `longtable` in `sections/`.

## Build

```bash
./scripts/setup-fonts.sh  # first build only
./scripts/build.sh
```

For normal work, edit `config/`, `sections/`, `bibliography/references.bib`, and `figures/`; keep `style/` unchanged.
