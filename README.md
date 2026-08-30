# LaTeX Templates

A curated collection of reusable LaTeX templates for academic writing. Templates are organized by **document type first**, then by **visual family**. Every template is self-contained and can be copied independently.

## Templates

| Type | Template | Engine | Structure | Languages |
| --- | --- | --- | --- | --- |
| Thesis | [`classic-academic`](thesis/classic-academic/) | XeLaTeX | Book / dissertation | English + 中文 |
| Report | [`classic-academic`](report/classic-academic/) | XeLaTeX | Full scientific / technical report | English + 中文 |
| Short report | [`short-charter`](report/short-charter/) | XeLaTeX | Compact ~10-page section-based report | English + 中文 |
| CV | [`curve-academic`](cv/curve-academic/) | XeLaTeX | Academic CV / publication list | English + 中文 |

## Project-wide typography rule

Every template uses the same font contract. Layout may differ by document type; font roles do not.

- Latin serif body text: **XCharter**.
- Mathematics: **XCharter-Math** with matching bold math.
- Structural sans-serif text: **Latin Modern Sans**.
- Chinese: **LXGW WenKai Screen 1.522**.
- Code / monospaced text: **Maple Mono 5.3.0**.

No template may substitute another serif or mathematics family. See [`FONT_POLICY.md`](FONT_POLICY.md).

## Unified document hierarchy

The thesis and both report templates implement exactly the same three ordinary heading levels. Heading numbers and heading text always share the same font, weight, size, and colour.

| Level | LaTeX | Size / leading | Weight | Colour |
| --- | --- | --- | --- | --- |
| 1 | `section` | 16 / 20 pt | Bold | `BrickRed` |
| 2 | `subsection` | 13 / 16 pt | Bold | `RoyalBlue` |
| 3 | `subsubsection` | 11 / 14 pt | Bold | `ForestGreen` |

All three levels use Latin Modern Sans Bold. The thesis adds a document-specific chapter opening at 22 / 28 pt in `BrickRed`, with a 62 pt chapter numeral. Paragraph indentation, line spacing, heading spacing, caption styling, table row spacing, and running-head styling are also shared across the three document templates. See [`STYLE_POLICY.md`](STYLE_POLICY.md).

## Rendered previews

Every image below is a **direct 200-dpi render of the compiled PDF**. Preview files are committed exactly as produced by `pdftoppm`: no crop, collage, scaling, sharpening, annotation, or manual reconstruction is applied. Markdown does not set `width` or `height`.

The workflow uses semantic preview filenames (`title.png`, `hierarchy.png`, `cv.png`) and appends a `?rev=<content-hash>` query to every README image URL after rendering. The query is only a GitHub cache key; it never changes the PNG bytes. Therefore a new renderer output cannot remain visually hidden behind an older README image cache.

### Thesis · Classic Academic

![Thesis title page](thesis/classic-academic/preview/title.png?rev=c548ccd53a43)

![Thesis hierarchy specimen](thesis/classic-academic/preview/hierarchy.png?rev=3662e53d0e42)

### Report · Classic Academic

![Classic report title page](report/classic-academic/preview/title.png?rev=a14f4f986958)

![Classic report hierarchy specimen](report/classic-academic/preview/hierarchy.png?rev=e0c037a6cff3)

### Report · Short Charter

![Short Charter report title page](report/short-charter/preview/title.png?rev=f212a23fb8e7)

![Short Charter report hierarchy specimen](report/short-charter/preview/hierarchy.png?rev=213ede755db9)

### CV · Academic CurVe

![Academic CurVe CV](cv/curve-academic/preview/cv.png?rev=7446cde3df34)

## Repository contract

- One directory = one complete reusable template.
- Templates do not import implementation files from sibling templates.
- `config/` contains project-specific metadata/theme values where applicable.
- `style/` contains stable template infrastructure where applicable.
- Long-form thesis content lives in `chapters/`; report content lives in `sections/`; CV content lives in `rubrics/`.
- Report manuscript tables use `AcademicTable`, fixed to the complete `\linewidth`.
- English, Chinese, and mixed-language scientific writing are supported under XeLaTeX.
- Required non-TeX fonts are prepared by the template build scripts; generated font binaries are excluded from Git.
- Generated LaTeX build artifacts are excluded. Only deliberate direct-render preview PNGs are committed under `preview/`.
- Preview PNGs are generated at **200 dpi** only. Current intrinsic sizes are 1700 × 2200 px for Letter and approximately 1654 × 2339 px for A4. README display code must not rescale them explicitly.
