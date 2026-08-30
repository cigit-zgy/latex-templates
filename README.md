# LaTeX Templates

A collection of reusable LaTeX templates for academic writing, journal manuscripts, grant applications, reports, theses, and CVs. Each template is directly usable from its own directory.

## Templates

| Category | Template | Engine | Purpose |
| --- | --- | --- | --- |
| Thesis | [`thesis/classic-academic`](thesis/classic-academic/) | XeLaTeX | Dissertation / monograph |
| Report | [`report/classic-academic`](report/classic-academic/) | XeLaTeX | Full scientific / technical report |
| Report | [`report/short-charter`](report/short-charter/) | XeLaTeX | Compact 8–12 page report; no TOC by default |
| CV | [`cv/curve-academic`](cv/curve-academic/) | XeLaTeX | Academic CV |
| Journal | [`journal/nature`](journal/nature/) | pdfLaTeX | Springer Nature `sn-jnl`, Nature reference style |
| Journal | [`journal/elsevier`](journal/elsevier/) | pdfLaTeX | Elsevier `elsarticle` |
| Journal | [`journal/acs`](journal/acs/) | pdfLaTeX | ACS `achemso` |
| Journal | [`journal/chinese`](journal/chinese/) | XeLaTeX | Chinese scientific manuscript, `kxtbcas` |
| NSFC | [`nsfc-general`](nsfc-general/) | XeLaTeX | 2026 面上项目 |
| NSFC | [`nsfc-young`](nsfc-young/) | XeLaTeX | 2026 青年科学基金项目（C类） |

## Style specification

[`STYLE_SPEC.md`](STYLE_SPEC.md) defines the shared typography, heading hierarchy, colours, spacing, table rules, and preview rules for the self-owned thesis, report, and CV templates.

The shared font roles are:

| Role | Typeface |
| --- | --- |
| Latin serif body | XCharter |
| Mathematics | XCharter-Math |
| Structural sans-serif | Latin Modern Sans |
| Chinese | LXGW WenKai Screen 1.522 |
| Monospace / code | Maple Mono 5.3.0 |

Journal publisher templates and NSFC templates retain their class-defined typography and layout.

## Journal templates

The journal templates are standalone copies of the public resources previously maintained in `cigit-zgy/sci-manuscript-skill` at commit `69adcab3e0d40e4e0eb42038f685cc6125050cc6`.

| Directory | Class | Reference style | Source |
| --- | --- | --- | --- |
| `journal/nature` | `sn-jnl.cls` | `sn-nature.bst` | Springer Nature resource |
| `journal/elsevier` | `elsarticle.cls` | `elsarticle-num.bst` | Elsevier resource |
| `journal/acs` | `achemso.cls` | class-managed ACS style | CTAN `achemso` |
| `journal/chinese` | `kxtbcas.cls` | `kxtbcas-numeric.bst` | Project-maintained MIT resource |

Each journal directory contains a directly compilable `main.tex`, bibliography sample, source information, and rendered preview.

## Rendered previews

All committed preview PNGs are direct 100-dpi renders of compiled PDFs.

### Thesis · Classic Academic

![Thesis title page](thesis/classic-academic/preview/title.png?rev=ced154624288)

![Thesis hierarchy specimen](thesis/classic-academic/preview/hierarchy.png?rev=3662e53d0e42)

### Report · Classic Academic

![Classic report title page](report/classic-academic/preview/title.png?rev=7e93f78b1d8d)

![Classic report hierarchy specimen](report/classic-academic/preview/hierarchy.png?rev=e0c037a6cff3)

### Report · Short Charter

![Short report title page](report/short-charter/preview/title.png?rev=f212a23fb8e7)

![Short report hierarchy specimen](report/short-charter/preview/hierarchy.png?rev=9437a0384a22)

### CV · Academic CurVe

![Academic CurVe CV](cv/curve-academic/preview/cv.png?rev=7446cde3df34)

### Journal · Springer Nature

![Springer Nature article](journal/nature/preview/article.png?rev=bf8426bfaeca)

### Journal · Elsevier

![Elsevier article](journal/elsevier/preview/article.png?rev=8a25f8f6fdf1)

### Journal · ACS

![ACS article](journal/acs/preview/article.png?rev=bf89486f57fd)

### Journal · Chinese

![Chinese journal article](journal/chinese/preview/article.png?rev=c90de7219212)

## Sources

- Springer Nature `sn-jnl`: https://www.springernature.com/gp/authors/campaigns/latex-author-support
- Elsevier LaTeX instructions: https://www.elsevier.com/researcher/author/policies-and-guidelines/latex-instructions
- ACS `achemso`: https://ctan.org/pkg/achemso
- Chinese `kxtbcas`: https://github.com/cigit-zgy/sci-manuscript-skill
- NSFC reference: https://github.com/andy123t/nsfc-latex
- CurVe CV reference: https://www.overleaf.com/latex/templates/a-customised-curve-cv/mvmbhkwsnmwv

## Constraints

- One template directory contains one directly usable template.
- Self-owned thesis, report, and CV templates follow `STYLE_SPEC.md`.
- Publisher class and bibliography files under `journal/nature`, `journal/elsevier`, and `journal/acs` are retained as source resources and are not restyled.
- `journal/chinese` retains the `kxtbcas` class specification.
- `nsfc-general` and `nsfc-young` retain their NSFC typography and page geometry.
- Report manuscript tables use the full `\linewidth` through `AcademicTable`.
- `report/short-charter` has no table of contents by default.
- Preview PNGs are generated with `pdftoppm -png -r 100` and are not cropped, resized, composited, sharpened, annotated, or redrawn.
- README image markup does not set explicit width or height.
