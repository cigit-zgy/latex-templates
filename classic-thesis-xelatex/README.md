# Classic Thesis XeLaTeX

A reusable dissertation template that recreates the visual logic of the ClassicThesis family with an independent XeLaTeX implementation.

The layout follows the same broad typographic ideas visible in the reference dissertation: large chapter numerals, tracked uppercase chapter titles, restrained section headings, asymmetric running heads, thin rules, Roman-numbered front matter, and Arabic-numbered main matter.

## Typography

- Body: **Latin Modern Roman**
- Headings / sans-serif text: **Latin Modern Sans**
- Monospace / code: **Maple Mono** when installed; otherwise **Latin Modern Mono**
- Mathematics: Latin Modern Math

Font files are not bundled in this repository. Latin Modern is normally supplied by TeX Live / MacTeX. Maple Mono is optional and detected automatically.

## Colour system

The default palette is deliberately isolated in `config/colors.tex`:

- academic accent: `RGB(173, 34, 49)`
- hyperlink blue: `RGB(23, 111, 192)`
- body text: near-black

Change colours only in that file. Do not hard-code colours in chapters.

## Directory contract

```text
classic-thesis-xelatex/
├── main.tex
├── latexmkrc
├── config/
│   ├── metadata.tex
│   ├── colors.tex
│   ├── typography.tex
│   └── style.tex
├── frontmatter/
│   ├── titlepage.tex
│   ├── acknowledgements.tex
│   ├── declaration.tex
│   └── abstract.tex
├── chapters/
│   ├── 01-introduction.tex
│   └── 02-methods.tex
├── backmatter/
│   └── references.bib
└── assets/
    └── README.md
```

## Use contract

For a new thesis, edit only these files during ordinary writing:

1. `config/metadata.tex` — title, author, institution, degree, supervisor, date.
2. `chapters/*.tex` — scientific content.
3. `frontmatter/*.tex` — acknowledgements, declaration, abstract.
4. `backmatter/references.bib` — bibliography.
5. `assets/` — figures and other project assets.

Treat `config/typography.tex` and `config/style.tex` as template infrastructure. Modify them only when intentionally creating a new template version.

Do not place formatting commands in chapter files when a semantic LaTeX command is available. In particular, do not manually set font families, colours, margins, page headers, chapter spacing, or hyperlink colours inside content files.

## Naming convention

- Chapters: `01-introduction.tex`, `02-literature-review.tex`, ...
- Figures: `fig:<chapter>:<short-name>`
- Tables: `tab:<chapter>:<short-name>`
- Equations: `eq:<chapter>:<short-name>`
- Sections: `sec:<chapter>:<short-name>`

Example:

```latex
\begin{figure}[tb]
  \centering
  \includegraphics[width=0.82\linewidth]{assets/model-architecture.pdf}
  \caption{Architecture of the proposed model.}
  \label{fig:introduction:model-architecture}
\end{figure}
```

## Build

From this directory:

```bash
latexmk -xelatex main.tex
```

Clean generated files:

```bash
latexmk -C
```

The template uses `biblatex` with `biber`; `latexmk` runs the required bibliography pass automatically.

## Starting a new project

Copy the whole folder first. Keep the template repository as the immutable source of truth, then customize the copied project. This prevents one thesis from silently changing the shared template.
