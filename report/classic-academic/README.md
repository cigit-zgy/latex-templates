# Classic Academic Report

## Overview

XeLaTeX `article` template for scientific reports, technical reports, project reports, and research notes. English, Chinese, and mixed-language text are supported.

## Files

- `main.tex` — document entry point.
- `config/` — metadata and colour configuration.
- `style/` — typography, layout, and component definitions.
- `sections/` — report content.
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

![Report title page](preview/title.png?rev=7e93f78b1d8d)

![Report hierarchy specimen](preview/hierarchy.png?rev=e0c037a6cff3)

## Constraints

- `section`: 16/20 pt Bold `BrickRed`.
- `subsection`: 13/16 pt Bold `RoyalBlue`.
- `subsubsection`: 11/14 pt Bold `ForestGreen`.
- Manuscript tables use `AcademicTable` and occupy the full `\linewidth`.
- Preview PNGs are direct 100-dpi PDF renders.
