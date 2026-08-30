# NSFC Youth Science Fund (C) · 青年科学基金项目（C类）

A flat, directly usable 2026 NSFC Youth Science Fund (C) LaTeX template maintained as a top-level, standalone project.

## Files

```text
nsfc-young/
├── main.tex
├── nsfc.cls
├── reference.bib
├── README.md
└── fonts/
    └── README.md
```

There is no parent template wrapper, submodule, symlink, virtual mapping, or shared implementation dependency. `main.tex` compiles against the `nsfc.cls` and bibliography in this same directory.

## Typography and layout

This is a fixed-format NSFC template and is excluded from the repository-wide XCharter style policy. It keeps the font families and layout used by the referenced 2026 upstream template:

- 宋体: SimSun;
- 楷体: KaiTi;
- 仿宋: FangSong;
- Latin sans-serif: Arial;
- A4, Youth-Program left/right margins of 3.20 cm;
- original blue instruction colour and NSFC heading hierarchy.

The three ZhongYi font binaries are not redistributed here. Place legally obtained `SimSun.ttf`, `KaiTi.ttf`, and `FangSong.ttf` in `fonts/` before compiling. The class does not fall back to substitute Chinese fonts.

## Build

```bash
xelatex main.tex
bibtex main
xelatex main.tex
xelatex main.tex
```

## Provenance

The layout and 2026 outline were organized with reference to the public upstream project:

- upstream: https://github.com/andy123t/nsfc-latex
- pinned reference commit: `11a02726f6190fcb89859dfaed18e3d1d68af0b8`
- upstream Youth Science Fund entry: `main-YF.tex`

The upstream repository does not currently declare a repository-level license. This directory records provenance explicitly; do not infer redistribution rights for third-party assets, especially fonts.
