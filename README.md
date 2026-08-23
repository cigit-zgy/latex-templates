# LaTeX Templates

A curated collection of reusable LaTeX templates for academic writing. Templates are organized by **document type first**, then by **visual family**. Every template is self-contained and can be copied independently.

## Templates

| Type | Template | Engine | Structure | Languages |
| --- | --- | --- | --- | --- |
| Thesis | [`classic-academic`](thesis/classic-academic/) | XeLaTeX | Book / dissertation | English + 中文 |
| Report | [`classic-academic`](report/classic-academic/) | XeLaTeX | Scientific / technical report | English + 中文 |

The two templates use the same academic visual language while remaining implementation-independent. Latin Modern Sans regular/bold is pinned to the exact WOFF2 assets in [`water-modeling-notes`](https://github.com/cigit-zgy/water-modeling-notes) at commit `462c5e1609978b27fc0774780229fc41a0aba8f8`; LXGW WenKai Screen is pinned to 1.522; Maple Mono is pinned to Fontsource 5.3.0; mathematics uses Latin Modern Math. Font fallback is disabled.

## Rendered previews

The images below are **direct 72-dpi renders of the compiled PDFs**. They are committed exactly as produced by `pdftoppm`: no crop, collage, scaling, sharpening, annotation, or manual reconstruction is applied. Markdown references the files directly and does not set `width` or `height`.

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
- Every manuscript table uses `AcademicTable`, fixed to the full `\linewidth`; raw `tabular`, `tabularx`, and `longtable` are rejected in content files.
- English, Chinese, and mixed-language scientific writing are supported under XeLaTeX.
- Required fonts are prepared locally by each template's `scripts/setup-fonts.sh`; font binaries are excluded from Git and no fallback family is configured.
- Generated LaTeX build artifacts are excluded. Only deliberate direct-render preview PNGs are committed under `preview/`.
- Preview PNGs must remain the intrinsic 612 × 792 px output of a Letter-size PDF rendered at 72 dpi; README display code must not rescale them.
