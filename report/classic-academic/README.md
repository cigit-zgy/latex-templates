# Classic Academic Report

A self-contained XeLaTeX report template for research reports, technical reports, project reports, and modelling notes. It uses the same visual family as the thesis template while remaining a completely independent `article`-based template.

## Rendered preview

These PNG files are direct 72-dpi renders of the compiled sample PDF. They are not cropped, resized, composited, sharpened, annotated, or redrawn. Markdown references them at their intrinsic size without `width` or `height` overrides.

![Rendered report title page](preview/page-01.png)

![Rendered report content page](preview/page-04.png)

## Architecture

```text
classic-academic/
├── main.tex
├── latexmkrc
├── config/
│   ├── metadata.tex
│   └── theme.tex
├── style/
│   ├── typography.tex
│   ├── layout.tex
│   └── components.tex
├── fonts/                 # local cache; binaries are gitignored
├── sections/
├── bibliography/
├── figures/
├── scripts/
│   ├── setup-fonts.sh
│   ├── validate.sh
│   └── build.sh
└── preview/               # direct PDF renders only
```

The report template does not import any thesis file. It uses a one-sided `article` layout, continuous section-based flow, compact running heads, and a report title page, while retaining the same colour, mathematics, captions, code style, and table contract as the thesis template.

Report section headings intentionally omit the large upper-right display numeral used by the thesis chapter design. Numbering remains available internally and in the table of contents.

## Font contract

- Latin scientific prose, headings, and running heads: **Latin Modern Roman**;
- explicitly sans-serif structural elements: **Latin Modern Sans**;
- Chinese prose and headings: **LXGW WenKai Screen 1.522**;
- code: **Maple Mono**, matching `@fontsource/maple-mono@5.3.0`;
- mathematics: **Latin Modern Math**.

Latin Modern Roman, Sans, and Math are supplied by the TeX distribution. `scripts/setup-fonts.sh` prepares only the pinned non-TeX assets (LXGW WenKai Screen and Maple Mono). Font fallback is disabled.

```bash
./scripts/setup-fonts.sh
```

## English / 中文

Switch `\DocumentLanguage` in `config/metadata.tex` between `english` and `chinese`. Generated labels change accordingly; mixed bilingual scientific text remains supported.

## Mandatory full-width tables

All manuscript tables use `AcademicTable`, fixed to the complete `\linewidth`. The validation script rejects raw `tabular`, `tabularx`, and `longtable` in `sections/`.

## Build

```bash
./scripts/setup-fonts.sh  # first build only
./scripts/build.sh
```

For normal work, edit `config/`, `sections/`, `bibliography/references.bib`, and `figures/`; keep `style/` unchanged.
