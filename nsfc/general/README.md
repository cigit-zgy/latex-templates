# NSFC General Program · 面上项目

This entry points to the fixed 2026 upstream NSFC template [`main-GP.tex`](https://github.com/andy123t/nsfc-latex/blob/master/main-GP.tex).

The template is intentionally left unchanged. Its original page geometry, font families, font sizes, colours, headings, and bibliography configuration remain authoritative.

Initialize the upstream submodule first:

```bash
git submodule update --init --recursive
```

Then build from the upstream directory following the upstream instructions:

```bash
cd nsfc/upstream
xelatex main-GP.tex
bibtex main-GP
xelatex main-GP.tex
xelatex main-GP.tex
```

On systems that need local font files, follow the upstream `字体说明.txt` and its `fonts` class option. Do not substitute the repository-wide Charter typography into this template.

Upstream: https://github.com/andy123t/nsfc-latex
