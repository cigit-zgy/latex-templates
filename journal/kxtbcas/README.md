# KXTB-CAS Template

## Overview

Standalone XeLaTeX template for the KXTB-CAS / 科学通报 manuscript format using `kxtbcas.cls` and `kxtbcas-numeric.bst`.

Typography and page layout are owned by this template. No project-level font mapping or shared font runtime is loaded.

## Files

- `main.tex` — directly compilable sample manuscript.
- `kxtbcas.cls` — authoritative manuscript class for typography and layout.
- `kxtbcas-numeric.bst` — numeric bibliography style.
- `fonts/` — template-local exact font files.
- `scripts/setup-fonts.sh` / `scripts/setup-fonts.ps1` — verify the bundled font files.
- `scripts/build.sh` / `scripts/build.ps1` — compile with XeLaTeX.
- `references.bib` — sample bibliography.
- `preview/` — two-page 150-DPI visual validation generated from this template's own PDF.
- `LICENSE.md` — class license information.

## Typography and layout

The font contract follows the reference `structure-object-perspective` KXTB-CAS class: Latin text uses Times New Roman, Chinese text uses SimSun, and mathematics uses STIX Two Math. The original class maps both roman and display-family roles to the same serif text faces, so title and section commands using `\sffamily` still resolve to the template's serif fonts. Bold, italic, title centering, heading sizes, spacing, geometry, captions, and front matter remain class-defined.

The bundled files are `TimesNewRoman-Regular.ttf`, `TimesNewRoman-Bold.ttf`, `TimesNewRoman-Italic.ttf`, `TimesNewRoman-BoldItalic.ttf`, `SimSun.ttf`, and `STIXTwoMath-Regular.otf`. Silent fallback to TeX Gyre Termes, Fandol, Songti, Heiti, or other substitute families is disabled.

## Build

macOS / Linux:

```bash
./scripts/build.sh
```

Windows:

```powershell
./scripts/build.ps1
```

The setup scripts only verify the exact files already contained in this template's `fonts/` directory. They do not search the operating system or replace any typeface.

## Preview

CI compiles `journal/kxtbcas/main.tex` directly from the repository-local font files, checks the generated PDF with `pdffonts`, and renders pages 1 and 2 at 150 DPI.

| First page | Content page |
| --- | --- |
| ![KXTB-CAS first page](preview/article.png) | ![KXTB-CAS content page](preview/content.png) |

## Source

- Reference implementation: `cigit-zgy/structure-object-perspective`, archived `kxtbcas.cls`.
- Manuscript workflow source: `cigit-zgy/sci-manuscript-skill`.
- Class version: 2026/03/08, `CASAD-style journal template`.
- License: MIT.

## Constraints

- XeLaTeX is required.
- `kxtbcas.cls` is the single source of truth for typography and layout.
- Exact Times New Roman, SimSun, and STIX Two Math files are required; font substitution is a build error.
- No local title/section layout override is permitted outside the class.
- Preview PNGs must come from this directory's compiled `main.pdf` and are direct 150-DPI renders.
