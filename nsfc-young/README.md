# NSFC Youth Science Fund (C) · 青年科学基金项目（C类）

## Overview

Standalone 2026 National Natural Science Foundation of China Youth Science Fund (C) application-body template.

## Files

- `main.tex` — document entry point.
- `nsfc.cls` — template class.
- `references.bib` — bibliography database.
- `sections/` — application content.
- `figures/` — figure assets.
- `fonts/` — required local Chinese fonts.

## Typography

- 宋体: SimSun.
- 楷体: KaiTi.
- 仿宋: FangSong.
- Latin sans-serif: Arial.
- A4 page geometry follows the Youth Science Fund (C) template.

## Build

```bash
xelatex main.tex
bibtex main
xelatex main.tex
xelatex main.tex
```

## Source

- Reference repository: https://github.com/andy123t/nsfc-latex
- Reference commit: `11a02726f6190fcb89859dfaed18e3d1d68af0b8`.
- Reference entry: `main-YF.tex`.

## Constraints

- The NSFC typography and page geometry are retained.
- Required ZhongYi font binaries are not distributed in this repository.
- Local `fonts/` contains the required font-file names and setup information.
