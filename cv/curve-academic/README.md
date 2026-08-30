# Academic CurVe CV

## Overview

XeLaTeX academic CV based on LianTze Lim's **A Customised CurVe CV**. The template supports English and Chinese content, bibliography-driven publication lists, and a build-time GitHub profile avatar.

## Files

- `main.tex` — document entry point.
- `settings.sty` — typography and CurVe layout settings.
- `rubrics/` — CV sections.
- `publications.bib` — publication database.
- `scripts/` — build, font, and avatar setup.
- `assets/` — build-time assets.
- `preview/` — rendered CV preview.

## Typography

This template follows [`../../STYLE_SPEC.md`](../../STYLE_SPEC.md).

- Body: XCharter.
- Mathematics: XCharter-Math.
- Structural headings: Latin Modern Sans Bold.
- Chinese: LXGW WenKai Screen 1.522.
- Monospace: Maple Mono 5.3.0.

## Build

```bash
./scripts/build.sh
```

## Preview

![Academic CurVe CV](preview/cv.png?rev=4db47848316f)

## Source

- Upstream template: https://www.overleaf.com/latex/templates/a-customised-curve-cv/mvmbhkwsnmwv
- Upstream license: CC BY 4.0.
- Attribution: `NOTICE.md`.

## Constraints

- Journal articles use sequential numeric labels (`1.`, `2.`, `3.`, ...).
- Chinese text uses LXGW WenKai Screen 1.522.
- The build refreshes the public GitHub avatar.
- Preview PNGs are direct 100-dpi PDF renders.
