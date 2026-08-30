# KXTB-CAS Template

## Overview

Standalone XeLaTeX Chinese scientific manuscript using the project-maintained `kxtbcas.cls` and `kxtbcas-numeric.bst` resources.

The standalone sample does not redefine typography or page layout. Font selection, title alignment, title and section styling, spacing, geometry, captions, and front matter are controlled by `kxtbcas.cls` itself.

## Files

- `main.tex` — directly compilable sample manuscript.
- `kxtbcas.cls` — authoritative manuscript class for typography and layout.
- `kxtbcas-numeric.bst` — pinned numeric bibliography style.
- `references.bib` — sample bibliography.
- `LICENSE.md` — class license information.
- `preview/article.png` — rendered sample first page.

## Typography and layout

No local `fontspec`, `xeCJK`, `titlesec`, `geometry`, or title-format override is applied by `main.tex`.

The template uses the exact Times New Roman and SimSun files defined by the reference KXTB-CAS class. Roman and display-family roles resolve to those same serif files, and silent substitution is disabled. The article title remains centered inside `\kxtb@frontmatter`; its size, weight, spacing, and alignment are unchanged.

This directory intentionally does not carry a separate font-mapping file. In particular, it does not remap the source class to Latin Modern Sans or FandolHei for title and section roles.

## Build

```bash
latexmk -xelatex -interaction=nonstopmode -halt-on-error main.tex
```

Run `./scripts/build.sh`. Its template-local setup copies the required Times New Roman and SimSun files into `fonts/` before XeLaTeX runs.

## Preview

![KXTB-CAS article](preview/article.png?rev=c90de7219212)

## Source

- Original class: `cigit-zgy/sci-manuscript-skill`
- Source commit: `69adcab3e0d40e4e0eb42038f685cc6125050cc6`
- Class version: 2026/03/08, `CASAD-style journal template`.
- License: MIT.

## Constraints

- XeLaTeX is required.
- `kxtbcas.cls` is the single source of truth for typography and layout.
- Do not add local font-family substitutions or title/section layout overrides to the standalone sample.
- Target-journal requirements remain authoritative.
