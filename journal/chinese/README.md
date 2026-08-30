# Chinese Journal Template

## Overview

Standalone XeLaTeX Chinese scientific manuscript using the project-maintained `kxtbcas.cls` and `kxtbcas-numeric.bst` bibliography style.

## Files

- `main.tex` — directly compilable sample manuscript.
- `kxtbcas.cls` — manuscript class.
- `kxtbcas-numeric.bst` — numeric bibliography style.
- `references.bib` — sample bibliography.
- `scripts/setup-fonts.sh` — reproducible CJK sample-font setup.
- `fonts/` — local sample font directory.
- `LICENSE.md` — class license information.
- `preview/article.png` — rendered sample first page.

## Build

```bash
bash scripts/setup-fonts.sh
latexmk -xelatex -interaction=nonstopmode -halt-on-error main.tex
```

## Preview

![Chinese journal article](preview/article.png?rev=ecc8e57d6d1e)

## Source

- Original class: `cigit-zgy/sci-manuscript-skill`
- Source commit: `69adcab3e0d40e4e0eb42038f685cc6125050cc6`
- Class version: 2026/03/08, `CASAD-style journal template`.
- License: MIT.

## Constraints

- `kxtbcas.cls` and `kxtbcas-numeric.bst` retain the migrated class specification.
- XeLaTeX is required.
- The sample build uses LXGW WenKai Screen 1.522 through the class font-file interface.
- Target-journal requirements remain authoritative.
- Preview PNGs are direct 200-dpi PDF renders.
