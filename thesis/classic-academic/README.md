# Classic Academic Thesis

A self-contained XeLaTeX thesis template based on a `book` document model and a ClassicThesis-inspired typographic hierarchy. It is intended for dissertations, monographs, and long-form academic manuscripts.

## Rendered preview

These PNG files are direct 72-dpi renders of the compiled sample PDF. They are not cropped, resized, composited, sharpened, annotated, or redrawn. Markdown references them at their intrinsic size without `width` or `height` overrides.

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
│   ├── typography.tex     # exact font contract
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

- Latin scientific prose, headings, and running heads: **Latin Modern Roman**;
- explicitly sans-serif structural elements, including the large chapter numeral: **Latin Modern Sans**;
- Chinese prose and headings: **LXGW WenKai Screen 1.522**;
- code: **Maple Mono**, matching `@fontsource/maple-mono@5.3.0`;
- mathematics: **Latin Modern Math**.

Latin Modern Roman, Sans, and Math are supplied by the TeX distribution. `scripts/setup-fonts.sh` prepares only the pinned non-TeX assets (LXGW WenKai Screen and Maple Mono). Font fallback is disabled.

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

```latex
\begin{table}[tb]
  \centering
  \caption{Example table.}
  \begin{AcademicTable}{LLR}
    \toprule
    Item & Description & Value \\
    \midrule
    A & Example & 1.0 \\
    \bottomrule
  \end{AcademicTable}
\end{table}
```

Use `L`, `C`, and `R` for flexible left-, centre-, and right-aligned columns.

## Build

```bash
./scripts/setup-fonts.sh  # first build only
./scripts/build.sh
```

During ordinary thesis writing, edit `config/`, `frontmatter/`, `chapters/`, `bibliography/references.bib`, and `figures/`. Treat `style/` as template infrastructure.
