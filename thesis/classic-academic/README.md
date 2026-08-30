# Classic Academic Thesis

## Overview

XeLaTeX `book` template for dissertations, monographs, and long-form academic manuscripts. English, Chinese, and mixed-language text are supported.

## Files

- `main.tex` — document entry point.
- `config/` — metadata and colour configuration.
- `style/` — typography, layout, and component definitions.
- `frontmatter/` — title page, abstract, declaration, and acknowledgements.
- `chapters/` — manuscript chapters.
- `bibliography/references.bib` — bibliography database.
- `figures/` — figure assets.
- `preview/` — rendered sample pages.

## Typography

This template follows [`../../STYLE_SPEC.md`](../../STYLE_SPEC.md).

- Body: XCharter.
- Mathematics: XCharter-Math.
- Structural headings: Latin Modern Sans Bold.
- Chinese: LXGW WenKai Screen 1.522.
- Code: Maple Mono 5.3.0.

## Build

```bash
./scripts/setup-fonts.sh
./scripts/build.sh
```

## Preview

![Thesis title page](preview/title.png?rev=5b9ff3ef9517)

![Thesis hierarchy specimen](preview/hierarchy.png?rev=f051345934f5)

## Constraints

- `section`: 16/20 pt Bold `BrickRed`.
- `subsection`: 13/16 pt Bold `RoyalBlue`.
- `subsubsection`: 11/14 pt Bold `ForestGreen`.
- Chapter title: 22/28 pt Bold `BrickRed`; chapter numeral: 62 pt Bold `BrickRed`.
- Manuscript tables use `AcademicTable` and occupy the full `\linewidth`.
- Preview PNGs are direct 100-dpi PDF renders.
