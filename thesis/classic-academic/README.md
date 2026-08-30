# Classic Academic Thesis

A self-contained XeLaTeX thesis template based on a `book` document model and a ClassicThesis-inspired typographic hierarchy. It is intended for dissertations, monographs, and long-form academic manuscripts.

## Rendered preview

These PNG files are direct **200-dpi** renders of the compiled sample PDF. They are not cropped, resized, composited, sharpened, annotated, or redrawn. Markdown references them at their intrinsic size without `width` or `height` overrides.

![Rendered thesis title page](preview/page-01.png)

![Rendered thesis chapter page](preview/page-15.png)

## Architecture

```text
classic-academic/
├── main.tex
├── latexmkrc
├── config/
│   ├── metadata.tex       # language + thesis metadata
│   └── theme.tex          # colour tokens only
├── style/
│   ├── typography.tex     # exact project-wide font contract
│   ├── layout.tex         # book geometry, chapters, running heads
│   └── components.tex     # captions, tables, code, links, localization
├── fonts/                 # local cache; binaries are gitignored
├── frontmatter/
├── chapters/
├── bibliography/
├── figures/
├── scripts/
│   ├── setup-fonts.sh
│   ├── validate.sh
│   └── build.sh
└── preview/               # direct PDF renders only
```

## Font contract

This template follows the repository-wide font rule:

- Latin serif body text: **XCharter**;
- mathematics: **XCharter-Math**;
- structural sans-serif elements: **Latin Modern Sans**;
- Chinese: **LXGW WenKai Screen 1.522**;
- code: **Maple Mono 5.3.0**.

XCharter, XCharter-Math, and Latin Modern Sans are supplied by the TeX distribution. `scripts/setup-fonts.sh` prepares only the pinned non-TeX assets. Font fallback is disabled. See [`../../FONT_POLICY.md`](../../FONT_POLICY.md).

Before the first build:

```bash
./scripts/setup-fonts.sh
```

## English / 中文

Set one value in `config/metadata.tex`:

```latex
\newcommand{\DocumentLanguage}{english}
% or
\newcommand{\DocumentLanguage}{chinese}
```

Generated labels switch language accordingly. English and Chinese may also be mixed in the same manuscript.

## Mandatory full-width tables

All manuscript tables must use `AcademicTable`; raw `tabular`, `tabularx`, and `longtable` are rejected by `scripts/validate.sh`. `AcademicTable` always occupies the complete `\linewidth`.

## Build

```bash
./scripts/setup-fonts.sh  # first build only
./scripts/build.sh
```

During ordinary thesis writing, edit `config/`, `frontmatter/`, `chapters/`, `bibliography/references.bib`, and `figures/`. Treat `style/` as template infrastructure.
