# LaTeX Templates

A curated collection of reusable LaTeX templates for academic writing. Templates are organized by **document type first**, then by **visual family**. Every template is self-contained and can be copied independently.

## Templates

| Type | Template | Engine | Structure | Languages |
| --- | --- | --- | --- | --- |
| Thesis | [`classic-academic`](thesis/classic-academic/) | XeLaTeX | Book / dissertation | English + 中文 |
| Report | [`classic-academic`](report/classic-academic/) | XeLaTeX | Scientific / technical report | English + 中文 |

Both templates share one visual language while remaining implementation-independent: Latin Modern Sans for Latin text, LXGW WenKai Screen for Chinese, Maple Mono for code, Latin Modern Math for mathematics, restrained academic colour tokens, and mandatory full-width tables.

## Rendered previews

The images below are **direct 72-dpi renders of the compiled PDFs**. They are committed exactly as produced by the PDF renderer: no crop, collage, scaling, sharpening, or manual reconstruction is applied. Markdown uses the intrinsic image dimensions without a `width` or `height` override.

### Thesis

![Thesis title page](thesis/classic-academic/preview/page-01.png)

![Thesis chapter page](thesis/classic-academic/preview/page-15.png)

### Report

![Report title page](report/classic-academic/preview/page-01.png)

![Report content page](report/classic-academic/preview/page-04.png)

## Repository contract

- One directory = one complete reusable template.
- Thesis and report templates never import files from each other.
- `config/` contains project-specific metadata and theme values.
- `style/` contains stable template infrastructure.
- Scientific content lives in `chapters/` for thesis templates and `sections/` for report templates.
- Every manuscript table uses `AcademicTable`, which is fixed to the full `\linewidth`; raw `tabular`, `tabularx`, and `longtable` are rejected in content files.
- English, Chinese, and mixed-language scientific writing are supported under XeLaTeX.
- Required non-TeX fonts are downloaded locally by each template's `scripts/setup-fonts.sh`; font binaries are not committed and fallback fonts are disabled.
- Generated LaTeX build artifacts are excluded. Only deliberate direct-render preview PNGs are committed under `preview/`.
