# NSFC Youth Science Fund (C) · 青年科学基金项目（C类）

This entry points to the fixed 2026 upstream NSFC template [`main-YF.tex`](https://github.com/andy123t/nsfc-latex/blob/master/main-YF.tex).

The template is intentionally left unchanged. Its original page geometry, font families, font sizes, colours, headings, and bibliography configuration remain authoritative.

Initialize the upstream submodule first:

```bash
git submodule update --init --recursive
```

Then build from the upstream directory following the upstream instructions:

```bash
cd nsfc/upstream
xelatex main-YF.tex
bibtex main-YF
xelatex main-YF.tex
xelatex main-YF.tex
```

On systems that need local font files, follow the upstream `字体说明.txt` and its `fonts` class option. Do not substitute the repository-wide Charter typography into this template.

Upstream: https://github.com/andy123t/nsfc-latex
