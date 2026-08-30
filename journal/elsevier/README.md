# Elsevier Journal Template

## Overview

Standalone Elsevier journal manuscript using `elsarticle.cls` and the numeric `elsarticle-num.bst` reference style.

## Files

- `main.tex` — directly compilable two-page-or-longer sample manuscript.
- `elsarticle.cls` — Elsevier article class.
- `elsarticle-num.bst` — numeric bibliography style.
- `references.bib` — sample bibliography.
- `NOTICE.md` — source and license information.
- `preview/article.png` / `preview/content.png` — first and second preview pages.

## Build

```bash
latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex
```

## Preview

<table>
<tr><th width="50%">First page</th><th width="50%">Content page</th></tr>
<tr><td width="50%"><img src="preview/article.png" width="100%" alt="Elsevier first page"></td><td width="50%"><img src="preview/content.png" width="100%" alt="Elsevier content page"></td></tr>
</table>

Both PNGs are direct 150-DPI renders from the current repository PDF and must have identical pixel dimensions.

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
- The sample manuscript contains at least two pages solely to exercise opening-page and body-page preview behavior.
- Preview PNGs are direct 150-DPI PDF renders with equal dimensions.
