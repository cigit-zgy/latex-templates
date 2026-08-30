# Springer Nature Journal Template

## Overview

Standalone Springer Nature journal manuscript using `sn-jnl.cls` with the `sn-nature` reference style.

## Files

- `main.tex` — directly compilable sample manuscript.
- `sn-jnl.cls` — Springer Nature class resource.
- `sn-nature.bst` — Nature reference style.
- `references.bib` — sample bibliography.
- `NOTICE.md` — source and license information.
- `preview/article.png` — rendered sample first page.

## Build

```bash
latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex
```

## Preview

![Springer Nature article](preview/article.png?rev=835f465eafde)

## Source

- Publisher source: https://www.springernature.com/gp/authors/campaigns/latex-author-support
- Migrated from: `cigit-zgy/sci-manuscript-skill`
- Source commit: `69adcab3e0d40e4e0eb42038f685cc6125050cc6`
- Resource version: December 2024 package; class header 0.1 (2019-11-18).
- Class license: LPPL 1.3c or later.

## Constraints

- `sn-jnl.cls` and `sn-nature.bst` are retained as source resources without style changes.
- This directory represents the Springer Nature `sn-jnl` template with Nature reference style; it is not a universal class for every Nature Portfolio journal.
- Target-journal submission requirements remain authoritative.
- Preview PNGs are direct 200-dpi PDF renders.
