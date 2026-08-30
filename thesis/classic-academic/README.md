# Classic Academic Thesis

A self-contained XeLaTeX thesis template based on a `book` document model and a ClassicThesis-inspired typographic hierarchy. It is intended for dissertations, monographs, and long-form academic manuscripts.

## Rendered preview

These PNG files are direct **200-dpi** renders of the compiled sample PDF. They are not cropped, resized, composited, sharpened, annotated, or redrawn. Markdown references them at intrinsic size without `width` or `height` overrides.

![Rendered thesis title page](preview/page-01.png)

![Rendered thesis chapter page](preview/page-15.png)

## Font and hierarchy contract

This template follows the repository-wide [`FONT_POLICY.md`](../../FONT_POLICY.md) and [`STYLE_POLICY.md`](../../STYLE_POLICY.md).

- body: **XCharter**;
- mathematics: **XCharter-Math**;
- structural headings: **Latin Modern Sans Bold**;
- Chinese: **LXGW WenKai Screen 1.522**;
- code: **Maple Mono 5.3.0**.

The ordinary heading hierarchy is identical to both report templates:

| Level | Size / leading | Weight | Colour |
| --- | --- | --- | --- |
| `section` | 16 / 20 pt | Bold | `BrickRed` |
| `subsection` | 13 / 16 pt | Bold | `RoyalBlue` |
| `subsubsection` | 11 / 14 pt | Bold | `ForestGreen` |

Heading numbers and heading text always share the complete style of their level. Thesis chapters add a 22 / 28 pt bold `BrickRed` opening with a 62 pt bold `BrickRed` numeral.

Paragraph indent is `1.2em`, line spread is `1.08`, caption style and table row spacing are shared with both reports, and running heads use muted Latin Modern Sans without a rule.

## English / 中文

Set `\DocumentLanguage` in `config/metadata.tex` to `english` or `chinese`. Mixed bilingual scientific text is also supported.

## Mandatory full-width tables

All manuscript tables must use `AcademicTable`; raw `tabular`, `tabularx`, and `longtable` are rejected by `scripts/validate.sh`. `AcademicTable` always occupies the complete `\linewidth`.

## Build

```bash
./scripts/setup-fonts.sh  # first build only
./scripts/build.sh
```

During ordinary thesis writing, edit `config/`, `frontmatter/`, `chapters/`, `bibliography/references.bib`, and `figures/`. Treat `style/` as template infrastructure.
