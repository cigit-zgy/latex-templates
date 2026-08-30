# Chinese Journal Template

## Overview

Standalone XeLaTeX Chinese scientific manuscript using the pinned project-maintained `kxtbcas.cls` and `kxtbcas-numeric.bst` resources from `cigit-zgy/sci-manuscript-skill`.

The standalone sample does not redefine typography or page layout. Font selection, title alignment, title and section styling, spacing, geometry, captions, and front matter are controlled by `kxtbcas.cls` itself.

## Files

- `main.tex` — directly compilable sample manuscript.
- `kxtbcas.cls` — pinned manuscript class; kept unchanged from the source repository.
- `kxtbcas-numeric.bst` — pinned numeric bibliography style.
- `references.bib` — sample bibliography.
- `LICENSE.md` — class license information.
- `preview/article.png` — rendered sample first page.

## Typography and layout

No local `fontspec`, `xeCJK`, `titlesec`, `geometry`, or title-format override is applied by `main.tex`.

The source class defines Times New Roman and SimSun as its local-file defaults, with its own system-font fallback chain. The article title is centered by the source class inside `\kxtb@frontmatter`; the standalone template does not duplicate or alter that rule.

This directory intentionally does not carry a separate font-mapping file. In particular, it does not remap the source class to Latin Modern Sans or FandolHei for title and section roles.

## Build

```bash
latexmk -xelatex -interaction=nonstopmode -halt-on-error main.tex
```

The source class requires XeLaTeX and suitable fonts in the build environment. Font availability is an environment requirement and is not compensated for by changing the template typography.

## Preview

![Chinese journal article](preview/article.png?rev=c90de7219212)

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
