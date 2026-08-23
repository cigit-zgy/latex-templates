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

The template follows the font policy used by [`cigit-zgy/water-modeling-notes`](https://github.com/cigit-zgy/water-modeling-notes):

- Latin prose and headings: **Latin Modern Sans** regular/bold, taken from the exact WOFF2 assets in `water-modeling-notes` and pinned to repository commit `462c5e1609978b27fc0774780229fc41a0aba8f8`;
- Chinese prose and headings: **LXGW WenKai Screen 1.522**;
- code: **Maple Mono**, matching `@fontsource/maple-mono@5.3.0`;
- mathematics: **Latin Modern Math**.

There is no fallback path. Before the first build:

```bash
./scripts/setup-fonts.sh
```

The script prepares all required non-math font files in the local gitignored `fonts/` directory. XeLaTeX stops with an error when any required asset is absent. Because `water-modeling-notes` provides Latin Modern Sans regular and bold only, italic Latin text is a deterministic synthetic slant of the pinned regular/bold files rather than a fallback family.

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
