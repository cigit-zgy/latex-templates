# Chinese Journal Template

## Overview

Standalone XeLaTeX Chinese scientific manuscript using the project-maintained `kxtbcas.cls` and `kxtbcas-numeric.bst` bibliography style.

## Files

- `main.tex` — directly compilable sample manuscript.
- `fonts.tex` — portable font mapping for the sample build.
- `kxtbcas.cls` — manuscript class.
- `kxtbcas-numeric.bst` — numeric bibliography style.
- `references.bib` — sample bibliography.
- `LICENSE.md` — class license information.
- `preview/article.png` — rendered sample first page.

## Typography

| Role | Typeface |
| --- | --- |
| Chinese body | FandolSong Regular / Bold |
| Chinese italic role | FandolKai Regular |
| Chinese sans-serif title and section roles | FandolHei Regular / Bold |
| Chinese monospaced role | FandolFang Regular |
| Latin serif text | Latin Modern Roman |
| Latin sans-serif text | Latin Modern Sans |
| Mathematics | STIX Two Math when available |

The Chinese body is Song-style serif text. `kxtbcas.cls` uses the sans-serif role for display elements explicitly marked with `\sffamily`, including the Chinese article title and section headings.

## Build

```bash
latexmk -xelatex -interaction=nonstopmode -halt-on-error main.tex
```

The required Fandol and Latin Modern fonts are supplied by the TeX Live XeLaTeX/Chinese toolchain.

## Preview

![Chinese journal article](preview/article.png?rev=c90de7219212)

## Source

- Original class: `cigit-zgy/sci-manuscript-skill`
- Source commit: `69adcab3e0d40e4e0eb42038f685cc6125050cc6`
- Class version: 2026/03/08, `CASAD-style journal template`.
- License: MIT.

## Constraints

- XeLaTeX is required.
- Chinese body text uses a Song-style serif family.
- Display roles explicitly defined with `\sffamily` use FandolHei.
- The portable sample mapping follows the same Song/Hei role separation used by the source class.
- Target-journal requirements remain authoritative.
- Preview PNGs are direct 200-dpi PDF renders.
