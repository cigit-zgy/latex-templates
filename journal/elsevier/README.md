# Elsevier Journal Template

## Overview

Standalone Elsevier journal manuscript using `elsarticle.cls` and the numeric `elsarticle-num.bst` reference style.

## Files

- `main.tex` — directly compilable sample manuscript.
- `elsarticle.cls` — Elsevier article class.
- `elsarticle-num.bst` — numeric bibliography style.
- `references.bib` — sample bibliography.
- `NOTICE.md` — source and license information.
- `preview/article.png` — rendered sample first page.

## Build

```bash
latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex
```

## Preview

![Elsevier article](preview/article.png?rev=8a25f8f6fdf1)

## Source

- Publisher source: https://www.elsevier.com/researcher/author/policies-and-guidelines/latex-instructions
- Migrated from: `cigit-zgy/sci-manuscript-skill`
- Source commit: `69adcab3e0d40e4e0eb42038f685cc6125050cc6`
- Class version: 3.3 (2020-11-20).
- Template package version recorded by the source resource: 3.4 (2024-04-04).
- License: LPPL 1.2 or later for the class; package documentation declares LPPL 1.3 or later.

## Constraints

- `elsarticle.cls` and `elsarticle-num.bst` are retained as source resources without style changes.
- Target-journal Guide for Authors remains authoritative.
- Preview PNGs are direct 200-dpi PDF renders.
