# Academic CurVe CV

Academic CV adapted from LianTze Lim's **A Customised CurVe CV** on Overleaf. The upstream template is licensed under **CC BY 4.0**.

Upstream: https://www.overleaf.com/latex/templates/a-customised-curve-cv/mvmbhkwsnmwv

This adaptation keeps the CurVe rubric layout while applying the repository-wide typography contract: **XCharter** for Latin serif body text, **XCharter-Math** for mathematics, Latin Modern Sans for structural headings, **LXGW WenKai Screen 1.522** for Chinese, and **Maple Mono 5.3.0** for monospaced text. The header avatar is downloaded from the public `cigit-zgy` GitHub profile during the build. Journal articles use ordinary sequential labels (`1.`, `2.`, `3.`, `4.`) with no circled markers.

## Build

```bash
./scripts/build.sh
```

The build prepares the pinned non-TeX fonts and refreshes the GitHub avatar before compiling with XeLaTeX + Biber.

## Chinese support

Chinese may be used directly in any rubric. The CJK family is fixed to LXGW WenKai Screen 1.522; no CJK fallback is configured.

## Rendered preview

![Academic CurVe CV](preview/cv.png?rev=7446cde3df34)

The preview is a direct **200-dpi** render of the compiled A4 PDF after refreshing the public GitHub avatar. It is not cropped, resized, composited, sharpened, annotated, or redrawn. The renderer appends a content-hash query parameter to the README URL only to invalidate GitHub image caches; the PNG bytes remain untouched. See [`../../FONT_POLICY.md`](../../FONT_POLICY.md).

## Attribution

This repository changes typography, colours, publication numbering, header identity, CJK support, and sample content. See `NOTICE.md` for the CC BY 4.0 attribution.
