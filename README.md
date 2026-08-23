# LaTeX Templates

A curated collection of reusable LaTeX templates for academic writing.

The repository is organized by **document type first**, then by **template**. Each template is self-contained and includes its own documentation, source files, and rendered preview.

## Templates

| Type | Template | Engine | Purpose |
| --- | --- | --- | --- |
| Thesis | [`classic-academic`](thesis/classic-academic/) | XeLaTeX | Long-form dissertation / thesis with a ClassicThesis-inspired academic layout |

## Preview

<p align="center">
  <img src="thesis/classic-academic/preview/preview.svg" width="100%" alt="Classic Academic thesis rendered preview" />
</p>


## Repository contract

- One directory = one reusable template.
- A template must compile independently from its own directory.
- Template infrastructure lives under `style/`; project-specific values live under `config/`.
- Sample scientific content is intentionally minimal and lives under `chapters/`.
- Rendered examples live under `preview/` and are committed only to make visual inspection easy.
- Font files are never bundled. Templates use TeX-distributed fonts or locally installed optional fonts.

Generated LaTeX build artifacts are not part of the repository, except the deliberate files under `preview/`.
