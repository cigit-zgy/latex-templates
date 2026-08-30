# KXTB-CAS Template

## Overview

Standalone XeLaTeX template for the KXTB-CAS / 科学通报 manuscript format using `kxtbcas.cls` and `kxtbcas-numeric.bst`.

Typography and page layout are owned by this template. No project-level font mapping or shared font runtime is loaded.

## Files

- `main.tex` — directly compilable sample manuscript after local font staging.
- `kxtbcas.cls` — authoritative manuscript class for typography and layout.
- `kxtbcas-numeric.bst` — numeric bibliography style.
- `fonts/` — template-local Times New Roman and SimSun staging directory.
- `scripts/setup-fonts.sh` / `scripts/setup-fonts.ps1` — resolve legally installed exact font files into `fonts/`.
- `scripts/build.sh` / `scripts/build.ps1` — stage this template's fonts and compile with XeLaTeX.
- `references.bib` — sample bibliography.
- `preview/` — two-page 100-DPI visual validation generated from this template's own PDF.
- `LICENSE.md` — class license information.

## Typography and layout

The font contract follows the reference `structure-object-perspective` KXTB-CAS class: Latin text uses Times New Roman and Chinese text uses SimSun. The original class maps both roman and display-family roles to those same serif font files; therefore `\sffamily` in the title and section definitions does not introduce a sans-serif typeface. Bold, italic, title centering, heading sizes, spacing, geometry, captions, and front matter remain class-defined.

The six required local filenames are `TimesNewRoman-Regular.ttf`, `TimesNewRoman-Bold.ttf`, `TimesNewRoman-Italic.ttf`, `TimesNewRoman-BoldItalic.ttf`, `SimSun.ttf`, and `SimSun-Bold.ttf`. Silent fallback to TeX Gyre Termes, Fandol, Songti, Heiti, or other substitute families is disabled.

## Build

macOS / Linux:

```bash
./scripts/build.sh
```

Windows:

```powershell
./scripts/build.ps1
```

The setup scripts copy the exact locally installed Times New Roman and SimSun files into this template's own `fonts/` directory. On Windows, `simsun.ttc` is deterministically extracted to the required local `SimSun.ttf` face when necessary. The public repository does not redistribute proprietary font binaries; missing required fonts stop the build.

## Preview

CI compiles `journal/kxtbcas/main.tex` from this repository on Windows after staging the exact Times New Roman and SimSun files. The generated `main.pdf` is checked with `pdffonts`, then pages 1 and 2 are rendered directly at 100 DPI.

![KXTB-CAS first page](preview/article.png)

![KXTB-CAS content page](preview/content.png)

## Source

- Reference implementation: `cigit-zgy/structure-object-perspective`, archived `kxtbcas.cls`.
- Manuscript workflow source: `cigit-zgy/sci-manuscript-skill`.
- Class version: 2026/03/08, `CASAD-style journal template`.
- License: MIT.

## Constraints

- XeLaTeX is required.
- `kxtbcas.cls` is the single source of truth for typography and layout.
- Exact Times New Roman and SimSun files are required; font substitution is a build error.
- No local title/section layout override is permitted outside the class.
- Preview PNGs must come from this directory's compiled `main.pdf`, never from a precompiled PDF in another repository.
