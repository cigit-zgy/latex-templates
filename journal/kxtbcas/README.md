# KXTB-CAS Template

## Overview

Standalone XeLaTeX template for the KXTB-CAS / 科学通报 manuscript format using `kxtbcas.cls` and `kxtbcas-numeric.bst`.

Typography and page layout are owned by this template. No project-level font mapping or shared font runtime is loaded.

## Files

- `main.tex` — directly compilable sample manuscript after local font staging.
- `kxtbcas.cls` — authoritative manuscript class for typography and layout.
- `kxtbcas-numeric.bst` — numeric bibliography style.
- `fonts/` — template-local Times New Roman and SimSun staging directory.
- `scripts/setup-fonts.sh` — resolves legally installed exact font files into `fonts/`.
- `scripts/build.sh` — stages this template's fonts and compiles with XeLaTeX.
- `references.bib` — sample bibliography.
- `LICENSE.md` — class license information.

## Typography and layout

The font contract follows the reference `structure-object-perspective` KXTB-CAS class: Latin text uses Times New Roman and Chinese text uses SimSun. The original class maps both roman and display-family roles to those same serif font files; therefore `\sffamily` in the title and section definitions does not introduce a sans-serif typeface. Bold, italic, title centering, heading sizes, spacing, geometry, captions, and front matter remain class-defined.

The six required local filenames are `TimesNewRoman-Regular.ttf`, `TimesNewRoman-Bold.ttf`, `TimesNewRoman-Italic.ttf`, `TimesNewRoman-BoldItalic.ttf`, `SimSun.ttf`, and `SimSun-Bold.ttf`. Silent fallback to TeX Gyre Termes, Fandol, Songti, Heiti, or other substitute families is disabled.

## Build

```bash
./scripts/build.sh
```

The setup script searches standard macOS/Linux font locations and the optional `KXTBCAS_FONT_SOURCE_DIR`, then copies the exact installed files into this template's own `fonts/` directory. The public repository does not redistribute proprietary Times New Roman or SimSun binaries; the build stops when the exact required fonts cannot be resolved.

## Preview

The previous CI preview was removed because it had been rendered with substitute fonts. A KXTB-CAS preview is valid only after an exact Times New Roman + SimSun local build; previews should be rendered from that PDF at 100 DPI.

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
