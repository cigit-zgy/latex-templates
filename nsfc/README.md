# NSFC templates

This directory provides entry points to the 2026 National Natural Science Foundation of China (NSFC) application-body LaTeX templates maintained in the public upstream repository [`andy123t/nsfc-latex`](https://github.com/andy123t/nsfc-latex).

The upstream repository contains two relevant templates:

- [`youth-c/`](youth-c/) — 青年科学基金项目（C类）, upstream entry file `main-YF.tex`;
- [`general/`](general/) — 面上项目, upstream entry file `main-GP.tex`.

## Upstream reference

The original template is included as a Git submodule at [`nsfc/upstream`](upstream), pinned to upstream commit [`11a02726f6190fcb89859dfaed18e3d1d68af0b8`](https://github.com/andy123t/nsfc-latex/commit/11a02726f6190fcb89859dfaed18e3d1d68af0b8).

Clone this repository with submodules:

```bash
git clone --recurse-submodules https://github.com/cigit-zgy/latex-templates.git
```

For an existing clone:

```bash
git submodule update --init --recursive
```

## Fixed-template rule

The NSFC templates are external fixed-layout templates. They are **excluded** from this repository's XCharter / XCharter-Math / colour / heading style policies. Do not normalize their typography, spacing, colours, heading hierarchy, or page geometry to match the thesis/report templates.

The upstream template uses the Chinese font families specified by the source template: SimSun (宋体), KaiTi (楷体), and FangSong (仿宋). The upstream font note states that these fonts are copyrighted by Beijing ZhongYi Electronics and should not be redistributed without appropriate authorization. This repository therefore does not duplicate those font binaries; the submodule remains the authoritative upstream source.

## Upstream status

The upstream repository does not currently declare a repository license. For that reason this repository references it through a submodule rather than vendoring or modifying its source files.

- Upstream repository: https://github.com/andy123t/nsfc-latex
- Upstream Youth template: https://github.com/andy123t/nsfc-latex/blob/master/main-YF.tex
- Upstream General Program template: https://github.com/andy123t/nsfc-latex/blob/master/main-GP.tex
- Upstream font note: https://github.com/andy123t/nsfc-latex/blob/master/%E5%AD%97%E4%BD%93%E8%AF%B4%E6%98%8E.txt
