# ACS Journal Template

## Overview

Standalone ACS journal manuscript using the `achemso` class distributed through CTAN. The sample uses `journal=esthag` and `manuscript=article`.

## Files

- `main.tex` — directly compilable sample manuscript.
- `achemso.cls` — ACS manuscript class.
- `achemso.dtx` — package source file.
- `LICENSE.md` — package license.
- `references.bib` — sample bibliography.
- `preview/article.png` — rendered sample first page.

## Build

```bash
latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex
```

## Preview

![ACS article](preview/article.png?rev=e2d637a07492)

## Source

- Publisher guidance: https://pubs.acs.org/page/4authors/submission_guide
- Package source: https://ctan.org/pkg/achemso
- Migrated from: `cigit-zgy/sci-manuscript-skill`
- Source commit: `69adcab3e0d40e4e0eb42038f685cc6125050cc6`
- `achemso` version: 3.14 (2025-09-22).
- License: LPPL 1.3c.

## Constraints

- `achemso.cls`, `achemso.dtx`, and `LICENSE.md` are retained as source resources without style changes.
- Target-journal Author Guidelines remain authoritative.
- Preview PNGs are direct 200-dpi PDF renders.
